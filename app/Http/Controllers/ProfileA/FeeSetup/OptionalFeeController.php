<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\CurrentSession;
use App\FeeParameter;
use App\OptionalFee;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class OptionalFeeController extends Controller
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
        $current_sessions = CurrentSession::where('status', '>', 1)->orderBy('id', 'desc')->get();
        $fee_parameters = FeeParameter::where('status', 1)->get();
        $optional_fees = OptionalFee::where('status', 1)->get();
        return view('profilea.fee-setup.optional_fees', compact('optional_fees','current_sessions', 'fee_parameters'));
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
            'fee_parameter'  => 'required|numeric',
            'amount'         => 'required|numeric',
        ]);

        $content = $request->current_session." ".$request->academic_term." ".$request->fee_parameter." ".$request->amount;
        $slug = Str::slug($content);

        if(OptionalFee::where('slug', $slug)->count() > 0)
        {
            return redirect()->back()->with('error', 'This Optional Fee Already exists!');
        }
        else
        {
            $data = new OptionalFee();
            $data->slug                = $slug;
            $data->current_session_id   = $request->input('current_session');
            $data->fee_parameter_id    = $request->input('fee_parameter');
            $data->amount              = $request->input('amount');
            $data->created_by          = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Optional Fee has been added successfully');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\OptionalFee  $optionalFee
     * @return \Illuminate\Http\Response
     */
    public function show(OptionalFee $optionalFee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\OptionalFee  $optionalFee
     * @return \Illuminate\Http\Response
     */
    public function edit(OptionalFee $optionalFee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\OptionalFee  $optionalFee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, OptionalFee $optionalFee)
    {
        $request->validate([
            'current_session' => 'required|numeric',
            'fee_parameter'   => 'required|numeric',
            'amount'          => 'required|numeric',
        ]);

        $content = $request->current_session." ".$request->academic_term." ".$request->fee_parameter." ".$request->amount;
        $slug = Str::slug($content);

        if(OptionalFee::where('slug', $slug)->where('id', '!=', $optionalFee->id)->count() > 0)
        {
            return redirect()->back()->with('error', 'This Optional Fee Already exists!');
        }
        else
        {
            $data = $optionalFee;
            $data->slug                = $slug;
            $data->current_session_id   = $request->input('current_session');
            $data->fee_parameter_id    = $request->input('fee_parameter');
            $data->amount              = $request->input('amount');
            $data->updated_by          = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Optional Fee has been updated successfully');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\OptionalFee $optionalFee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, OptionalFee $optionalFee)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $optionalFee->delete();

            return redirect()->back()->with('success', 'The Optional Fee has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
