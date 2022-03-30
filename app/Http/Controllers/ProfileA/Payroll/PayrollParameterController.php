<?php

namespace App\Http\Controllers\ProfileA\Payroll;

use App\PayrollParameter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class PayrollParameterController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('super');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $parameters = PayrollParameter::all();
        return view('profilea.payroll.payroll_parameters', compact('parameters'));
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
           'name'   => 'required|string|unique:payroll_parameters',
           'description'  => 'required|string',
           'type'  => 'required|string',
        ]);

        $data = new PayrollParameter();
        $data->name     = $request->name;
        $data->description = $request->description;
        $data->type     = $request->type;
        $data->created_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Parameter added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param PayrollParameter $payrollParameter
     * @return Response
     */
    public function show(PayrollParameter $payrollParameter)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param PayrollParameter $payrollParameter
     * @return Response
     */
    public function edit(PayrollParameter $payrollParameter)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param PayrollParameter $payrollParameter
     * @return Response
     */
    public function update(Request $request, PayrollParameter $payrollParameter)
    {
        $request->validate([
            'name'          => 'required|string|unique:payroll_parameters,name,'.$payrollParameter->id,
            'description'   => 'required|string',
            'type'          => 'required|string',
        ]);

        $data = $payrollParameter;
        $data->name         = $request->name;
        $data->description  = $request->description;
        $data->type         = $request->type;
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('payroll-parameters.index')->with('success', 'Parameter Updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param PayrollParameter $payrollParameter
     * @return Response
     * @throws \Exception
     */
    public function destroy(Request $request, PayrollParameter $payrollParameter)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $payrollParameter->delete();

            return redirect()->back()->with('success', 'The Fee Parameter has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
