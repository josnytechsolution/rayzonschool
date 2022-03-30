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
                    <h1 class="m-0 text-dark">Add Multiple Class Fees</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Fee Setup</li>
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
                    <div class="card no-radius bg-white">
                    <form action="{{ route('class-fees.store') }}" method="POST">
                        @csrf
                        <div class="card-header">
                            <h3 class="card-title">Class Fee Structure List</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 alert alert-warning no-radius">
                                    <p>This section is for mandatory fees only. Those that apply to all students in the class.</p>
                                </div>
                                <input type="hidden" name="type" value="multiple" />
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="form-group col-md-4 mb-5">
                                            <label>Financial Session</label>
                                            <select name="current_session" class="form-control form-control-border @error('current_session') is-invalid @enderror no-radius">
                                                <option value="">--Select Financial Session--</option>
                                                @foreach($current_sessions as $current_session)
                                                    <option value="{{ $current_session->id }}">{{ ucwords($current_session->name) }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('current_session'))
                                                <small class="text-danger">{{ $errors->first('current_session') }}</small>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-4 mb-5">
                                            <label>Grade/Class</label>
                                            <select name="grade" class="form-control form-control-border @error('grade') is-invalid @enderror no-radius form-control-border">
                                                <option value="">--Select Grade/Class--</option>
                                                @foreach($grades as $grade)
                                                    <option value="{{ $grade->id }}">{{ ucwords($grade->long_name) }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('grade'))
                                                <small class="text-danger">{{ $errors->first('grade') }}</small>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                @php($i = 1)
                                @foreach($fee_parameters as $fee_parameter)
                                    <div class="form-group col-md-4 mb-5">
                                        <label>{{ ucwords(strtolower($fee_parameter->name)) }}</label>
                                        <input type="hidden" name="fee_parameter_id[{{ $fee_parameter->id }}]" value="{{ $fee_parameter->id }}" >
                                        <input type="text" name="amount[{{ $fee_parameter->id }}]" class="form-control form-control-border no-radius" placeholder="Enter Amount">
                                    </div>
                                    @php($i++)
                                @endforeach
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary btn-flat float-right" >
                               <i class="fa fa-save"></i> Save Fees
                            </button>
                        </div>
                    </form>
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
