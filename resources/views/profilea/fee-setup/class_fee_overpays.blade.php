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
            <div class="row mb-2 mt-4">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">{{ strtoupper($class_grade->long_name) }} <small class="text-muted">FEES OVERPAYMENT</small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Fees Collection</li>
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
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fa fa-database"></i> STUDENTS WITH FEE OVERPAYMENT
                            </h3>

                            <div class="card-tools">
                                <div class="btn-group">
                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-filter"></i> Filter By Class
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item text-muted" href="{{ route('overpays') }}">
                                                All Classes
                                            </a>
                                            @php($class_grads = App\ClassGrade::Active()->orderBy('name', 'asc')->get())
                                            @foreach($class_grads as $class_grad)
                                                <a class="dropdown-item text-muted" href="{{ route('overpayByClass', $class_grad->slug) }}">
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
                                            <a class="dropdown-item text-danger" href="{{ route('exportOvPDF', $class_grade->slug) }}" target="_blank">
                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                            </a>
                                            <a class="dropdown-item text-success" href="{{ route('exportOvExcel', $class_grade->id) }}">
                                                <i class="fa fa-file-excel text-success"></i> Export To Excel
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table id="example1" class="table table-striped">
                                <thead>
                                <th>#</th>
                                <th>PHOTO</th>
                                <th>ADM NO</th>
                                <th>FULL NAME</th>
                                <th>CLASSROOM</th>
                                <th>CONTACT</th>
                                <th style="text-align: right">AMOUNT</th>
                                </thead>
                                <tbody>
                                <?php $i = 1; ?>
                                @foreach($overpays as $overpay)
                                    <tr>
                                        <td style="vertical-align: middle">{{ $i }}</td>
                                        <td><img src="{{ asset($overpay->photo) }}" class="img-fluid pad img-size-32" /></td>
                                        <td style="vertical-align: middle">
                                            <a href="{{ route('student-details.show', $overpay->slug) }}" >
                                                <u>{{ $overpay->admno }}</u>
                                            </a>
                                        </td>
                                        <td style="vertical-align: middle">{{ strtoupper($overpay->name) }}</td>
                                        <td style="vertical-align: middle">{{ $overpay->classroom->name }}</td>
                                        <td style="vertical-align: middle">{{ $overpay->parent_detail->primary_contact }}</td>
                                        <td style="vertical-align: middle;text-align: right">{{ number_format($overpay->balance,2) }}</td>
                                    </tr>
                                    <?php $i++; ?>
                                @endforeach
                                </tbody>

                                @if($overpays->count() > 0)
                                <tfooter>
                                    <td colspan="6" style="vertical-align: middle;text-align: right"><b>TOTAL</b></td>
                                    <td style="vertical-align: middle;text-align: right"><b>{{ number_format($overpays->sum('balance'),2) }}</b></td>
                                </tfooter>
                                @endif
                            </table>
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
