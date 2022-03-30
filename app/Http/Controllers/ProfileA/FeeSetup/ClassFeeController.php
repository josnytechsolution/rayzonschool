<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\ClassFee;
use App\ClassGrade;
use App\CurrentDefault;
use App\CurrentSession;
use App\FeeParameter;
use App\OneTimeFee;
use App\OptionalFee;
use App\Student;
use App\StudentFee;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ClassFeeController extends Controller
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

    public function getFees(Request $request)
    {
        $classGrade = ClassGrade::findOrFail($request->toClass);
        $currentSession = CurrentSession::Current()->first();
        $newFees = ClassFee::where('current_session_id', $currentSession->id)->where('class_grade_id', $classGrade->id)->get();

        if ($newFees->count() > 0)
        {
            $newData = "";
            $newData .= "<table class='table table-bordered'><tbody>";

            foreach ($newFees as $newFee){
                $newData .= "<tr><td>".$newFee->fee_parameter->name."</td><td class='text-right'>".number_format($newFee->amount)."</td></tr>";
            }
            $newData .= "<tr><th>NEW TOTAL FEES</th><th class='text-right'>".number_format($newFees->sum('amount'))."</th></tr>";
            $newData .= "</tbody><table>";
        }
        else {
           $newData = "<h5 class='text-danger'>No Data For This Class Found!</h5>";
        }

        return $newData;
    }

    public function feeStructure($id)
    {
       $currentSession = CurrentSession::Current()->first();
       $classGrade = ClassGrade::where('slug', $id)->first();
       $classFees = ClassFee::where('current_session_id', $currentSession->id)->where('class_grade_id', $classGrade->id)->get();
       $optionalFees = OptionalFee::where('current_session_id', $currentSession->id)->get();
       $onetimeFees = OneTimeFee::where('current_session_id', $currentSession->id)->get();
       return view('profilea.fee-setup.fee_structure', compact('currentSession', 'classGrade', 'classFees', 'optionalFees', 'onetimeFees'));
    }

    public function multipleClassFees()
    {
        $current_sessions = CurrentSession::where('status', '>', 1)->orderBy('id', 'desc')->get();
        $fee_parameters = FeeParameter::where('status', 1)->get();
        $grades = ClassGrade::where('status', 1)->get();
        return view('profilea.fee-setup.multiple_class_fees', compact('current_sessions', 'fee_parameters', 'grades'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $current_sessions = CurrentSession::orderBy('id', 'desc')->get();
        $fee_parameters = FeeParameter::where('status', 1)->get();
        $grades = ClassGrade::where('status', 1)->get();
        $class_fees = ClassFee::orderBy('id', 'desc')->get();
        return view('profilea.fee-setup.class_fees', compact('class_fees', 'current_sessions', 'fee_parameters', 'grades'));
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
        $request->validate([
            'current_session' => 'required|numeric',
            'grade'          => 'required|numeric',
        ]);

        if ($request->type === "single")
        {
            $request->validate([
                'current_session' => 'required|numeric',
                'fee_parameter'  => 'required|numeric',
                'grade'          => 'required|numeric',
                'amount'         => 'required|numeric',
            ]);

            $content = $request->current_session." ".$request->fee_parameter." ".$request->grade;
            $slug = Str::slug($content);

            if(ClassFee::where('slug', $slug)->count() > 0)
            {
                return redirect()->back()->with('error', 'This Class Fee Already exists!');
            }
            else
            {
                $data = new ClassFee();
                $data->slug                = $slug;
                $data->current_session_id   = $request->input('current_session');
                $data->fee_parameter_id    = $request->input('fee_parameter');
                $data->class_grade_id      = $request->input('grade');
                $data->amount              = $request->input('amount');
                $data->created_by          = Auth::user()->id;
                $data->save();

                $students = Student::where('class_grade_id', $request->grade)->Active()->get();
                $cSession = CurrentSession::Current()->first();

                if ($request->current_session == $cSession->id && $students->count() > 0) {

                    foreach ($students as $student) {

                        DB::table('student_fees')->insert([
                            'student_id'            => $student->id,
                            'current_session_id'    => $request->current_session,
                            'fee_parameter_id'      => $request->fee_parameter,
                            'description'           => 'General Fee',
                            'class_grade_id'        => $request->grade,
                            'amount'                => $request->amount,
                            'created_by'            => Auth::user()->id
                        ]);

                        $stud = $student;
                        $stud->expected = $student->expected +  $request->amount;
                        $stud->current  = $student->current + $request->amount;
                        $stud->balance  = $student->balance + $request->amount;
                        $stud->save();
                    }

                }

                return redirect()->back()->with('success', 'Class Fee has been added successfully');
            }
        }
        elseif ($request->type === "multiple")
        {
            foreach ($request->fee_parameter_id as $fee)
            {
                if ($request->amount[$fee] != NULL) {

                   $feeP = FeeParameter::findOrFail($fee);

                  // echo $feeP->name." : ".$request->amount[$fee];

                   $content = $request->current_session." ".$feeP->id." ".$request->grade;
                   $slug = Str::slug($content);
                   if(ClassFee::where('slug', $slug)->count() > 0)
                   {
                       return redirect()->back()->with('error', 'This Class Fee Already exists!');
                   }
                   else
                   {
                       DB::table('class_fees')->insert([
                           'slug' => $slug,
                           'current_session_id'  => $request->input('current_session'),
                            'fee_parameter_id'    => $feeP->id,
                             'class_grade_id'      => $request->input('grade'),
                             'amount'              => $request->amount[$fee],
                            'created_by'          => Auth::user()->id
                       ]);

                       $students = Student::where('class_grade_id', $request->input('grade'))->Active()->get();
                       $cSession = CurrentSession::Current()->first();

                       if ($request->input('current_session') == $cSession->id && $students->count() > 0) {

                           foreach ($students as $student) {
                               DB::table('student_fees')->insert([
                                   'student_id' => $student->id,
                                   'current_session_id' => $request->input('current_session'),
                                   'fee_parameter_id' => $feeP->id,
                                   'description' => 'General Fee',
                                   'class_grade_id' => $request->input('grade'),
                                   'amount' => $request->amount[$fee],
                                   'created_by' => Auth::user()->id
                               ]);

                               $stud = $student;
                               $stud->expected = $student->expected +  $request->amount[$fee];
                               $stud->current  = $student->current + $request->amount[$fee];
                               $stud->balance  = $student->balance + $request->amount[$fee];
                               $stud->save();
                           }

                       }
                    }
                }
            }

            return redirect()->back()->with('success', 'Class Fee has been added successfully');
        }

    }

    /**
     * Display the specified resource.
     *
     * @param ClassFee $classFee
     * @return Response
     */
    public function show(ClassFee $classFee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param ClassFee $classFee
     * @return Response
     */
    public function edit(ClassFee $classFee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param ClassFee $classFee
     * @return Response
     */
    public function update(Request $request, ClassFee $classFee)
    {
        $request->validate([
            'current_session' => 'required|numeric',
            'fee_parameter'  => 'required|numeric',
            'grade'          => 'required|numeric',
            'amount'         => 'required|numeric',
        ]);

        $content = $request->current_session." ".$request->academic_term." ".$request->fee_parameter." ".$request->grade;
        $slug = Str::slug($content);

        if(ClassFee::where('slug', $slug)->where('id', '!=', $classFee->id)->count() > 0)
        {
            return redirect()->back()->with('error', 'This Class Fee Already exists!');
        }
        else
        {
            $data = $classFee;
            $data->slug                = $slug;
            $data->current_session_id   = $request->input('current_session');
            $data->fee_parameter_id    = $request->input('fee_parameter');
            $data->class_grade_id      = $request->input('grade');
            $data->amount              = $request->input('amount');
            $data->updated_by          = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Class Fee has been updated successfully');
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param ClassFee $classFee
     * @return Response
     * @throws \Exception
     */
    public function destroy(Request $request, ClassFee $classFee)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $classFee->delete();

            return redirect()->back()->with('success', 'The Class Fee has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
