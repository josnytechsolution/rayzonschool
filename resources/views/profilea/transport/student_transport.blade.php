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
                    <h1 class="m-0 text-dark">Students Termly Transport</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">School Transport</li>
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
                <div class="col-md-12">
                    @if($message = Session::get('success'))
                        <div class="alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if (Session::has('error'))
                        <div class="alerts alert alert-warning">
                                <p class="mb-0 mt-0">{{ Session::get('error') }}</p>
                        </div>
                    @endif
                </div>

                <div class="col-md-12 mb-2">
                    <a href="#assignStudent" class="btn btn-primary btn-flat float-right" data-toggle="modal">
                        <i class="fa fa-user-plus"></i> Assign Transport
                    </a>
                </div>
                <div class="col-md-12">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">
                               <i class="fa fa-bus"></i> {{ strtoupper($current_session->name) }} Students Transport List
                            </h3>

                            <div class="card-tools">
                                <div class="btn-group">
                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-filter"></i> Filter By Class
                                        </button>
                                        <div class="dropdown-menu">
                                            @php($class_grades = App\ClassGrade::Active()->orderBy('level', 'asc')->get())
                                            @foreach($class_grades as $class_grade)
                                                <a class="dropdown-item text-muted" href="">
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
                                            <a class="dropdown-item text-danger" href="">
                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                            </a>
                                            <a class="dropdown-item text-success" href="#">
                                                <i class="fa fa-file-excel text-success"></i> Export To Excel
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>ADM NO</th>
                                    <th>STUDENT NAME</th>
                                    <th>CLASS</th>
                                    <th>ZONE</th>
                                    <th>WAY</th>
                                    <th style="text-align: right">AMOUNT</th>
                                    <th style="text-align: right">CREATED ON</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($studentTransports as $studentTransport)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $studentTransport->student->admno }}</td>
                                    <td>{{ $studentTransport->student->name }}</td>
                                    <td>{{ $studentTransport->student->class_grade->long_name }}</td>
                                    <td>{{ $studentTransport->transport_zone_fee->transport_zone->name }}</td>
                                    <td>{{ $studentTransport->way }}</td>
                                    <td style="text-align: right">{{ number_format($studentTransport->amount,2) }}</td>
                                    <td style="text-align: right">{{ date('d-m-Y', strtotime($studentTransport->created_at)) }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('student-transports.edit', $studentTransport->id) }}">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteTransportStudent{{ $studentTransport->id }}" data-toggle="modal">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteTransportStudent{{ $studentTransport->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('student-transports.destroy', $studentTransport->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Student Transport</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            Are you you want to delete?
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 mb-3">
                                                        <label>Enter Administrator Password<span class="text-danger"><sup>*</sup></span> </label>
                                                        <input type="password" name="password" class="form-control no-radius @error('password') is-invalid @enderror" required>
                                                        <small>This action requires Admin rights</small>
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
                                <!-- End Delete Modal -->

                                <?php $i++; ?>
                            @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Start Assign Student Modal -->
                <div class="modal fade" id="assignStudent" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content no-radius">
                            <form action="{{ route('student-transports.store') }}" method="post">
                                @csrf

                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-bus text-primary"></i> Assign Student Transport</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <input type="hidden" name="current_session" value="{{ $current_session->id }}">
                                        <div class="col-md-12 form-group">
                                            <label>Select Student</label>
                                            <select name="student_id" class="form-control select2 @error('student_id') is-invalid @enderror" >
                                                <option value="">--Select Student--</option>
                                                @php($students = App\Student::Active()->orderBy('admno', 'asc')->get())
                                                @foreach($students as $student)
                                                    <option value="{{ $student->id }}">{{ $student->admno." - ".$student->name." - ".$student->class_grade->long_name." - ".$student->phoneno }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('student_id'))
                                                <small class="text-danger">{{ $errors->first('student_id') }}</small>
                                            @endif
                                        </div>

                                        <div class="col-md-12 form-group">
                                            <label>Transport Zone</label>
                                            <select id="transport" name="transport_zone_id" class="form-control select2 @error('transport_zone_id') is-invalid @enderror no-radius">
                                                <option value="">--Select Option--</option>
                                                @php($transport_zone_fees = App\TransportZoneFee::all())
                                                @foreach($transport_zone_fees as $transport_zone_fee)
                                                    <option value="{{ $transport_zone_fee->id }}">{{ $transport_zone_fee->transport_zone->name }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('transport_zone_id'))
                                                <small class="text-danger">{{ $errors->first('transport_zone_id') }}</small>
                                            @endif
                                        </div>

                                        <div class="col-md-12 form-group">
                                            <label>Transport Mode</label>
                                            <select id="way" name="way" class="form-control select2 @error('way') is-invalid @enderror no-radius">
                                                <option value="">--Select Transport Zone--</option>

                                            </select>
                                            @if($errors->has('way'))
                                                <small class="text-danger">{{ $errors->first('way') }}</small>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Assign Transport</button>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
                <!-- End Assign Student Modal -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
