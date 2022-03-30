<?php

namespace App\Http\Controllers\ProfileA\Transport;

use App\TransportFleet;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class TransportFleetController extends Controller
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
        $transport_fleets = TransportFleet::all();
        return view('profilea.transport.transport_fleets', compact('transport_fleets'));
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
            'name'      => 'required|string|unique:transport_fleets',
            'reg_no'    => 'required|string|unique:transport_fleets',
            'capacity'  => 'required|numeric',
        ]);

        $data = new TransportFleet();
        $data->name         = strtoupper($request->input('name'));
        $data->reg_no       = $request->input('reg_no');
        $data->slug         = Str::slug($request->name." ".$request->reg_no);
        $data->capacity     = $request->input('capacity');
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Transport Fleet has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\TransportFleet  $transportFleet
     * @return \Illuminate\Http\Response
     */
    public function show(TransportFleet $transportFleet)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\TransportFleet  $transportFleet
     * @return \Illuminate\Http\Response
     */
    public function edit(TransportFleet $transportFleet)
    {
        $transport_fleets = TransportFleet::all();
        return view('profilea.transport.edit_transport_fleet', compact('transport_fleets', 'transportFleet'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\TransportFleet  $transportFleet
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TransportFleet $transportFleet)
    {
        $request->validate([
            'name'      => 'required|string|unique:transport_fleets,name,'.$transportFleet->id,
            'reg_no'    => 'required|string|unique:transport_fleets,reg_no,'.$transportFleet->id,
            'capacity'  => 'required|numeric',
        ]);

        $data = $transportFleet;
        $data->name         = strtoupper($request->input('name'));
        $data->reg_no       = $request->input('reg_no');
        $data->slug         = Str::slug($request->name." ".$request->reg_no);
        $data->capacity     = $request->input('capacity');
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('transport-fleets.index')->with('success', 'Transport Fleet has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\TransportFleet $transportFleet
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, TransportFleet $transportFleet)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $transportFleet->status = 2;
            $transportFleet->deleted_by = Auth::user()->id;
            $transportFleet->deleted_at = now();
            $transportFleet->save();

            return redirect()->back()->with('success', 'The Transport Fleet has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
