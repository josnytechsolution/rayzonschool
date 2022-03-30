<?php

namespace App\Http\Controllers\ProfileA\Transport;

use App\TransportZone;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class TransportZoneController extends Controller
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
        $transport_zones = TransportZone::all();
        return view('profilea.transport.transport_zones', compact('transport_zones'));
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
            'name'       => 'required|string|unique:transport_zones',
            'long_name'  => 'required|string|unique:transport_zones',
            'areas'      => 'nullable|string',
        ]);

        $data = new TransportZone();
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->areas        = $request->input('areas');
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Transport Zone has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\TransportZone  $transportZone
     * @return \Illuminate\Http\Response
     */
    public function show(TransportZone $transportZone)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\TransportZone  $transportZone
     * @return \Illuminate\Http\Response
     */
    public function edit(TransportZone $transportZone)
    {
        $transport_zones = TransportZone::all();
        return view('profilea.transport.edit_transport_zone', compact('transportZone', 'transport_zones'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\TransportZone  $transportZone
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TransportZone $transportZone)
    {
        $request->validate([
            'name'       => 'required|string|unique:class_grades,name,'.$transportZone->id,
            'long_name'  => 'required|string|unique:class_grades,long_name,'.$transportZone->id,
            'areas'      => 'nullable|string',
        ]);

        $data = $transportZone;
        $data->name         = strtoupper($request->input('name'));
        $data->long_name    = $request->input('long_name');
        $data->slug         = Str::slug($request->long_name);
        $data->areas        = $request->input('areas');
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('transport-zones.index')->with('success', 'Transport Zone has been added successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\TransportZone $transportZone
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, TransportZone $transportZone)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $transportZone->status = 2;
            $transportZone->deleted_by = Auth::user()->id;
            $transportZone->deleted_at = now();
            $transportZone->save();

            return redirect()->back()->with('success', 'The Transport Zone has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
