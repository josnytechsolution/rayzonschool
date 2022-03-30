<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\AcademicTerm;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AcademicTermController extends Controller
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
        $terms = AcademicTerm::where('status', 1)->orderBy('id', 'asc')->get();
        return view('profilea.school-setup.academic_terms', compact('terms'));
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
            'name'       => 'required|string|unique:academic_terms',
            'long_name'  => 'required|string|unique:academic_terms',
        ]);

        $data = new AcademicTerm();
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Academic Term has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\AcademicTerm  $academicTerm
     * @return \Illuminate\Http\Response
     */
    public function show(AcademicTerm $academicTerm)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\AcademicTerm  $academicTerm
     * @return \Illuminate\Http\Response
     */
    public function edit(AcademicTerm $academicTerm)
    {
        $terms = AcademicTerm::where('status', 1)->orderBy('id', 'asc')->get();
        return view('profilea.school-setup.edit_academic_term', compact('academicTerm', 'terms'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\AcademicTerm  $academicTerm
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AcademicTerm $academicTerm)
    {
        $request->validate([
            'name'       => 'required|string|unique:academic_terms,name,'.$academicTerm->id,
            'long_name'  => 'required|string|unique:academic_terms,long_name,'.$academicTerm->id,
        ]);

        $data = $academicTerm;
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('academic-terms.index')->with('success', 'Academic Term has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\AcademicTerm $academicTerm
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, AcademicTerm $academicTerm)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $academicTerm->status = 2;
            $academicTerm->deleted_by = Auth::user()->id;
            $academicTerm->deleted_at = now();
            $academicTerm->save();

            return redirect()->back()->with('success', 'The Academic Term has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
