<?php

namespace App\Http\Controllers\Api\V1;

use App\Bank;
use App\ClientConnection;
use App\Compute;
use App\CoopPayment;
use App\CurrentSession;
use App\FeePayment;
use App\GenerateToken;
use App\Jobs\SendMessage;
use App\MessageOutbox;
use App\MpesaOutbox;
use App\MpesaPayment;
use App\SchoolProfile;
use App\SendConfirmation;
use App\Student;
use App\Http\Controllers\Controller;
use App\TransactionStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class TransactionCallbacksController extends Controller
{
    /**
     * Use this function to process the C2B Confirmation result callback
     * @return string
     */
    public static function processC2BRequestConfirmation(){

        $callbackJSONData = file_get_contents('php://input');
        $callbackData = json_decode($callbackJSONData);

        $logFile = "PaymentConfirmationResponse.json";
        $log = fopen($logFile, "a");
        fwrite($log, $callbackJSONData);
        fclose($log);

        $transactionType    =   $callbackData->TransactionType;
        $transID            =   $callbackData->TransID;
        $transTime          =   $callbackData->TransTime;
        $transAmount        =   $callbackData->TransAmount;
        $businessShortCode  =   $callbackData->BusinessShortCode;
        $billRefNumber      =   strtoupper(str_replace(' ', '', $callbackData->BillRefNumber));
        $invoiceNumber      =   $callbackData->InvoiceNumber;
        $orgAccountBalance  =   $callbackData->OrgAccountBalance;
        $thirdPartyTransID  =   $callbackData->ThirdPartyTransID;
        $MSISDN             =   $callbackData->MSISDN;
        $firstName          =   $callbackData->FirstName;
        $middleName         =   $callbackData->MiddleName;
        $lastName           =   $callbackData->LastName;

        $current_session = CurrentSession::Current()->first();
        $student = Student::where('admno', $billRefNumber)->first();

        if($student)
        {
            $result = new MpesaPayment();
            $result->student_id        = $student->id;
            $result->current_session_id= $current_session->id;
            $result->transTime         = $transTime;
            $result->transAmount       = $transAmount;
            $result->businessShortCode = $businessShortCode;
            $result->billRefNumber     = $billRefNumber;
            $result->invoiceNumber     = $invoiceNumber;
            $result->orgAccountBalance = $orgAccountBalance;
            $result->thirdPartyTransID = $thirdPartyTransID;
            $result->MSISDN            = $MSISDN;
            $result->firstName         = $firstName;
            $result->lastName          = $lastName;
            $result->middleName        = $middleName;
            $result->transID           = $transID;
            $result->transactionType   = $transactionType;
            $result->save();

            //First fetch fees data from the student
            $arrears = $student->arrears;
            $current = $student->current;
            $balance = $student->balance;
            $paid    = $student->paid;

            $bank = Bank::where('branch', $result->businessShortCode)->first();

            //Payment details
            $amount_paid        = $result->transAmount;
            $bank_id            = $bank->id;
            $ref_no             = $result->transID;
            $pay_date           = date('Y-m-d');
            $slip_date          = date('Y-m-d');
            $current_session_id = $current_session->id;
            $class_grade_id     = $student->class_grade_id;

            //if the amount paid is greater than arrears
            if($amount_paid > $arrears){
                //Deduct arrears from paid to the amount that goes to fees payment
                $new_fees = $amount_paid - $arrears;
                //New arrears is now 0
                $new_arrears = 0;
                //fees paid
                $fees_paid = $new_fees;
                //Arrears paid = $arr
                $arrears_paid = $arrears;
                $new_current = $current - $new_fees;
                //Deduct current term fees from $new_fees to get new fees balance
                $new_fees_balance = $current - $new_fees;

                //If the amount paid is less than the last term arrears
            }elseif($amount_paid < $arrears){
                //New arrears balance
                $new_arrears = $arrears - $amount_paid;
                //fees paid
                $fees_paid = 0;
                //Arrears paid
                $arrears_paid = $amount_paid;
                //New fees balance
                $new_fees_balance = $new_arrears + $current;
                $new_current = $current;

            }else{
                //New arrears balance
                $new_arrears = 0;
                //fees paid
                $fees_paid = 0;
                //Arrears paid
                $arrears_paid = $amount_paid;
                //New fees balance
                $new_fees_balance = $current;
                $new_current = $current;
            }

            $new_paid = $paid + $amount_paid;

            $check = FeePayment::orderBy('receipt_no', 'desc')->limit(1)->first();
            if ($check)
            {
                $rec = $check->receipt_no;
                $receipt_no = ++$rec;
            }
            else
            {
                $receipt_no = date('Y')."000001";
            }

            //Save the payment information
            $data = new FeePayment();
            $data->parent_detail_id     = $student->parent_detail_id;
            $data->student_id           = $student->id;
            $data->receipt_no           = $receipt_no;
            $data->current_session_id   = $current_session_id;
            $data->class_grade_id       = $class_grade_id;
            $data->expected             = $balance;
            $data->fees                 = $fees_paid;
            $data->arrears              = $arrears_paid;
            $data->paid                 = $amount_paid;
            $data->balance              = $new_fees_balance;
            $data->pay_date             = $pay_date;
            $data->slip_date            = $slip_date;
            $data->bank_id              = $bank_id;
            $data->ref_no               = $ref_no;
            $data->created_by           = 1;
            $data->save();

            $data1 = $student;
            $data1->arrears     = $new_arrears;
            $data1->current     = $new_current;
            $data1->paid        = $new_paid;
            $data1->balance     = $new_fees_balance;
            $data1->save();

            if($data1->balance < 0)
            {
                $newest = "Overpay";
            }
            else
            {
                $newest = "Balance";
            }

            $name = strtoupper($result->firstName." ".$result->middleName." ".$result->lastName);
            $amt = number_format($transAmount);
            $studentName = strtoupper($student->name);
            $balanc = number_format($data1->balance);

            $message = "Dear {$name}, Your payment of Ksh {$amt} for {$studentName} has been received. New Fees {$newest} is Ksh {$balanc}. Thank you";

            $messageId = Str::uuid()->getHex();
            $uniq = Str::uuid()->getHex();
            $phone = $MSISDN;

            $chars = strlen($message);

            if ($chars < 161)
            {
                $units = 1;
            }
            elseif ($chars > 160 && $chars < 306)
            {
                $units = 2;
            }
            elseif ($chars > 305 && $chars < 458)
            {
                $units = 3;
            }

            $cost = $units * 0.8;

            $data = new MessageOutbox();
            $data->code         = $uniq;
            $data->recipient_id = $student->id;
            $data->messageId    = $messageId;
            $data->message      = $message;
            $data->phoneno      = $phone;
            $data->characters   = $chars;
            $data->sms_units    = $units;
            $data->sms_cost     = $cost;
            $data->target       = "mpesa";
            $data->save();

            $dat = new MpesaOutbox();
            $dat->mpesa_payment_id = $result->id;
            $dat->messageId    = $messageId;
            $dat->message      = $message;
            $dat->phone        = $phone;
            $dat->status       = "successful";
            $dat->save();

            SendConfirmation::PaymentConfirmation($messageId, $message, $phone);
        }
        else
        {
            $result = new MpesaPayment();
            $result->current_session_id= $current_session->id;
            $result->transTime         = $transTime;
            $result->transAmount       = $transAmount;
            $result->businessShortCode = $businessShortCode;
            $result->billRefNumber     = $billRefNumber;
            $result->invoiceNumber     = $invoiceNumber;
            $result->orgAccountBalance = $orgAccountBalance;
            $result->thirdPartyTransID = $thirdPartyTransID;
            $result->MSISDN            = $MSISDN;
            $result->firstName         = $firstName;
            $result->lastName          = $lastName;
            $result->middleName        = $middleName;
            $result->transID           = $transID;
            $result->transactionType   = $transactionType;
            $result->status            = 2;
            $result->save();

            $name = strtoupper($result->firstName)." ".strtoupper($result->lastName);
            $message = "Dear {$name}, Your payment of Ksh ".number_format($transAmount,2)." has been received but the Admission No. you have used does not match our records. Kindly contact the office";

            $messageId = Str::uuid()->getHex();
            $uniq = Str::uuid()->getHex();
            $phone = $MSISDN;

            $chars = strlen($message);

            if ($chars < 161)
            {
                $units = 1;
            }
            elseif ($chars > 160 && $chars < 306)
            {
                $units = 2;
            }
            elseif ($chars > 305 && $chars < 458)
            {
                $units = 3;
            }

            $cost = $units * 0.8;

            $data = new MessageOutbox();
            $data->code         = $uniq;
            $data->messageId    = $messageId;
            $data->message      = $message;
            $data->phoneno      = $phone;
            $data->characters   = $chars;
            $data->sms_units    = $units;
            $data->sms_cost     = $cost;
            $data->target       = "mpesa";
            $data->save();

            $dat = new MpesaOutbox();
            $dat->mpesa_payment_id = $result->id;
            $dat->messageId    = $messageId;
            $dat->message      = $message;
            $dat->phone        = $phone;
            $dat->status       = "unsuccessful";
            $dat->save();

            $wakati = date('Y-m-d H:m:s');
            SendConfirmation::PaymentConfirmation($messageId, $message, $phone);

        }



    }


    /**
     * Use this function to process the Transaction status request callback
     * @return string
     */
    public static function processTransactionStatusRequestCallback(){
        $callbackJSONData=file_get_contents('php://input');
        $callbackData=json_decode($callbackJSONData);

        $logFile = "TransactionStatusResponse.json";
        $log = fopen($logFile, "a");
        fwrite($log, $callbackJSONData);
        fclose($log);


        $resultCode                 = $callbackData->Result->ResultCode;
        $resultDesc                 = $callbackData->Result->ResultDesc;
        $originatorConversationID   = $callbackData->Result->OriginatorConversationID;
        $conversationID             = $callbackData->Result->ConversationID;
        $transactionID              = $callbackData->Result->TransactionID;

        if($resultCode < 1)
        {
            $DebitPartyName             = $callbackData->Result->ResultParameters->ResultParameter[0]->Value;
            $CreditPartyName            = $callbackData->Result->ResultParameters->ResultParameter[1]->Value;
            //$OriginatorConversationID   = $callbackData->Result->ResultParameters->ResultParameter[2]->Value;
            $InitiatedTime              = $callbackData->Result->ResultParameters->ResultParameter[3]->Value;
            //$CreditPartyCharges         = $callbackData->Result->ResultParameters->ResultParameter[4]->Value;
            $DebitAccountType           = $callbackData->Result->ResultParameters->ResultParameter[5]->Value;
            //$TransactionReason          = $callbackData->Result->ResultParameters->ResultParameter[6]->Value;
            $ReasonType                 = $callbackData->Result->ResultParameters->ResultParameter[7]->Value;
            $TransactionStatus          = $callbackData->Result->ResultParameters->ResultParameter[8]->Value;
            $FinalisedTime              = $callbackData->Result->ResultParameters->ResultParameter[9]->Value;
            $Amount                     = $callbackData->Result->ResultParameters->ResultParameter[10]->Value;
            //$ConversationID             = $callbackData->Result->ResultParameters->ResultParameter[11]->Value;
            $ReceiptNo                  = $callbackData->Result->ResultParameters->ResultParameter[12]->Value;
        }


        $result = new TransactionStatus;
        $result->result_code                    = $resultCode;
        $result->result_desc                    = $resultDesc;
        $result->originator_conversation_id     = $originatorConversationID;
        $result->conversation_id                = $conversationID;
        $result->transaction_id                 = $transactionID;
        if($resultCode < 1)
        {
            $result->receipt_no                     = $ReceiptNo;
            //$result->conversationid                = $ConversationID;
            $result->finalised_time                 = $FinalisedTime;
            $result->amount                         = $Amount;
            $result->transaction_status             = $TransactionStatus;
            $result->reason_type                    = $ReasonType;
            //$result->transaction_reason             = $TransactionReason;
            //$result->debit_party_charges            = $DebitPartyCharges;
            $result->debit_account_type             = $DebitAccountType;
            $result->initiated_time                 = $InitiatedTime;
            //$result->originator_conversationid     = $OriginatorConversationID;
            $result->credit_party_name              = $CreditPartyName;
            $result->debit_party_name               = $DebitPartyName;
        }
        $result->save();

    }

}
