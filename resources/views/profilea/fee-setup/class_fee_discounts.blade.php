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
                    <h1 class="m-0 text-dark">{{ strtoupper($grade->long_name) }} <small>FEES DISCOUNTS</small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Fees Details</li>
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
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fa fa-database"></i> STUDENTS WITH FEE DISCOUNTS [ <span class="text-danger">KES {{ number_format($discounts->sum('amount'),2) }}</span> ]
                            </h3>

                            <div class="card-tools">
                                <div class="btn-group">
                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-filter"></i> Filter By Class
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item text-muted" href="{{ route('fee-discounts.index') }}">
                                                All Classes
                                            </a>
                                            @php($class_grads = App\ClassGrade::Active()->orderBy('name', 'asc')->get())
                                            @foreach($class_grads as $class_grad)
                                                <a class="dropdown-item text-muted" href="{{ route('classFeeDiscount', $class_grad->slug) }}">
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
                                            <a class="dropdown-item text-danger" href="{{ route('feeDiscountPDF', $grade->slug) }}" target="_blank">
                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                            </a>
                                            <a class="dropdown-item text-success" href="{{ route('feeDiscountExcel', $grade->id) }}">
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
                                <th>ADM NO</th>
                                <th>FULL NAME</th>
                                <th>CLASSROOM</th>
                                <th>CONTACT</th>
                                <th>DISCOUNT NAME</th>
                                <th>DESCRIPTION</th>
                                <th style="text-align: right">AMOUNT</th>
                                </thead>
                                <tbody>
                                <?php $i = 1; ?>
                                @foreach($discounts as $discount)
                                    <tr>
                                        <td style="vertical-align: middle">{{ $i }}</td>
                                        <td style="vertical-align: middle">
                                            <a href="{{ route('studentFees', $discount->student->slug) }}" >
                                                <u>{{ $discount->student->admno }}</u>
                                            </a>
                                        </td>
                                        <td style="vertical-align: middle">{{ ucwords($discount->student->name) }}</td>
                                        <td style="vertical-align: middle">{{ $discount->student->classroom->name }}</td>
                                        <td style="vertical-align: middle">{{ $discount->student->parent_detail->primary_contact }}</td>
                                        <td style="vertical-align: middle">{{ ucwords($discount->name) }}</td>
                                        <td style="vertical-align: middle">{{ $discount->description }}</td>
                                        <td style="vertical-align: middle;text-align: right">{{ number_format($discount->amount,2) }}</td>
                                    </tr>
                                    <?php $i++; ?>
                                @endforeach
                                </tbody>
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
