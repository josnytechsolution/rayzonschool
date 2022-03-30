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
                            BULK SMS DASHBOARD
                        </h5>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                            <li class="breadcrumb-item active">Communication</li>
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
                <div class="col-md-12">@include('errors')</div>
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <!-- small box -->
                                <div class="small-box bg-primary no-radius">
                                    <div class="inner">
                                        @php($messes = App\MessageOutbox::all()->count())
                                        <h3><small>{{ $messes }}</small></h3>

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
                                    @php($delivered = App\MessageOutbox::where('status', 'DeliveredToTerminal')->count())
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
                                    @php($blocked = App\MessageOutbox::where('status', 'SenderName Blacklisted')->count())
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
                                    @php($pending = App\MessageOutbox::where('status', 'Sent')->count())
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

                    <div class="col-md-8">
                        <div class="card card-outline card-primary no-radius">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fa fa-envelope"></i> Messages Outbox
                                </h3>
                                <div class="card-tools">
                                    @include('profilea.communication.balance_modal')
                                    <a href="#rechargeBalance" class="btn btn-success btn-sm btn-flat float-right" data-toggle="modal">
                                        SMS Balance: KES {{ $balance }}
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="example1" class="table table-striped">
                                    <thead>
                                    <th style="width: 50%;">MESSAGE</th>
                                    <th style="width: 20%;">SENT ON</th>
                                    <th style="width: 15%;">SENT BY</th>
                                    <th style="width: 10%;">RECIPIENTS</th>
                                    <th style="width: 10%;">STATUS</th>
                                    </thead>
                                    <tbody>
                                    @foreach($messages as $message)
                                        @php($messes = App\MessageOutbox::where('code', $message->slug)->count())
                                        <tr>
                                            <td style="vertical-align: middle">{{ $message->message }}</td>
                                            <td style="vertical-align: middle">{{ $message->updated_at }}</td>
                                            <td style="vertical-align: middle">
                                                @if($message->status === "isQueued")
                                                    {{ $message->creator->name }}
                                                @else
                                                    {{ $message->sender->name }}
                                                @endif
                                            </td>
                                            <td style="vertical-align: middle;text-align: center">{{ $messes }}</td>
                                            <td style="vertical-align: middle;text-align: center">
                                                @if($message->status === 'isSent')
                                                    <a href="{{ route('showMessages', $message->slug) }}" class="btn btn-success btn-sm btn-flat btn-block" title="Click To View">Details</a>
                                                @else
                                                    <a href="{{ route('send-bulk-messages.show', $message->slug) }}" class="btn btn-warning btn-sm btn-flat btn-block" title="Click To Resend">{{ $message->status }}</a>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="col-12 p-0">
                            <div class="card card-primary card-outline no-radius">
                                <div class="card-header no-radius">
                                    <h3 class="card-title">
                                        <i class="fa fa-paper-plane"></i> Send Fees Reminders
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <ul class="nav nav-pills" data-widget="treeview" role="menu">
                                        <li class="nav-item">
                                            <a href="{{ route('fee-messages.index') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To All Students
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('fee-messages.create') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Selected Classes
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('sendToStudents') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Selected Students
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <div class="col-12 p-0">
                            <div class="card card-success card-outline  no-radius">
                                <div class="card-header no-radius">
                                    <h3 class="card-title">
                                        <i class="fa fa-paper-plane"></i> Send General Messages To Students
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <ul class="nav nav-pills" data-widget="treeview" role="menu" data-accordion="false">
                                        <li class="nav-item">
                                            <a href="{{ route('general-messages.index') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To All Students
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('general-messages.create') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Selected Classes
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('sendToGenStudents') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Selected Students
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('sendToTranStudents') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Transport Students
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <div class="col-12 p-0">
                            <div class="card card-warning card-outline  no-radius">
                                <div class="card-header no-radius">
                                    <h3 class="card-title">
                                        <i class="fa fa-paper-plane"></i> Send General Messages To Staff
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <ul class="nav nav-pills" data-widget="treeview" role="menu" data-accordion="false">
                                        <li class="nav-item">
                                            <a href="{{ route('staff-messages.create') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To All Members
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('selectedMembers') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Selected Members
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="{{ route('selectedDepartment') }}" class="nav-link">
                                                <i class="nav-icon fas fa-paper-plane"></i>
                                                Send To Selected Departments
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
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