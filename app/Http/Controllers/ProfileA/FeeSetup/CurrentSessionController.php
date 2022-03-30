<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\AcademicTerm;
use App\CurrentSession;
use App\FinancialYear;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class CurrentSessionController extends Controller
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
        $financial_sessions = CurrentSession::orderBy('id', 'asc')->get();
        $financial_years = FinancialYear::orderBy('name', 'asc')->get();
        $academic_terms = AcademicTerm::orderBy('name', 'asc')->get();
        return view('profilea.fee-setup.financial_sessions', compact('financial_sessions', 'financial_years', 'academic_terms'));
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
           'financial_year' => 'required|numeric',
           'academic_term'  => 'required|numeric',
        ]);

        $year = FinancialYear::findOrFail($request->financial_year);
        $term = AcademicTerm::findOrFail($request->academic_term);

        $name = strtoupper(str_slug($term->name." ".$year->name));
        $slug = str_slug($term->name." ".$year->name);

        $slag = CurrentSession::where('slug', $slug)->first();
        if ($slag)
        {
            return redirect()->back()->with('error', 'Failed! This Financial Session already exists!');
        }
        else
        {
            $data  = new CurrentSession();
            $data->slug                 = $slug;
            $data->name                 = $name;
            $data->financial_year_id    = $request->financial_year;
            $data->academic_term_id     = $request->academic_term;
            $data->created_by           = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Session Added Successfully!');
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\CurrentSession  $currentSession
     * @return \Illuminate\Http\Response
     */
    public function show(CurrentSession $currentSession)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CurrentSession  $currentSession
     * @return \Illuminate\Http\Response
     */
    public function edit(CurrentSession $currentSession)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CurrentSession  $currentSession
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CurrentSession $currentSession)
    {
        $request->validate([
            'financial_year' => 'required|numeric',
            'academic_term'  => 'required|numeric',
        ]);

        $year = FinancialYear::findOrFail($request->financial_year);
        $term = AcademicTerm::findOrFail($request->academic_term);

        $name = strtoupper(str_slug($term->name." ".$year->name));
        $slug = str_slug($term->name." ".$year->name);

        $slag = CurrentSession::where('slug', $slug)->where('id', '!=', $currentSession->id)->first();
        if ($slag)
        {
            return redirect()->back()->with('error', 'Failed! This Financial Session already exists!');
        }
        else
        {
            $data  = $currentSession;
            $data->slug                 = $slug;
            $data->name                 = $name;
            $data->financial_year_id    = $request->financial_year;
            $data->academic_term_id     = $request->academic_term;
            $data->status               = 1;
            $data->updated_by           = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Session Updated Successfully!');
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\CurrentSession $currentSession
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, CurrentSession $currentSession)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $currentSession->delete();

            return redirect()->back()->with('success', 'The Session has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
