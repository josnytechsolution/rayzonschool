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
                        MESSAGES SENT TO STUDENTS
                        <small>{{ date('Y') }}</small>
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Students Outbox</li>
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
                                   <i class="fa fa-envelope-open"></i> {{ date('Y') }} MESSAGES SENT TO STUDENTS
                                </h3>
                                <div class="card-tools">
                                    <a href="{{ route('outboxSync') }}" class="btn btn-success btn-sm btn-flat">
                                        <i class="fa fa-refresh"></i> Refresh
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="example1" class="table table-bordered">
                                            <thead>
                                                <th style="width: 10%">STUDENT NAME</th>
                                                <th style="width: 42%">SENT MESSAGE</th>
                                                <th style="width: 8%">CONTACT</th>
                                                <th style="width: 10%">STATUS</th>
                                                <th style="width: 10%">DELIVERED AT</th>
                                            </thead>
                                            <tbody>
                                               @foreach($studentMessages as $studentMessage)
                                                   @php($student = \App\Student::findOrFail($studentMessage->recipient_id))
                                                   <tr>
                                                       <td style="vertical-align: middle">{{ $student->name }}</td>
                                                       <td style="vertical-align: middle">{{ $studentMessage->message }}</td>
                                                       <td style="vertical-align: middle">{{ $studentMessage->phoneno }}</td>
                                                       <td style="vertical-align: middle">
                                                           @if($studentMessage->status === "DeliveredToTerminal")
                                                               <button class="btn btn-success btn-flat btn-block btn-xs"><code>success</code></button>
                                                           @else
                                                               <button class="btn btn-danger btn-flat btn-block btn-xs"><code>{{ $studentMessage->status }}</code></button>
                                                           @endif
                                                       </td>
                                                       <td style="vertical-align: middle">{{ $studentMessage->delivered_at }}</td>
                                                   </tr>
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
