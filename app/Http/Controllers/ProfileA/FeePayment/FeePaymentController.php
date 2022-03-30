<?php

namespace App\Http\Controllers\ProfileA\FeePayment;

use App\Bank;
use App\ClassGrade;
use App\CurrentSession;
use App\Exports\FeePaymentExport;
use App\FeeDiscount;
use App\FeePayment;
use App\SchoolProfile;
use App\Student;
use App\StudentFee;
use App\StudentTransport;
use PDF;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;

class FeePaymentController extends Controller
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

    public function checkBank(Request $request)
    {
        $confirm = FeePayment::where('bank_id', $request->bank)->where('ref_no', $request->refno)->first();

        if($confirm)
        {
            $used = '<a href="/fee-payment/'.$confirm->id.'" target="_blank" class="btn btn-danger btn-flat btn-block">This Ref. No Has Been Used!</a>';
        }
        else
        {
            $used = '<a href="javascript:;" class="btn btn-success btn-flat btn-block">This Ref. No Has Not Been Used!</a>';
        }

        return $used;
    }

    public function checkeBank(Request $request)
    {
        $confirm = FeePayment::where('bank_id', $request->bank)->where('ref_no', $request->refno)->where('id', $request->id)->first();

        if($confirm)
        {
            $used = '<a href="/fee-payment/'.$confirm->id.'" target="_blank" class="btn btn-danger btn-flat btn-block">This Ref. No Has Been Used!</a>';
        }
        else
        {
            $used = '<a href="javascript:;" class="btn btn-success btn-flat btn-block">This Ref. No Has Not Been Used!</a>';
        }


        return $used;
    }

    public function printReceipt($id)
    {
        $feePayment = FeePayment::findOrFail($id);
        $printed = $feePayment->print + 1;

        $feePayment->print = $printed;
        $feePayment->save();

        $profile = SchoolProfile::findOrFail(1);
        return view('profilea.fee-payment.print_a5_receipt', compact('feePayment', 'profile', 'printed'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $current_session = CurrentSession::Current()->first();
        $payments = FeePayment::where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
        return view('profilea.fee-payment.collected_fees', compact('current_session', 'payments'));
    }

    public function collectFees(Request $request)
    {
        $student = Student::where('slug', $request->input('stud'))->first();
        return redirect()->route('collectFee', $student->slug);
    }

    public function collectedFeeReport(Request $request)
    {
        $dateFrom = $request->date_from;
        $dateTo = $request->date_to;

        $payments = FeePayment::where('pay_date', '>=', $dateFrom)->where('pay_date', '<=', $dateTo)->orderBy('receipt_no', 'desc')->get();
        return view('profilea.reports.collected_fee_report', compact( 'payments', 'dateFrom', 'dateTo'));
    }

    public function bankReport(Request $request)
    {
        $bank_id = $request->bank;
        $dateFrom = $request->date_from;
        $dateTo = $request->date_to;

        $bank = Bank::findOrFail($bank_id);

        $payments = FeePayment::where('pay_date', '>=', $dateFrom)->where('pay_date', '<=', $dateTo)->where('bank_id', $bank_id)->orderBy('receipt_no', 'desc')->get();
        return view('profilea.reports.bank_reports', compact( 'payments', 'dateFrom', 'dateTo', 'bank'));

    }

    public function collectFee($id)
    {
        $student = Student::where('slug', $id)->first();
        $current_session = CurrentSession::Current()->first();
        $banks = Bank::Active()->get();
        $studentFees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $feeDiscounts = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $transport = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();
        $feePayment = FeePayment::where('student_id', $student->id)->where('current_session_id', $current_session->id)->sum('paid');
        return view('profilea.fee-payment.collect_fees', compact('student', 'current_session', 'banks','studentFees', 'feeDiscounts', 'transport', 'feePayment'));
    }

    public function paymentByClass($id)
    {
        $class_grade = ClassGrade::where('slug', $id)->first();
        $current_session = CurrentSession::Current()->first();
        $payments = FeePayment::where('current_session_id', $current_session->id)->where('class_grade_id', $class_grade->id)->orderBy('receipt_no', 'desc')->get();
        return view('profilea.fee-payment.collected_class_fees', compact('current_session', 'payments', 'class_grade'));
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
        $request->validate([
            'student_id'            => 'required|numeric',
            'current_session_id'    => 'required|numeric',
            'class_grade_id'        => 'required|numeric',
            'paid'                  => 'required|numeric',
            'pay_date'              => 'required|date',
            'slip_date'             => 'required|date',
            'bank_id'               => 'required|numeric',
            'ref_no'                => 'required|string',
        ]);

        $duplicate = FeePayment::where('bank_id', $request->bank_id)->where('ref_no', $request->ref_no)->get();

        if (count($duplicate))
        {
            return redirect()->back()->with('error', 'The Reference No. you have entered has been used!');
        }

        //First fetch fees data from the student
        $student = Student::findOrFail($request->student_id);
        $arrears = $student->arrears;
        $current = $student->current;
        $balance = $student->balance;
        $paid    = $student->paid;

        //Payment details
        $amount_paid = $request->paid;
        $bank_id     = $request->bank_id;
        $ref_no      = $request->ref_no;
        $pay_date    = $request->pay_date;
        $slip_date   = $request->slip_date;
        $current_session_id   = $request->current_session_id;
        $class_grade_id   = $request->class_grade_id;

        //Initiate a fresh payment
        if ($arrears > 0) {
            //if the amount paid is greater than arrears
            if ($amount_paid > $arrears) {
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
            } elseif ($amount_paid < $arrears) {
                //New arrears balance
                $new_arrears = $arrears - $amount_paid;
                //fees paid
                $fees_paid = 0;
                //Arrears paid
                $arrears_paid = $amount_paid;
                //New fees balance
                $new_fees_balance = $new_arrears + $current;
                $new_current = $current;

            } else {
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
        }
        else
        {
            $new_arrears      = $arrears;
            $fees_paid        = $amount_paid;
            $arrears_paid     = 0;
            $new_current      = $current - $amount_paid;
            $new_fees_balance = $new_current;
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

        return redirect()->route('fee-payment.show', $data->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\FeePayment  $feePayment
     * @return \Illuminate\Http\Response
     */
    public function show(FeePayment $feePayment)
    {
        $profile = SchoolProfile::findOrFail(1);
        return view('profilea.fee-payment.show_payment', compact('feePayment', 'profile'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\FeePayment  $feePayment
     * @return \Illuminate\Http\Response
     */
    public function edit(FeePayment $feePayment)
    {
        if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin') {
            $current_session = CurrentSession::Current()->first();
            $banks = Bank::Active()->get();

            return view('profilea.fee-payment.edit_fee_payment', compact('feePayment', 'banks', 'current_session'));
        }

        return redirect()->back()->with('failed', 'Failed! You are not allowed to Edit payments!');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\FeePayment  $feePayment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FeePayment $feePayment)
    {
        $request->validate([
            'paid'          => 'required|numeric',
            'pay_date'      => 'required|date',
            'slip_date'     => 'required|date',
            'bank_id'       => 'required|numeric',
            'ref_no'        => 'required|string',
        ]);

        $duplicate = FeePayment::where('bank_id', $request->bank_id)->where('ref_no', $request->ref_no)->whereNotIn('id',$feePayment->id)->get();

        if (count($duplicate))
        {
            return redirect()->back()->with('error', 'The Reference No. you have entered has been used!');
        }

        //First fetch the old figures
        $old_expected  = $feePayment->expected;
        $old_fees      = $feePayment->fees;
        $old_arrears   = $feePayment->arrears;
        $old_paid      = $feePayment->paid;

        //Fetch newly changed figures
        $amount_paid      = $request->paid;

        //Check if there is any different in the amount paid
        if ($amount_paid != $old_paid)
        {
            //If there is a change in the amount, reverse the original payment
            //Get student details/figure
            $student = Student::findOrFail($feePayment->student_id);
            $stud_expected = $student->expected;
            $stud_current  = $student->current;
            $stud_arrears  = $student->arrears;
            $stud_paid     = $student->paid;
            $stud_balance  = $student->balance;

            //Reset Figures in student details
            $data = $student;
            $data->expected    = $old_paid + $stud_expected;
            $data->arrears     = $old_arrears + $stud_arrears;
            $data->current     = $old_fees + $stud_current;
            $data->paid        = $stud_paid - $old_paid;
            $data->balance     = $old_paid + $stud_balance;
            $data->updated_by  = Auth::user()->id;
            $data->save();


            //Initiate a fresh payment
           if ($data->arrears > 0)
           {
               //if the amount paid is greater than arrears
               if($amount_paid > $data->arrears)
               {
                   //Deduct arrears from paid to the amount that goes to fees payment
                   $new_fees = $amount_paid - $data->arrears;
                   //New arrears is now 0
                   $new_arrears = 0;
                   //fees paid
                   $fees_paid = $new_fees;
                   //Arrears paid = $arr
                   $arrears_paid = $data->arrears;
                   $new_current = $data->current - $new_fees;
                   //Deduct current term fees from $new_fees to get new fees balance
                   $new_fees_balance = $data->current - $new_fees;

                   //If the amount paid is less than the last term arrears
               }
               elseif($amount_paid < $data->arrears)
               {
                   //New arrears balance
                   $new_arrears = $data->arrears - $amount_paid;
                   //fees paid
                   $fees_paid = 0;
                   //Arrears paid
                   $arrears_paid = $amount_paid;
                   //New fees balance
                   $new_fees_balance = $new_arrears + $data->current;
                   $new_current = $data->current;

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
                   $new_fees_balance = $data->current;
                   $new_current = $data->current;
               }
           }
           else
           {
               $new_arrears      = $data->arrears;
               $fees_paid        = $amount_paid;
               $arrears_paid     = 0;
               $new_current      = $data->current - $amount_paid;
               $new_fees_balance = $new_current;
           }

            //Save the payment information
            $data1 = $feePayment;
            $data1->fees                 = $fees_paid;
            $data1->arrears              = $arrears_paid;
            $data1->paid                 = $amount_paid;
            $data1->balance              = $old_expected - $amount_paid;
            $data1->pay_date             = $request->pay_date;
            $data1->slip_date            = $request->slip_date;
            $data1->bank_id              = $request->bank_id;
            $data1->ref_no               = $request->ref_no;
            $data1->updated_by           = Auth::user()->id;
            $data1->save();


            //update student figures
            $data2 = $data;
            $data2->arrears     = $new_arrears;
            $data2->current     = $new_current;
            $data2->paid        = $data->paid + $amount_paid;
            $data2->balance     = $new_fees_balance;
            $data2->updated_by  = Auth::user()->id;
            $data2->save();

            return redirect()->route('fee-payment.show', $data1->id);
        }
        else
        {
            //If not change in amount, save the rest of the data
           $data = $feePayment;
           $data->pay_date   = $request->pay_date;
           $data->slip_date = $request->slip_date;
           $data->bank_id   = $request->bank_id;
           $data->ref_no    = $request->ref_no;
           $data->updated_by = Auth::user()->id;
           $data->save();

            return redirect()->route('fee-payment.show', $data->id);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\FeePayment $feePayment
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(Request $request, FeePayment $feePayment)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password) && Auth::user()->profile === "isSuper")
        {
            //First fetch the old figures
            $old_fees      = $feePayment->fees;
            $old_arrears   = $feePayment->arrears;
            $old_paid      = $feePayment->paid;

            //Get student details/figure
            $student = Student::findOrFail($feePayment->student_id);
            $stud_expected = $student->expected;
            $stud_current  = $student->current;
            $stud_arrears  = $student->arrears;
            $stud_paid     = $student->paid;
            $stud_balance  = $student->balance;

            //Reset Figures in student details
            $data = $student;
            $data->expected    = $old_paid + $stud_expected;
            $data->arrears     = $old_arrears + $stud_arrears;
            $data->current     = $old_fees + $stud_current;
            $data->paid        = $stud_paid - $old_paid;
            $data->balance     = $old_paid + $stud_balance;
            $data->updated_by  = Auth::user()->id;
            $data->save();


            $feePayment->delete();

            return redirect()->back()->with('success', 'The Student has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }

    /**
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public function exportFeePDF($id)
    {
        $current_session = CurrentSession::Current()->first();
        if($id === "all-classes")
        {
            $payments = FeePayment::where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
        }
        else
        {
            $class_grade = ClassGrade::where('slug', $id)->first();
            $payments = FeePayment::where('current_session_id', $current_session->id)->where('class_grade_id', $class_grade->id)->orderBy('receipt_no', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.fee_payments_pdf', compact('payments', 'profile', 'current_session'))
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('all-fee-payments-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function ExportFeeExcel($id)
    {
        return Excel::download(new FeePaymentExport($id), 'collected-fees-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }
}
