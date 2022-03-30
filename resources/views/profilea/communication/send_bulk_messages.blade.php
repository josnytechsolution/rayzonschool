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
                        COMPLETE SEND MESSAGE
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
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-5">@include('errors')</div>
                <div class="col-md-2"></div>
                <div class="col-md-8 p-0">
                    <div class="card no-radius">
                        <form action="{{ route('send-bulk-messages.store') }}" method="post">
                            @csrf
                            <div class="card-body">
                                <div class="row">
                                    <input type="hidden" name="slug" value="{{ $originalMessage->slug }}" />
                                    <div class="col-md-12 mt-3 form-group">
                                        <label>Original Message:</label>
                                        <textarea name="message" id="textarea" class="form-control no-radius" rows="5" readonly>{{ $originalMessage->message }}</textarea>
                                    </div>

                                    <div class="col-md-12 btn-group">
                                        <button class="btn btn-secondary btn-flat text-right">Your SMS Balance: KES {{ $balance }}</button>
                                        <button class="btn btn-primary btn-flat text-right">Recipients: {{ $outboxes->count() }}</button>
                                        <button class="btn btn-warning btn-flat text-right">Total Cost: KES {{ $cost }}</button>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="alert @if($status === "Insufficient") alert-danger @else alert-success @endif mt-4 no-radius">
                                            <h5>{{ $msg }}</h5>
                                        </div>
                                    </div>

                                    @if($status === "Sufficient")
                                    <div class="col-md-12 mt-5">
                                        <div class="float-right">
                                            <button type="submit" class="btn btn-outline btn-primary btn-flat"><i class="far fa-paper-plane"></i> Send Message</button>
                                        </div>
                                    </div>
                                    @endif
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-md-2"></div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
