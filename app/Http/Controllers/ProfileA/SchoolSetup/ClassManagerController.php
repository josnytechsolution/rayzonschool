<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\ClassManager;
use App\Classroom;
use App\StaffMember;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Support\Facades\Hash;

class ClassManagerController extends Controller
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
        //$teachers = StaffMember::Active()->get();

        $teachers = StaffMember::Active()->whereHas('staff_department', function ($query) {
            return $query->where('name', '=', 'Teaching');
        })->get();

        $classrooms = Classroom::orderBy('class_grade_id', 'asc')->get();
        $classManagers = ClassManager::orderBy('class_grade_id', 'asc')->get();
        return view('profilea.school-setup.class_managers', compact('classManagers', 'classrooms', 'teachers'));
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
           'classroom_id' => 'required|numeric',
           'staff_member_id' => 'required|numeric',
        ]);
        $classroom = Classroom::findOrFail($request->classroom_id);

        $data = new ClassManager();
        $data->class_grade_id   = $classroom->class_grade_id;
        $data->class_stream_id  = $classroom->class_stream_id;
        $data->classroom_id     = $classroom->id;
        $data->staff_member_id  = $request->staff_member_id;
        $data->created_by       = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Class Manager has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param ClassManager $classManager
     * @return \Illuminate\Http\Response
     */
    public function show(ClassManager $classManager)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param ClassManager $classManager
     * @return \Illuminate\Http\Response
     */
    public function edit(ClassManager $classManager)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param ClassManager $classManager
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ClassManager $classManager)
    {

        $request->validate([
            'classroom' => 'required|numeric',
            'staff_member' => 'required|numeric',
        ]);
        $classroom = Classroom::findOrFail($request->classroom);

        $data = $classManager;
        $data->class_grade_id   = $classroom->class_grade_id;
        $data->class_stream_id  = $classroom->class_stream_id;
        $data->classroom_id     = $classroom->id;
        $data->staff_member_id  = $request->staff_member;
        $data->updated_by       = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Class Manager has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param ClassManager $classManager
     * @return void
     * @throws \Exception
     */
    public function destroy(Request $request, ClassManager $classManager)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $classManager->delete();

            return redirect()->back()->with('success', 'The Class Manager has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
