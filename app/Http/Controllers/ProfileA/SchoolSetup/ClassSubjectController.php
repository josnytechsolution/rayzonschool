<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\AcademicSubject;
use App\ClassGrade;
use App\Classroom;
use App\ClassSubject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ClassSubjectController extends Controller
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

    public function getSubject(Request $request)
    {
        $classroom = Classroom::findOrFail($request->grade);
        $subjects = ClassSubject::where('class_grade_id', $classroom->class_grade_id)->get();
        $subjectData = "";
        $subjectData .= '<option>--Select Class Subject--</option>';

        foreach ($subjects as $subject)
        {
            $subjectData .= '<option value="'.$subject->id.'">'.$subject->name.'</option>';
        }

        if(!empty($subjectData))
        {
            return $subjectData;
        }
        else
        {
            return '<option value="">No Data Found</option>';
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $academic_subjects = AcademicSubject::all();
        $class_grades = ClassGrade::orderBy('name', 'asc')->get();
        $classSubjects = ClassSubject::all();

        return view('profilea.school-setup.class_subjects', compact('academic_subjects', 'classSubjects', 'class_grades'));
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
           'name'   => 'required|string|unique:class_subjects',
           'academic_subject_id'  => 'required|numeric',
           'class_grade_id'  => 'required|numeric',
        ]);

        $check = ClassSubject::where('academic_subject_id', $request->academic_subject_id)->where('class_grade_id', $request->class_grade_id)->get();

        if ($check->count() > 0){ return redirect()->back()->with('failed', 'This Class Subject Already Exists!'); }

        $data = new ClassSubject();
        $data->name                 = $request->name;
        $data->academic_subject_id  = $request->academic_subject_id;
        $data->class_grade_id       = $request->class_grade_id;
        $data->created_by           = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Class Subject Added Successfully!');

    }

    /**
     * Display the specified resource.
     *
     * @param ClassSubject $classSubject
     * @return Response
     */
    public function show(ClassSubject $classSubject)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param ClassSubject $classSubject
     * @return Response
     */
    public function edit(ClassSubject $classSubject)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param ClassSubject $classSubject
     * @return Response
     */
    public function update(Request $request, ClassSubject $classSubject)
    {
        $request->validate([
            'name'   => 'required|string|unique:class_subjects,name,'.$classSubject->id,
            'academic_subject_id'  => 'required|numeric',
            'class_grade_id'  => 'required|numeric',
        ]);

        $check = ClassSubject::where('id', '!=', $classSubject->id)
                                ->where('academic_subject_id', $request->academic_subject_id)
                                    ->where('class_grade_id', $request->class_grade_id)
                                        ->get();

        if ($check->count() > 0){ return redirect()->back()->with('failed', 'This Class Subject Already Exists!'); }

        $data = $classSubject;
        $data->name                 = $request->name;
        $data->academic_subject_id  = $request->academic_subject_id;
        $data->class_grade_id       = $request->class_grade_id;
        $data->updated_by           = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Class Subject Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param ClassSubject $classSubject
     * @return Response
     * @throws \Exception
     */
    public function destroy(Request $request, ClassSubject $classSubject)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $classSubject->delete();

            return redirect()->back()->with('success', 'The Class Subject has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
