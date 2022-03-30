<?php

namespace App\Http\Controllers\ProfileA\Communication;

use App\ClassGrade;
use App\Compute;
use App\CurrentSession;
use App\GenerateToken;
use App\GenStudent;
use App\MessageOutbox;
use App\OriginalMessage;
use App\Student;
use App\StudentTransport;
use App\TransportFleet;
use App\TransportZone;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use phpDocumentor\Reflection\Types\Integer;

class GeneralMessageController extends Controller
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
     * @return Response
     */
    public function index()
    {
        return view('profilea.communication.to_all_stud_general');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $grades = ClassGrade::orderBy('name', 'asc')->get();
        return view('profilea.communication.selected_class_general', compact( 'grades'));
    }

    public function sendToGenStudents()
    {
        $students = Student::Active()->orderBy('admno', 'asc')->get();
        $temps = GenStudent::orderBy('id', 'asc')->get();
        return view('profilea.communication.selected_students_general', compact( 'students', 'temps'));
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function addGenStudent(Request $request)
    {
        $check = DB::table('gen_students')->where('student_id', $request->student_id)->first();
        if ($check != NULL) {
            return response()->json(
                [
                    'error' => true,
                    'message' => 'Student already exists in the list!'
                ]
            );
        }
        else {
            DB::table('gen_students')->insert(['student_id' => $request->student_id, 'created_by' => Auth::user()->id]);

            $lists = GenStudent::where('created_by', Auth::user()->id)->get();

            $tableData = "";

            $i = 1;
            foreach ($lists as $list) {
                $tableData .= "<tr>";
                $tableData .= "<td>".$i."</td>";
                $tableData .= "<td>".$list->student->admno."</td>";
                $tableData .= "<td>".$list->student->name."</td>";
                $tableData .= "<td>".$list->student->class_grade->long_name."</td>";
                $tableData .= "<td>".$list->student->parent_detail->primary_contact."</td>";
                $tableData .= "<td><button type='button' id='delete-gen' class='btn btn-outline-danger btn-xs' onClick='deleteGen(".$list->id.")'><i class='fa fa-trash'></i> </button></td>";
                $tableData .= "</tr>";

                $i++;
            }

            return response()->json(
                [
                    'success' => true,
                    'message' => 'Student added successfully!',
                    'results'    => $tableData
                ]
            );
        }
    }

    public function deleteGen($id)
    {
        DB::table('gen_students')->delete($id);

        $lists = GenStudent::where('created_by', Auth::user()->id)->get();

        $tableData = "";

        $i = 1;
        foreach ($lists as $list) {
            $tableData .= "<tr>";
            $tableData .= "<td>".$i."</td>";
            $tableData .= "<td>".$list->student->admno."</td>";
            $tableData .= "<td>".$list->student->name."</td>";
            $tableData .= "<td>".$list->student->class_grade->long_name."</td>";
            $tableData .= "<td>".$list->student->parent_detail->primary_contact."</td>";
            $tableData .= "<td>".$list->student->balance."</td>";
            $tableData .= "<td><button type='button' id='delete-gen' class='btn btn-outline-danger btn-xs' onClick='deleteGen(".$list->id.")'><i class='fa fa-trash'></i> </button></td>";
            $tableData .= "</tr>";

            $i++;
        }

        return response()->json(
            [
                'success' => true,
                'message' => 'Student removed from list successfully!',
                'results'    => ".$tableData."
            ]
        );
    }

    public function sendToTranStudents()
    {
        $students = Student::Active()->where('on_transport', 'YES')->count();
        $transport_zones = TransportZone::all();
        $transport_fleets = TransportFleet::all();
        return view('profilea.communication.to_transport_students', compact('students', 'transport_zones', 'transport_fleets'));
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function sendToAllStudents(Request $request)
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

        $students = Student::Active()->get();
        foreach ($students as $student)
        {
            $message1  = str_replace("full_name", $student->name, $msg);
            $message  = str_replace("adm_no", $student->admno, $message1);

            $chars = strlen($message);

            $calc = Compute::calcEngine($chars);

            if ($student->send_to === "Primary Contact")
            {
                $messageId = Str::uuid()->getHex();
                $phone = $student->parent_detail->primary_contact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
            }
            elseif ($student->send_to === "Secondary Contact")
            {
                $messageId = Str::uuid()->getHex();
                $phone = $student->parent_detail->secondary_contact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
            }
            elseif ($student->send_to === "Both Contacts")
            {
                $messageId = Str::uuid()->getHex();
                $messageId1 = Str::uuid()->getHex();

                $phone = $student->parent_detail->primary_contact;
                $phone1 = $student->parent_detail->secondary_contact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);

            }
        }

        return redirect()->route('send-bulk-messages.show', $uniq);

    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function sendToSelectedClasses(Request $request)
    {
        $request->validate([
            'grade'   => 'required',
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

        $grades = $request->grade;

        foreach($grades as $grade) {

            $students = Student::Active()->where('class_grade_id', $grade)->get();

            foreach ($students as $student)
            {
                $message1 = str_replace("full_name", $student->name, $msg);
                $message = str_replace("adm_no", $student->admno, $message1);

                $chars = strlen($message);

                $calc = Compute::calcEngine($chars);

                if ($student->send_to === "Primary Contact")
                {
                    $messageId = Str::uuid()->getHex();
                    $phone = $student->parent_detail->primary_contact;

                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                }
                elseif ($student->send_to === "Secondary Contact")
                {
                    $messageId = Str::uuid()->getHex();
                    $phone = $student->parent_detail->secondary_contact;

                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                }
                elseif ($student->send_to === "Both Contacts")
                {
                    $messageId = Str::uuid()->getHex();
                    $messageId1 = Str::uuid()->getHex();

                    $phone = $student->parent_detail->primary_contact;
                    $phone1 = $student->parent_detail->secondary_contact;

                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);

                }
            }
        }

        return redirect()->route('send-bulk-messages.show', $uniq);
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function sendToSelectedStudents(Request $request)
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

        $studs = GenStudent::where('created_by', Auth::user()->id)->get();

        foreach ($studs as $stud)
        {
            $message1  = str_replace("full_name", $stud->student->name, $msg);
            $message  = str_replace("adm_no", $stud->student->admno, $message1);

            $chars = strlen($message);

            $calc = Compute::calcEngine($chars);

            if ($stud->student->send_to === "Primary Contact")
            {
                $messageId = Str::uuid()->getHex();
                $phone = $stud->student->parent_detail->primary_contact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $stud->student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
            }
            elseif ($stud->student->send_to === "Secondary Contact")
            {
                $messageId = Str::uuid()->getHex();
                $phone = $stud->student->parent_detail->secondary_contact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $stud->student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
            }
            elseif ($stud->student->send_to === "Both Contacts")
            {
                $messageId = Str::uuid()->getHex();
                $messageId1 = Str::uuid()->getHex();

                $phone = $stud->student->parent_detail->primary_contact;
                $phone1 = $stud->student->parent_detail->secondary_contact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $stud->student_id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $stud->student_id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);

            }

            $tem = $stud;
            $tem->delete();
        }

        return redirect()->route('send-bulk-messages.show', $uniq);

    }


    public function sendToTransportStudents(Request $request)
    {
        $request->validate([
            'message' => 'required|string',
        ]);

        //dd($request->transport_zone_id, $request->transport_fleet_id);

        $uniq = Str::uuid()->getHex();
        $msg = preg_replace( "/\r|\n/", " ", $request->input('message'));

        $orig = new OriginalMessage();
        $orig->slug    = $uniq;
        $orig->message = $msg;
        $orig->target  = "students";
        $orig->created_by = Auth::user()->id;
        $orig->save();

        if ($request->transport_zone_id != NULL)
        {
            $students = Student::Active()->where('on_transport', 'YES')->where('transport_zone_id', $request->transport_zone_id)->get();

           if ($students->count() > 0)
           {
               foreach ($students as $student)
               {
                   $message1 = str_replace("full_name", $student->name, $msg);
                   $message  = str_replace("adm_no", $student->admno, $message1);

                   $chars = strlen($message);

                   $calc = Compute::calcEngine($chars);

                   if ($student->send_to === "Primary Contact")
                   {
                       $messageId = Str::uuid()->getHex();
                       $phone = $student->parent_detail->primary_contact;

                       DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                   }
                   elseif ($student->send_to === "Secondary Contact")
                   {
                       $messageId = Str::uuid()->getHex();
                       $phone = $student->parent_detail->secondary_contact;

                       DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                   }
                   elseif ($student->send_to === "Both Contacts")
                   {
                       $messageId = Str::uuid()->getHex();
                       $messageId1 = Str::uuid()->getHex();

                       $phone = $student->parent_detail->primary_contact;
                       $phone1 = $student->parent_detail->secondary_contact;

                       DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                       DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);

                   }
               }

               return redirect()->route('send-bulk-messages.show', $uniq);
           }

            return redirect()->back()->with('error', 'No students found for the selected criteria!');
        }
        elseif($request->transport_fleet_id != NULL)
        {
            $students = Student::Active()->where('on_transport', 'YES')->where('transport_fleet_id', $request->transport_fleet_id)->get();

            if ($students->count() > 0)
            {
                foreach ($students as $student)
                {
                    $message1 = str_replace("full_name", $student->name, $msg);
                    $message  = str_replace("adm_no", $student->admno, $message1);

                    $chars = strlen($message);

                    $calc = Compute::calcEngine($chars);

                    if ($student->send_to === "Primary Contact")
                    {
                        $messageId = Str::uuid()->getHex();
                        $phone = $student->parent_detail->primary_contact;

                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                    }
                    elseif ($student->send_to === "Secondary Contact")
                    {
                        $messageId = Str::uuid()->getHex();
                        $phone = $student->parent_detail->secondary_contact;

                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                    }
                    elseif ($student->send_to === "Both Contacts")
                    {
                        $messageId = Str::uuid()->getHex();
                        $messageId1 = Str::uuid()->getHex();

                        $phone = $student->parent_detail->primary_contact;
                        $phone1 = $student->parent_detail->secondary_contact;

                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);

                    }
                }

                return redirect()->route('send-bulk-messages.show', $uniq);
            }

            return redirect()->back()->with('error', 'No students found for the selected criteria!');
        }
        else
        {
            $students = Student::Active()->where('on_transport', 'YES')->get();

            if ($students->count() > 0)
            {
                foreach ($students as $student)
                {
                    $message1 = str_replace("full_name", $student->name, $msg);
                    $message  = str_replace("adm_no", $student->admno, $message1);

                    $chars = strlen($message);

                    $calc = Compute::calcEngine($chars);

                    if ($student->send_to === "Primary Contact")
                    {
                        $messageId = Str::uuid()->getHex();
                        $phone = $student->parent_detail->primary_contact;

                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                    }
                    elseif ($student->send_to === "Secondary Contact")
                    {
                        $messageId = Str::uuid()->getHex();
                        $phone = $student->parent_detail->secondary_contact;

                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                    }
                    elseif ($student->send_to === "Both Contacts")
                    {
                        $messageId = Str::uuid()->getHex();
                        $messageId1 = Str::uuid()->getHex();

                        $phone = $student->parent_detail->primary_contact;
                        $phone1 = $student->parent_detail->secondary_contact;

                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                        DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);

                    }
                }

                return redirect()->route('send-bulk-messages.show', $uniq);
            }

            return redirect()->back()->with('error', 'No students found for the selected criteria!');
        }

    }
}
