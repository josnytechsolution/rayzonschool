<?php

namespace App\Http\Controllers\ProfileA\Staff;

use App\StaffDepartment;
use App\StaffSection;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class StaffSectionController extends Controller
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
        $departments = StaffDepartment::orderBy('name', 'asc')->get();
        $sections = StaffSection::orderBy('staff_department_id', 'asc')->get();
        return view('profilea.staff.staff_sections', compact('sections', 'departments'));
    }

    public function staffSection(Request $request)
    {
        $sections = StaffSection::where('staff_department_id', $request->staffDepartment)->get();

        $sectionsData = "";

        $sectionsData .= "<option value=''>--Select Section--</option>";

        foreach($sections as $section)
        {
            $sectionsData .= "<option value='".$section->id."'>".$section->name."</option>";
        }

        return $sectionsData;
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
            'staff_department_id' => 'required|numeric',
            'name'  => 'required|string|unique:staff_sections',
        ]);

        $data = new StaffSection();
        $data->staff_department_id  = $request->staff_department_id;
        $data->name                 = $request->name;
        $data->created_by           = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Staff Section has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\StaffSection  $staffSection
     * @return \Illuminate\Http\Response
     */
    public function show(StaffSection $staffSection)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\StaffSection  $staffSection
     * @return \Illuminate\Http\Response
     */
    public function edit(StaffSection $staffSection)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StaffSection  $staffSection
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StaffSection $staffSection)
    {
        $request->validate([
            'staff_department_id' => 'required|numeric',
            'name'                => 'required|string|unique:staff_sections,name,'.$staffSection->id,
        ]);

        $data = $staffSection;
        $data->staff_department_id  = $request->staff_department_id;
        $data->name                 = $request->name;
        $data->updated_by           = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Staff Section has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\StaffSection $staffSection
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(Request $request, StaffSection $staffSection)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $staffSection->delete();

            return redirect()->back()->with('success', 'The staff section has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
