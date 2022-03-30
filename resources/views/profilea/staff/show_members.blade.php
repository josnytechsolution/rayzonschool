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
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">
                        {{ strtoupper($staffMember->name) }} <small>STAFF MEMBER</small>
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Staff Management</li>
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

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3">
                            <!-- Profile Image -->
                            <div class="card card-primary card-outline no-radius">
                                <div class="card-body box-profile">
                                    <div class="text-center">
                                        <img class="profile-user-img img-fluid img-circle"
                                             src="{{ asset($staffMember->photo) }}"
                                             alt="User profile picture">
                                    </div>

                                    <h3 class="profile-username text-center">{{ $staffMember->member_no }}</h3>

                                    <p class="text-muted text-center">{{ $staffMember->name }}</p>

                                    <ul class="list-group list-group-unbordered mb-3">
                                        <li class="list-group-item">
                                            <b>Department</b> <a class="float-right">{{ strtoupper($staffMember->staff_department->name) }}</a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Designation</b> <a class="float-right">{{ strtoupper($staffMember->staff_section->name) }}</a>
                                        </li>
                                    </ul>


                                        <a href="{{ route('staff-members.edit', $staffMember->slug) }}" class="btn btn-success btn-flat btn-sm">
                                            <i class="fa fa-edit"></i> Edit Member
                                        </a>
                                        <a href="#deleteMember{{ $staffMember->slug }}" class="btn btn-danger btn-flat btn-sm float-right" data-toggle="modal">
                                            <i class="fa fa-trash"></i> Delete Member
                                        </a>

                                        <!-- Start Delete Modal -->
                                        <div class="modal fade" id="deleteMember{{ $staffMember->slug }}" tabindex="-1" role="dialog" aria-hidden="true">

                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content no-radius">
                                                    <form action="{{ route('staff-members.destroy', $staffMember->slug) }}" method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($staffMember->name) }}</small></h5>
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
                                                                    Are you you want to delete<br> {{ strtoupper($staffMember->name) }}?
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
                                                            <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Member</button>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Edit Modal -->

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
                                        <li class="nav-item"><a class="nav-link" href="#employment" data-toggle="tab"><i class="fa fa-clipboard-check"></i> EMPLOYMENT INFO</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#bank" data-toggle="tab"><i class="fa fa-university"></i> BANK INFO</a></li>
                                    </ul>
                                </div><!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="active tab-pane" id="basic">
                                            <div class="row p-4">
                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Member Number</label>
                                                    <h5 class="text-md">{{ $staffMember->member_no }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Member's Name</label>
                                                    <h5 class="text-md">{{ ucwords($staffMember->name) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">ID Number</label>
                                                    <h5 class="text-md">{{ $staffMember->idno }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Primary Contact</label>
                                                    <h5 class="text-md">{{ $staffMember->phoneno1 }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Secondary Contact</label>
                                                    <h5 class="text-md">{{ $staffMember->phoneno2 }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Date of Birth</label>
                                                    <h5 class="text-md">{{ $staffMember->dob }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Gender</label>
                                                    <h5 class="text-md">{{ $staffMember->gender }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Email Address</label>
                                                    <h5 class="text-md">{{ $staffMember->email }}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.tab-pane -->

                                        <div class="tab-pane" id="employment">
                                            <div class="row p-4">
                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Employment Type</label>
                                                    <h5 class="text-md">{{ $staffMember->emp_type }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Date of Registration</label>
                                                    <h5 class="text-md">{{ $staffMember->reg_date }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Department</label>
                                                    <h5 class="text-md">{{ ucwords($staffMember->staff_department->name) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Designation</label>
                                                    <h5 class="text-md">{{ $staffMember->staff_section->name }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">TSC Number</label>
                                                    <h5 class="text-md">{{ $staffMember->tsc_no }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">NSSF Number</label>
                                                    <h5 class="text-md">{{ $staffMember->nssf }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">NHIF Number</label>
                                                    <h5 class="text-md">{{ ucwords($staffMember->nhif) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">KRA PIN</label>
                                                    <h5 class="text-md">{{ $staffMember->pin }}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.tab-pane -->

                                        <div class="tab-pane" id="bank">
                                            <div class="row p-4">
                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Bank Name</label>
                                                    <h5 class="text-md">{{ $staffMember->bank_name }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Bank Branch</label>
                                                    <h5 class="text-md">{{ $staffMember->bank_branch }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Account Name</label>
                                                    <h5 class="text-md">{{ ucwords($staffMember->account_name) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Account Number</label>
                                                    <h5 class="text-md">{{ $staffMember->account_no }}</h5>
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
