<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\CurrentSession;
use App\FeeParameter;
use App\OneTimeFee;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class OneTimeFeeController extends Controller
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
        $financial_sessions = CurrentSession::where('status', '>', 1)->orderBy('id', 'desc')->get();
        $one_time_fees = OneTimeFee::where('status', 1)->get();
        $fee_parameters = FeeParameter::where('status', 1)->get();
        return view('profilea.fee-setup.one_time_fees', compact('one_time_fees','financial_sessions', 'fee_parameters'));
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
            'current_session' => 'required|numeric',
            'fee_parameter'   => 'required|numeric',
            'amount'          => 'required|numeric',
        ]);

        $content = $request->current_session." ".$request->fee_parameter." ".$request->amount;
        $slug = Str::slug($content);

        if(OneTimeFee::where('slug', $slug)->count() > 0)
        {
            return redirect()->back()->with('error', 'This One Time Fee Already exists!');
        }
        else
        {
            $data = new OneTimeFee();
            $data->slug                = $slug;
            $data->current_session_id   = $request->input('current_session');
            $data->fee_parameter_id    = $request->input('fee_parameter');
            $data->amount              = $request->input('amount');
            $data->created_by          = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'One Time Fee has been added successfully');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\OneTimeFee  $oneTimeFee
     * @return \Illuminate\Http\Response
     */
    public function show(OneTimeFee $oneTimeFee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\OneTimeFee  $oneTimeFee
     * @return \Illuminate\Http\Response
     */
    public function edit(OneTimeFee $oneTimeFee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\OneTimeFee  $oneTimeFee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, OneTimeFee $oneTimeFee)
    {
        $request->validate([
            'current_session' => 'required|numeric',
            'fee_parameter'  => 'required|numeric',
            'amount'         => 'required|numeric',
        ]);

        $content = $request->current_session." ".$request->fee_parameter." ".$request->amount;
        $slug = Str::slug($content);

        if(OneTimeFee::where('slug', $slug)->where('id', '!=', $oneTimeFee->id)->count() > 0)
        {
            return redirect()->back()->with('error', 'This One Time Fee Already exists!');
        }
        else
        {
            $data = $oneTimeFee;
            $data->slug                   = $slug;
            $data->current_session_id   = $request->input('current_session');
            $data->fee_parameter_id       = $request->input('fee_parameter');
            $data->amount              = $request->input('amount');
            $data->updated_by          = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'One Time Fee has been updated successfully');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\OneTimeFee $oneTimeFee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, OneTimeFee $oneTimeFee)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $oneTimeFee->status = 2;
            $oneTimeFee->deleted_by = Auth::user()->id;
            $oneTimeFee->deleted_at = now();
            $oneTimeFee->save();

            return redirect()->back()->with('success', 'The One Time Fee has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
