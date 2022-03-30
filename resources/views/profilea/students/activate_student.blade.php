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
                    <h1 class="m-0 text-dark">Activate {{ strtoupper($student->name) }}</h1>
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
        <div class="container">
            <div class="row">
               <div class="col-md-12">@include('errors')</div>

                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-key"></i> ACTIVATE STUDENT</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <table class="table">
                                        <thead>
                                        <tr class="mb-4"><th colspan="2" style="text-align: center">CURRENT FEES DETAILS</th></tr>
                                        <tr><th>ITEM</th><th style="text-align: right">AMOUNT</th></tr>
                                        </thead>
                                        <tbody>
                                           <tr>
                                               <td>FEES</td>
                                               <td style="text-align: right">{{ number_format($student->current,2) }}</td>
                                           </tr>
                                           <tr>
                                               <td>ARREARS</td>
                                               <td style="text-align: right">{{ number_format($student->arrears,2) }}</td>
                                           </tr>
                                           <tr>
                                               <th>BALANCE</th>
                                               <th style="text-align: right">{{ number_format($student->balance,2) }}</th>
                                           </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-6">
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
                            </div>
                        </div>
                    </div>
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
