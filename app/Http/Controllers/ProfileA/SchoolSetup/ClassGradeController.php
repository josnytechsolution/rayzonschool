<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\ClassGrade;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ClassGradeController extends Controller
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
        return view('profilea.school-setup.class_grades', compact('grades'));
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
           'name'       => 'required|string|unique:class_grades',
           'long_name'  => 'required|string|unique:class_grades',
           'level'      => 'required|integer|unique:class_grades',
        ]);

        $data = new ClassGrade();
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->level        = $request->input('level');
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Class has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ClassGrade  $classGrade
     * @return \Illuminate\Http\Response
     */
    public function show(ClassGrade $classGrade)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ClassGrade  $classGrade
     * @return \Illuminate\Http\Response
     */
    public function edit(ClassGrade $classGrade)
    {
        $grades = ClassGrade::where('status', 1)->orderBy('level', 'asc')->get();
        return view('profilea.school-setup.edit_class_grade', compact('classGrade', 'grades'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ClassGrade  $classGrade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ClassGrade $classGrade)
    {
        $request->validate([
           'name'       => 'required|string|unique:class_grades,name,'.$classGrade->id,
           'long_name'  => 'required|string|unique:class_grades,long_name,'.$classGrade->id,
           'level'      => 'required|integer|unique:class_grades,level,'.$classGrade->id,
        ]);

        $data = $classGrade;
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->level        = $request->input('level');
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('class-grades.index')->with('success', 'Class has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\ClassGrade $classGrade
     * @return void
     */
    public function destroy(Request $request, ClassGrade $classGrade)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $classGrade->status = 2;
            $classGrade->deleted_by = Auth::user()->id;
            $classGrade->deleted_at = now();
            $classGrade->save();

            return redirect()->back()->with('success', 'The Class has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
