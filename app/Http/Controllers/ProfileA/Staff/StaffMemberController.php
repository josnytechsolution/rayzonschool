<?php

namespace App\Http\Controllers\ProfileA\Staff;

use App\StaffDepartment;
use App\StaffMember;
use App\StaffSection;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class StaffMemberController extends Controller
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
        $members = StaffMember::Active()->get();
        return view('profilea.staff.staff_members', compact('members'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $reg = StaffMember::orderBy('member_no', 'desc')->limit(1)->first();
        if(!empty($reg))
        {
            $no = $reg->member_no;
            $member_no = ++$no;
        }
        else
        {
            $member_no = "EMP0001";
        }

        $departments = StaffDepartment::orderBy('name', 'asc')->get();
        $sections = StaffSection::orderBy('staff_department_id', 'asc')->get();
        return view('profilea.staff.create_member', compact('sections', 'departments', 'member_no'));
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
            'member_no'     => 'required|string|unique:staff_members',
            'name'          => 'required|string',
            'idno'          => 'required|string',
            'gender'        => 'required|numeric',
            'marital'       => 'required|numeric',
            'dob'           => 'nullable|date',
            'reg_date'      => 'required|date',
            'phoneno1'      => 'required|string',
            'phoneno2'      => 'nullable|string',
            'email'         => 'nullable|email',
            'staff_department_id'  => 'required|numeric',
            'staff_section_id'     => 'required|numeric',
            'emp_type'      => 'required|numeric',
            'tsc_no'        => 'nullable|string',
            'pin'           => 'nullable|string',
            'nssf'          => 'nullable|string',
            'nhif'          => 'nullable|string',
            'bank_name'     => 'nullable|string',
            'bank_branch'   => 'nullable|string',
            'account_name'  => 'nullable|string',
            'account_no'    => 'nullable|string',
            'photo'         => 'nullable',
        ]);

        $uni = strtolower(substr(chunk_split(str_random(30), 5, '-'), 0, 34));
        $uniq = StaffMember::where('slug', $uni)->first();

        if($uniq)
        {
            $slug = strtolower(substr(chunk_split(str_random(30), 5, '-'), 0, 34));
        }
        else
        {
            $slug = $uni;
        }

        $reg = StaffMember::where('member_no', $request->member_no)->first();
        if(!empty($reg))
        {
            $regy = StaffMember::orderBy('member_no', 'desc')->limit(1)->first();
            $no = $regy->member_no;
            $member_no = ++$no;
        }
        else
        {
            $member_no = strtoupper($request->member_no);
        }

        $data = new StaffMember();
        $data->slug         = $slug;
        $data->member_no    = $member_no;
        $data->name         = $request->name;
        $data->idno         = $request->idno;
        $data->gender       = $request->gender;
        $data->marital      = $request->marital;
        $data->dob          = $request->dob;
        $data->reg_date     = $request->reg_date;
        $data->phoneno1     = $request->phoneno1;
        $data->phoneno2     = $request->phoneno2;
        $data->email        = $request->email;
        $data->staff_department_id = $request->staff_department_id;
        $data->staff_section_id     = $request->staff_section_id;
        $data->emp_type     = $request->emp_type;
        $data->tsc_no       = $request->tsc_no;
        $data->pin          = $request->pin;
        $data->nssf         = $request->nssf;
        $data->nhif         = $request->nhif;
        $data->bank_name    = $request->bank_name;
        $data->bank_branch  = $request->bank_branch;
        $data->account_name = $request->account_name;
        $data->account_no   = $request->account_no;

        if($file = $request->file('photo')){
            $name = rand() . '.' .$file->getClientOriginalExtension();
            $data->photo   = $file->move('storage/staff', $name);
        }else{
            if($request->gender < 2){
                $data->photo   = 'storage/staff\male.png';
            }else{
                $data->photo   = 'storage/staff\female.png';
            }
        }
        $data->status       = 1;
        $data->created_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('staff-members.index')->with('success', 'Staff Member added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\StaffMember  $staffMember
     * @return \Illuminate\Http\Response
     */
    public function show(StaffMember $staffMember)
    {
        return view('profilea.staff.show_members', compact('staffMember'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\StaffMember  $staffMember
     * @return \Illuminate\Http\Response
     */
    public function edit(StaffMember $staffMember)
    {
        $departments = StaffDepartment::orderBy('name', 'asc')->get();
        $sections = StaffSection::orderBy('staff_department_id', 'asc')->get();
        return view('profilea.staff.edit_member', compact('sections', 'departments', 'staffMember'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StaffMember  $staffMember
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StaffMember $staffMember)
    {
        $request->validate([
            'name'          => 'required|string',
            'idno'          => 'required|string|unique:staff_members,idno,'.$staffMember->id,
            'gender'        => 'required|numeric',
            'marital'       => 'required|numeric',
            'dob'           => 'nullable|date',
            'reg_date'      => 'required|date',
            'phoneno1'      => 'required|string',
            'phoneno2'      => 'nullable|string',
            'email'         => 'nullable|email',
            'staff_department_id'  => 'required|numeric',
            'staff_section_id'     => 'required|numeric',
            'emp_type'      => 'required|numeric',
            'tsc_no'        => 'nullable|string',
            'pin'           => 'nullable|string',
            'nssf'          => 'nullable|string',
            'nhif'          => 'nullable|string',
            'bank_name'     => 'nullable|string',
            'bank_branch'   => 'nullable|string',
            'account_name'  => 'nullable|string',
            'account_no'    => 'nullable|string',
            'photo'         => 'nullable',
        ]);

        $data = $staffMember;
        $data->name         = $request->name;
        $data->idno         = $request->idno;
        $data->gender       = $request->gender;
        $data->marital      = $request->marital;
        $data->dob          = $request->dob;
        $data->reg_date     = $request->reg_date;
        $data->phoneno1     = $request->phoneno1;
        $data->phoneno2     = $request->phoneno2;
        $data->email        = $request->email;
        $data->staff_department_id = $request->staff_department_id;
        $data->staff_section_id     = $request->staff_section_id;
        $data->emp_type     = $request->emp_type;
        $data->tsc_no       = $request->tsc_no;
        $data->pin          = $request->pin;
        $data->nssf         = $request->nssf;
        $data->nhif         = $request->nhif;
        $data->bank_name    = $request->bank_name;
        $data->bank_branch  = $request->bank_branch;
        $data->account_name = $request->account_name;
        $data->account_no   = $request->account_no;

        if($file = $request->file('photo')){
            $name = rand() . '.' .$file->getClientOriginalExtension();
            $data->photo   = $file->move('storage/staff', $name);
        }

        $data->status       = $request->status;
        $data->updated_by   = Auth::user()->id;
        $data->save();

        return redirect()->route('staff-members.index')->with('success', 'Staff Member updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\StaffMember $staffMember
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(Request $request, StaffMember $staffMember)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $staffMember->delete();

            return redirect()->back()->with('success', 'The staff member has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
