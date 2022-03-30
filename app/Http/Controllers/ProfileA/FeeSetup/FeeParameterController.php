<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\FeeParameter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class FeeParameterController extends Controller
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
        $parameters = FeeParameter::all();
        return view('profilea.fee-setup.fee_parameters', compact('parameters'));
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
            'name'         => 'required|string|unique:fee_parameters',
            'description'  => 'required|string|unique:fee_parameters',
        ]);

        $data = new FeeParameter();
        $data->name         = strtoupper($request->input('name'));
        $data->description  = $request->input('description');
        $data->slug         = Str::slug($request->name);
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Fee Parameter has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ProfileA\FeeParameter  $feeParameter
     * @return \Illuminate\Http\Response
     */
    public function show(FeeParameter $feeParameter)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ProfileA\FeeParameter  $feeParameter
     * @return \Illuminate\Http\Response
     */
    public function edit(FeeParameter $feeParameter)
    {
        $parameters = FeeParameter::where('status', 1)->orderBy('id', 'asc')->get();
        return view('profilea.fee-setup.edit_fee_parameter', compact('feeParameter', 'parameters'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ProfileA\FeeParameter  $feeParameter
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FeeParameter $feeParameter)
    {
        $request->validate([
            'name'         => 'required|string|unique:fee_parameters,name,'.$feeParameter->id,
            'description'  => 'required|string',
        ]);

        $data = $feeParameter;
        $data->name         = strtoupper($request->input('name'));
        $data->description  = $request->input('description');
        $data->slug         = Str::slug($request->name);
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('fee-parameters.index')->with('success', 'Fee Parameter has been added successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param FeeParameter $feeParameter
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, FeeParameter $feeParameter)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $feeParameter->status = 2;
            $feeParameter->deleted_by = Auth::user()->id;
            $feeParameter->deleted_at = now();
            $feeParameter->save();

            return redirect()->back()->with('success', 'The Fee Parameter has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
