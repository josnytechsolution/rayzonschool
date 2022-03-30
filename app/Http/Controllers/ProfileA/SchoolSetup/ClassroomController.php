<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\ClassGrade;
use App\Classroom;
use App\ClassStream;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ClassroomController extends Controller
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
        $grades = ClassGrade::where('status', 1)->get();
        $streams = ClassStream::where('status', 1)->get();
        $classrooms = Classroom::where('status', 1)->get();
        return view('profilea.school-setup.classrooms', compact('classrooms', 'grades', 'streams'));
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
            'name'       => 'required|string|unique:classrooms',
            'long_name'  => 'required|string|unique:classrooms',
            'grade'      => 'required|numeric',
            'stream'     => 'required|numeric',
        ]);

        $data = new Classroom();
        $data->name             = strtoupper($request->input('name'));
        $data->long_name        = $request->input('long_name');
        $data->slug             = Str::slug($request->long_name);
        $data->class_grade_id   = $request->input('grade');
        $data->class_stream_id  = $request->input('stream');
        $data->created_by       = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Classroom has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Classroom  $classroom
     * @return \Illuminate\Http\Response
     */
    public function show(Classroom $classroom)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Classroom  $classroom
     * @return \Illuminate\Http\Response
     */
    public function edit(Classroom $classroom)
    {
        $grades = ClassGrade::where('status', 1)->get();
        $streams = ClassStream::where('status', 1)->get();
        $classrooms = Classroom::where('status', 1)->get();
        return view('profilea.school-setup.edit_classroom', compact('classroom','classrooms', 'grades', 'streams'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Classroom  $classroom
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Classroom $classroom)
    {
        $request->validate([
            'name'       => 'required|string|unique:classrooms,name,'.$classroom->id,
            'long_name'  => 'required|string|unique:classrooms,long_name,'.$classroom->id,
            'grade'      => 'required|numeric',
            'stream'     => 'required|numeric',
        ]);

        $data = $classroom;
        $data->name             = strtoupper($request->input('name'));
        $data->long_name        = $request->input('long_name');
        $data->slug             = Str::slug($request->long_name);
        $data->class_grade_id   = $request->input('grade');
        $data->class_stream_id  = $request->input('stream');
        $data->updated_by       = Auth::user()->id;
        $data->save();

        return redirect()->route('classrooms.index')->with('success', 'Classroom has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\Classroom $classroom
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Classroom $classroom)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $classroom->status = 2;
            $classroom->deleted_by = Auth::user()->id;
            $classroom->deleted_at = now();
            $classroom->save();

            return redirect()->back()->with('success', 'The Classroom has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
