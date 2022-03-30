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
            <div class="row mt-2">
                <div class="col-sm-6">
                    <h5 class="m-0 text-dark">
                       {{ strtoupper($class_grade->long_name) }} FEES SUMMARY
                        <small>{{ strtoupper($current_session->name) }}</small>
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Fees Collection</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <hr>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                            <div class="card-header">
                                <h3 class="card-title">
                                   <i class="fa fa-database"></i> {{ strtoupper($class_grade->long_name) }} {{ strtoupper($current_session->name) }} FEES SUMMARY
                                </h3>

                                <div class="card-tools">
                                    <div class="btn-group">

                                        <div class="input-group-prepend ml-2">
                                            <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-filter"></i> Filter By Class
                                            </button>
                                            <div class="dropdown-menu">
                                                @php($class_grads = App\ClassGrade::Active()->orderBy('id', 'asc')->get())
                                                @foreach($class_grads as $class_grad)
                                                    <a class="dropdown-item text-muted" href="{{ route('thisSummaryClass', $class_grad->slug) }}">
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
                                                <a class="dropdown-item text-danger" href="{{ route('exportFeeSummaryPDF', $class_grade->slug) }}" target="_blank">
                                                    <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                </a>
                                                <a class="dropdown-item text-success" href="{{ route('exportFeeSummaryExcel', $class_grade->id) }}">
                                                    <i class="fa fa-file-excel text-success"></i> Export To Excel
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="example1" class="table table-bordered">
                                            <thead>
                                                <th>#</th>
                                                <th>ADMNO</th>
                                                <th>STUDENT NAME</th>
                                                <th>CLASS/GRADE</th>
                                                <th style="text-align: right">EXPECTED</th>
                                                <th style="text-align: right">PAID</th>
                                                <th style="text-align: right">BALANCE</th>
                                            </thead>
                                            <tbody>
                                            @php($i = 1)
                                               @foreach($students as $student)
                                                   <tr>
                                                       <td style="vertical-align: middle">{{ $i }}</td>
                                                       <td style="vertical-align: middle">{{ $student->admno }}</td>
                                                       <td style="vertical-align: middle">{{ $student->name }}</td>
                                                       <td style="vertical-align: middle">{{ $student->class_grade->long_name }}</td>
                                                       <td style="vertical-align: middle;text-align: right">{{ number_format($student->expected,2) }}</td>
                                                       <td style="vertical-align: middle;text-align: right">{{ number_format($student->paid,2) }}</td>
                                                       <td style="vertical-align: middle;text-align: right">{{ number_format($student->balance,2) }}</td>
                                                   </tr>
                                                   @php(++$i)
                                               @endforeach
                                            </tbody>
                                        </table>
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
