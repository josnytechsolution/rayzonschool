<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\Bank;
use App\ClassFee;
use App\ClassGrade;
use App\Classroom;
use App\CurrentSession;
use App\FeeDiscount;
use App\FeePayment;
use App\OptionalFee;
use App\SchoolProfile;
use App\FeeParameter;
use App\Student;
use App\StudentFee;
use App\StudentTimeline;
use App\StudentTransport;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\View\View;
use PDF;

class StudentFeeController extends Controller
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

    public function switchClass(Request $request, $id)
    {
        $request->validate([
            'toClass' => 'required|string',
        ]);

        $student        = Student::where('slug', $id)->first();
        $oldClass       = $student->class_grade->long_name;
        $currentClass   = $student->class_grade_id;
        $newClass       = $request->toClass;
        $thisClass      = ClassGrade::findOrFail($request->toClass);
        $newClassroom   = Classroom::where('class_grade_id', $newClass)->where('class_stream_id', $student->class_stream_id)->first();
        $currentSession = CurrentSession::Current()->first();

        $newFees = ClassFee::where('current_session_id', $currentSession->id)->where('class_grade_id', $newClass)->get();

        if ($newFees->count() < 1) { return redirect()->back()->with('failed', 'The selected class does no have a prepared fee structure!'); }

        //Get the current student's fees
        $currentFees = StudentFee::where('student_id', $student->id)->where('class_grade_id', $currentClass)->where('current_session_id', $currentSession->id)->where('description', 'General Fee')->get();

        //Delete the current student fees
        foreach ($currentFees as $currentFee) {
            $currentFee->delete();
        }

        foreach ($newFees as $newFee) {

            if($newFee->fee_parameter->type === 'main_fee')
            {
                $amount = $newFee->amount - floor(($newFee->amount * $student->discount_level->discount)/100);
            }
            else
            {
                $amount = $newFee->amount;
            }

            $row = new StudentFee();
            $row->student_id           = $student->id;
            $row->current_session_id   = $currentSession->id;
            $row->fee_parameter_id     = $newFee->fee_parameter_id;
            $row->description          = "General Fee";
            $row->class_grade_id       = $newClass;
            $row->amount               = $amount;
            $row->created_by           = Auth::user()->id;
            $row->save();
        }

        $otherFees = StudentFee::where('student_id', $student->id)->where('class_grade_id', $currentClass)->where('current_session_id', $currentSession->id)->get();
        if ($otherFees->count() > 0) {
            foreach ($otherFees as $otherFee) {
                $otherFee->class_grade_id = $newClass;
                $otherFee->updated_by     = Auth::user()->id;
                $otherFee->save();
            }
        }


        //Get transport details
        $studentTransport = StudentTransport::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $currentClass)->first();

        //Update transport class_grade_id to the current
        if ($studentTransport != NULL) {

            $transport = $studentTransport;
            $transport->class_grade_id = $newClass;
            $transport->updated_by = Auth::user()->id;
            $transport->save();

            $sTransport = StudentTransport::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $newClass)->first();
            $transportFee = $sTransport->amount;

        }  else { $transportFee = 0;}

        //Get student's fees discount
        $feeDiscounts = FeeDiscount::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $currentClass)->get();

        //Update class to the current
        if ($feeDiscounts->count() > 0) {

            foreach ($feeDiscounts as $feeDiscount) {
                $feeDiscount->class_grade_id = $newClass;
                $feeDiscount->updated_by = Auth::user()->id;
                $feeDiscount->save();
            }

            $discounts = FeeDiscount::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $newClass)->get();
            $discountFee = $discounts->sum('amount');

        } else { $discountFee = 0; }

        $fees = StudentFee::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $newClass)->get();

        $totalFees  = ($fees->sum('amount') + $transportFee) - $discountFee;
        $newCurrent = $totalFees - $student->paid;

        //Make changes to the current fees balance
        $data = $student;
        $data->classroom_id     = $newClassroom->id;
        $data->class_grade_id   = $newClass;
        $data->class_stream_id  = $newClassroom->class_stream_id;
        $data->expected         = $totalFees;
        if ($newCurrent > 0) {
            $data->current      = $newCurrent - $student->arrears;
        }
        $data->balance          = $newCurrent;
        $data->updated_by       = Auth::user()->id;
        $data->save();


        $description = "Switched from ".strtoupper($oldClass)." to ".strtoupper($thisClass->long_name)."";

        $tim = new StudentTimeline();
        $tim->student_id            = $data->id;
        $tim->current_session_id    = $currentSession->id;
        $tim->class_grade_id        = $newClass;
        $tim->description           = $description;
        $tim->created_by            = Auth::user()->id;
        $tim->save();

        return redirect()->back()->with('success', 'Student has been switched successfully!');

    }

    public function activateStudent(Request $request, $id)
    {
        $request->validate([
            'toClass' => 'required|string',
        ]);

        $student        = Student::where('slug', $id)->first();
        $oldClass       = $student->class_grade->long_name;
        $currentClass   = $student->class_grade_id;
        $newClass       = $request->toClass;
        $thisClass      = ClassGrade::findOrFail($request->toClass);
        $newClassroom   = Classroom::where('class_grade_id', $newClass)->where('class_stream_id', $student->class_stream_id)->first();
        $currentSession = CurrentSession::Current()->first();

        $newFees = ClassFee::where('current_session_id', $currentSession->id)->where('class_grade_id', $newClass)->get();

        if ($newFees->count() < 1) { return redirect()->back()->with('failed', 'The selected class does no have a prepared fee structure!'); }

        //Get the current student's fees
        $currentFees = StudentFee::where('student_id', $student->id)->where('class_grade_id', $currentClass)->where('current_session_id', $currentSession->id)->where('description', 'General Fee')->get();

        //Delete the current student fees
        foreach ($currentFees as $currentFee) {
            $currentFee->delete();
        }

        foreach ($newFees as $newFee) {

            if($newFee->fee_parameter->type === 'main_fee')
            {
                $amount = $newFee->amount - floor(($newFee->amount * $student->discount_level->discount)/100);
            }
            else
            {
                $amount = $newFee->amount;
            }

            $row = new StudentFee();
            $row->student_id           = $student->id;
            $row->current_session_id   = $currentSession->id;
            $row->fee_parameter_id     = $newFee->fee_parameter_id;
            $row->description          = "General Fee";
            $row->class_grade_id       = $newClass;
            $row->amount               = $amount;
            $row->created_by           = Auth::user()->id;
            $row->save();
        }

        $otherFees = StudentFee::where('student_id', $student->id)->where('class_grade_id', $currentClass)->where('current_session_id', $currentSession->id)->get();
        if ($otherFees->count() > 0) {
            foreach ($otherFees as $otherFee) {
                $otherFee->class_grade_id = $newClass;
                $otherFee->updated_by     = Auth::user()->id;
                $otherFee->save();
            }
        }


        //Get transport details
        $studentTransport = StudentTransport::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $currentClass)->first();

        //Update transport class_grade_id to the current
        if ($studentTransport != NULL) {

            $transport = $studentTransport;
            $transport->class_grade_id = $newClass;
            $transport->updated_by = Auth::user()->id;
            $transport->save();

            $sTransport = StudentTransport::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $newClass)->first();
            $transportFee = $sTransport->amount;

        }  else { $transportFee = 0;}

        //Get student's fees discount
        $feeDiscounts = FeeDiscount::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $currentClass)->get();

        //Update class to the current
        if ($feeDiscounts->count() > 0) {

            foreach ($feeDiscounts as $feeDiscount) {
                $feeDiscount->class_grade_id = $newClass;
                $feeDiscount->updated_by = Auth::user()->id;
                $feeDiscount->save();
            }

            $discounts = FeeDiscount::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $newClass)->get();
            $discountFee = $discounts->sum('amount');

        } else { $discountFee = 0; }

        $fees = StudentFee::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->where('class_grade_id', $newClass)->get();

        $totalFees  = ($fees->sum('amount') + $transportFee) - $discountFee;
        $newCurrent = $totalFees - $student->paid;

        //Make changes to the current fees balance
        $data = $student;
        $data->classroom_id     = $newClassroom->id;
        $data->class_grade_id   = $newClass;
        $data->class_stream_id  = $newClassroom->class_stream_id;
        $data->expected         = $totalFees;
        if ($newCurrent > 0) {
            $data->current      = $newCurrent - $student->arrears;
        }
        $data->balance          = $newCurrent;
        $data->status           = 1;
        $data->updated_by       = Auth::user()->id;
        $data->save();


        $description = "Student activated to ".strtoupper($thisClass->long_name)." ".strtoupper($currentSession->name)."";

        $tim = new StudentTimeline();
        $tim->student_id            = $data->id;
        $tim->current_session_id    = $currentSession->id;
        $tim->class_grade_id        = $newClass;
        $tim->description           = $description;
        $tim->created_by            = Auth::user()->id;
        $tim->save();

        return redirect()->back()->with('success', 'Student has been activated successfully!');

    }

    public function getStudent(Request $request)
    {
        return redirect()->route('studentFees', $request->stud);
    }

    public function studentFees($id)
    {
        $current_session = CurrentSession::Current()->first();
        $student = Student::where('slug', $id)->first();
        $studentFees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $feePayments = FeePayment::where('student_id', $student->id)->orderBy('receipt_no', 'desc')->get();
        $feeDiscounts = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $studTransport = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();

        return view('profilea.fee-setup.student_fees', compact('studentFees', 'student', 'current_session', 'feePayments', 'feeDiscounts', 'studTransport'));
    }

    /**
     * @param Request $request
     * @return Factory|RedirectResponse|View
     */
    public function sessionFees(Request $request)
    {
        $current_session = CurrentSession::findOrFail($request->current_session_id);
        $student = Student::where('slug', $request->student_id)->first();
        $studentFees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $feePayments = FeePayment::where('student_id', $student->id)->orderBy('receipt_no', 'desc')->get();
        $feeDiscounts = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $studTransport = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();

        dd($studentFees);

        return view('profilea.fee-setup.student_fees', compact('studentFees', 'student', 'current_session', 'feePayments', 'feeDiscounts', 'studTransport'));
    }


    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
