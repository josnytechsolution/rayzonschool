<?php

namespace App\Http\Controllers\ProfileA\Communication;

use App\ClassGrade;
use App\Compute;
use App\MessageOutbox;
use App\OriginalMessage;
use App\Student;
use App\TempStudent;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class FeeMessageController extends Controller
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
        return view('profilea.communication.to_all_with_arrears');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $grades = ClassGrade::orderBy('name', 'asc')->get();
        return view('profilea.communication.selected_class_with_arrears', compact( 'grades'));
    }

    public function sendToStudents()
    {
        $students = Student::Active()->orderBy('admno', 'asc')->where('balance', '>', 0)->get();
        $temps = TempStudent::orderBy('id', 'asc')->get();
        return view('profilea.communication.selected_students_with_arrears', compact( 'students', 'temps'));

    }

    public function addStudent(Request $request)
    {
        $check = DB::table('temp_students')->where('student_id', $request->student_id)->first();
        if ($check != NULL) {
            return response()->json(
                [
                    'error' => true,
                    'message' => 'Student already exists in the list!'
                ]
            );
        }
        else {
            DB::table('temp_students')->insert([
                'student_id' => $request->student_id,
                'created_by' => Auth::user()->id,
            ]);

            $lists = TempStudent::where('created_by', Auth::user()->id)->get();

            $tableData = "";

            $i = 1;
            foreach ($lists as $list) {
                $tableData .= "<tr>";
                $tableData .= "<td>".$i."</td>";
                $tableData .= "<td>".$list->student->admno."</td>";
                $tableData .= "<td>".$list->student->name."</td>";
                $tableData .= "<td>".$list->student->class_grade->long_name."</td>";
                $tableData .= "<td>".$list->student->parent_detail->primary_contact."</td>";
                $tableData .= "<td>".number_format($list->student->balance)."</td>";
                $tableData .= "<td><button type='button' id='delete-temp' class='btn btn-outline-danger btn-xs' onClick='deleteTemp(".$list->id.")'><i class='fa fa-trash'></i> </button></td>";
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

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteTemp($id)
    {
        DB::table('temp_students')->delete($id);

        $lists = TempStudent::where('created_by', Auth::user()->id)->get();

        $tableData = "";

        $i = 1;
        foreach ($lists as $list) {
            $tableData .= "<tr>";
            $tableData .= "<td>".$i."</td>";
            $tableData .= "<td>".$list->student->admno."</td>";
            $tableData .= "<td>".$list->student->name."</td>";
            $tableData .= "<td>".$list->student->class_grade->long_name."</td>";
            $tableData .= "<td>".$list->student->parent_detail->primary_contact."</td>";
            $tableData .= "<td>".number_format($list->student->balance)."</td>";
            $tableData .= "<td><button type='button' id='delete-temp' class='btn btn-outline-danger btn-xs' onClick='deleteTemp(".$list->id.")'><i class='fa fa-trash'></i> </button></td>";
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

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function sendToAllWithFigures(Request $request)
    {
        $request->validate([
            'from'   => 'nullable|numeric',
            'to'     => 'nullable|numeric',
            'message' => 'required|string',
        ]);

        $uniq = Str::uuid()->getHex();

        if(!empty($request->from) && !empty($request->to))
        {
            if($request->from > $request->to || $request->from === $request->to)
            {
                return redirect()->back()->with('failed', 'Error! Amount 2 should be greater than Amount 1');
            }
            else
            {
                $students = Student::Active()->Balance()->where('balance', '>', $request->from)->where('balance', '<', $request->to)->get();
            }
        }
        else
        {
            $students = Student::Active()->Balance()->get();
        }

        $msg = preg_replace( "/\r|\n/", " ", $request->input('message'));

        $orig = new OriginalMessage();
        $orig->slug    = $uniq;
        $orig->message = $msg;
        $orig->target  = "students";
        $orig->created_by = Auth::user()->id;
        $orig->save();

        foreach ($students as $student)
        {
            $message1  = str_replace("full_name", $student->name, $msg);
            $message2  = str_replace("fee_balance", $student->balance, $message1);
            $message  = str_replace("adm_no", $student->admno, $message2);

            $pContact = $student->parent_detail->primary_contact;
            $sContact = $student->parent_detail->secondary_contact;

            $chars = strlen($message);

            $calc = Compute::calcEngine($chars);

            if ($student->send_to === "Primary Contact" && $pContact != NULL)
            {
                $messageId = Str::uuid()->getHex();
                $phone = $pContact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
            }
            elseif ($student->send_to === "Secondary Contact" && $sContact != NULL)
            {
                $messageId = Str::uuid()->getHex();
                $phone =  $sContact;

                DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
            }
            elseif ($student->send_to === "Both Contacts")
            {
                $messageId = Str::uuid()->getHex();
                $messageId1 = Str::uuid()->getHex();

                $phone = $pContact;
                $phone1 = $sContact;

                if($pContact != NULL){
                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId, 'message' => $message, 'phoneno' => $phone, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                }

                if($sContact != NULL){
                    DB::table('message_outboxes')->insert(['code' => $uniq, 'recipient_id' => $student->id, 'messageId' => $messageId1, 'message' => $message, 'phoneno' => $phone1, 'characters' => $chars, 'sms_units' => $calc['units'], 'sms_cost' => $calc['cost'], 'target' => 'students']);
                }
            }
        }

        return redirect()->route('send-bulk-messages.show', $uniq);

    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function sendToSelectedClassWithFigures(Request $request)
    {
        $request->validate([
            'grade'   => 'required',
            'from'   => 'nullable|numeric',
            'to'     => 'nullable|numeric',
            'message' => 'required|string',
        ]);

        $uniq = Str::uuid()->getHex();
        $msg = preg_replace( "/\r|\n/", " ", $request->input('message'));
        $grades = $request->grade;

        $orig = new OriginalMessage();
        $orig->slug    = $uniq;
        $orig->message = $msg;
        $orig->target  = "students";
        $orig->created_by = Auth::user()->id;
        $orig->save();

        if(!empty($request->from) && !empty($request->to))
        {
            if($request->from > $request->to || $request->from === $request->to)
            {
                return redirect()->back()->with('failed', 'Error! Amount 2 should be greater than Amount 1');
            }
            else
            {
                foreach($grades as $grade)
                {
                    $students = Student::Active()->Balance()->where('balance', '>', $request->from)->where('balance', '<', $request->to)->where('class_grade_id', $grade)->get();

                    foreach ($students as $student)
                    {
                        $message1    = str_replace("full_name", $student->name, $msg);
                        $message2   = str_replace("fee_balance", $student->balance, $message1);
                        $message  = str_replace("adm_no", $student->admno, $message2);

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
        }
        else
        {
            foreach($grades as $grade) {
                $students = Student::Active()->Balance()->where('class_grade_id', $grade)->get();

                foreach ($students as $student)
                {
                    $message1 = str_replace("full_name", $student->name, $msg);
                    $message2 = str_replace("fee_balance", $student->balance, $message1);
                    $message = str_replace("adm_no", $student->admno, $message2);

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
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function sendToSelectedStudentWithFigures(Request $request)
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

        $studs = TempStudent::where('created_by', Auth::user()->id)->get();

        foreach ($studs as $stud)
        {
            $message1  = str_replace("full_name", $stud->student->name, $msg);
            $message2  = str_replace("fee_balance", $stud->student->balance, $message1);
            $message  = str_replace("adm_no", $stud->student->admno, $message2);

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
}
