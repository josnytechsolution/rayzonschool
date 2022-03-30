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
                    <h1 class="m-0 text-dark">ALUMNI STUDENTS LIST</h1>
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
                <div class="col-md-12">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fa fa-users"></i> ALUMNI STUDENTS LIST
                            </h3>
                        </div>
                        <div class="card-body">
                            <table id="example1" class="table table-striped">
                                <thead>
                                <th>#</th>
                                <th>PHOTO</th>
                                <th>ADM NO</th>
                                <th>STUDENT NAME</th>
                                <th>GENDER</th>
                                <th>CONTACT</th>
                                <th>EMAIL</th>
                                <th>ADM DATE</th>
                                <th>ACTION</th>
                                </thead>
                                <tbody>
                                <?php $i = 1; ?>
                                @foreach($students as $student)
                                    <tr>
                                        <td style="vertical-align: middle">{{ $i }}</td>
                                        <td><img src="{{ asset($student->photo) }}" class="img-fluid pad img-size-32" /></td>
                                        <td style="vertical-align: middle">{{ $student->admno }}</td>
                                        <td style="vertical-align: middle">{{ ucwords(strtolower($student->name)) }}</td>
                                        <td style="vertical-align: middle">{{ $student->gender }}</td>
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
                                                    <a href="{{ route('collectFee', $student->slug) }}" class="dropdown-item text-warning">
                                                        <i class="fa fa-money-bill text-warning"></i> Collect Fees
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
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