//        $current_session = CurrentSession::Current()->first();
//        $students = Student::where('class_grade_id', 10)->Active()->get();
//
//        foreach ($students as $student)
//        {
//            $data["current_session"] = CurrentSession::Current()->first();
//            $data["student"] = Student::findOrFail(3);
//            $data["studentFees"] = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
//            $data["feePayments"] = FeePayment::where('student_id', $student->id)->where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
//            $data["feeDiscounts"] = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
//            $data["studTransport"] = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();
//            $data["banks"] = Bank::Active()->get();
//
//            $data["profile"] = SchoolProfile::findOrFail(1);
//
//            $data["email"] = "schoolbestms@gmail.com";
//
//            $data["title"] = strtoupper($student->name)." ".$current_session->name." FEES INVOICE";
//
//            $data["body"] = "Kindly find attached your invoice";
//
//            $pdf = PDF::loadView('profilea.export-pdf.student_invoice_pdf', $data)
//                ->setPaper('a4', 'portrait')
//                ->setWarnings(false)
//                ->setOptions(['defaultFont' => 'Courier New']);
//
//            Mail::send('profilea.emails.email', $data, function($message)use($data, $pdf) {
//
//                $message->to($data["email"], $data["email"])
//
//                    ->subject($data["title"])
//
//                    ->attachData($pdf->output(), "student-invoice.pdf");
//
//            });
//        }
//
//        return redirect()->back()->with('success', 'Invoices Have Been Emailed Successfully!');

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        if($request->type === 'optional')
        {
            $request->validate([
                'student_id'            => 'required|numeric',
                'current_session_id'    => 'required|numeric',
                'class_grade_id'        => 'required|numeric',
                'option'                => 'required',
            ]);

            $optionals = $request->option;

            $student = Student::findOrFail($request->student_id);

            foreach ($optionals as $optional)
            {
                $opt = OptionalFee::findOrFail($optional);
                $check = StudentFee::where('student_id', $student->id)->where('current_session_id', $request->current_session_id)->where('fee_parameter_id', $opt->fee_parameter_id)->first();

                if($check === NULL)
                {
                    $data = new StudentFee();
                    $data->student_id           = $student->id;
                    $data->current_session_id   = $request->current_session_id;
                    $data->fee_parameter_id     = $opt->fee_parameter_id;
                    $data->description          = "Optional Fee";
                    $data->class_grade_id       = $student->class_grade_id;
                    $data->amount               = $opt->amount;
                    $data->created_by           = Auth::user()->id;
                    $data->save();

                    $stud = $student;
                    $stud->expected  = $student->expected + $opt->amount;
                    $stud->current   = $student->current + $opt->amount;
                    $stud->balance   = $student->balance + $opt->amount;
                    $stud->save();
                }
            }

            return redirect()->back()->with('success', 'Optional Fee added successfully!');

        }
        elseif ($request->type === 'additional')
        {
            $request->validate([
                'student_id'            => 'required|numeric',
                'current_session_id'    => 'required|numeric',
                'class_grade_id'        => 'required|numeric',
                'fee_parameter_id'      => 'required|numeric',
                'description'           => 'required|string',
                'amount'                => 'required|numeric',
            ]);

            $voteHead = FeeParameter::findOrFail($request->fee_parameter_id);

            if ($voteHead->type === "balance_bf")
            {
                $data = new StudentFee();
                $data->student_id           = $request->student_id;
                $data->current_session_id   = $request->current_session_id;
                $data->fee_parameter_id     = $request->fee_parameter_id;
                $data->description          = "BALANCE B/F";
                $data->class_grade_id       = $request->class_grade_id;
                $data->amount               = $request->amount;
                $data->created_by           = Auth::user()->id;
                $data->save();

                // Check for overpayment
                $student = Student::findOrFail($request->student_id);

                if($request->amount < 0)
                {
                    $stud = $student;
                    $stud->expected  = $student->expected + $request->amount;
                    $stud->current   = $student->current + $request->amount;
                    $stud->balance   = $student->balance + $request->amount;
                    $stud->save();
                }
                else
                {
                    if ($student->balance < 0)
                    {
                        $stud = $student;
                        $stud->expected  = $student->expected + $request->amount;
                        $stud->current   = $student->current + $request->amount;
                        $stud->balance   = $student->balance + $request->amount;
                        $stud->save();
                    }
                    else
                    {
                        $stud = $student;
                        $stud->expected  = $student->expected + $request->amount;
                        $stud->arrears   = $student->arrears + $request->amount;
                        $stud->balance   = $student->balance + $request->amount;
                        $stud->save();
                    }
                }
            }
            else
            {
                $student = Student::findOrFail($request->student_id);

                $data = new StudentFee();
                $data->student_id           = $request->student_id;
                $data->current_session_id   = $request->current_session_id;
                $data->fee_parameter_id     = $request->fee_parameter_id;
                $data->description          = "Additional Fee";
                $data->class_grade_id       = $request->class_grade_id;
                $data->amount               = $request->amount;
                $data->created_by           = Auth::user()->id;
                $data->save();

                $stud = $student;
                $stud->expected  = $student->expected + $request->amount;
                $stud->current   = $student->current + $request->amount;
                $stud->balance   = $student->balance + $request->amount;
                $stud->save();
            }

            return redirect()->route('studentFees', $student->slug)->with('success', 'Additional Fee added successfully!');

        }
        else
        {
            $student = Student::findOrFail($request->student_id);
            return redirect()->route('studentFees', $student->slug)->with('error', 'Sorry! Something went wrong. Kindly Try again!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param StudentFee $studentFee
     * @return Response
     */
    public function show(StudentFee $studentFee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param StudentFee $studentFee
     * @return Response
     */
    public function edit(StudentFee $studentFee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param StudentFee $studentFee
     * @return Response
     */
    public function update(Request $request, StudentFee $studentFee)
    {
        $request->validate([
            'amount'  => 'required|numeric',
            'password' => 'required|string',
        ]);

        if (Hash::check($request->password, Auth::user()->password))
        {
            //Fetch student details
            $student = Student::findOrFail($studentFee->student_id);
            $studExpected = $student->expected;
            $studCurrent = $student->current;
            $studBalance = $student->balance;
            $studArrears = $student->arrears;

            //check if this is balance brought forward
            if ($studentFee->fee_parameter->type === "balance_bf")
            {
                $oldArrears = $studentFee->amount; //Balance BF in student_fees table
                $newArrears = $request->amount; //The updated balance bf by user

                //Check if the old arrears  is greater than the new arrears
                if ($oldArrears > $newArrears)
                {
                    $diff = $oldArrears - $newArrears;
                    $newStudExpected = $studExpected - $diff;
                    $newStudBalance  = $studBalance - $diff;

                    if ($student->arrears > 0) //Check if the current student arrears is greater than zero
                    {
                        $newStudArrears  = $studArrears - $diff;
                        $newStudCurrent  = $studCurrent;
                    }
                    else //if the amount is less or equal to the updated arrears
                    {
                        $newStudArrears  = $studArrears;
                        $newStudCurrent  = $studCurrent - $diff;
                    }
                }
                //Check if the updated arrears is greater than the old
                elseif ($newArrears > $oldArrears)
                {
                    $diff = $newArrears - $oldArrears;

                    $newStudExpected = $studExpected + $diff;
                    $newStudArrears  = $studArrears + $diff;
                    $newStudBalance  = $studBalance + $diff;
                    $newStudCurrent  = $studCurrent;
                }
                else
                {
                    $newStudExpected = $studExpected;
                    $newStudArrears  = $studArrears;
                    $newStudBalance  = $studBalance;
                    $newStudCurrent  = $studCurrent;
                }

                $studentFee->update(['amount' => $newArrears, 'updated_by' => Auth::user()->id]);
                $student->update(['expected' => $newStudExpected, 'arrears' => $newStudArrears, 'current' => $newStudCurrent, 'balance' => $newStudBalance, 'updated_by' => Auth::user()->id]);

                return redirect()->back()->with('success', 'Fees has been edited successfully!');
            }

            //If this is not arrears
            else
            {
                $oldFee = $studentFee->amount;
                $newFee = $request->amount;

                //Check if the old fee is greater than the new fee
                if ($oldFee > $newFee)
                {
                    $diff = $oldFee - $newFee;

                    $newStudExpected = $studExpected - $diff;
                    $newStudCurrent  = $studCurrent - $diff;
                    $newStudBalance  = $studBalance - $diff;
                }
                elseif ($newFee > $oldFee)
                {
                    $diff = $newFee - $oldFee;

                    $newStudExpected = $studExpected + $diff;
                    $newStudCurrent  = $studCurrent + $diff;
                    $newStudBalance  = $studBalance + $diff;
                }
                else
                {
                    $newStudExpected = $studExpected;
                    $newStudBalance  = $studBalance;
                    $newStudCurrent  = $studCurrent;
                }

                $studentFee->update(['amount' => $newFee, 'updated_by' => Auth::user()->id]);
                $student->update(['expected' => $newStudExpected, 'current' => $newStudCurrent, 'balance' => $newStudBalance, 'updated_by' => Auth::user()->id]);

                return redirect()->back()->with('success', 'Fees has been edited successfully!');
            }
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param StudentFee $studentFee
     * @return Response
     * @throws \Exception
     */
    public function destroy(Request $request, StudentFee $studentFee)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $student = Student::findOrFail($studentFee->student_id);

            //Confirm if this fee is  BALANCE B/F
            if($studentFee->fee_parameter->type === "balance_bf")
            {
                if ($student->arrears > 0)
                {
                    if ($student->arrears > $studentFee->amount)
                    {
                        $newExpected   = $student->expected - $studentFee->amount;
                        $newArrears = $student->arrears - $studentFee->amount;
                        $newCurrent = $student->current;
                        $newBalance = $student->balance - $studentFee->amount;
                    }
                    elseif ($student->arrears < $studentFee->amount)
                    {
                        $diff        = $studentFee->amount - $student->arrears;
                        $newExpected = $student->expected - $studentFee->amount;
                        $newArrears  = 0;
                        $newCurrent  = $student->current - $diff;
                        $newBalance  = $student->balance - $studentFee->amount;
                    }
                    else
                    {
                        $newExpected = $student->expected - $studentFee->amount;
                        $newArrears  = 0;
                        $newCurrent  = $student->current;
                        $newBalance  = $student->balance - $studentFee->amount;
                    }
                }
                else
                {
                    $newExpected = $student->expected - $studentFee->amount;
                    $newArrears  = 0;
                    $newCurrent  = $student->current - $studentFee->amount;
                    $newBalance  = $student->balance - $studentFee->amount;
                }

                $stud = $student;
                $stud->expected  = $newExpected;
                $stud->arrears   = $newArrears;
                $stud->current   = $newCurrent;
                $stud->balance   = $newBalance;
                $stud->save();
            }
            else
            {
                $stud = $student;
                $stud->expected  = $student->expected - $studentFee->amount;
                $stud->current   = $student->current - $studentFee->amount;
                $stud->balance   = $student->balance - $studentFee->amount;
                $stud->save();
            }

            $studentFee->delete();

            return redirect()->back()->with('success', 'The Student Fee has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }

    /**
     * @param $id
     * @return Response
     */
    public function invoicePDF($id)
    {
        $current_session = CurrentSession::Current()->first();
        $student = Student::where('slug', $id)->first();
        $studentFees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $feePayments = FeePayment::where('student_id', $student->id)->where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
        $feeDiscounts = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $studTransport = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();
        $banks = Bank::Active()->get();

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.student_invoice_pdf', compact('studentFees', 'student', 'current_session', 'feePayments', 'feeDiscounts', 'studTransport', 'profile', 'banks'))
            ->setPaper('a4', 'portrait')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Courier New']);

        return $pdf->stream('student-invoice-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function invoiceTimelinePDF($id)
    {
        $studentTimeline = StudentTimeline::findOrFail($id);
        $current_session = CurrentSession::findOrFail($studentTimeline->current_session_id);
        $student = Student::findOrFail($studentTimeline->student_id);
        $studentFees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $feePayments = FeePayment::where('student_id', $student->id)->where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
        $feeDiscounts = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $studTransport = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();
        $banks = Bank::Active()->get();

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.student_timeline_invoice_pdf', compact('studentFees', 'student', 'current_session', 'feePayments', 'feeDiscounts', 'studTransport', 'profile', 'banks', 'studentTimeline'))
            ->setPaper('a4', 'portrait')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Courier New']);

        return $pdf->stream('student-invoice-'.date('d-m-Y H:i:sa').'.pdf');
    }

    /**
     * @param $id
     * @return Response
     */
    public function invoicesPDF($id)
    {
        $current_session = CurrentSession::Current()->first();
        $students = Student::Active()->where('class_grade_id', $id)->get();
        $banks = Bank::Active()->get();

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.student_invoices_pdf', compact('students', 'current_session', 'profile', 'banks'))
            ->setPaper('a4', 'portrait')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Courier New']);

        return $pdf->stream('students-invoice-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function studentPaymentsPDF($id)
    {
        $student = Student::findOrFail($id);

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.student_fee_payments_pdf', compact('student', 'profile'))
            ->setPaper('a4', 'portrait')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Courier New']);

        return $pdf->stream($student->name.' Fee Payment Summary '.date('YmdHis').'.pdf');
    }
}