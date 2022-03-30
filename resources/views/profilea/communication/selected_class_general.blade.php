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
                        SEND FEES REMINDER <small>BY CLASS</small>
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
                    <div class="row">
                        <div class="col-md-12">@include('errors')</div>
                        <div class="col-md-12">
                            <div class="card card-primary card-outline no-radius">
                                <div class="card-header">
                                    <h3 class="card-title text-primary">
                                        <i class="fa fa-edit"></i> Compose New Message
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <form action="{{ route('sendToSelectedClasses') }}" method="post">
                                    @csrf
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 border bg-gray-light p-3 mb-4">
                                                <label class="text-primary">INSTRUCTIONS:</label><br>
                                                <div class="row">
                                                    <div class="col-md-6">For student name use: <code>full_name</code></div>
                                                    <div class="col-md-6">For admission number use: <code>admn_no</code></div>
                                                </div>
                                                <label class="text-danger" style="margin-top: 20px;">SAMPLE MESSAGE:</label><br>
                                                <span class="text-dark">Dear Parent, The school officially opens on 01/01/2021. Give <code>full_name</code> the items required.</span>
                                            </div>
                                            <div class="col-md-12 border bg-gray-light p-3 mb-4">
                                                <label class="text-primary">SELECT CLASSES</label><br>
                                                <div class="row">
                                                    @foreach($grades as $grade)
                                                        <div class="col-md-4 mb-3">
                                                            <input type="checkbox" name="grade[]" value="{{ $grade->id }}">
                                                            {{ $grade->long_name }}
                                                        </div>
                                                    @endforeach
                                                </div>
                                              </div>

                                            <input type="hidden" name="type" value="class" />
                                            <div class="col-md-12 mt-3 form-group">
                                                <label>Compose Message:<span class="text-danger">*</span></label>
                                                <textarea name="message" id="textarea" class="form-control" rows="7" maxlength="445"></textarea>

                                                @if($errors->has('message'))
                                                    <p class="text-danger">{{ $errors->first('message') }}</p>
                                                @endif
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <p id="textarea_feedback" class="help-block text-primary font-italic"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <div class="float-right">
                                            <button type="submit" class="btn btn-primary no-radius"><i class="far fa-paper-plane"></i> Send Message</button>
                                        </div>
                                        <button type="reset" class="btn btn-default no-radius"><i class="fas fa-brush"></i> Discard</button>
                                    </div>
                                    <!-- /.card-footer -->
                                </form>
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.row -->
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
