<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\AcademicSubject;
use Exception;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class AcademicSubjectController extends Controller
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
        $academicSubjects = AcademicSubject::orderBy('name', 'asc')->get();
        return view('profilea.school-setup.academic_subjects', compact('academicSubjects'));
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
            'code' => 'required|string',
            'name' => 'required|string',
        ]);

        $data = new AcademicSubject();
        $data->code         = $request->code;
        $data->name         = $request->name;
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Academic Subject has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param AcademicSubject $academicSubject
     * @return Response
     */
    public function show(AcademicSubject $academicSubject)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param AcademicSubject $academicSubject
     * @return Response
     */
    public function edit(AcademicSubject $academicSubject)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param AcademicSubject $academicSubject
     * @return Response
     */
    public function update(Request $request, AcademicSubject $academicSubject)
    {
        $request->validate([
            'code' => 'required|string',
            'name' => 'required|string',
        ]);

        $data = $academicSubject;
        $data->code         = $request->code;
        $data->name         = $request->name;
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Academic Subject has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param AcademicSubject $academicSubject
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    public function destroy(Request $request, AcademicSubject $academicSubject)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $academicSubject->delete();

            return redirect()->back()->with('success', 'The Academic Subject has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
