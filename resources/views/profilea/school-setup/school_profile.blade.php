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
            <div class="row mb-2 mt-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">School Profile</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">School Setup</li>
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

                    @if (\Session::has('error'))
                        <div class="alerts alert alert-warning">
                                <p class="mb-0 mt-0">{{ \Session::get('error') }}</p>
                        </div>
                    @endif
                </div>

                <div class="col-md-5">
                    <div class="card card-primary card-outline no-radius bg-white">
                        <div class="card-header text-center">
                            <img src="{{ asset($school_profile->logo) }}" class="img img-fluid" title="School Logo" />
                        </div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>School Name:</b> <a class="float-right">{{ $school_profile->name }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>School Motto:</b> <a class="float-right">{{ $school_profile->motto }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Postal Address:</b> <a class="float-right">{{ $school_profile->postal }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Physical Address:</b> <a class="float-right">{{ $school_profile->physical }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Contact 1:</b> <a class="float-right">{{ $school_profile->contact1 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Contact 2:</b> <a class="float-right">{{ $school_profile->contact2 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Contact 3:</b> <a class="float-right">{{ $school_profile->contact3 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Contact 4:</b> <a class="float-right">{{ $school_profile->contact4 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Email 1:</b> <a class="float-right">{{ $school_profile->email1 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Email 2:</b> <a class="float-right">{{ $school_profile->email2 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Email 3:</b> <a class="float-right">{{ $school_profile->email3 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Email 4:</b> <a class="float-right">{{ $school_profile->email4 }}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>School Website:</b> <a class="float-right">{{ $school_profile->website }}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="card card-primary card-outline no-radius bg-white">
                        <form action="{{ route('school-profile.update', $school_profile->id) }}" method="post" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="card-header">
                                <h3 class="card-title">Update School Profile</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label>School Name</label>
                                        <input type="text" name="name" class="form-control no-radius" value="{{ old('name', $school_profile->name) }}">
                                        @if($errors->has('name'))
                                            <small class="text-danger">{{ $errors->first('name') }}</small>
                                        @endif
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label>School Motto</label>
                                        <input type="text" name="motto" class="form-control no-radius" value="{{ old('motto', $school_profile->motto) }}">
                                        @if($errors->has('motto'))
                                            <small class="text-danger">{{ $errors->first('motto') }}</small>
                                        @endif
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label>Postal Address</label>
                                        <input type="text" name="postal" class="form-control no-radius" value="{{ old('postal', $school_profile->postal) }}">
                                        @if($errors->has('postal'))
                                            <small class="text-danger">{{ $errors->first('postal') }}</small>
                                        @endif
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label>Physical Address</label>
                                        <input type="text" name="physical" class="form-control no-radius" value="{{ old('physical', $school_profile->physical) }}">
                                        @if($errors->has('physical'))
                                            <small class="text-danger">{{ $errors->first('physical') }}</small>
                                        @endif
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label>Contact 1</label>
                                                <input type="text" name="contact1" class="form-control no-radius" value="{{ old('contact1', $school_profile->contact1) }}">
                                                @if($errors->has('contact1'))
                                                    <small class="text-danger">{{ $errors->first('contact1') }}</small>
                                                @endif
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label>Contact 2</label>
                                                <input type="text" name="contact2" class="form-control no-radius" value="{{ old('contact2', $school_profile->contact2) }}">
                                                @if($errors->has('contact2'))
                                                    <small class="text-danger">{{ $errors->first('contact2') }}</small>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label>Contact 3</label>
                                                <input type="text" name="contact3" class="form-control no-radius" value="{{ old('contact3', $school_profile->contact3) }}">
                                                @if($errors->has('contact3'))
                                                    <small class="text-danger">{{ $errors->first('contact3') }}</small>
                                                @endif
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label>Contact 4</label>
                                                <input type="text" name="contact4" class="form-control no-radius" value="{{ old('contact4', $school_profile->contact4) }}">
                                                @if($errors->has('contact4'))
                                                    <small class="text-danger">{{ $errors->first('contact4') }}</small>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label>Email 1</label>
                                                <input type="email" name="email1" class="form-control no-radius" value="{{ old('email1', $school_profile->email1) }}">
                                                @if($errors->has('email1'))
                                                    <small class="text-danger">{{ $errors->first('email1') }}</small>
                                                @endif
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label>Email 2</label>
                                                <input type="email" name="email2" class="form-control no-radius" value="{{ old('email2', $school_profile->email2) }}">
                                                @if($errors->has('email2'))
                                                    <small class="text-danger">{{ $errors->first('email2') }}</small>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label>Email 3</label>
                                                <input type="email" name="email3" class="form-control no-radius" value="{{ old('email3', $school_profile->email3) }}">
                                                @if($errors->has('email3'))
                                                    <small class="text-danger">{{ $errors->first('email3') }}</small>
                                                @endif
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label>Email 4</label>
                                                <input type="email" name="email4" class="form-control no-radius" value="{{ old('email4', $school_profile->email4) }}">
                                                @if($errors->has('email4'))
                                                    <small class="text-danger">{{ $errors->first('email4') }}</small>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label>School Website</label>
                                        <input type="text" name="website" class="form-control no-radius" value="{{ old('website', $school_profile->website) }}">
                                        @if($errors->has('website'))
                                            <small class="text-danger">{{ $errors->first('website') }}</small>
                                        @endif
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label>School Logo</label>
                                        <input type="file" name="logo" class="form-control no-radius" accept=".jpg,.jpeg,.png,.tiff">
                                        @if($errors->has('logo'))
                                            <small class="text-danger">{{ $errors->first('logo') }}</small>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="reset" class="btn btn-secondary btn-flat" >
                                    <i class="fa fa-brush"></i> Clear All
                                </button>
                                <button type="submit" class="btn btn-primary btn-flat float-right">
                                    <i class="fa fa-save"></i> Update Profile
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
