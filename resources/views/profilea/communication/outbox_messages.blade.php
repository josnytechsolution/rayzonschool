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
                        MESSAGES OUTBOX
                        <small>{{ date('Y') }}</small>
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Message Outbox</li>
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
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-primary no-radius">
                                <div class="inner">
                                    <h3><small>{{ $messages->count() }}</small></h3>

                                    <p>Sent Messages</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-paper-plane"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-success no-radius">
                                @php($delivered = $messages->where('status', 'DeliveredToTerminal')->count())
                                <div class="inner">
                                    <h3><small>{{ $delivered }}</small></h3>

                                    <p>Messages Delivered</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-envelope-open"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-danger no-radius">
                                @php($blocked = $messages->where('status', 'UserNameBlacklisted')->count())
                                <div class="inner">
                                    <h3><small>{{ $blocked }}</small></h3>

                                    <p>Blocked Messages</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-ban"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-warning no-radius">
                                @php($pending = $messages->where('status', NULL)->count())
                                <div class="inner">
                                    <h3><small>{{ $pending }}</small></h3>

                                    <p>Pending Messages</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-sync"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                            <div class="card-header">
                                <h3 class="card-title">
                                   <i class="fa fa-envelope-open"></i> MESSAGES OUTBOX
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="example1" class="table table-bordered">
                                            <thead>
                                                <th style="width: 10%">RECIPIENT NAME</th>
                                                <th style="width: 42%">SENT MESSAGE</th>
                                                <th style="width: 8%">CONTACT</th>
                                                <th style="width: 10%">STATUS</th>
                                                <th style="width: 10%">DELIVERED AT</th>
                                            </thead>
                                            <tbody>
                                               @foreach($messages as $message)
                                                   @if($message->target === "students")
                                                        @php($recipient = App\Student::findOrFail($message->recipient_id))
                                                    @else
                                                       @php($recipient = App\StaffMember::findOrFail($message->recipient_id))
                                                   @endif
                                                   <tr>
                                                       <td style="vertical-align: middle">{{ $recipient->name }}</td>
                                                       <td style="vertical-align: middle">{{ $message->message }}</td>
                                                       <td style="vertical-align: middle">{{ $message->phoneno }}</td>
                                                       <td style="vertical-align: middle">
                                                           @if($message->status === "DeliveredToTerminal")
                                                               <button class="btn btn-success btn-flat btn-block btn-xs">success</button>
                                                           @elseif ($message->status === NULL)
                                                               <button class="btn btn-info btn-flat btn-block btn-xs">sent</button>
                                                           @else
                                                               <button class="btn btn-danger btn-flat btn-block btn-xs">{{ $message->status }}</button>
                                                           @endif
                                                       </td>
                                                       <td style="vertical-align: middle">{{ $message->delivered_at }}</td>
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
