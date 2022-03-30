<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\ClassStream;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ClassStreamController extends Controller
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
        $streams = ClassStream::where('status', 1)->get();
        return view('profilea.school-setup.class_streams', compact('streams'));
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
            'name'       => 'required|string|unique:class_streams',
            'long_name'  => 'required|string|unique:class_streams',
        ]);

        $data = new ClassStream();
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Class has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ClassStream  $classStream
     * @return \Illuminate\Http\Response
     */
    public function show(ClassStream $classStream)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ClassStream  $classStream
     * @return \Illuminate\Http\Response
     */
    public function edit(ClassStream $classStream)
    {
        $streams = ClassStream::where('status', 1)->get();
        return view('profilea.school-setup.edit_class_stream', compact('classStream', 'streams'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ClassStream  $classStream
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ClassStream $classStream)
    {
        $request->validate([
            'name'       => 'required|string|unique:class_streams,name,'.$classStream->id,
            'long_name'  => 'required|string|unique:class_streams,long_name,'.$classStream->id,
        ]);

        $data = $classStream;
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('class-streams.index')->with('success', 'Stream has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\ClassStream $classStream
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, ClassStream $classStream)
    {

        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $classStream->status = 2;
            $classStream->deleted_by = Auth::user()->id;
            $classStream->deleted_at = now();
            $classStream->save();

            return redirect()->back()->with('success', 'The Class Stream has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
