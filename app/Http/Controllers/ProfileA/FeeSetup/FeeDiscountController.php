<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\ClassGrade;
use App\CurrentSession;
use App\Exports\FeeDiscountExport;
use App\FeeDiscount;
use App\SchoolProfile;
use App\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use PDF;

class FeeDiscountController extends Controller
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

    public function classFeeDiscount($id)
    {
        $current_session = CurrentSession::Current()->first();
        $grade = ClassGrade::where('slug', $id)->first();
        $discounts = FeeDiscount::where('current_session_id', $current_session->id)->where('class_grade_id', $grade->id)->get();

        return view('profilea.fee-setup.class_fee_discounts', compact('discounts', 'current_session', 'grade'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $current_session = CurrentSession::Current()->first();
        $discounts = FeeDiscount::where('current_session_id', $current_session->id)->get();

        return view('profilea.fee-setup.fee_discounts', compact('discounts', 'current_session'));
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
            'student_id'         => 'required|numeric',
            'current_session_id' => 'required|numeric',
            'class_grade_id'     => 'required|numeric',
            'name'               => 'required|string',
            'description'        => 'required|string',
            'amount'             => 'required|numeric',
        ]);

        $data = new FeeDiscount();
        $data->student_id           = $request->student_id;
        $data->current_session_id   = $request->current_session_id;
        $data->class_grade_id       = $request->class_grade_id;
        $data->name                 = $request->name;
        $data->description          = $request->description;
        $data->amount               = $request->amount;
        $data->created_by           = Auth::user()->id;
        $data->save();

        $student = Student::findOrFail($request->student_id);
        $stud_expected = $student->expected;
        $stud_current  = $student->current;
        $stud_arrears  = $student->arrears;
        $stud_balance  = $student->balance;
        $discount      = $request->amount;

        if($stud_arrears > 0)
        {
            if($stud_arrears > $discount)
            {
               $new_arrears = $stud_arrears - $discount;
               $new_current = $stud_current;
               $new_balance = $stud_balance - $discount;
               $new_expected = $stud_expected - $discount;
            }
            else
            {
                $new_arrears = 0;

                $remainder = $discount - $stud_arrears;
                if ($remainder < $stud_current)
                {
                    $new_current = $stud_current - $remainder;
                }
                else
                {
                    $new_current = 0;
                }

                $new_balance = $stud_balance - $discount;
                $new_expected = $stud_expected - $discount;
            }
        }
        else
        {
            $new_arrears = 0;

            if ($stud_current > $discount)
            {
                $new_current = $stud_current - $discount;
            }
            else
            {
                $new_current = 0;
            }

            $new_balance = $stud_balance - $discount;
            $new_expected = $stud_expected - $discount;
        }

        $stud = $student;
        $stud->expected     = $new_expected;
        $stud->current      = $new_current;
        $stud->arrears      = $new_arrears;
        $stud->balance      = $new_balance;
        $stud->save();


        return redirect()->back()->with('success', 'Discount has been effected successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\FeeDiscount  $feeDiscount
     * @return \Illuminate\Http\Response
     */
    public function show(FeeDiscount $feeDiscount)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\FeeDiscount  $feeDiscount
     * @return \Illuminate\Http\Response
     */
    public function edit(FeeDiscount $feeDiscount)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\FeeDiscount  $feeDiscount
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FeeDiscount $feeDiscount)
    {
        $request->validate([
            'name'                  => 'required|string',
            'description'           => 'required|string',
            'amount'                => 'required|numeric',
        ]);

        $discount   = $request->amount;

        if($discount > $feeDiscount->amount)
        {
            $diff = $discount - $feeDiscount->amount;

            $data = $feeDiscount;
            $data->name                 = $request->name;
            $data->description          = $request->description;
            $data->amount               = $discount;
            $data->updated_by           = Auth::user()->id;
            $data->save();

            $student = Student::findOrFail($data->student_id);
            $stud_expected = $student->expected;
            $stud_current  = $student->current;
            $stud_balance  = $student->balance;


            $stud = $student;
            $stud->expected     = $stud_expected - $diff;
            $stud->current      = $stud_current - $diff;
            $stud->balance      = $stud_balance - $diff;
            $stud->save();

            return redirect()->back()->with('success', 'The Student Discount has been updated successfully!');
        }
        elseif ($discount < $feeDiscount->amount)
        {
            $diff = $feeDiscount->amount - $discount;

            $data = $feeDiscount;
            $data->name                 = $request->name;
            $data->description          = $request->description;
            $data->amount               = $discount;
            $data->updated_by           = Auth::user()->id;
            $data->save();

            $student = Student::findOrFail($data->student_id);
            $stud_expected = $student->expected;
            $stud_current  = $student->current;
            $stud_balance  = $student->balance;


            $stud = $student;
            $stud->expected     = $stud_expected + $diff;
            $stud->current      = $stud_current + $diff;
            $stud->balance      = $stud_balance + $diff;
            $stud->save();

            return redirect()->back()->with('success', 'The Student Discount has been updated successfully!');
        }

        return redirect()->back()->with('error', 'The Discount amount has not changed!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\FeeDiscount $feeDiscount
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, FeeDiscount $feeDiscount)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $student = Student::findOrFail($feeDiscount->student_id);

            $stud = $student;
            $stud->expected  = $student->expected + $feeDiscount->amount;
            $stud->current   = $student->current + $feeDiscount->amount;
            $stud->balance   = $student->balance + $feeDiscount->amount;
            $stud->save();

            $feeDiscount->delete();

            return redirect()->back()->with('success', 'The Discount Fee has been deleted successfully!');
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
    public function feeDiscountPDF($id)
    {
        $current_session = CurrentSession::Current()->first();
        if($id === "all-classes")
        {
            $discounts = FeeDiscount::where('current_session_id', $current_session->id)->orderBy('student_id', 'desc')->get();
        }
        else
        {
            $class_grade = ClassGrade::where('slug', $id)->first();
            $discounts = FeeDiscount::where('current_session_id', $current_session->id)->where('class_grade_id', $class_grade->id)->orderBy('student_id', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.fee_discounts_pdf', compact('discounts', 'profile', 'current_session'))
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('all-fee-discounts-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function FeeDiscountExcel($id)
    {
        return Excel::download(new FeeDiscountExport($id), 'fee-discounts-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }
}
