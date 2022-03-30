<?php

namespace App\Http\Controllers\ProfileA\FeePayment;

use App\Bank;
use App\CurrentSession;
use App\FeePayment;
use App\GenerateToken;
use App\MessageOutbox;
use App\MpesaOutbox;
use App\MpesaPayment;
use App\SendConfirmation;
use App\Student;
use App\TransactionStatus;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class MpesaPaymentController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function confirmTransaction(Request $request)
    {
        $url = 'https://api.safaricom.co.ke/mpesa/transactionstatus/v1/query';
        $token = GenerateToken::generateLiveToken();

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json','Authorization:Bearer '.$token)); //setting custom header


        $curl_post_data = array(
            'Initiator'             => 'MabeLink',
            'SecurityCredential'    => 'HyHp1f1i5JXxwX0l4XdFBPAmjrAcS2rLuF1VG0f+8fAFNqYkSQpuyLqi9ElQOugIEqGCJHfsgapyQpvcUIsvHFThkwCu8EcKQrrq+qjL4cNMiR2FV0TVbSH2IiBhMuvrwXTJaaPk/mo2cjkxFVSwjWmjJ3XDbvn07fzBy/lUSmSYN8duQs+nNiMWaW/t9kG7AAmTnYyQXBOXxSzutXkgLAmInhRAhUYTdAL3b/rYxCywuyYBiYp5jmo9fnx4MscH95KkIhFf3PXLYNDGnziVxTL2zwjOuxgEV4dFH+tN/66ePpPtMNyPteCxbyH3/xRcMSafd8p1mLGOphSzScdbSA==',
            'CommandID'             => 'TransactionStatusQuery',
            'TransactionID'         => $request->code,
            'PartyA'                => '4087119',
            'IdentifierType'        => '4',
            'ResultURL'             => 'https://mabetwinkling.schoolbest.net/v1/transaction-confirmation-url',
            'QueueTimeOutURL'       => 'https://mabetwinkling.schoolbest.net/v1/transaction-confirmation-url',
            'Remarks'               => 'Transaction Query',
            'Occasion'              => 'Transaction Request'
        );

        $data_string = json_encode($curl_post_data);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($curl, CURLOPT_HEADER, false);
        $response = curl_exec($curl);
        $result = json_decode($response);
        curl_close($curl);

        sleep(2);

        $status = TransactionStatus::where('originator_conversation_id', $result->OriginatorConversationID)->first();

        if($status->transaction_status === "Completed")
        {
            $message = "<div class='alert alert-success text-center'>Transaction was completed successfully!</div>";
        } else {
            $message = "<div class='alert alert-danger text-center'>Transaction Not Found!</div>";
        }
        return $message;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $current_session = CurrentSession::Current()->first();
        $mpesa_payments = MpesaPayment::where('current_session_id', $current_session->id)->orderBy('id', 'desc')->get();

        return view('profilea.fee-payment.mpesa_payments', compact('mpesa_payments', 'current_session'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\MpesaPayment  $mpesaPayment
     * @return \Illuminate\Http\Response
     */
    public function show(MpesaPayment $mpesaPayment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MpesaPayment  $mpesaPayment
     * @return \Illuminate\Http\Response
     */
    public function edit(MpesaPayment $mpesaPayment)
    {
        if(Auth::user()->profile === 'isSuper' && Auth::user()->profile === 'isSuper') {
            $students = Student::Active()->orderBy('name', 'asc')->get();
            return view('profilea.fee-payment.edit_mpesa_payment', compact('mpesaPayment', 'students'));
        }
        else{
            return redirect()->back()->with('failed', 'Failed! You are not allowed to Edit payments!');
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MpesaPayment  $mpesaPayment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MpesaPayment $mpesaPayment)
    {
        $request->validate([
           'student_id'  => 'required|numeric',
            'password' => 'required|string',
        ]);

        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password) && Auth::user()->profile === "isSuper")
        {

            $student = Student::findOrFail($request->student_id);

            $feePayment = FeePayment::where('ref_no', $mpesaPayment->transID)->first();

            if ($feePayment)
            {
                if ($student->id === $feePayment->student_id)
                {
                    return redirect()->back()->with('error', 'No changes made! The student is the same!');
                }

                //Get student details/figure
                $stud = Student::findOrFail($feePayment->student_id);
                $stud_expected = $stud->expected;
                $stud_current  = $stud->current;
                $stud_arrears  = $stud->arrears;
                $stud_paid     = $stud->paid;
                $stud_balance  = $stud->balance;

                //Reset Figures in student details
                $new_data = $stud;
                $new_data->expected    = $feePayment->paid + $stud_expected;
                $new_data->arrears     = $feePayment->arrears + $stud_arrears;
                $new_data->current     = $feePayment->fees + $stud_current;
                $new_data->paid        = $stud_paid - $feePayment->paid;
                $new_data->balance     = $feePayment->paid + $stud_balance;
                $new_data->updated_by  = Auth::user()->id;
                $new_data->save();

                $feePayment->delete();

            }

            $result = $mpesaPayment;
            $result->student_id        = $student->id;
            $result->billRefNumber     = strtoupper($student->admno);
            $result->status            = 1;
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
            $pay_date           = date('Y-m-d', strtotime($mpesaPayment->transTime));
            $slip_date          = date('Y-m-d', strtotime($mpesaPayment->transTime));
            $current_session_id = $mpesaPayment->current_session_id;
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
            $data->created_by           = Auth::user()->id;
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

            $name = strtoupper($mpesaPayment->firstName)." ".strtoupper($mpesaPayment->middleName)." ".strtoupper($mpesaPayment->lastName);
            $message = "Dear {$name}, Your payment of Ksh {$mpesaPayment->transAmount} for {$student->name} has been received. New Fees {$newest} {$data1->balance}.  Thank you";

            $messageId = Str::uuid()->getHex();
            $uniq = Str::uuid()->getHex();
            $phone = $mpesaPayment->MSISDN;

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

            $out = new MessageOutbox();
            $out->code         = $uniq;
            $out->recipient_id = $student->id;
            $out->messageId    = $messageId;
            $out->message      = $message;
            $out->phoneno      = $phone;
            $out->characters   = $chars;
            $out->sms_units    = $units;
            $out->sms_cost     = $cost;
            $out->target       = "mpesa";
            $out->save();

            $dat = new MpesaOutbox();
            $dat->mpesa_payment_id = $result->id;
            $dat->messageId    = $messageId;
            $dat->message      = $message;
            $dat->phone        = $phone;
            $dat->status       = "sent";
            $dat->save();

            SendConfirmation::PaymentConfirmation($messageId, $message, $phone);

            return redirect()->route('mpesa-payments.index')->with('success', 'Mpesa payment has been assigned to the right student!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MpesaPayment  $mpesaPayment
     * @return \Illuminate\Http\Response
     */
    public function destroy(MpesaPayment $mpesaPayment)
    {
        //
    }
}
