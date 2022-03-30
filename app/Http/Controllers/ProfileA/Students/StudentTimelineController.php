<?php

namespace App\Http\Controllers\ProfileA\Students;

use App\CurrentSession;
use App\FeeDiscount;
use App\FeePayment;
use App\Http\Controllers\Controller;
use App\Student;
use App\StudentFee;
use App\StudentTimeline;
use App\StudentTransport;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class StudentTimelineController extends Controller
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

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param StudentTimeline $studentTimeline
     * @return Response
     */
    public function show(StudentTimeline $studentTimeline)
    {
        $current_session = CurrentSession::findOrFail($studentTimeline->current_session_id);
        $student = Student::findOrFail($studentTimeline->student_id);
        $studentFees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $feePayments = FeePayment::where('student_id', $student->id)->where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
        $feeDiscounts = FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get();
        $studTransport = StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first();


        return view('profilea.fee-setup.student_timeline', compact('studentFees', 'student', 'current_session', 'feePayments', 'feeDiscounts', 'studTransport', 'studentTimeline'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param StudentTimeline $studentTimeline
     * @return Response
     */
    public function edit(StudentTimeline $studentTimeline)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param StudentTimeline $studentTimeline
     * @return Response
     */
    public function update(Request $request, StudentTimeline $studentTimeline)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param StudentTimeline $studentTimeline
     * @return Response
     */
    public function destroy(StudentTimeline $studentTimeline)
    {
        //
    }
}