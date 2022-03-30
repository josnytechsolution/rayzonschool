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
                    <h1 class="m-0 text-dark">ARREARS BROUGHT FORWARD</h1>
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
                                <i class="fa fa-database"></i> STUDENTS WITH FEE BALANCES BROUGHT FORWARD [<code>TOTAL: {{ number_format($arrears->sum('arrears'),2) }} </code>]
                            </h3>

                            <div class="card-tools">
                                <div class="btn-group">
                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-filter"></i> Filter By Class
                                        </button>
                                        <div class="dropdown-menu">
                                            @php($class_grades = App\ClassGrade::Active()->orderBy('name', 'asc')->get())
                                            @foreach($class_grades as $class_grade)
                                                <a class="dropdown-item text-muted" href="{{ route('arrearsByClass', $class_grade->slug) }}">
                                                    {{ $class_grade->long_name }}
                                                </a>
                                            @endforeach
                                        </div>
                                    </div>

                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-download"></i> Export
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item text-danger" href="{{ route('exportArrPDF', "all-classes") }}" target="_blank">
                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                            </a>
                                            <a class="dropdown-item text-success" href="{{ route('exportArrExcel', 100) }}">
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
                                @foreach($arrears as $arrear)
                                    <tr>
                                        <td style="vertical-align: middle">{{ $i }}</td>
                                        <td><img src="{{ asset($arrear->photo) }}" class="img-fluid pad img-size-32" /></td>
                                        <td style="vertical-align: middle">
                                            <a href="{{ route('student-details.show', $arrear->slug) }}" >
                                                <u>{{ $arrear->admno }}</u>
                                            </a>
                                        </td>
                                        <td style="vertical-align: middle">{{ strtoupper($arrear->name) }}</td>
                                        <td style="vertical-align: middle">{{ $arrear->classroom->name }}</td>
                                        <td style="vertical-align: middle">{{ $arrear->parent_detail->primary_contact }}</td>
                                        <td style="vertical-align: middle;text-align: right">{{ number_format($arrear->arrears,2) }}</td>
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
