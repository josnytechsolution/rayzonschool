<?php

namespace App\Http\Controllers\ProfileA\Settings;

use App\Bank;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class BankController extends Controller
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
        $banks = Bank::all();
        return view('profilea.settings.banks', compact('banks'));
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
            'name'          => 'required|string',
            'long_name'     => 'required|string',
            'branch'        => 'required|string',
            'account_name'  => 'required|string',
            'account_no'    => 'required|string|unique:banks',
        ]);

        $data = new Bank();
        $data->slug         = str_slug($request->long_name." ".$request->account_no);
        $data->name         = strtoupper($request->name);
        $data->long_name    = $request->long_name;
        $data->branch       = $request->branch;
        $data->account_name = $request->account_name;
        $data->account_no   = $request->account_no;
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('bank-accounts.index')->with('success', 'Bank Account has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function show(Bank $bank)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function edit(Bank $bank)
    {
        $banks = Bank::all();
        return view('profilea.settings.edit_bank', compact('bank', 'banks'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Bank $bank)
    {
        $request->validate([
            'name'          => 'required|string',
            'long_name'     => 'required|string',
            'branch'        => 'required|string',
            'account_name'  => 'required|string',
            'account_no'    => 'required|string|unique:banks,account_no,'.$bank->id,
            'status'        => 'numeric|required',
        ]);

        $data = $bank;
        $data->slug         = str_slug($request->long_name." ".$request->account_no);
        $data->name         = strtoupper($request->name);
        $data->long_name    = $request->long_name;
        $data->branch       = $request->branch;
        $data->account_name = $request->account_name;
        $data->account_no   = $request->account_no;
        $data->status       = $request->status;
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('bank-accounts.index')->with('success', 'Bank Account has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\Bank $bank
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Bank $bank)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $bank->status       = 2;
            $bank->deleted_by   = Auth::user()->id;
            $bank->deleted_at   = now();
            $bank->save();

            return redirect()->back()->with('success', 'The Bank Account has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
