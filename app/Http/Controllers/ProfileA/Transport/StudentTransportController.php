<?php

namespace App\Http\Controllers\ProfileA\Transport;

use App\CurrentSession;
use App\Student;
use App\StudentTransport;
use App\TransportZoneFee;
use Exception;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class StudentTransportController extends Controller
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

    public function sync()
    {
        $trans = StudentTransport::where('current_session_id', 2)->get();

        foreach ($trans as $tran)
        {
            $student = Student::findOrFail($tran->student_id);

            $data = $student;
            $data->on_transport      = "YES";
            $data->transport_zone_id = $tran->transport_zone_fee->transport_zone_id;
            $data->way               = $tran->getOriginal('way');
            $data->updated_by        = Auth::user()->id;
            $data->save();
        }

        return redirect()->back()->with('status', 'Sync Successfully');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $current_session = CurrentSession::Current()->first();
        $studentTransports = StudentTransport::where('current_session_id', $current_session->id)->orderBy('student_id', 'desc')->get();
        return view('profilea.transport.student_transport', compact('studentTransports', 'current_session'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'student_id'        => 'required|numeric',
            'current_session' => 'required|numeric',
            'transport_zone_id' => 'required|numeric',
            'way'               => 'required|numeric',
        ]);

        $student = Student::findOrFail($request->student_id);

        $tran = TransportZoneFee::findOrFail($request->transport_zone_id);

        $tran_data = new StudentTransport();
        $tran_data->student_id              = $student->id;
        $tran_data->current_session_id      = $request->current_session;
        $tran_data->class_grade_id          = $student->class_grade_id;
        $tran_data->transport_zone_fee_id   = $tran->id;
        $tran_data->way                     = $request->way;
        if($request->input('way') < 2){
            $tran_data->amount              = $tran->one_way;
        }
        elseif($request->input('way') > 1)
        {
            $tran_data->amount              = $tran->two_way;
        }
        $tran_data->created_by           = Auth::user()->id;
        $tran_data->save();

        $data = $student;
        $data->expected     = $student->expected + $tran_data->amount;
        $data->current      = $student->current + $tran_data->amount;
        $data->balance      = $student->balance + $tran_data->amount;
        $data->on_transport = "YES";
        $data->transport_zone_id = $request->transport_zone_id;
        $data->way          = $request->way;
        $data->save();

        return redirect()->back()->with('success', 'Student assigned transport successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param StudentTransport $studentTransport
     * @return Response
     */
    public function show(StudentTransport $studentTransport)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param StudentTransport $studentTransport
     * @return Response
     */
    public function edit(StudentTransport $studentTransport)
    {
        return view('profilea.transport.edit_student_transport', compact('studentTransport'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param StudentTransport $studentTransport
     * @return Response
     */
    public function update(Request $request, StudentTransport $studentTransport)
    {
        $request->validate([
            'transport_zone_id' => 'required|numeric',
            'way'               => 'required|numeric',
        ]);

        $old_amount = $studentTransport->amount;
        $tran = TransportZoneFee::findOrFail($request->transport_zone_id);

        $tran_data = $studentTransport;
        $tran_data->transport_zone_fee_id   = $tran->id;
        $tran_data->way                     = $request->way;
        if($request->input('way') < 2){
            $tran_data->amount              = $tran->one_way;
        }
        elseif($request->input('way') > 1)
        {
            $tran_data->amount              = $tran->two_way;
        }
        $tran_data->updated_by              = Auth::user()->id;
        $tran_data->save();

        $student = Student::findOrFail($studentTransport->student_id);

        if($tran_data->amount > $old_amount)
        {
            //Get the diff
            $diff = $tran_data->amount - $old_amount;

            $data = $student;
            $data->expected     = $student->expected + $diff;
            $data->current      = $student->current + $diff;
            $data->balance      = $student->balance + $diff;
            $data->transport_zone_id   = $request->transport_zone_id;
            $data->way                 = $request->way;
            $data->save();
        }
        elseif ($old_amount > $tran_data->amount)
        {
            //Get the diff
            $diff2 = $old_amount - $tran_data->amount;

            $data = $student;
            $data->expected     = $student->expected - $diff2;
            $data->current      = $student->current - $diff2;
            $data->balance      = $student->balance - $diff2;
            $data->transport_zone_id   = $request->transport_zone_id;
            $data->way                 = $request->way;
            $data->save();
        }

        return redirect()->route('student-transports.index')->with('success', 'Student transport updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param StudentTransport $studentTransport
     * @return Response
     * @throws Exception
     */
    public function destroy(Request $request, StudentTransport $studentTransport)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $student = Student::findOrFail($studentTransport->student_id);

            $stud = $student;
            $stud->expected  = $student->expected - $studentTransport->amount;
            $stud->current   = $student->current - $studentTransport->amount;
            $stud->balance   = $student->balance - $studentTransport->amount;
            $stud->on_transport = "NO";
            $stud->transport_zone_id = NULL;
            $stud->way = NULL;
            $stud->save();

            $studentTransport->delete();

            return redirect()->back()->with('success', 'The Student Transport Fee has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
