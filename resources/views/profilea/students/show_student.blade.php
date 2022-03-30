@extends('layouts.main')

@section('content')


    <!-- Navbar -->
    @include('profilea.layouts.admin_navbar')
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    @include('profilea.layouts.admin_aside')
    <!-- End Main Sidebar Container -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2 mt-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{{ $student->name }} Info</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                            <li class="breadcrumb-item active">Student Details</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">@include('errors')</div>

                    <div class="col-md-12 mb-2">
                        <a href="{{ route('student-details.index') }}" class="btn btn-secondary btn-flat btn-sm">
                            <i class="fa fa-arrow-left"></i> View Students List
                        </a>
                    </div>

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <!-- Profile Image -->
                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-body box-profile">
                                        <div class="text-center">
                                            <img class="profile-user-img img-fluid img-circle"
                                                 src="{{ asset($student->photo) }}"
                                                 alt="photo">
                                        </div>

                                        <p class="text-center">
                                            <a href="{{ route('removePhoto', $student->slug) }}" class="text-primary">remove</a> |
                                            <a href="#uploadPhoto" data-toggle="modal" class="text-success">upload</a>
                                        </p>

                                        <!-- Start Upload Modal -->
                                        <div class="modal fade" id="uploadPhoto" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content no-radius">
                                                    <form action="{{ route('uploadPhoto', $student->slug) }}" method="post" enctype="multipart/form-data">
                                                        @csrf

                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-file-upload text-success"></i> <small>{{ strtoupper($student->name) }}</small></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body text-sm">

                                                            <div class="col-md-12 mb-3">
                                                                <label>Select Image to Upload<span class="text-danger"><sup>*</sup></span> </label>
                                                                <input type="file" name="photo" class="form-control no-radius @error('photo') is-invalid @enderror" accept=".jpg,.png,.jpeg,.tiff,.svg" required />
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                            <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-file-upload"></i> Upload</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Edit Modal -->

                                        <h3 class="profile-username text-center">{{ $student->admno }}</h3>

                                        <p class="text-muted text-center">{{ $student->name }}</p>

                                        <ul class="list-group list-group-unbordered mb-3">
                                            <li class="list-group-item">
                                                <b>Classroom</b> <a class="float-right">{{ $student->classroom->name }}</a>
                                            </li>
                                            <li class="list-group-item">
                                                <b>Grade</b> <a class="float-right">{{ strtoupper($student->class_grade->long_name) }}</a>
                                            </li>
                                            <li class="list-group-item">
                                                <b>Stream</b> <a class="float-right">{{ $student->classroom->class_stream->long_name }}</a>
                                            </li>
                                        </ul>

                                        @if($student->status === "Active")
                                            <a href="{{ route('studentFees', $student->slug) }}" class="btn btn-primary btn-flat btn-sm">
                                                <i class="fa fa-eye"></i> View Fees
                                            </a>
                                            <a href="{{ route('student-details.edit', $student->slug) }}" class="btn btn-success btn-flat btn-sm">
                                                <i class="fa fa-edit"></i> Edit
                                            </a>
                                            <a href="#deleteStudent" class="btn btn-danger btn-flat btn-sm" data-toggle="modal">
                                                <i class="fa fa-trash"></i> Delete
                                            </a>

                                            <!-- Start Delete Modal -->
                                            <div class="modal fade" id="deleteStudent" tabindex="-1" role="dialog" aria-hidden="true">

                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content no-radius">
                                                        <form action="{{ route('student-details.destroy', $student->slug) }}" method="post" enctype="multipart/form-data">
                                                            @csrf
                                                            @method('DELETE')
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($student->name) }}</small></h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body text-sm">
                                                                <div class="col-md-12 mb-3">
                                                                    <div class="alert alert-warning" style="text-align: center">
                                                                        <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                        This action cannot be undone.<br>
                                                                        This will delete all information related to this this student.<br>
                                                                        Are you you want to delete<br> {{ strtoupper($student->name) }}?
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-3">
                                                                    <label>Enter Your Password<span class="text-danger"><sup>*</sup></span> </label>
                                                                    <input type="password" name="password" class="form-control no-radius @error('password') is-invalid @enderror" required>
                                                                    <small>This action requires your password</small>
                                                                    @if($errors->has('password'))
                                                                        <p style="font-family:courier new;color:red;font-size:12px">
                                                                            {{ $errors->first('password') }}
                                                                        </p>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> No! Cancel</button>
                                                                <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Student</button>
                                                            </div>
                                                        </form>

                                                    </div>
                                                </div>

                                            </div>
                                            <!-- End Edit Modal -->
                                        @endif

                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-9">
                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-header p-2">
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"><a class="nav-link active" href="#basic" data-toggle="tab"><i class="fa fa-child"></i> BASIC INFO</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#parent" data-toggle="tab"><i class="fa fa-user"></i> PARENT INFO</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#siblings" data-toggle="tab"><i class="fa fa-users"></i> SIBLINGS</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#switch" data-toggle="tab"><i class="fa fa-exchange-alt"></i> SWITCH CLASS</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#activate" data-toggle="tab"><i class="fa fa-key"></i> ACTIVATE STUDENT</a></li>
                                        </ul>
                                    </div><!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="active tab-pane" id="basic">
                                                <div class="row p-4">
                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Admission Number</label>
                                                        <h5 class="text-bold">{{ $student->admno }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Student's Name</label>
                                                        <h5 class="text-bold">{{ ucwords($student->name) }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Birth Cert. No</label>
                                                        <h5 class="text-bold">{{ $student->birth_cert }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">NEMIS UPI</label>
                                                        <h5 class="text-bold">{{ $student->nemis_upi }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">SMS Phone Number</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->primary_contact }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Date of Admission</label>
                                                        <h5 class="text-bold">{{ $student->doa }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Date of Birth</label>
                                                        <h5 class="text-bold">{{ $student->dob }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Gender</label>
                                                        <h5 class="text-bold">{{ $student->gender }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Email Address</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->primary_email }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Area of Residence</label>
                                                        <h5 class="text-bold">{{ $student->residence }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Classroom</label>
                                                        <h5 class="text-bold">{{ $student->classroom->long_name }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Discount Level</label>
                                                        <h5 class="text-bold">{{ $student->discount_level->name." ".$student->discount_level->discount }}%</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="parent">
                                                <div class="row p-4">
                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Parent Number</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->parent_no }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Primary SMS Phone Number</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->primary_contact }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Secondary SMS Phone Number</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->secondary_contact }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Primary Email Address</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->primary_email }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Father's Name</label>
                                                        <h5 class="text-bold">{{ ucwords($student->parent_detail->fname) }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Father's Contact</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->fcontact }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Father's Email</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->femail }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Father's Occupation</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->foccupation }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Mother's Name</label>
                                                        <h5 class="text-bold">{{ ucwords($student->parent_detail->mname) }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Mother's Contact</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->mcontact }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Mother's Email</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->memail }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Mother's Occupation</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->moccupation }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Guardian's Name</label>
                                                        <h5 class="text-bold">{{ ucwords($student->parent_detail->gname) }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Guardian's Contact</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->gcontact }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Guardian's Email</label>
                                                        <h5 class="text-bold">{{ $student->parent_detail->gemail }}</h5>
                                                    </div>

                                                    <div class="col-md-3 mb-4">
                                                        <label class="text-muted">Guardian's Relation</label>
                                                        <h5 class="text-bold">{{ $student->grelation }}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="siblings">
                                                <div class="row">
                                                    @if(count($siblings) > 0)
                                                        <table class="table table-striped">
                                                            <thead>
                                                            <th>#</th>
                                                            <th>Photo</th>
                                                            <th>Adm No</th>
                                                            <th>Student Name</th>
                                                            <th>Gender</th>
                                                            <th>Classroom</th>
                                                            <th>Birth Cert</th>
                                                            <th>Nemis UPI</th>
                                                            <th>Contact</th>
                                                            <th>Balance</th>
                                                            </thead>
                                                            <tbody>
                                                            @php($i =1)
                                                            @foreach($siblings as $sibling)
                                                                <tr>
                                                                    <td style="vertical-align: middle">{{ $i }}</td>
                                                                    <td style="vertical-align: middle"><img src="{{ asset($sibling->photo) }}" class="img img-fluid img-size-32"></td>
                                                                    <td style="vertical-align: middle">
                                                                        <a href="{{ route('student-details.show', $sibling->slug) }}">{{ $sibling->admno }}</a>
                                                                    </td>
                                                                    <td style="vertical-align: middle">{{ $sibling->name }}</td>
                                                                    <td style="vertical-align: middle">{{ $sibling->gender }}</td>
                                                                    <td style="vertical-align: middle">{{ $sibling->classroom->name }}</td>
                                                                    <td style="vertical-align: middle">{{ $sibling->birth_cert }}</td>
                                                                    <td style="vertical-align: middle">{{ $sibling->nemis_upi }}</td>
                                                                    <td style="vertical-align: middle">{{ $sibling->phoneno }}</td>
                                                                    <td style="vertical-align: middle">{{ number_format($sibling->balance,2) }}</td>
                                                                </tr>
                                                                @php(++$i)
                                                            @endforeach
                                                            </tbody>
                                                        </table>
                                                    @else
                                                        <div class="col-md-12 alert alert-info text-center">
                                                            This Student has no Sibling in this school.
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="switch">
                                                <form action="{{ route('switchClass', $student->slug) }}" method="POST" >
                                                    @csrf
                                                    <div class="row">
                                                        @if($student->status === "Active")
                                                            <div class="col-md-5">
                                                                <h5 class="text-success"><b>CURRENT CLASS FEES</b></h5>
                                                                <h5 class="text-bold">{{ strtoupper($student->class_grade->long_name) }}</h5>
                                                                <table class="table table-bordered">
                                                                    <tbody>
                                                                    @foreach($studentFees as $studentFee)
                                                                        <tr>
                                                                            <td>{{ $studentFee->fee_parameter->name }}</td>
                                                                            <td class="text-right">{{ number_format($studentFee->amount) }}</td>
                                                                        </tr>
                                                                    @endforeach
                                                                    <tr>
                                                                        <th>TOTAL FEES</th>
                                                                        <th class="text-right">KSH. {{ number_format($studentFees->sum('amount')) }}</th>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>

                                                            <div class="col-md-2"></div>

                                                            <div class="col-md-5">
                                                                <input type="hidden" name="studentID" value="{{ $student->id }}">
                                                                <div class="form-group">
                                                                    @php($classGrades = App\ClassGrade::orderBy('name', 'asc')->get())
                                                                    <label class="text-primary">SELECT NEW CLASS</label>
                                                                    <select id="toClass" name="toClass" class="form-control select2">
                                                                        <option value="">--Select Class--</option>
                                                                        @foreach($classGrades as $classGrade)
                                                                            <option value="{{ $classGrade->id }}">{{ $classGrade->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="col-12" id="tableShow"></div>
                                                            </div>

                                                            <div class="col-12 mt-4">
                                                                <hr>
                                                                <button type="submit" class="btn btn-primary btn-flat float-right">
                                                                    <i class="fa fa-exchange-alt"></i> Switch Class
                                                                </button>
                                                            </div>
                                                        @else
                                                            <div class="col-md-12 alert alert-info text-center">
                                                                This Student is Inactive.
                                                            </div>
                                                        @endif
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="activate">
                                                @if($student->status === "Active")
                                                    <div class="alert alert-default" style="font-family: 'Courier New'">
                                                        <i class="fa fa-thumbs-up"></i>   This Student is already <code>Active</code>
                                                    </div>
                                                @else
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-6">
                                                                <form action="{{ route('activate-student', $student->slug) }}" method="POST" >
                                                                    @csrf
                                                                    <input type="hidden" name="studentID" value="{{ $student->id }}">
                                                                    <div class="col-12 form-group">
                                                                        @php($classGrades = App\ClassGrade::orderBy('name', 'asc')->get())
                                                                        <label class="text-primary">ACTIVATE STUDENT TO CLASS</label>
                                                                        <select id="activateTo" name="toClass" class="form-control select2">
                                                                            <option value="">--Select Class--</option>
                                                                            @foreach($classGrades as $classGrade)
                                                                                <option value="{{ $classGrade->id }}">{{ $classGrade->name }}</option>
                                                                            @endforeach
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-12" id="tableShow2"></div>
                                                                    <div class="col-12 mt-4">
                                                                        <hr>
                                                                        <button type="submit" class="btn btn-primary btn-flat float-right">
                                                                            <i class="fa fa-key"></i> Activate Student
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="col-md-3"></div>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <!-- /.tab-pane -->
                                        </div>
                                        <!-- /.tab-content -->
                                    </div><!-- /.card-body -->
                                </div>
                                <!-- /.nav-tabs-custom -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>

                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection