<?php

namespace App\Http\Controllers\ProfileA\Students;

use App\Exports\ParentDetailExport;
use App\FeePayment;
use App\ParentDetail;
use App\SchoolProfile;
use App\Student;
use App\User;
use Illuminate\Support\Facades\Hash;
use PDF;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;

class ParentDetailController extends Controller
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

    public function syncContact()
    {
        $paros = ParentDetail::all();
        foreach ($paros as $paro)
        {
            $stud = Student::where('parent_detail_id', $paro->id)->orderBy('id', 'desc')->limit(1)->first();

            if ($stud != NULL)
            {
                $paro->update(['primary_contact' => $stud->phoneno, 'primary_email' => $stud->email, 'updated_by' => Auth::user()->id]);
            }
        }
    }

    public function parent(Request $request)
    {
        $parent = ParentDetail::findOrFail($request->paro_no);
        $parentData = "";
        $parentData .= '<div class="col-md-3 mb-3"><label>Parent No.</label><input type="text" class="form-control no-radius" value="'.$parent->parent_no.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Primary Phone</label><input type="text" class="form-control no-radius" value="'.$parent->primary_contact.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Secondary Phone</label><input type="text" class="form-control no-radius" value="'.$parent->secondary_contact.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Primary Email</label><input type="text" class="form-control no-radius" value="'.$parent->primary_email.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Father Name</label><input type="text" class="form-control no-radius" value="'.$parent->fname.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Father Contact</label><input type="text" class="form-control no-radius" value="'.$parent->fcontact.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Father Email</label><input type="text" class="form-control no-radius" value="'.$parent->femail.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Father Occupation</label><input type="text" class="form-control no-radius" value="'.$parent->foccupation.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Mother Name</label><input type="text" class="form-control no-radius" value="'.$parent->mname.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Mother Contact</label><input type="text" class="form-control no-radius" value="'.$parent->mcontact.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Mother Email</label><input type="text" class="form-control no-radius" value="'.$parent->memail.'" readonly /></div>';
        $parentData .= '<div class="col-md-3 mb-3"><label>Mother Occupation</label><input type="text" class="form-control no-radius" value="'.$parent->moccupation.'" readonly /></div>';
        $parentData .= '<div class="col-md-3"><label>Guardian Name</label><input type="text" class="form-control no-radius" value="'.$parent->gname.'" readonly /></div>';
        $parentData .= '<div class="col-md-3"><label>Guardian Contact</label><input type="text" class="form-control no-radius" value="'.$parent->gcontact.'" readonly /></div>';
        $parentData .= '<div class="col-md-3"><label>Guardian Email</label><input type="text" class="form-control no-radius" value="'.$parent->gemail.'" readonly /></div>';
        $parentData .= '<div class="col-md-3"><label>Guardian Occupation</label><input type="text" class="form-control no-radius" value="'.$parent->grelation.'" readonly /></div>';

        if($parent != NULL)
        {
            return $parentData;
        }
        else
        {
            return '<h5 class="text-primary">No Parent Found Found</h5>';
        }
    }

    public function checkParent(Request $request)
    {
        $parent1 = ParentDetail::where('parent_no', $request->parent)->first();

        if($parent1 === NULL)
        {
            return '<span class="text-success">This Parent ID is Ok!</span>';
        }
        else
        {
            return '<span class="text-danger">This Parent ID is already taken!</span>';
        }
    }

