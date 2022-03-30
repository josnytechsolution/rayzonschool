<?php

namespace App\Http\Controllers\ProfileA\Students;

use App\ClassFee;
use App\ClassGrade;
use App\Classroom;
use App\CurrentDefault;
use App\CurrentSession;
use App\DiscountLevel;
use App\Exports\ArrearExport;
use App\Exports\BalanceExport;
use App\Exports\OverpayExport;
use App\Exports\StudentExport;
use App\FeeDiscount;
use App\OneTimeFee;
use App\OptionalFee;
use App\ParentDetail;
use App\SchoolProfile;
use App\Student;
use App\StudentFee;
use App\StudentTimeline;
use App\StudentTransport;
use App\TransportZoneFee;
use App\User;
use PDF;
use Exception;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class StudentController extends Controller
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

    public function studentsStatistics()
    {
        return view('profilea.students.students_statistics');
    }

    public function feeSummary()
    {
        $students = Student::Active()->get();
        $current_session = CurrentSession::Current()->first();
        return view('profilea.reports.fees_summary', compact('students', 'current_session'));
    }

    public function thisSummaryClass($id)
    {
        $class_grade = ClassGrade::where('slug', $id)->first();
        $students = Student::Active()->where('class_grade_id', $class_grade->id)->get();
        $current_session = CurrentSession::Current()->first();
        return view('profilea.reports.class_fees_summary', compact('students', 'current_session', 'class_grade'));
    }

    public function balances()
    {
        $balances = Student::Active()->Balance()->get();
        return view('profilea.fee-setup.fee_balances', compact('balances'));
    }

    public function filterByClass($id)
    {
        $class_grade = ClassGrade::where('slug', $id)->first();
        $balances = Student::where('class_grade_id', $class_grade->id)->Active()->Balance()->get();
        return view('profilea.fee-setup.class_fee_balances', compact('balances', 'class_grade'));
    }

    public function arrears()
    {
        $arrears = Student::Active()->Arrears()->get();
        return view('profilea.fee-setup.fee_arrears', compact('arrears'));
    }

    public function arrearsByClass($id)
    {
        $class_grade = ClassGrade::where('slug', $id)->first();
        $arrears = Student::where('class_grade_id', $class_grade->id)->Active()->Arrears()->get();
        return view('profilea.fee-setup.class_fee_arrears', compact('arrears', 'class_grade'));
    }

    public function overpays()
    {
        $overpays = Student::Active()->Overpay()->get();
        return view('profilea.fee-setup.fee_overpays', compact('overpays'));
    }

    public function overpayByClass($id)
    {
        $class_grade = ClassGrade::where('slug', $id)->first();
        $overpays = Student::where('class_grade_id', $class_grade->id)->Active()->Overpay()->get();
        return view('profilea.fee-setup.class_fee_overpays', compact('overpays', 'class_grade'));
    }

    public function activateStudent($id)
    {
        $student = Student::where('slug', $id)->first();
        return view('profilea.students.activate_student', compact('student'));
    }




    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $students = Student::Active()->orderBy('id', 'desc')->get();
        $mStudents = Student::Active()->Male()->orderBy('id', 'desc')->get();
        $fStudents = Student::Active()->Female()->orderBy('id', 'desc')->get();
        return view('profilea.students.students_list', compact('students', 'mStudents', 'fStudents'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function Alumni()
    {
        $students = Student::Alumni()->orderBy('id', 'desc')->get();
        return view('profilea.students.alumni_list', compact('students'));
    }

    public function inactive()
    {
        $students = Student::Inactive()->orderBy('id', 'desc')->get();
        return view('profilea.students.inactive_students', compact('students'));
    }

    public function thisClass($id)
    {
        $class_grade = ClassGrade::where('slug', $id)->first();
        $students = Student::Active()->where('class_grade_id', $class_grade->id)->orderBy('admno', 'desc')->get();
        $mStudents = Student::Active()->Male()->where('class_grade_id', $class_grade->id)->orderBy('id', 'desc')->get();
        $fStudents = Student::Active()->Female()->where('class_grade_id', $class_grade->id)->orderBy('id', 'desc')->get();
        return view('profilea.students.class_students_list', compact('students', 'class_grade', 'mStudents', 'fStudents'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $classrooms = Classroom::all();
        $optional_fees = OptionalFee::all();
        $transport_zone_fees = TransportZoneFee::all();
        $parents = ParentDetail::Active()->get();
        $discount_levels = DiscountLevel::Active()->get();
        $current_sessions = CurrentSession::orderBy('id', 'desc')->get();

        $reg = Student::orderBy('admno', 'desc')->limit(1)->first();
        if(!empty($reg))
        {
            $no = $reg->admno;
            $admno = ++$no;
        }
        else
        {
            $admno = "RYZ1001";
        }

        $no = ParentDetail::orderBy('parent_no', 'desc')->limit(1)->first();
        if(!empty($no))
        {
            $pno = $no->parent_no;
            $parent_no = ++$pno;
        }
        else
        {
            $parent_no = "RYP0001";
        }

        return view('profilea.students.admit_student', compact('current_sessions','classrooms', 'optional_fees', 'transport_zone_fees', 'admno', 'parent_no', 'parents', 'discount_levels'));
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
            'primary_phone'     => 'nullable|string|unique:parent_details',
            'secondary_phone'   => 'nullable|string|unique:parent_details',
            'primary_email'     => 'nullable|string|unique:parent_details',
            'fname'             => 'nullable|string',
            'fcontact'          => 'nullable|string|unique:parent_details',
            'femail'            => 'nullable|email|unique:parent_details',
            'foccupation'       => 'nullable|string',
            'mname'             => 'nullable|string',
            'mcontact'          => 'nullable|string|unique:parent_details',
            'memail'            => 'nullable|email|unique:parent_details',
            'moccupation'       => 'nullable|string',
            'gname'             => 'nullable|string',
            'gcontact'          => 'nullable|string|unique:parent_details',
            'gemail'            => 'nullable|email|unique:parent_details',
            'grelation'         => 'nullable|string',

            'admno'             => 'required|max:8|unique:students',
            'name'              => 'required|string',
            'classroom'         => 'required|numeric',
            'birth_cert'        => 'nullable|string|unique:students',
            'nemis_upi'         => 'nullable|string|unique:students',
            'gender'            => 'required|numeric',
            'dob'               => 'required|date',
            'doa'               => 'required|date',
            'residence'         => 'nullable|string',
            'adm_type'          => 'required|numeric',
            'current_session'   => 'required|string',
            'discount_level'    => 'required|numeric',
            'send_to'           => 'required|string',
            'photo'             => 'nullable|mimes:jpg,jpeg,png,tiff',
        ]);

        $room = Classroom::findOrFail($request->classroom);

        //Add class fees
        $classFees = ClassFee::where('class_grade_id', $room->class_grade_id)->where('current_session_id', $request->current_session)->get();
        //dd($classFees);

        if (count($classFees) < 1) { return redirect()->back()->with('failed', 'Fee Structure for the selected class cannot be found!'); }

        //If this is an existing parent
        if(!empty($request->paro_no))
        {
            $parent = ParentDetail::findOrFail($request->paro_no);
            $parent_id = $parent->id;
        }
        else
        {
            // This is a new parent
            if(empty($request->fname) && empty($request->mname) && empty($request->gname) )
            {
                return redirect()->back()->with('no-parent', 'Kindly fill atleast one parent!');
            }
            else
            {
                $no = ParentDetail::orderBy('parent_no', 'desc')->limit(1)->first();
                if(!empty($no))
                {
                    $pno = $no->parent_no;
                    $par_no = ++$pno;
                }
                else
                {
                    $par_no = "RYP0001";
                }

                $slag = strtolower(substr(chunk_split(str_random(30), 5, '-'), 0, 34))."-".date('YmdHis');

                $data = new ParentDetail();
                $data->slug         =   $slag;
                $data->parent_no    =   $par_no;
                $data->primary_contact  = $request->primary_contact;
                $data->secondary_contact  = $request->secondary_contact;
                $data->primary_email  = $request->primary_email;
                $data->fname        =   $request->fname;
                $data->fcontact     =   $request->fcontact;
                $data->femail       =   $request->femail;
                $data->foccupation  =   $request->foccupation;
                $data->mname        =   $request->mname;
                $data->mcontact     =   $request->mcontact;
                $data->memail       =   $request->memail;
                $data->moccupation  =   $request->moccupation;
                $data->gname        =   $request->gname;
                $data->gcontact     =   $request->gcontact;
                $data->gemail       =   $request->gemail;
                $data->grelation    =   $request->grelation;
                $data->credential_email = strtolower($par_no)."@rayzonschools.com";
                $data->credential_password = rand(10000001, 99999999);
                $data->created_by   =   Auth::user()->id;
                $data->save();

                if ($data->fname != NULL){ $name = $data->fname; } elseif ($data->mname != NULL) { $name = $data->mname; } elseif ($data->gname != NULL) { $name = $data->gname; } else { $name = "Anonymous"; }

                DB::table('users')->insert(['name' => $name, 'email' => $data->credential_email, 'password' => Hash::make($data->credential_password), 'profile' => 5, 'position' => 'Parent', 'parent_detail_id' => $data->id, 'status' => 1, 'created_by' => Auth::user()->id]);

                $parent_id = $data->id;
            }
        }

        //Register student

        $admno = $request->admno;

        $slug = strtolower(substr(chunk_split(str_random(30), 5, '-'), 0, 34))."-".date('YmdHis');

        $data1 = new Student();
        $data1->parent_detail_id = $parent_id;
        $data1->slug            = $slug;
        $data1->admno           = $admno;
        $data1->name            = $request->name;
        $data1->classroom_id    = $request->classroom;
        $data1->class_grade_id  = $room->class_grade_id;
        $data1->class_stream_id = $room->class_stream_id;
        $data1->birth_cert      = $request->birth_cert;
        $data1->nemis_upi       = $request->nemis_upi;
        $data1->gender          = $request->gender;
        $data1->dob             = $request->dob;
        $data1->doa             = $request->doa;
        $data1->residence       = $request->residence;
        $data1->adm_type        = $request->adm_type;
        $data1->send_to         = $request->send_to;
        $data1->discount_level_id  = $request->discount_level;
        $data1->current_session_id = $request->current_session;

        if($file = $request->file('photo')){
            $name = rand() . '.' .$file->getClientOriginalExtension();
            $data1->photo   = $file->move('storage/students', $name);
        }else{
            if($request->gender < 2){
                $data1->photo   = 'storage/students\male.png';
            }else{
                $data1->photo   = 'storage/students\female.png';
            }
        }

        $data1->created_by      = Auth::user()->id;
        $data1->save();


        foreach ($classFees as $classFee)
        {
            DB::table('student_fees')->insert(['student_id' => $data1->id, 'current_session_id' => $request->current_session, 'fee_parameter_id' => $classFee->fee_parameter_id, 'description' => 'General Fee', 'class_grade_id' => $data1->class_grade_id, 'amount' => $classFee->amount, 'created_by' => Auth::user()->id]);
        }

        //Add all optional fees selected to the student fees
        $options = $request->input('options');

        if($options != NULL)
        {
            foreach ($options as $option)
            {
                $opt = OptionalFee::findOrFail($option);

                DB::table('student_fees')->insert(['student_id' => $data1->id, 'current_session_id' => $request->current_session, 'fee_parameter_id' => $opt->fee_parameter_id, 'description' => 'Optional Fee', 'class_grade_id' => $data1->class_grade_id, 'amount' => $opt->amount, 'created_by' => Auth::user()->id]);
            }
        }

        //If this is a new admission add all one time fees
        if($request->input('adm_type') < 2)
        {
            $otfs = OneTimeFee::where('current_session_id', $request->input('current_session'))->get();

            foreach ($otfs as $otf)
            {
                DB::table('student_fees')->insert(['student_id' => $data1->id, 'current_session_id' => $request->current_session, 'fee_parameter_id' => $otf->fee_parameter_id, 'description' => 'One Time Fee', 'class_grade_id' => $data1->class_grade_id, 'amount' => $otf->amount, 'created_by' => Auth::user()->id]);
            }
        }

        //Add transport details if specified
        $transport = $request->input('transport_zone_id');
        $transportWay = $request->input('way');
        $trans_amount = 0;

        if($transport != NULL && $transportWay != NULL)
        {
            $tran = TransportZoneFee::findOrFail($transport);

            if($request->input('way') < 2) {  $tamount  = $tran->one_way; } else { $tamount  = $tran->two_way; }

            DB::table('student_transports')->insert(['student_id' => $data1->id, 'current_session_id' => $request->current_session, 'class_grade_id' => $data1->class_grade_id, 'transport_zone_fee_id' => $tran->id, 'way' => $request->way, 'amount' => $tamount, 'created_by' => Auth::user()->id]);

            $trans_amount = $tamount;
        }

        $discount = 0;
        if ($data1->discount_level->discount > 0)
        {
            DB::table("fee_discounts")->insert(['student_id' => $data1->id, 'current_session_id' => $request->current_session, 'class_grade_id' => $data1->class_grade_id, 'name' => $data1->discount_level->name, 'description' => $data1->discount_level->name.' Discount', 'amount' => $data1->discount_level->discount, 'status' => 1, 'created_by' => Auth::user()->id]);
            $discount = FeeDiscount::where('student_id', $data1->id)->where('current_session_id', $request->current_session)->sum('amount');
        }

        //Calculate fees payable
        $fees = StudentFee::where('student_id', $data1->id)->where('current_session_id', $request->input('current_session'))->sum('amount');

        $total = ($fees + $trans_amount) - $discount;

        $stud = $data1;
        $stud->expected     = $total;
        $stud->current      = $total;
        $stud->balance      = $total;

        if($trans_amount > 0 ){
            $stud->on_transport         = "YES";
            $stud->transport_zone_id    = $request->transport_zone_id;
            $stud->way                  = $request->way;
        }

        $stud->updated_by   = Auth::user()->id;
        $stud->updated_at   = now();
        $stud->save();

        $description = "Enrolled to ".strtoupper($stud->class_grade->long_name)."";

        DB::table('student_timelines')->insert(['student_id' => $stud->id, 'current_session_id' => $request->current_session, 'class_grade_id' => $stud->class_grade_id, 'description' => $description, 'created_by' => Auth::user()->id]);

        return redirect()->back()->with('success', 'Student added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param Student $student
     * @return Response
     */
    public function show(Student $student)
    {
        $siblings = Student::where('parent_detail_id', $student->parent_detail_id)->where('id', '!=', $student->id)->get();
        $currentSession = CurrentSession::Current()->first();
        $studentFees = StudentFee::where('current_session_id', $currentSession->id)->where('student_id', $student->id)->get();
        return view('profilea.students.show_student', compact('student', 'siblings', 'currentSession', 'studentFees'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Student $student
     * @return Response
     */
    public function edit(Student $student)
    {
        $classrooms = Classroom::all();
        $parents = ParentDetail::Active()->get();
        $discount_levels = DiscountLevel::Active()->get();
        $no = ParentDetail::orderBy('parent_no', 'desc')->limit(1)->first();
        if(!empty($no))
        {
            $pno = $no->parent_no;
            $parent_no = ++$pno;
        }
        else
        {
            $parent_no = "SBP0001";
        }
        return view('profilea.students.edit_student', compact('student', 'classrooms', 'parents', 'parent_no', 'discount_levels'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Student $student
     * @return Response
     */
    public function update(Request $request, Student $student)
    {
        $request->validate([
            'parent_detail_id'  => 'required|numeric',
            'name'              => 'required|string',
            'classroom'         => 'required|numeric',
            'birth_cert'        => 'nullable|string|unique:students,birth_cert,'.$student->id,
            'nemis_upi'         => 'nullable|string|unique:students,nemis_upi,'.$student->id,
            'gender'            => 'required|numeric',
            'dob'               => 'required|date',
            'doa'               => 'required|date',
            'residence'         => 'nullable|string',
            'discount_level'    => 'required|numeric',
            'send_to'           => 'required|string',
            'photo'             => 'nullable|mimes:jpg,jpeg,png,tiff',
        ]);

        $room = Classroom::findOrFail($request->classroom);

        $data = $student;
        $data->parent_detail_id  = $request->parent_detail_id;
        $data->name              = $request->name;
        $data->classroom_id      = $request->classroom;
        $data->class_grade_id    = $room->class_grade_id;
        $data->class_stream_id   = $room->class_stream_id;
        $data->birth_cert        = $request->birth_cert;
        $data->nemis_upi         = $request->nemis_upi;
        $data->gender            = $request->gender;
        $data->dob               = $request->dob;
        $data->doa               = $request->doa;
        $data->residence         = $request->residence;
        $data->discount_level_id = $request->discount_level;
        if ($request->transport_fleet_id) {
            $data->transport_fleet_id = $request->transport_fleet_id;
        }

        $data->send_to           = $request->send_to;

        if($file = $request->file('photo')){
            $name = rand() . '.' .$file->getClientOriginalExtension();
            $data->photo   = $file->move('storage/students', $name);
        }
        $data->status          = $request->status;
        $data->updated_by      = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Student updated successfully!');
    }

    public function removePhoto($id)
    {
        $student = Student::where('slug', $id)->first();

        $data = $student;
        $data->photo  = "storage/students\placeholder.png";
        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Photo has been removed!');
    }

    public function uploadPhoto(Request $request, $id)
    {
        $file = $request->file('photo');
        $name = rand() . '.' .$file->getClientOriginalExtension();

        $student = Student::where('slug', $id)->first();

        $data = $student;
        $data->photo   = $file->move('storage/students', $name);
        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Photo has been upload!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param Student $student
     * @return Response
     * @throws Exception
     */
    public function destroy(Request $request, Student $student)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $student->delete();

            return redirect()->back()->with('success', 'The Student has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }


    //Export Students list
    public function exportAllPDF($id)
    {

        if($id === "all-male-students")
        {
            $grade = "ALL";
            $gender = "MALE";
            $students = Student::Active()->Male()->orderBy('class_grade_id', 'desc')->get();
        }

        elseif($id === "all-female-students")
        {
            $grade = "ALL";
            $gender = "FEMALE";
            $students = Student::Active()->Female()->orderBy('class_grade_id', 'desc')->get();
        }
        else
        {
            $grade = "ALL";
            $gender = NULL;
            $students = Student::Active()->orderBy('class_grade_id', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.all_students_pdf', ['students' => $students, 'profile' => $profile, 'grade' => $grade, 'gender' => $gender])
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('students-students-list-'.date('d-m-Y H:i:sa').'.pdf');
    }
    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function exportGradeStudentPDF(Request $request, $id)
    {
        $genda = $request->gender;
        $grad = ClassGrade::where('slug', $id)->first();
        $grade = $grad->name;

        if($genda === "MALE")
        {
            $gender = "MALE";
            $students = Student::Active()->Male()->where('class_grade_id', $grad->id)->orderBy('class_grade_id', 'desc')->get();
        }

        elseif($genda === "FEMALE")
        {
            $gender = "FEMALE";
            $students = Student::Active()->Female()->where('class_grade_id', $grad->id)->orderBy('class_grade_id', 'desc')->get();
        }
        else
        {
            $gender = NULL;
            $students = Student::Active()->where('class_grade_id', $grad->id)->orderBy('class_grade_id', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.all_students_pdf', ['students' => $students, 'profile' => $profile, 'gender' => $gender, 'grade' => $grade])
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('students-students-list-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function exportAllExcel($id)
    {
        return Excel::download(new StudentExport($id), 'students-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }

    public function exportGradeStudentExcel($id)
    {
        return Excel::download(new StudentExport($id), 'students-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }

    //Export Students Fee Balances
    public function exportBalPDF($id)
    {
        if ($id === "all-classes")
        {
            $students = Student::Active()->Balance()->orderBy('balance', 'desc')->get();
        }
        else
        {
            $grade = ClassGrade::where('slug', $id)->first();
            $students = Student::Active()->Balance()->where('class_grade_id', $grade->id)->orderBy('balance', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.fees_balances_pdf', ['students' => $students, 'profile' => $profile])
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('fees-balances-list-'.date('d-m-Y H:i:sa').'.pdf');
    }

    //Export Students Fee Summary
    public function exportFeeSummaryPDF($id)
    {
        if ($id === "all-classes")
        {
            $students = Student::Active()->orderBy('admno', 'desc')->get();
        }
        else
        {
            $grade = ClassGrade::where('slug', $id)->first();
            $students = Student::Active()->where('class_grade_id', $grade->id)->orderBy('admno', 'desc')->get();
        }

        $profile = CurrentDefault::SchoolProfile();
        $current_session = CurrentDefault::CurrentSession();

        $pdf = PDF::loadView('profilea.export-pdf.fees_summary_pdf', ['students' => $students, 'profile' => $profile, 'current_session' => $current_session, 'id' => $id])
            ->setPaper('a4', 'portrait')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Nunito']);

        return $pdf->stream($current_session->name.' Fees Summary Report'.date('dmYHis').'.pdf');
    }

    public function exportBalExcel($id)
    {
        return Excel::download(new BalanceExport($id), 'students-balances-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }

    //Export Students Fee Arrears
    public function exportArrPDF($id)
    {
        if ($id === "all-classes")
        {
            $students = Student::Active()->Arrears()->orderBy('arrears', 'desc')->get();
        }
        else
        {
            $grade = ClassGrade::where('slug', $id)->first();
            $students = Student::Active()->Arrears()->where('class_grade_id', $grade->id)->orderBy('arrears', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.fees_arrears_pdf', ['students' => $students, 'profile' => $profile])
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('fees-arrears-list-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function exportArrExcel($id)
    {
        return Excel::download(new ArrearExport($id), 'students-arrears-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }

    //Export Students Fee Overpays
    public function exportOvPDF($id)
    {
        if ($id === "all-classes")
        {
            $students = Student::Active()->Overpay()->orderBy('balance', 'desc')->get();
        }
        else
        {
            $grade = ClassGrade::where('slug', $id)->first();
            $students = Student::Active()->Overpay()->where('class_grade_id', $grade->id)->orderBy('balance', 'desc')->get();
        }

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.fees_overpayment_pdf', ['students' => $students, 'profile' => $profile])
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('fees-overpayment-list-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function exportOvExcel($id)
    {
        return Excel::download(new OverpayExport($id), 'fees-overpayment-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }

}