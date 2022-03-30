<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\SchoolProfile;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class SchoolProfileController extends Controller
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
        $school_profile = SchoolProfile::where('id', 1)->first();
        return view('profilea.school-setup.school_profile', compact('school_profile'));
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
            'name'      => 'required|string',
            'motto'     => 'nullable|string',
            'postal'    => 'nullable|string',
            'physical'  => 'nullable|string',
            'contact1'  => 'nullable|string',
            'contact2'  => 'nullable|string',
            'contact3'  => 'nullable|string',
            'contact4'  => 'nullable|string',
            'email1'    => 'nullable|email',
            'email2'    => 'nullable|email',
            'email3'    => 'nullable|email',
            'email4'    => 'nullable|email',
            'website'   => 'nullable|string',
            'logo'      => 'nullable|mime:jpeg,jpg,png,tiff',
        ]);

        $school_profile = SchoolProfile::all();

        if($school_profile)
        {
            return redirect()->back()->with('error', 'School profile already exists! Try edit it.');
        }
        else
        {
            $data = new SchoolProfile();
            $data->name      = $request->name;
            $data->motto     = $request->motto;
            $data->postal    = $request->postal;
            $data->physical  = $request->physical;
            $data->contact1  = $request->contact1;
            $data->contact2  = $request->contact2;
            $data->contact3  = $request->contact3;
            $data->contact4  = $request->contact4;
            $data->email1    = $request->email1;
            $data->email2    = $request->email2;
            $data->email3    = $request->email3;
            $data->email4    = $request->email4;
            $data->website    = $request->website;

            if($file = $request->file('logo')){
                $name = rand() . '.' .$file->getClientOriginalExtension();
                $data->logo   = $file->move('storage/profile', $name);
            }

            $data->created_by = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Profile Added successfully');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SchoolProfile  $schoolProfile
     * @return \Illuminate\Http\Response
     */
    public function show(SchoolProfile $schoolProfile)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\SchoolProfile  $schoolProfile
     * @return \Illuminate\Http\Response
     */
    public function edit(SchoolProfile $schoolProfile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\SchoolProfile  $schoolProfile
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SchoolProfile $schoolProfile)
    {
        $request->validate([
            'name'      => 'required|string',
            'motto'     => 'nullable|string',
            'postal'    => 'nullable|string',
            'physical'  => 'nullable|string',
            'contact1'  => 'nullable|string',
            'contact2'  => 'nullable|string',
            'contact3'  => 'nullable|string',
            'contact4'  => 'nullable|string',
            'email1'    => 'nullable|email',
            'email2'    => 'nullable|email',
            'email3'    => 'nullable|email',
            'email4'    => 'nullable|email',
            'website'   => 'nullable|string',
            'logo'      => 'nullable|mimes:jpg,jpeg,png,tiff',
        ]);



        $data = $schoolProfile;
        $data->name      = $request->name;
        $data->motto     = $request->motto;
        $data->postal    = $request->postal;
        $data->physical  = $request->physical;
        $data->contact1  = $request->contact1;
        $data->contact2  = $request->contact2;
        $data->contact3  = $request->contact3;
        $data->contact4  = $request->contact4;
        $data->email1    = $request->email1;
        $data->email2    = $request->email2;
        $data->email3    = $request->email3;
        $data->email4    = $request->email4;
        $data->website    = $request->website;

        if($file = $request->file('logo')){
            $name = rand() . '.' .$file->getClientOriginalExtension();
            $data->logo   = $file->move('storage/profile', $name);
        }

        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Profile has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SchoolProfile  $schoolProfile
     * @return \Illuminate\Http\Response
     */
    public function destroy(SchoolProfile $schoolProfile)
    {
        //
    }
}
