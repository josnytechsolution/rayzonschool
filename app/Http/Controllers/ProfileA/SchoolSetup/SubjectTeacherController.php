<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\ClassGrade;
use App\Classroom;
use App\ClassSubject;
use App\StaffMember;
use App\SubjectTeacher;
use Exception;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class SubjectTeacherController extends Controller
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
        $staffMembers = StaffMember::Active()->whereHas('staff_department', function ($query){
                                                return $query->where('name', '=', 'Teaching');
                                                    })->get();
        $classrooms = Classroom::orderBy('name', 'asc')->get();
        $subjectTeachers = SubjectTeacher::orderBy('classroom_id', 'asc')->get();

        return view('profilea.school-setup.subject_teachers', compact('staffMembers', 'classrooms', 'subjectTeachers'));
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
     * @param  \Illuminate\Http\Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
           'staff_member_id'  => 'required|numeric',
           'classroom_id'     => 'required|numeric',
           'class_subject_id' => 'required|numeric',
        ]);

        $classroom = Classroom::findOrFail($request->classroom_id);

        $check = SubjectTeacher::where('staff_member_id', $request->staff_member_id)
                                    ->where('classroom_id', $classroom->id)
                                        ->where('class_subject_id', $request->class_subject_id)
                                            ->get();

        if (count($check) > 0){ return redirect()->back()->with('failed', 'This entry already exists!'); }

        $data  = new SubjectTeacher();
        $data->staff_member_id  = $request->staff_member_id;
        $data->class_grade_id   = $classroom->class_grade_id;
        $data->class_stream_id  = $classroom->class_stream_id;
        $data->classroom_id     = $classroom->id;
        $data->class_subject_id = $request->class_subject_id;
        $data->created_by       = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Subject Teacher Added Successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param SubjectTeacher $subjectTeacher
     * @return Response
     */
    public function show(SubjectTeacher $subjectTeacher)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param SubjectTeacher $subjectTeacher
     * @return Response
     */
    public function edit(SubjectTeacher $subjectTeacher)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param SubjectTeacher $subjectTeacher
     * @return Response
     */
    public function update(Request $request, SubjectTeacher $subjectTeacher)
    {
        $request->validate([
            'staff_member_id'  => 'required|numeric',
            'classroom_id'     => 'required|numeric',
            'class_subject_id' => 'required|numeric',
        ]);

        $classroom = Classroom::findOrFail($request->classroom_id);

        $check = SubjectTeacher::where('staff_member_id', $request->staff_member_id)
                                ->where('classroom_id', $classroom->id)
                                    ->where('class_subject_id', $request->class_subject_id)
                                        ->where('id', '!=', $subjectTeacher->id)
                                            ->get();

        if (count($check) > 0){ return redirect()->back()->with('failed', 'This entry already exists!'); }

        $data  = $subjectTeacher;
        $data->staff_member_id  = $request->staff_member_id;
        $data->class_grade_id   = $classroom->class_grade_id;
        $data->class_stream_id  = $classroom->class_stream_id;
        $data->classroom_id     = $classroom->id;
        $data->class_subject_id = $request->class_subject_id;
        $data->updated_by       = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Subject Teacher updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param SubjectTeacher $subjectTeacher
     * @return Response
     * @throws Exception
     */
    public function destroy(Request $request, SubjectTeacher $subjectTeacher)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $subjectTeacher->delete();

            return redirect()->back()->with('success', 'The Subject Teacher has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
