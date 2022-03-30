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
            <div class="row mt-2">
                <div class="col-sm-6">
                    <h5 class="m-0 text-dark">
                        {{ strtoupper($bank->name) }} BANK FEE COLLECTION
                        <small>{{ $dateFrom." TO ".$dateTo }}</small>
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Report Center</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <hr>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                            <div class="card-header">
                                <h3 class="card-title">
                                   <i class="fa fa-database"></i> {{ $dateFrom." TO ".$dateTo }} {{ strtoupper($bank->name) }} FEE COLLECTED
                                </h3>

                                <div class="card-tools">
                                    <div class="btn-group">
                                        <div class="input-group-prepend ml-2">
                                            <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-download"></i> Export
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item text-danger" href="{{ route('exportFeePDF', "all-classes") }}" target="_blank">
                                                    <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                </a>
                                                <a class="dropdown-item text-success" href="{{ route('exportFeeExcel', 100) }}">
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
                                                <th>REC. #</th>
                                                <th>STUDENT NAME</th>
                                                <th>CLASS/GRADE</th>
                                                <th>AMOUNT</th>
                                                <th>PAY DATE</th>
                                                <th>SLIP DATE</th>
                                                <th>BANK</th>
                                                <th>REF. #</th>
                                            </thead>
                                            <tbody>
                                            @php($i = 1)
                                               @foreach($payments as $payment)
                                                   <tr>
                                                       <td style="vertical-align: middle">{{ $i }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->receipt_no }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->student->name }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->class_grade->long_name }}</td>
                                                       <td style="vertical-align: middle">{{ number_format($payment->paid,2) }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->pay_date }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->slip_date }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->bank->name }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->ref_no }}</td>
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
