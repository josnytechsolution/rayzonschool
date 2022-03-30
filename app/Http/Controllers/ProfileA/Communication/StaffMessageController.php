<?php

namespace App\Http\Controllers\ProfileA\Communication;

use App\Compute;
use App\MessageOutbox;
use App\OriginalMessage;
use App\StaffDepartment;
use App\StaffMember;
use App\StaffSection;
use App\TempStaff;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class StaffMessageController extends Controller
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
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $staff_members = StaffMember::orderBy('name', 'asc')->get();
        return view('profilea.communication.to_all_staff', compact(  'staff_members'));
    }

    public function selectedDepartment()
    {
        $departments = StaffDepartment::orderBy('name', 'asc')->get();
        $sections = StaffSection::orderBy('staff_department_id', 'asc')->get();
        return view('profilea.communication.to_selected_department', compact('sections', 'departments'));
    }

    public function selectedMembers()
    {
        $members = StaffMember::Active()->orderBy('member_no', 'asc')->get();
        $temps = TempStaff::where('created_by', Auth::user()->id)->get();
        return view('profilea.communication.to_selected_members', compact('members',  'temps'));
    }

    public function addMember(Request $request)
    {
        $check = DB::table('temp_staff')->where('staff_member_id', $request->staff_member_id)->first();
        if ($check != NULL) {
            return response()->json(
                [
                    'error' => true,
                    'message' => 'Member already exists in the list!'
                ]
            );
        }
        else {
            DB::table('temp_staff')->insert(['staff_member_id' => $request->staff_member_id, 'created_by' => Auth::user()->id]);

            $lists = TempStaff::where('created_by', Auth::user()->id)->get();

            $tableData = "";

            $i = 1;
            foreach ($lists as $list) {
                $tableData .= "<tr>";
                $tableData .= "<td>".$i."</td>";
                $tableData .= "<td>".$list->staff_member->member_no."</td>";
                $tableData .= "<td>".$list->staff_member->name."</td>";
                $tableData .= "<td>".$list->staff_member->staff_section->name."</td>";
                $tableData .= "<td>".$list->staff_member->phoneno1."</td>";
                $tableData .= "<td><button type='button' class='btn btn-outline-danger btn-xs' onClick='deleteStaff(".$list->id.")'><i class='fa fa-trash'></i> </button></td>";
                $tableData .= "</tr>";

                $i++;
            }

            return response()->json(
                [
                    'success' => true,
                    'message' => 'Member added successfully!',
                    'results'    => $tableData
                ]
            );
        }
    }

    public function deleteMember($id)
    {
        DB::table('temp_staff')->delete($id);

        $lists = TempStaff::where('created_by', Auth::user()->id)->get();

        $tableData = "";

        $i = 1;
        foreach ($lists as $list) {
            $tableData .= "<tr>";
            $tableData .= "<td>".$i."</td>";
            $tableData .= "<td>".$list->staff_member->member_no."</td>";
            $tableData .= "<td>".$list->staff_member->name."</td>";
            $tableData .= "<td>".$list->staff_member->staff_section->name."</td>";
            $tableData .= "<td>".$list->staff_member->phoneno1."</td>";
            $tableData .= "<td><button type='button' class='btn btn-outline-danger btn-xs' onClick='deleteStaff(".$list->id.")'><i class='fa fa-trash'></i> </button></td>";
            $tableData .= "</tr>";

            $i++;
        }

        return response()->json(
            [
                'success' => true,
                'message' => 'Member removed from list successfully!',
                'results'    => ".$tableData."
            ]
        );
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function sendToAllStaffs(Request $request)
    {
        $request->validate([
            'message' => 'required|string',
        ]);

        $uniq = Str::uuid()->getHex();
        $msg = preg_replace( "/\r|\n/", " ", $request->input('message'));

        $orig = new OriginalMessage();
        $orig->slug    = $uniq;
        $orig->message = $msg;
        $orig->target  = "students";
        $orig->created_by = Auth::user()->id;
        $orig->save();

        $members = StaffMember::Active()->get();
        foreach ($members as $member)
        {
            $message  = str_replace("full_name", $member->name, $msg);

            $chars = strlen($message);

            $calc = Compute::calcEngine($chars);

            $messageId = Str::uuid()->getHex();

            $phone = $member->phoneno1;

            $data = new MessageOutbox();
            $data->code         = $uniq;
            $data->recipient_id = $member->id;
            $data->messageId    = $messageId;
            $data->message      = $message;
            $data->phoneno      = $phone;
            $data->characters   = $chars;
            $data->sms_units    = $calc['units'];
            $data->sms_cost     = $calc['cost'];
            $data->target       = "staff";
            $data->save();
        }

        return redirect()->route('send-bulk-messages.show', $uniq);

    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function sendToStaffDepartments(Request $request)
    {
        $request->validate([
            'staff_department_id'   => 'required|numeric',
            'staff_section_id'      => 'nullable|numeric',
            'message'               => 'required|string',
        ]);

        $uniq = Str::uuid()->getHex();
        $msg = preg_replace( "/\r|\n/", " ", $request->input('message'));

        $orig = new OriginalMessage();
        $orig->slug    = $uniq;
        $orig->message = $msg;
        $orig->target  = "students";
        $orig->created_by = Auth::user()->id;
        $orig->save();

        if(!empty($request->staff_section_id))
        {
            $members = StaffMember::Active()->where('staff_department_id', $request->staff_department_id)->where('staff_section_id', $request->staff_section_id)->get();
        }
        else
        {
            $members = StaffMember::Active()->where('staff_department_id', $request->staff_department_id)->get();
        }

        foreach ($members as $member)
        {
            $message  = str_replace("full_name", $member->name, $msg);

            $chars = strlen($message);

            $calc = Compute::calcEngine($chars);

            $messageId = Str::uuid()->getHex();

            $phone = $member->phoneno1;

            $data = new MessageOutbox();
            $data->code         = $uniq;
            $data->recipient_id = $member->id;
            $data->messageId    = $messageId;
            $data->message      = $message;
            $data->phoneno      = $phone;
            $data->characters   = $chars;
            $data->sms_units    = $calc['units'];
            $data->sms_cost     = $calc['cost'];
            $data->target       = "staff";
            $data->save();
        }

        return redirect()->route('send-bulk-messages.show', $uniq);

    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function sendToSelectedStaffMembers(Request $request)
    {
        $request->validate([
            'message' => 'required|string',
        ]);

        $uniq = Str::uuid()->getHex();
        $msg = preg_replace( "/\r|\n/", " ", $request->input('message'));

        $orig = new OriginalMessage();
        $orig->slug    = $uniq;
        $orig->message = $msg;
        $orig->target  = "students";
        $orig->created_by = Auth::user()->id;
        $orig->save();

        $temps = TempStaff::where('created_by', Auth::user()->id)->get();

        foreach ($temps as $temp)
        {
            $member = StaffMember::findOrFail($temp->staff_member_id);

            $message  = str_replace("full_name", $member->name, $msg);

            $chars = strlen($message);

            $calc = Compute::calcEngine($chars);

            $messageId = Str::uuid()->getHex();

            $phone = $member->phoneno1;

            $data = new MessageOutbox();
            $data->code         = $uniq;
            $data->recipient_id = $temp->staff_member_id;
            $data->messageId    = $messageId;
            $data->message      = $message;
            $data->phoneno      = $phone;
            $data->characters   = $chars;
            $data->sms_units    = $calc['units'];
            $data->sms_cost     = $calc['cost'];
            $data->target       = "staff";
            $data->save();

            $tem = $temp;
            $tem->delete();
        }

        return redirect()->route('send-bulk-messages.show', $uniq);

    }
}
