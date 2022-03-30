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
            <div class="row mb-2 mt-4">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">{{ strtoupper($class_grade->long_name) }} STUDENTS LIST</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Students Details</li>
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

                </div>

                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#allstudents" data-toggle="tab"><i class="fa fa-users"></i> ALL STUDENTS LIST</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#malestudents" data-toggle="tab"><i class="fa fa-male"></i> MALE STUDENTS LIST</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#femalestudents" data-toggle="tab"><i class="fa fa-female"></i> FEMALE STUDENTS LIST</a></li>
                                </ul>
                            </h3>

                            <div class="card-tools">
                                <a href="{{ route('student-details.create') }}" class="btn btn-primary btn-flat float-right">
                                    <i class="fa fa-user-plus"></i> Add Students
                                </a>
                            </div>
                        </div><!-- /.card-header -->
                        <div class="card-body">
                            <div class="tab-content">
                                <div class="active tab-pane" id="allstudents">
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <div class="btn-group float-right">
                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-filter"></i> Filter By Class
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        @php($class_grads = App\ClassGrade::Active()->orderBy('id', 'asc')->get())
                                                        @foreach($class_grads as $class_grad)
                                                            <a class="dropdown-item text-muted" href="{{ route('thisClass', $class_grad->slug) }}">
                                                                {{ $class_grad->long_name }}
                                                            </a>
                                                        @endforeach
                                                    </div>
                                                </div>

                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-download"></i> Export
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <form action="{{ route('exportGradeStudentPDF', $class_grade->slug) }}" method="POST" target="_blank">
                                                            @csrf
                                                            <input type="hidden" name="gender" value="ALL" >
                                                            <button type="submit" class="dropdown-item text-danger">
                                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                            </button>
                                                        </form>

                                                        <form action="{{ route('exportGradeStudentExcel', $class_grade->id) }}" method="POST">
                                                            @csrf
                                                            <input type="hidden" name="gender" value="ALL" >
                                                            <button type="submit" class="dropdown-item text-success">
                                                                <i class="fa fa-file-excel text-success"></i> Export To Excel
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <table id="example1" class="table table-striped">
                                                <thead>
                                                <th>#</th>
                                                <th>PHOTO</th>
                                                <th>ADM NO</th>
                                                <th>STUDENT NAME</th>
                                                <th>GENDER</th>
                                                <th>CLASSROOM</th>
                                                <th>CONTACT</th>
                                                <th>EMAIL ADDRESS</th>
                                                <th>ADM DATE</th>
                                                <th>ACTION</th>
                                                </thead>
                                                <tbody>
                                                <?php $i = 1; ?>
                                                @foreach($students as $student)
                                                    <tr>
                                                        <td style="vertical-align: middle">{{ $i }}</td>
                                                        <td><img src="{{ asset($student->photo) }}" class="img-fluid pad img-size-32" /></td>
                                                        <td style="vertical-align: middle">
                                                            <a href="{{ route('student-details.show', $student->slug) }}" >
                                                                <u>{{ $student->admno }}</u>
                                                            </a>
                                                        </td>
                                                        <td style="vertical-align: middle">{{ ucwords(strtolower($student->name)) }}</td>
                                                        <td style="vertical-align: middle">{{ $student->gender }}</td>
                                                        <td style="vertical-align: middle">{{ $student->classroom->name }}</td>
                                                        <td style="vertical-align: middle">{{ $student->parent_detail->primary_contact }}</td>
                                                        <td style="vertical-align: middle">{{ $student->parent_detail->primary_email }}</td>
                                                        <td style="vertical-align: middle">{{ date('d-m-Y', strtotime($student->doa)) }}</td>
                                                        <td style="vertical-align: middle;text-align: center">
                                                            <div class="input-group-prepend">
                                                                <button type="button" class="btn btn-info btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                                                    Action
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <a href="{{ route('student-details.show', $student->slug) }}" class="dropdown-item text-primary">
                                                                        <i class="fa fa-eye text-primary"></i> View Details
                                                                    </a>
                                                                    <a href="{{ route('student-details.edit', $student->slug) }}" class="dropdown-item text-success">
                                                                        <i class="fa fa-edit text-success"></i> Edit Student
                                                                    </a>
                                                                    <a href="{{ route('studentFees', $student->slug) }}" class="dropdown-item text-info">
                                                                        <i class="fa fa-money-bill text-info"></i> Go To Fees
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#deleteStudent{{ $student->slug }}" data-toggle="modal" class="dropdown-item text-danger">
                                                                        <i class="fa fa-trash text-danger"></i> Delete Student
                                                                    </a>
                                                                </div>
                                                            </div>

                                                            <!-- Start Delete Modal -->
                                                            <div class="modal fade" id="deleteStudent{{ $student->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content no-radius">
                                                                        <form action="{{ route('student-details.destroy', $student->slug) }}" method="post" enctype="multipart/form-data">
                                                                            @csrf
                                                                            @method('DELETE')
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($student->fullname) }}</small></h5>
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
                                                        </td>
                                                    </tr>
                                                    <?php $i++; ?>
                                                @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-pane -->

                                <div class="tab-pane" id="malestudents">
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <div class="btn-group float-right">
                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-filter"></i> Filter By Class
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        @php($class_grads = App\ClassGrade::Active()->orderBy('id', 'asc')->get())
                                                        @foreach($class_grads as $class_grad)
                                                            <a class="dropdown-item text-muted" href="{{ route('thisClass', $class_grad->slug) }}">
                                                                {{ $class_grad->long_name }}
                                                            </a>
                                                        @endforeach
                                                    </div>
                                                </div>

                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-download"></i> Export
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <form action="{{ route('exportGradeStudentPDF', $class_grade->slug) }}" method="POST" target="_blank">
                                                            @csrf
                                                            <input type="hidden" name="gender" value="MALE" >
                                                            <button type="submit" class="dropdown-item text-danger">
                                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                            </button>
                                                        </form>

                                                        <form action="{{ route('exportGradeStudentExcel', $class_grade->id) }}" method="POST">
                                                            @csrf
                                                            <input type="hidden" name="gender" value="MALE" >
                                                            <button type="submit" class="dropdown-item text-success">
                                                                <i class="fa fa-file-excel text-success"></i> Export To Excel
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <table id="example3" class="table table-striped">
                                                <thead>
                                                <th>#</th>
                                                <th>PHOTO</th>
                                                <th>ADM NO</th>
                                                <th>STUDENT NAME</th>
                                                <th>GENDER</th>
                                                <th>CLASSROOM</th>
                                                <th>CONTACT</th>
                                                <th>EMAIL ADDRESS</th>
                                                <th>ADM DATE</th>
                                                <th>ACTION</th>
                                                </thead>
                                                <tbody>
                                                <?php $i = 1; ?>
                                                @foreach($mStudents as $mStudent)
                                                    <tr>
                                                        <td style="vertical-align: middle">{{ $i }}</td>
                                                        <td><img src="{{ asset($mStudent->photo) }}" class="img-fluid pad img-size-32" /></td>
                                                        <td style="vertical-align: middle">
                                                            <a href="{{ route('student-details.show', $mStudent->slug) }}" >
                                                                <u>{{ $mStudent->admno }}</u>
                                                            </a>
                                                        </td>
                                                        <td style="vertical-align: middle">{{ ucwords(strtolower($mStudent->name)) }}</td>
                                                        <td style="vertical-align: middle">{{ $mStudent->gender }}</td>
                                                        <td style="vertical-align: middle">{{ $mStudent->classroom->name }}</td>
                                                        <td style="vertical-align: middle">{{ $student->parent_detail->primary_contact }}</td>
                                                        <td style="vertical-align: middle">{{ $student->parent_detail->primary_email }}</td>
                                                        <td style="vertical-align: middle">{{ date('d-m-Y', strtotime($mStudent->doa)) }}</td>
                                                        <td style="vertical-align: middle;text-align: center">
                                                            <div class="input-group-prepend">
                                                                <button type="button" class="btn btn-info btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                                                    Action
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <a href="{{ route('student-details.show', $mStudent->slug) }}" class="dropdown-item text-primary">
                                                                        <i class="fa fa-eye text-primary"></i> View Details
                                                                    </a>
                                                                    <a href="{{ route('student-details.edit', $mStudent->slug) }}" class="dropdown-item text-success">
                                                                        <i class="fa fa-edit text-success"></i> Edit Student
                                                                    </a>
                                                                    <a href="{{ route('studentFees', $mStudent->slug) }}" class="dropdown-item text-info">
                                                                        <i class="fa fa-money-bill text-info"></i> Go To Fees
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#deleteStudent{{ $mStudent->slug }}" data-toggle="modal" class="dropdown-item text-danger">
                                                                        <i class="fa fa-trash text-danger"></i> Delete Student
                                                                    </a>
                                                                </div>
                                                            </div>

                                                            <!-- Start Delete Modal -->
                                                            <div class="modal fade" id="deleteStudent{{ $mStudent->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content no-radius">
                                                                        <form action="{{ route('student-details.destroy', $mStudent->slug) }}" method="post" enctype="multipart/form-data">
                                                                            @csrf
                                                                            @method('DELETE')
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($mStudent->fullname) }}</small></h5>
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
                                                                                        Are you you want to delete<br> {{ strtoupper($mStudent->name) }}?
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
                                                        </td>
                                                    </tr>
                                                    <?php $i++; ?>
                                                @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-pane -->

                                <div class="tab-pane" id="femalestudents">
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <div class="btn-group float-right">
                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-filter"></i> Filter By Class
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        @php($class_grads = App\ClassGrade::Active()->orderBy('id', 'asc')->get())
                                                        @foreach($class_grads as $class_grad)
                                                            <a class="dropdown-item text-muted" href="{{ route('thisClass', $class_grad->slug) }}">
                                                                {{ $class_grad->long_name }}
                                                            </a>
                                                        @endforeach
                                                    </div>
                                                </div>

                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        <i class="fa fa-download"></i> Export
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <form action="{{ route('exportGradeStudentPDF', $class_grade->slug) }}" method="POST" target="_blank">
                                                            @csrf
                                                            <input type="hidden" name="gender" value="FEMALE" >
                                                            <button type="submit" class="dropdown-item text-danger">
                                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                            </button>
                                                        </form>

                                                        <form action="{{ route('exportGradeStudentExcel', $class_grade->id) }}" method="POST">
                                                            @csrf
                                                            <input type="hidden" name="gender" value="FEMALE" >
                                                            <button type="submit" class="dropdown-item text-success">
                                                                <i class="fa fa-file-excel text-success"></i> Export To Excel
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <table id="example4" class="table table-striped">
                                                <thead>
                                                <th>#</th>
                                                <th>PHOTO</th>
                                                <th>ADM NO</th>
                                                <th>STUDENT NAME</th>
                                                <th>GENDER</th>
                                                <th>CLASSROOM</th>
                                                <th>CONTACT</th>
                                                <th>EMAIL ADDRESS</th>
                                                <th>ADM DATE</th>
                                                <th>ACTION</th>
                                                </thead>
                                                <tbody>
                                                <?php $i = 1; ?>
                                                @foreach($fStudents as $fStudent)
                                                    <tr>
                                                        <td style="vertical-align: middle">{{ $i }}</td>
                                                        <td><img src="{{ asset($fStudent->photo) }}" class="img-fluid pad img-size-32" /></td>
                                                        <td style="vertical-align: middle">
                                                            <a href="{{ route('student-details.show', $fStudent->slug) }}" >
                                                                <u>{{ $fStudent->admno }}</u>
                                                            </a>
                                                        </td>
                                                        <td style="vertical-align: middle">{{ ucwords(strtolower($fStudent->name)) }}</td>
                                                        <td style="vertical-align: middle">{{ $fStudent->gender }}</td>
                                                        <td style="vertical-align: middle">{{ $fStudent->classroom->name }}</td>
                                                        <td style="vertical-align: middle">{{ $student->parent_detail->primary_contact }}</td>
                                                        <td style="vertical-align: middle">{{ $student->parent_detail->primary_email }}</td>
                                                        <td style="vertical-align: middle">{{ date('d-m-Y', strtotime($fStudent->doa)) }}</td>
                                                        <td style="vertical-align: middle;text-align: center">
                                                            <div class="input-group-prepend">
                                                                <button type="button" class="btn btn-info btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                                                    Action
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <a href="{{ route('student-details.show', $fStudent->slug) }}" class="dropdown-item text-primary">
                                                                        <i class="fa fa-eye text-primary"></i> View Details
                                                                    </a>
                                                                    <a href="{{ route('student-details.edit', $fStudent->slug) }}" class="dropdown-item text-success">
                                                                        <i class="fa fa-edit text-success"></i> Edit Student
                                                                    </a>
                                                                    <a href="{{ route('studentFees', $fStudent->slug) }}" class="dropdown-item text-info">
                                                                        <i class="fa fa-money-bill text-info"></i> Go To Fees
                                                                    </a>
                                                                    <div class="dropdown-divider"></div>
                                                                    <a href="#deleteStudent{{ $fStudent->slug }}" data-toggle="modal" class="dropdown-item text-danger">
                                                                        <i class="fa fa-trash text-danger"></i> Delete Student
                                                                    </a>
                                                                </div>
                                                            </div>

                                                            <!-- Start Delete Modal -->
                                                            <div class="modal fade" id="deleteStudent{{ $fStudent->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content no-radius">
                                                                        <form action="{{ route('student-details.destroy', $fStudent->slug) }}" method="post" enctype="multipart/form-data">
                                                                            @csrf
                                                                            @method('DELETE')
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($fStudent->fullname) }}</small></h5>
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
                                                                                        Are you you want to delete<br> {{ strtoupper($fStudent->name) }}?
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
                                                        </td>
                                                    </tr>
                                                    <?php $i++; ?>
                                                @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div><!-- /.card-body -->
                    </div>
                    <!-- /.nav-tabs-custom -->
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
