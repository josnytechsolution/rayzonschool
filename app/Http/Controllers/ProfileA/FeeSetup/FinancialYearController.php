<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\FinancialYear;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class FinancialYearController extends Controller
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
        $fyears = FinancialYear::where('status', 1)->orderBy('id', 'asc')->get();
        return view('profilea.fee-setup.financial_years', compact('fyears'));
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
            'name'       => 'required|string|unique:financial_years',
            'long_name'  => 'required|string|unique:financial_years',
        ]);

        $data = new FinancialYear();
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Financial Year has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\FinancialYear  $financialYear
     * @return \Illuminate\Http\Response
     */
    public function show(FinancialYear $financialYear)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\FinancialYear  $financialYear
     * @return \Illuminate\Http\Response
     */
    public function edit(FinancialYear $financialYear)
    {
        $fyears = FinancialYear::where('status', 1)->orderBy('id', 'asc')->get();
        return view('profilea.fee-setup.edit_financial_year', compact('financialYear', 'fyears'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\FinancialYear  $financialYear
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FinancialYear $financialYear)
    {
        $request->validate([
            'name'       => 'required|string|unique:financial_years,name,'.$financialYear->id,
            'long_name'  => 'required|string|unique:financial_years,long_name,'.$financialYear->id,
        ]);

        $data = $financialYear;
        $data->slug         = Str::slug($request->long_name);
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('financial-years.index')->with('success', 'Financial Year has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\FinancialYear  $financialYear
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, FinancialYear $financialYear)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $financialYear->delete();

            return redirect()->back()->with('success', 'The Financial Year has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
