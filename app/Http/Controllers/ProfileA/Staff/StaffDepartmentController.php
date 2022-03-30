<?php

namespace App\Http\Controllers\ProfileA\Staff;

use App\StaffDepartment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class StaffDepartmentController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('super');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $departments = StaffDepartment::all();
        return view('profilea.staff.staff_departments', compact('departments'));
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
            'name' => 'required|string|unique:staff_departments',
        ]);

        $data = new StaffDepartment();
        $data->name       = ucwords(strtolower($request->name));
        $data->created_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Staff Department has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\StaffDepartment  $staffDepartment
     * @return \Illuminate\Http\Response
     */
    public function show(StaffDepartment $staffDepartment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\StaffDepartment  $staffDepartment
     * @return \Illuminate\Http\Response
     */
    public function edit(StaffDepartment $staffDepartment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StaffDepartment  $staffDepartment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StaffDepartment $staffDepartment)
    {
        $request->validate([
            'name' => 'required|string|unique:staff_departments,name,'.$staffDepartment->id,
        ]);

        $data = $staffDepartment;
        $data->name       = ucwords(strtolower($request->name));
        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Staff Department has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\StaffDepartment $staffDepartment
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(Request $request, StaffDepartment $staffDepartment)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $staffDepartment->delete();

            return redirect()->back()->with('success', 'The staff department has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
