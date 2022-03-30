<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\ClassFee;
use App\ClassGrade;
use App\Classroom;
use App\CurrentSession;
use App\FeeParameter;
use App\PromotionHistory;
use App\Student;
use App\StudentFee;
use App\StudentPromotion;
use App\StudentTimeline;
use App\StudentTransport;
use App\TransportZoneFee;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class StudentPromotionController extends Controller
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
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     *
     */
    public function backupDatabase()
    {
        $call =  Artisan::call('backup:run', []);

        if ($call === 0)
        {
            return redirect()->back()->with('success', 'Database backup is successful!');
        }
        else
        {
            return redirect()->back()->with('failed', 'Database backup was Unsuccessful! Try Again!');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $class_grades = ClassGrade::orderBy('name', 'asc')->get();
        $current_sessions = CurrentSession::all();
        $current_term = CurrentSession::Current()->first();
        return view('profilea.school-setup.student_promotion', compact('class_grades', 'current_sessions', 'current_term'));
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
            'class_from'    => 'required|numeric',
            'from_session'  => 'required|numeric',
            'class_to'      => 'required|numeric',
            'current_session_id'   => 'required|numeric',
            'password'      => 'required|string',
        ]);

        $class_from         = $request->input('class_from');
        $from_session       = $request->input('from_session');
        $class_to           = $request->input('class_to');
        $current_session_id = $request->input('current_session_id');
        $password           = $request->input('password');


        if(Hash::check($password, Auth::user()->password))
        {
            // If try to move within the same session retrun with an eror
            if ($from_session === $current_session_id) { return redirect()->back()->with('error', 'Error! You cannot move within the same term!'); }

            $checkT = TransportZoneFee::where('current_session_id', $current_session_id)->first();
            // If transport for the new session is not created return with error
            if ($checkT === NULL) { return redirect()->back()->with('error', 'Error! You have not created transport fees for the new term!'); }

            if($class_to === "Alumni")
            {
                $prev_sess = CurrentSession::findOrFail($from_session);
                $students = Student::where('class_grade_id', $class_from)->Active()->get();

                foreach ($students as $student)
                {
                    $stud = $student;
                    $stud->yoc  = $prev_sess->financial_year->name;
                    $stud->status  = 3;
                    $stud->updated_by = Auth::user()->id;
                    $stud->save();

                    $transport = StudentTransport::where('student_id', $student->id)->where('status', 1)->first();
                    if($transport)
                    {
                        $tra = $transport;
                        $tra->status = 2;
                        $tra->updated_by = Auth::user()->id;
                        $tra->save();
                    }

                }

                return redirect()->back()->with('success', 'Student promoted successfully!');
            }

            // Check if the fee structure for this class has been created
            $classFees = ClassFee::where('current_session_id', $current_session_id)->where('class_grade_id', $class_to)->get();
            if ($classFees->count() > 0)
            {
                // Check if this request has been made before
                $duplicate = PromotionHistory::where('to_session_id', $current_session_id)->where('class_from', $class_from)->where('class_to', $class_to)->get();

                if ($duplicate->count() > 0) { return redirect()->back()->with('failed', 'This class has already been promoted!'); }

                //Save this promotion
                $promo = new PromotionHistory();
                $promo->class_from      = $class_from;
                $promo->class_to        = $class_to;
                $promo->from_session_id = $from_session;
                $promo->to_session_id   = $current_session_id;
                $promo->created_by      = Auth::user()->id;
                $promo->save();

                $students = Student::Active()->where('class_grade_id', $class_from)->get();

                foreach ($students as $student)
                {
                    $currentArrears = $student->arrears;
                    $currentCurrent = $student->current;
                    $currentBalance = $student->balance;

                    foreach ($classFees as $classFee)
                    {
                        if($classFee->fee_parameter->type === "main_fee")
                        {
                            $amount = $classFee->amount - floor(($classFee->amount * $student->discount_level->discount)/100);
                        }
                        else
                        {
                            $amount = $classFee->amount;
                        }

                        $class_data = new StudentFee();
                        $class_data->student_id           = $student->id;
                        $class_data->current_session_id   = $current_session_id;
                        $class_data->fee_parameter_id     = $classFee->fee_parameter_id;
                        $class_data->description          = "General Fee";
                        $class_data->class_grade_id       = $class_to;
                        $class_data->amount               = $amount;
                        $class_data->created_by           = Auth::user()->id;
                        $class_data->save();
                    }


                    //Add transport details if available
                    $trans_amount = 0;

                    if($student->on_transport === "YES")
                    {
                        $tran = TransportZoneFee::where('transport_zone_id', $student->transport_zone_id)->where('current_session_id', $current_session_id)->first();
                        if ($tran != NULL)
                        {
                            $tran_data = new StudentTransport();
                            $tran_data->student_id              = $student->id;
                            $tran_data->current_session_id      = $current_session_id;
                            $tran_data->class_grade_id          = $class_to;
                            $tran_data->transport_zone_fee_id   = $tran->id;
                            $tran_data->way                     = $student->way;
                            if($student->way < 2){
                                $tran_data->amount              = $tran->one_way;
                            }elseif($student->way > 1){
                                $tran_data->amount              = $tran->two_way;
                            }
                            $tran_data->created_by           = Auth::user()->id;
                            $tran_data->save();

                            $trans_amount = $tran_data->amount;
                        }
                    }

                    //Calculate fees payable
                    $fees = StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session_id)->sum('amount');
                    $total = $fees + $trans_amount;

                    $classroom = Classroom::where('class_grade_id', $class_to)->where('class_stream_id', $student->class_stream_id)->first();

                    //check if the student has arrears or overpayment
                    if($currentBalance < 0){

                        $new_fees  = $total + $currentBalance;
                        $new_arrears = 0;
                        $new_sub   = $new_fees;

                    }elseif($currentBalance > 0){

                        $new_fees = $total;
                        $new_arrears = $currentBalance;
                        $new_sub = $new_arrears + $new_fees;

                    }else{
                        $new_fees = $total;
                        $new_arrears = 0;
                        $new_sub = $new_fees;
                    }

                    //Save the student's new fees
                    $stud = $student;
                    $stud->classroom_id     = $classroom->id;
                    $stud->class_grade_id   = $class_to;
                    $stud->expected         = $new_sub;
                    $stud->arrears          = $new_arrears;
                    $stud->current          = $new_fees;
                    $stud->paid             = 0;
                    $stud->balance          = $new_sub;
                    $stud->updated_by       = Auth::user()->id;
                    $stud->updated_at       = now();
                    $stud->save();

                    //If there was arrears from last session add it
                    if ($currentBalance > 0 || $currentBalance < 0)
                    {
                        $para = FeeParameter::where('type', 'balance_bf')->first();

                        $class_data = new StudentFee();
                        $class_data->student_id           = $student->id;
                        $class_data->current_session_id   = $current_session_id;
                        $class_data->fee_parameter_id     = $para->id;
                        $class_data->description          = "BALANCE B/F";
                        $class_data->class_grade_id       = $class_to;
                        $class_data->amount               = $currentBalance;
                        $class_data->created_by           = Auth::user()->id;
                        $class_data->save();
                    }

                    //Add student to timeline
                    $tim = new StudentTimeline();
                    $tim->student_id            = $stud->id;
                    $tim->current_session_id    = $current_session_id;
                    $tim->class_grade_id        = $class_to;
                    $tim->created_by            = Auth::user()->id;
                    $tim->save();

                    //Record closing records
                    $studPromo = new StudentPromotion();
                    $studPromo->promotion_history_id    = $promo->id;
                    $studPromo->student_id              = $stud->id;
                    $studPromo->class_grade_id          = $class_from;
                    $studPromo->current_session_id      = $from_session;
                    $studPromo->fees                    = $currentCurrent;
                    $studPromo->arrears                 = $currentArrears;
                    $studPromo->balance                 = $currentBalance;
                    $studPromo->created_by              = Auth::user()->id;
                    $studPromo->save();
                }

                $prev = CurrentSession::findOrFail($from_session);
                $prev->status = 1;
                $prev->updated_by = Auth::user()->id;
                $prev->save();

                $curr = CurrentSession::findOrFail($current_session_id);
                $curr->status = 2;
                $curr->updated_by = Auth::user()->id;
                $curr->save();

                return redirect()->back()->with('success', 'Student promoted successfully!');
            }
            else
            {
                return redirect()->back()->with('failed', 'Fee structure for this class has not been created! Kindly create!');
            }
        }
        else
        {
            return redirect()->back()->with('failed', 'Incorrect Password!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\StudentPromotion  $studentPromotion
     * @return \Illuminate\Http\Response
     */
    public function show(StudentPromotion $studentPromotion)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\StudentPromotion  $studentPromotion
     * @return \Illuminate\Http\Response
     */
    public function edit(StudentPromotion $studentPromotion)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StudentPromotion  $studentPromotion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StudentPromotion $studentPromotion)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\StudentPromotion  $studentPromotion
     * @return \Illuminate\Http\Response
     */
    public function destroy(StudentPromotion $studentPromotion)
    {
        //
    }
}