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
                        SEND FEES REMINDER
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
                <div class="col-md-12">
                    <div class="col-md-12">@include('errors')</div>

                    <div class="col-md-12 border bg-white p-3 mb-4">
                        <label class="text-primary">INSTRUCTIONS:</label><br>
                        <div class="row">
                            <div class="col-md-4">For student name use: <code>full_name</code></div>
                            <div class="col-md-4">For fees balance use: <code>fee_balance</code></div>
                            <div class="col-md-4">For admission number use: <code>admn_no</code></div>
                        </div>
                        <label class="text-danger" style="margin-top: 20px;">SAMPLE MESSAGE:</label><br>
                        <span class="text-dark">Dear Parent, Kindly clear <code>full_name</code> fees balance of <code>fee_balance</code> by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: <code>adm_no</code></span>
                    </div>
                    <div class="col-md-12 p-0">
                        <div class="card no-radius">
                            <form action="{{ route('sendToAllWithFigures') }}" method="post">
                                @csrf
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label>Amount Between:</label>
                                            <input type="text" name="from" class="form-control no-radius @error('from') is-invalid @enderror" value="{{ old('from') }}" />

                                            @if($errors->has('from'))
                                                <p class="text-danger">{{ $errors->first('from') }}</p>
                                            @endif
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>And:</label>
                                            <input type="text" name="to" class="form-control no-radius @error('to') is-invalid @enderror" value="{{ old('to') }}" />

                                            @if($errors->has('to'))
                                                <p class="text-danger">{{ $errors->first('to') }}</p>
                                            @endif
                                        </div>
                                        <p class="help-block text-info pl-3"><i class="fa fa-lightbulb"></i> Leave the above fields empty to send to all with balances.</p>

                                        <div class="col-md-12 mt-3 form-group">
                                            <label>Compose Message:<span class="text-danger">*</span></label>
                                            <textarea name="message" id="textarea" class="form-control no-radius" rows="7" maxlength="457"></textarea>

                                            @if($errors->has('message'))
                                                <p class="text-danger">{{ $errors->first('message') }}</p>
                                            @endif
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <p id="textarea_feedback" class="help-block text-primary font-italic"></p>
                                        </div>

                                        <div class="col-md-12 mt-3">
                                            <div class="float-right">
                                                <button type="submit" class="btn btn-outline btn-primary btn-flat"><i class="far fa-paper-plane"></i> Send Message</button>
                                            </div>
                                            <button type="reset" class="btn btn-default btn-flat"><i class="fas fa-brush"></i> Discard</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </form>
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