//    public function makeUser()
//    {
//        $parents = ParentDetail::all();
//
//        foreach ($parents as $parent)
//        {
//            $data = $parent;
//            $data->credential_email     = strtolower($data->parent_no)."@schoolbest.co.ke";
//            $data->credential_password  = rand(10000001, 99999999);
//            $data->updated_by           = Auth::user()->id;
//            $data->save();
//
//            if ($data->fname != NULL)
//            {
//                $name = $data->fname;
//            }
//            elseif ($data->mname != NULL)
//            {
//                $name = $data->mname;
//            }
//            elseif ($data->gname != NULL)
//            {
//                $name = $data->gname;
//            }
//            else
//            {
//                $name = "Anonymous";
//            }
//
//            $user = new User();
//            $user->name         =   $name;
//            $user->email        =   $data->credential_email;
//            $user->password     =   Hash::make($data->credential_password);
//            $user->profile      =   5;
//            $user->position     =   'Parent';
//            $user->parent_detail_id = $data->id;
//            $user->status       =   1;
//            $user->created_by   = Auth::user()->id;
//            $user->save();
//        }
//
//    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
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

        $parents = ParentDetail::Active()->orderBy('id', 'desc')->get();
        return view('profilea.parents.parents_list', compact('parents', 'parent_no'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
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

        return view('profilea.parents.create_parent', compact('parent_no'));
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
            'primary_contact'   => 'nullable|string',
            'secondary_contact' => 'nullable|string',
            'primary_email'     => 'nullable|string',
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
        ]);


        //If this is a new parent
        if(empty($request->fname) && empty($request->mname) && empty($request->gname) )
        {
            return redirect()->back()->with('no-parent', 'Kindly fill atleast one parent!');
        }
        else
        {
            $no = ParentDetail::orderBy('parent_no', 'desc')->limit(1)->first();
            if (!empty($no)) {
                $pno = $no->parent_no;
                $parent_no = ++$pno;
            } else {
                $parent_no = "RYP0001";
            }

            $uniq = strtolower(substr(chunk_split(str_random(30), 5, '-'), 0, 34));
            $uniqu = ParentDetail::where('slug', $uniq)->first();

            if ($uniqu) {
                $slag = strtolower(substr(chunk_split(str_random(30), 5, '-'), 0, 34));
            } else {
                $slag = $uniq;
            }

            $data = new ParentDetail();
            $data->slug             = $slag;
            $data->parent_no        = $parent_no;
            $data->primary_contact  = $request->primary_contact;
            $data->secondary_contact  = $request->secondary_contact;
            $data->primary_email    = $request->primary_email;
            $data->fname            = $request->fname;
            $data->fcontact         = $request->fcontact;
            $data->femail           = $request->femail;
            $data->foccupation      = $request->foccupation;
            $data->mname            = $request->mname;
            $data->mcontact         = $request->mcontact;
            $data->memail           = $request->memail;
            $data->moccupation      = $request->moccupation;
            $data->gname            = $request->gname;
            $data->gcontact         = $request->gcontact;
            $data->gemail           = $request->gemail;
            $data->grelation        = $request->grelation;
            $data->credential_email = strtolower($parent_no)."@schoolbest.co.ke";
            $data->credential_password = rand(10000001, 99999999);
            $data->created_by       = Auth::user()->id;
            $data->save();

            if($data != NULL)
            {
                if ($data->fname != NULL)
                {
                    $name = $data->fname;
                }
                elseif ($data->mname != NULL)
                {
                    $name = $data->mname;
                }
                elseif ($data->gname != NULL)
                {
                    $name = $data->gname;
                }
                else
                {
                    $name = "Anonymous";
                }

                $user = new User();
                $user->name         =   $name;
                $user->email        =   $data->credential_email;
                $user->password     =   Hash::make($data->credential_password);
                $user->profile      =   5;
                $user->position     =   'Parent';
                $user->parent_detail_id = $data->id;
                $user->status       =   1;
                $user->created_by   = Auth::user()->id;
                $user->save();
            }

            return redirect()->back()->with('success', 'Parent has been added successfully!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ParentDetail  $parentDetail
     * @return \Illuminate\Http\Response
     */
    public function show(ParentDetail $parentDetail)
    {
        $payments = FeePayment::where('parent_detail_id', $parentDetail->id)->orderBy('receipt_no', 'desc')->get();
        $students = Student::where('parent_detail_id', $parentDetail->id)->get();
        return view('profilea.parents.show_parent', compact('parentDetail', 'students', 'payments'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ParentDetail  $parentDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(ParentDetail $parentDetail)
    {
        return view('profilea.parents.edit_parent', compact('parentDetail'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ParentDetail  $parentDetail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ParentDetail $parentDetail)
    {
        $request->validate([
            'primary_contact'   => 'nullable|string',
            'secondary_contact' => 'nullable|string',
            'primary_email'     => 'nullable|string',
            'fname'             => 'nullable|string',
            'fcontact'          => 'nullable|string|unique:parent_details,fcontact,'.$parentDetail->id,
            'femail'            => 'nullable|email|unique:parent_details,femail,'.$parentDetail->id,
            'foccupation'       => 'nullable|string',
            'mname'             => 'nullable|string',
            'mcontact'          => 'nullable|string|unique:parent_details,mcontact,'.$parentDetail->id,
            'memail'            => 'nullable|email|unique:parent_details,memail,'.$parentDetail->id,
            'moccupation'       => 'nullable|string',
            'gname'             => 'nullable|string',
            'gcontact'          => 'nullable|string|unique:parent_details,gcontact,'.$parentDetail->id,
            'gemail'            => 'nullable|email|unique:parent_details,gemail,'.$parentDetail->id,
            'grelation'         => 'nullable|string',
        ]);


        //If this is a new parent
        if(empty($request->fname) && empty($request->mname) && empty($request->gname) )
        {
            return redirect()->back()->with('no-parent', 'Kindly fill atleast one parent!');
        }
        else
        {
            $data = $parentDetail;
            $data->primary_contact  = $request->primary_contact;
            $data->secondary_contact  = $request->secondary_contact;
            $data->primary_email    = $request->primary_email;
            $data->fname        = $request->fname;
            $data->fcontact     = $request->fcontact;
            $data->femail       = $request->femail;
            $data->foccupation  = $request->foccupation;
            $data->mname        = $request->mname;
            $data->mcontact     = $request->mcontact;
            $data->memail       = $request->memail;
            $data->moccupation  = $request->moccupation;
            $data->gname        = $request->gname;
            $data->gcontact     = $request->gcontact;
            $data->gemail       = $request->gemail;
            $data->grelation    = $request->grelation;
            $data->updated_by   = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Parent has been updated successfully!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\ParentDetail $parentDetail
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(Request $request, ParentDetail $parentDetail)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $parentDetail->delete();

            return redirect()->back()->with('success', 'The Parent and Children have been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }

    /**
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public function parentDetailPDF()
    {
        $parents = ParentDetail::Active()->where('id', '>', 1)->get();

        $profile = SchoolProfile::findOrFail(1);

        $pdf = PDF::loadView('profilea.export-pdf.parent_details_pdf', compact('parents', 'profile'))
            ->setPaper('a4', 'landscape')
            ->setWarnings(false)
            ->setOptions(['defaultFont' => 'Berlin Sans FB']);

        return $pdf->stream('parent-details-'.date('d-m-Y H:i:sa').'.pdf');
    }

    public function parentDetailExcel()
    {
        return Excel::download(new ParentDetailExport(), 'parent-details-list-'.date('d-m-Y H:i:sa').'.xlsx');
    }
}
