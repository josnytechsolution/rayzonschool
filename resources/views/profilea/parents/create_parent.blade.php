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
            <div class="row mb-2 mt-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Create New Parent</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Parents</li>
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
                    @if ($errors->any())
                        <div class="col-md-12 alert alert-danger">
                            @foreach ($errors->all() as $error)
                                <p class="mb-0 mt-0">{{ $error }}</p>
                            @endforeach
                        </div>
                    @endif

                    @if($message = Session::get('success'))
                        <div class="col-md-12 alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if (Session::has('error'))
                        <div class="col-md-12 alerts alert alert-danger">
                                <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('error') }}</p>
                        </div>
                    @endif


                    @if (Session::has('failed'))
                        <div class="col-md-12 alerts alert alert-danger">
                            <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('failed') }}</p>
                        </div>
                    @endif

                    @if (Session::has('no-parent'))
                        <div class="col-md-12 alerts alert alert-danger">
                            <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('no-parent') }}</p>
                        </div>
                    @endif

                <div class="col-md-12 mb-2">
                    <a href="{{ route('parent-details.index') }}" class="btn btn-secondary btn-flat btn-sm">
                        <i class="fa fa-arrow-left"></i> Back
                    </a>
                </div>

                <div class="col-md-12">
            <form action="{{ route('parent-details.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                    <div class="card no-radius bg-white">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 mb-3 p-0">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Parent/Guardian ID<sup class="text-danger">*</sup></label>
                                            <input id="parent" type="text" name="parent_no" class="form-control form-control-border @error('parent_no') is-invalid @enderror no-radius" value="{{ old('parent_no', $parent_no) }}">
                                            @if($errors->has('parent_no'))
                                                <small class="text-danger">{{ $errors->first('parent_no') }}</small>
                                            @endif
                                            <p id="show"></p>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Primary SMS Contact</label>
                                            <input type="text" name="primary_contact" class="form-control form-control-border @error('primary_contact') is-invalid @enderror no-radius" value="{{ old('primary_contact') }}" placeholder="0712345678">
                                            @if($errors->has('primary_contact'))
                                                <small class="text-danger">{{ $errors->first('primary_contact') }}</small>
                                            @endif
                                        </div>
                                        <div class="col-md-3">
                                            <label>Secondary SMS Contact</label>
                                            <input type="text" name="secondary_contact" class="form-control form-control-border @error('secondary_contact') is-invalid @enderror no-radius" value="{{ old('secondary_contact') }}" placeholder="0712345678">
                                            @if($errors->has('secondary_contact'))
                                                <small class="text-danger">{{ $errors->first('secondary_contact') }}</small>
                                            @endif
                                        </div>
                                        <div class="col-md-3">
                                            <label>Primary Email Address</label>
                                            <input type="text" name="primary_email" class="form-control form-control-border @error('primary_email') is-invalid @enderror no-radius" value="{{ old('primary_email') }}">
                                            @if($errors->has('primary_email'))
                                                <small class="text-danger">{{ $errors->first('primary_email') }}</small>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <!-- FATHER'S DETAILS -->
                                <div class="col-md-3 mb-2">
                                    <label>Father's Name</label>
                                    <input type="text" name="fname" class="form-control form-control-border @error('fname') is-invalid @enderror no-radius" value="{{ old('fname') }}">
                                    @if($errors->has('fname'))
                                        <small class="text-danger">{{ $errors->first('fname') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Father's Contact</label>
                                    <input type="text" name="fcontact" class="form-control form-control-border @error('fcontact') is-invalid @enderror no-radius" placeholder="0712345678" value="{{ old('fcontact') }}">
                                    <small class="text-muted">Should be in this format 0712345678</small>
                                    @if($errors->has('fcontact'))
                                        <small class="text-danger">{{ $errors->first('fcontact') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Father's Email Address</label>
                                    <input type="email" name="femail" class="form-control form-control-border @error('femail') is-invalid @enderror no-radius" value="{{ old('femail') }}">
                                    @if($errors->has('femail'))
                                        <small class="text-danger">{{ $errors->first('femail') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Father's Occupation</label>
                                    <input type="text" name="foccupation" class="form-control form-control-border @error('foccupation') is-invalid @enderror no-radius" value="{{ old('foccupation') }}">
                                    @if($errors->has('foccupation'))
                                        <small class="text-danger">{{ $errors->first('foccupation') }}</small>
                                    @endif
                                </div>

                                <!-- MOTHER'S DETAILS -->
                                <div class="col-md-3 mb-2">
                                    <label>Mother's Name</label>
                                    <input type="text" name="mname" class="form-control form-control-border @error('mname') is-invalid @enderror no-radius" value="{{ old('mname') }}">
                                    @if($errors->has('mname'))
                                        <small class="text-danger">{{ $errors->first('mname') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Mother's Contact</label>
                                    <input type="text" name="mcontact" class="form-control form-control-border @error('mcontact') is-invalid @enderror no-radius" placeholder="0712345678" value="{{ old('mcontact') }}">
                                    <small class="text-muted">Should be in this format 0712345678</small>
                                    @if($errors->has('mcontact'))
                                        <small class="text-danger">{{ $errors->first('mcontact') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Mother's Email Address</label>
                                    <input type="email" name="memail" class="form-control form-control-border @error('memail') is-invalid @enderror no-radius" value="{{ old('memail') }}">
                                    @if($errors->has('memail'))
                                        <small class="text-danger">{{ $errors->first('memail') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Mother's Occupation</label>
                                    <input type="text" name="moccupation" class="form-control form-control-border @error('moccupation') is-invalid @enderror no-radius" value="{{ old('moccupation') }}">
                                    @if($errors->has('moccupation'))
                                        <small class="text-danger">{{ $errors->first('moccupation') }}</small>
                                    @endif
                                </div>

                                <!-- GUARDIAN'S DETAILS -->
                                <div class="col-md-3 mb-2">
                                    <label>Guardian's Name</label>
                                    <input type="text" name="gname" class="form-control form-control-border @error('gname') is-invalid @enderror no-radius" value="{{ old('gname') }}">
                                    @if($errors->has('gname'))
                                        <small class="text-danger">{{ $errors->first('gname') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Guardian's Contact</label>
                                    <input type="text" name="gcontact" class="form-control form-control-border @error('gcontact') is-invalid @enderror no-radius" placeholder="0712345678" value="{{ old('gcontact') }}">
                                    <small class="text-muted">Should be in this format 0712345678</small>
                                    @if($errors->has('gcontact'))
                                        <small class="text-danger">{{ $errors->first('gcontact') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Guardian's Email Address</label>
                                    <input type="email" name="gemail" class="form-control form-control-border @error('gemail') is-invalid @enderror no-radius" value="{{ old('gemail') }}">
                                    @if($errors->has('gemail'))
                                        <small class="text-danger">{{ $errors->first('gemail') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-3 mb-2">
                                    <label>Guardian's Relation</label>
                                    <input type="text" name="grelation" class="form-control form-control-border @error('grelation') is-invalid @enderror no-radius" value="{{ old('grelation') }}">
                                    @if($errors->has('grelation'))
                                        <small class="text-danger">{{ $errors->first('grelation') }}</small>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary btn-flat float-right">
                                <i class="fa fa-database"></i> Submit
                            </button>
                        </div>
                    </div>
            </form>
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
