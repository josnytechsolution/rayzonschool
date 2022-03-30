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
        <div class="container">
            <div class="row mb-2 mt-3">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">PROMOTE STUDENT TO NEXT TERM</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">School Setup</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-graduation-cap"></i> STUDENT PROMOTION</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 alert alert-warning no-radius">
                                    <h1 class="card-title">READ THE FOLLOWING INSTRUCTION</h1><br>
                                    <ul>
                                        <li>Ensure the <code>CLASS FEE STRUCTURES</code> for every class & <code>TRANSPORT FEES</code> has been created.</li>
                                        <li>Ensure no other user is using the system.</li>
                                        <li>Start Promotion from the highest class.</li>
                                        <li>
                                            Ensure you do a
                                            <a class="btn btn-primary btn-xs" href="{{ route('backupDatabase') }}">Database Backup</a>
                                            before you proceed.
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <form action="{{ route('student-promotion.store') }}" method="post">
                                @csrf
                                <div class="row mt-4">
                                    <div class="form-group col-md-6 mt-2">
                                        <label>From [Start with top most class]<sup class="text-danger">*</sup></label>
                                        <select name="class_from" class="form-control @error('class_from') is-invalid @enderror no-radius">
                                            <option value="">--Select Class--</option>
                                            @foreach($class_grades as $class_grade)
                                            <option value="{{ $class_grade->id }}">{{ $class_grade->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('class_from'))
                                            <small class="text-danger">{{ $errors->first('class_from') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mt-2">
                                        <label>From Term/Session<sup class="text-danger">*</sup></label>
                                        <select name="from_session" class="form-control @error('from_session') is-invalid @enderror no-radius">
                                            <option value="">--Select Term/Session</option>
                                            @foreach($current_sessions as $current_session)
                                                <option value="{{ $current_session->id }}">{{ $current_session->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('from_session'))
                                            <small class="text-danger">{{ $errors->first('from_session') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mt-2">
                                        <label>To [Class/Grade]<sup class="text-danger">*</sup></label>
                                        <select name="class_to" class="form-control @error('class_to') is-invalid @enderror no-radius">
                                            <option value="">--Select Class--</option>
                                            @foreach($class_grades as $class_grad)
                                                <option value="{{ $class_grad->id }}">{{ $class_grad->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('class_to'))
                                            <small class="text-danger">{{ $errors->first('class_to') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-6 mt-2">
                                        <label>To Term/Session<sup class="text-danger">*</sup></label>
                                        <select name="current_session_id" class="form-control @error('current_session_id') is-invalid @enderror no-radius">
                                            <option value="">--Select Session--</option>
                                            @foreach($current_sessions as $current_session)
                                                <option value="{{ $current_session->id }}">{{ $current_session->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('current_session_id'))
                                            <small class="text-danger">{{ $errors->first('current_session_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mt-2">
                                        <label>Enter Your Password<sup class="text-danger">*</sup></label>
                                        <input type="password" name="password" class="form-control @error('password') is-invalid @enderror no-radius">

                                        @if($errors->has('password'))
                                            <small class="text-danger">{{ $errors->first('password') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Promote Students
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
