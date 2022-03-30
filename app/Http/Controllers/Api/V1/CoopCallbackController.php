<?php

namespace App\Http\Controllers\Api\V1;

use App\Bank;
use App\ClientConnection;
use App\Compute;
use App\CoopOutbox;
use App\CoopPayment;
use App\CurrentSession;
use App\FeePayment;
use App\GenerateToken;
use App\MessageOutbox;
use App\MpesaOutbox;
use App\SchoolProfile;
use App\SendConfirmation;
use App\Student;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CoopCallbackController extends Controller
{

    public static function processB2BAdviseConfirmation(Request $request)
    {
        $serviceName        = $request->header('serviceName');
        $messageID          = $request->header('messageID');
        $connectionID       = $request->header('connectionID');
        $connectionPassword = $request->header('connectionPassword');

        try {
            $client = ClientConnection::where('connectionID', $connectionID)->where('connectionPassword', $connectionPassword)->first();

            if ($client != NULL)
            {
                $transactionReferenceCode   = $request->TransactionReferenceCode;
                $transactionDate            = $request->TransactionDate;
                $totalAmount                = $request->TotalAmount;
                $currency                   = $request->Currency;
                $documentReferenceNumber    = $request->DocumentReferenceNumber;
                $bankCode                   = $request->BankCode;
                $branchCode                 = $request->BranchCode;
                $paymentDate                = $request->PaymentDate;
                $paymentReferenceCode       = $request->PaymentReferenceCode;
                $paymentCode                = $request->PaymentCode;
                $paymentMode                = $request->PaymentMode;
                $paymentAmount              = $request->PaymentAmount;
                $additionalInfo             = $request->AdditionalInfo;
                $accountNumber              = $request->AccountNumber;
                $accountName                = $request->AccountName;
                $institutionCode            = $request->InstitutionCode;
                $institutionName            = $request->InstitutionName;


                $student = Student::where('admno', $documentReferenceNumber)->first();

                if ($student != NULL)
                {
                    $current_session = CurrentSession::Current()->first();

                    $id = DB::table('coop_payments')->insertGetId(['student_id' => $student->id, 'current_session_id' => $current_session->id, 'transactionReferenceCode' => $transactionReferenceCode, 'transactionDate' => $transactionDate, 'totalAmount' => $totalAmount, 'currency' => $currency, 'documentReferenceNumber' => $documentReferenceNumber, 'bankCode' => $bankCode, 'branchCode' => $branchCode, 'paymentDate' => $paymentDate, 'paymentReferenceCode' => $paymentReferenceCode, 'paymentCode' => $paymentCode, 'paymentMode' => $paymentMode, 'paymentAmount' => $paymentAmount, 'additionalInfo' => $additionalInfo, 'accountNumber' => $accountNumber, 'accountName' => $accountName, 'institutionCode' => $institutionCode, 'institutionName' => $institutionName]);

                    //First fetch fees data from the student
                    $arrears = $student->arrears;
                    $current = $student->current;
                    $balance = $student->balance;
                    $paid    = $student->paid;

                    $bank = Bank::where('account_no', $accountNumber)->first();

                    //Payment details
                    $amount_paid        = $totalAmount;
                    $bank_id            = $bank->id;
                    $ref_no             = $transactionReferenceCode;
                    $pay_date           = date('Y-m-d');
                    $slip_date          = date('Y-m-d');
                    $current_session_id = $current_session->id;
                    $class_grade_id     = $student->class_grade_id;

                    //if the amount paid is greater than arrears
                    if($amount_paid > $arrears)
                    {
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
                    }
                    elseif ($amount_paid < $arrears)
                    {
                        //New arrears balance
                        $new_arrears = $arrears - $amount_paid;
                        //fees paid
                        $fees_paid = 0;
                        //Arrears paid
                        $arrears_paid = $amount_paid;
                        //New fees balance
                        $new_fees_balance = $new_arrears + $current;
                        $new_current = $current;

                    }
                    else
                    {
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
                    DB::table('fee_payments')->insert(['parent_detail_id' => $student->parent_detail_id, 'student_id' => $student->id, 'receipt_no' => $receipt_no, 'current_session_id' => $current_session_id, 'class_grade_id' => $class_grade_id, 'expected' => $balance, 'fees' => $fees_paid, 'arrears' => $arrears_paid, 'paid' => $amount_paid, 'balance' => $new_fees_balance, 'pay_date' => $pay_date, 'slip_date' => $slip_date, 'bank_id' => $bank_id, 'ref_no' => $ref_no, 'created_by' => 1]);

                    $data1 = $student;
                    $data1->arrears = $new_arrears;
                    $data1->current = $new_current;
                    $data1->paid    = $new_paid;
                    $data1->balance = $new_fees_balance;
                    $data1->save();

                    if($data1->balance < 0) { $newest = "Overpay"; } else { $newest = "Balance"; }

                    $amt = number_format($totalAmount);
                    $studentName = strtoupper($student->name);
                    $balanc = number_format($data1->balance);

                    $message = "Dear Parent/Guardian, Your payment of Ksh {$amt} for {$studentName} via COOP BANK has been received. New Fees {$newest} is Ksh {$balanc}. Thank you";

                    $messageId = Str::uuid()->getHex();
                    $uniq = Str::uuid()->getHex();
                    $phone = $student->parent_detail->primary_contact;

                    $chars = strlen($message);

                    $calc = Compute::calcEngine($chars);

                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'coop']);

                    DB::table('coop_outboxes')->insert(['coop_payment_id' => $id, 'messageId' => $messageId, 'message' => $message, 'phone' => $phone, 'status' => 'sent']);

                    SendConfirmation::CoopConfirmation($messageId, $message, $phone);

                    $content = [
                        'TransactionReferenceCode'  => $transactionReferenceCode,
                        'TransactionDate'           => date('Y-m-d\TH:i:s.vP'),
                        'TransactionAmount'         => $totalAmount,
                        'AccountNumber'             => $transactionReferenceCode,
                        'AccountName'               => $student->name,
                        'InstitutionCode'           => $institutionCode,
                        'InstitutionName'           => 'Schoolbest Academy'
                    ];

                    return response($content)->withHeaders(['messageID' => $messageID, 'statusCode' => 200, 'statusDescription' => 'Payment Successfully Received']);
                }
                else
                {
                    return response(['statusCode' => 400, 'statusDescription' => 'The parameters are not valid or they are missing.'])->withHeaders(['statusCode' => 400, 'statusDescription' => 'The parameters are not valid or they are missing.']);
                }
            }
            else
            {
                return response(['statusCode' => 401, 'statusDescription' => 'The caller is not authorized for this request.'])->withHeaders(['statusCode' => 401, 'statusDescription' => 'The caller is not authorized for this request.']);
            }

        } catch ( QueryException $e) {

            $error_code = $e->errorInfo[1];
            if($error_code == 1062){
                return response(['statusCode' => 405, 'statusDescription' => 'Duplicate transaction detected.'])->withHeaders(['statusCode' => 405, 'statusDescription' => 'Duplicate transaction detected.']);
            } else {
                return response(['statusCode' => 405, 'statusDescription' => 'A severe problem has occurred.'])->withHeaders(['statusCode' => 405, 'statusDescription' => 'A severe problem has occurred.']);
            }

        }



    }
}
