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
                    <h1 class="m-0 text-dark">SYSTEM USERS MANAGEMENT</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Configurations</li>
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
                    @if ($message = Session::get('success'))
                        <div class="alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if ($errors->any())
                        <div class="col-md-12 alert alert-danger">
                            @foreach ($errors->all() as $error)
                                <p class="mb-0 mt-0">{{ $error }}</p>
                            @endforeach
                        </div>
                    @endif

                    @if (\Session::has('error'))
                        <div class="alerts alert alert-warning">
                                <p class="mb-0 mt-0">{{ \Session::get('error') }}</p>
                        </div>
                    @endif
                </div>

                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-users"></i> Users List</h3>
                            <div class="card-tools">
                                <a href="#createUser" class="btn btn-outline-primary btn-sm btn-flat" data-toggle="modal">
                                    <i class="fa fa-user-plus"></i> New User
                                </a>

                                <!-- Start Create User Modal -->
                                <div class="modal fade" id="createUser" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <form action="{{ route('user-management.store') }}" method="post">
                                            @csrf
                                        <div class="modal-content no-radius">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-plus text-primary"></i> Create New User</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('Name') }}<sup class="text-danger">*</sup></label>
                                                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror no-radius" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                                                @error('name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('E-Mail Address') }}<sup class="text-danger">*</sup></label>
                                                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror no-radius" name="email" value="{{ old('email') }}" required autocomplete="off">

                                                                @error('email')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('Position') }}<sup class="text-danger">*</sup></label>
                                                                <input type="text" class="form-control @error('position') is-invalid @enderror no-radius" name="position" value="{{ old('position') }}" required autocomplete="off">

                                                                @error('position')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('User-Profile') }}<sup class="text-danger">*</sup></label>
                                                                <select class="form-control @error('profile') is-invalid @enderror no-radius" name="profile">
                                                                    <option value="">--Select User-Profile--</option>
                                                                    <option value="1">Super Admin</option>
                                                                    <option value="2">Admin</option>
                                                                    <option value="3">User</option>
                                                                </select>

                                                                @error('profile')
                                                                <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $message }}</strong>
                                                                    </span>
                                                                @enderror
                                                            </div>

                                                            <div class="col-md-12 bg-gray-light border">
                                                                <div class="form-group col-md-12 mt-2">
                                                                    <label>{{ __('Password') }}<sup class="text-danger">*</sup></label>
                                                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror no-radius" name="password" required autocomplete="new-password">

                                                                    @error('password')
                                                                    <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                    @enderror
                                                                </div>

                                                                <div class="form-group col-md-12">
                                                                    <label>{{ __('Confirm Password') }}<sup class="text-danger">*</sup></label>
                                                                    <input id="password-confirm" type="password" class="form-control no-radius" name="password_confirmation" required autocomplete="new-password">
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                    <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-database"></i> Submit</button>
                                                </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- End Create User Modal -->
                            </div>
                        </div>

                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>EMAIL ADDRESS</th>
                                    <th>POSITION</th>
                                    <th>USER-PROFILE</th>
                                    <th>STATUS</th>
                                    <th class="text-center">ACTION</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($users as $user)
                                <tr>
                                    <td style="vertical-align: middle">{{ $i }}</td>
                                    <td style="vertical-align: middle">{{ $user->name }}</td>
                                    <td style="vertical-align: middle">{{ $user->email }}</td>
                                    <td style="vertical-align: middle">{{ $user->position }}</td>
                                    <td style="vertical-align: middle;text-align: center"><code>{{ $user->profile }}</code></td>
                                    <td style="vertical-align: middle;text-align: center">
                                        <button class="btn btn-flat btn-sm @if($user->status === "Active") btn-success @else btn-danger @endif">{{ $user->status }}</button>
                                    </td>
                                    <td style="vertical-align: middle;text-align: center">
                                        <a href="#editUser{{ $user->id }}" data-toggle="modal">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>


                                    <!-- Start Create User Modal -->
                                    <div class="modal fade" id="editUser{{ $user->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <form action="{{ route('user-management.update', $user->id) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-content no-radius">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-edit text-primary"></i> Edit User {{ $user->name }}</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('Name') }}<sup class="text-danger">*</sup></label>
                                                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror no-radius" name="name" value="{{ old('name', $user->name) }}" required autocomplete="name" autofocus>

                                                                @error('name')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('E-Mail Address') }}<sup class="text-danger">*</sup></label>
                                                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror no-radius" name="email" value="{{ old('email', $user->email) }}" required autocomplete="off">

                                                                @error('email')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('Position') }}<sup class="text-danger">*</sup></label>
                                                                <input type="text" class="form-control @error('position') is-invalid @enderror no-radius" name="position" value="{{ old('position', $user->position) }}" required autocomplete="off">

                                                                @error('position')
                                                                <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('User-Profile') }}<sup class="text-danger">*</sup></label>
                                                                <select class="form-control @error('profile') is-invalid @enderror no-radius" name="profile">
                                                                    <option value="{{ $user->getOriginal('profile') }}">{{ $user->profile }}</option>
                                                                    <option value="1">Super Admin</option>
                                                                    <option value="2">Admin</option>
                                                                    <option value="3">User</option>
                                                                </select>

                                                                @error('profile')
                                                                <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $message }}</strong>
                                                                    </span>
                                                                @enderror
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label>{{ __('Status') }}<sup class="text-danger">*</sup></label>
                                                                <select class="form-control @error('status') is-invalid @enderror no-radius" name="status">
                                                                    <option value="{{ $user->getOriginal('status') }}">{{ $user->status }}</option>
                                                                    <option value="1">Active</option>
                                                                    <option value="2">Suspended</option>
                                                                </select>

                                                                @error('profile')
                                                                <span class="invalid-feedback" role="alert">
                                                                        <strong>{{ $message }}</strong>
                                                                    </span>
                                                                @enderror
                                                            </div>

                                                            <div class="col-md-12 bg-gray-light border">
                                                                <div class="form-group col-md-12 mt-2">
                                                                    <label>{{ __('Password') }}<sup class="text-danger">*</sup></label>
                                                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror no-radius" name="password" autocomplete="new-password">

                                                                    @error('password')
                                                                    <span class="invalid-feedback" role="alert">
                                                                    <strong>{{ $message }}</strong>
                                                                </span>
                                                                    @enderror
                                                                </div>

                                                                <div class="form-group col-md-12">
                                                                    <label>{{ __('Confirm Password') }}<sup class="text-danger">*</sup></label>
                                                                    <input id="password-confirm" type="password" class="form-control no-radius" name="password_confirmation" autocomplete="new-password">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                        <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> Save Changes</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- End Create User Modal -->
                                </tr>
                                <?php $i++; ?>
                            @endforeach
                                </tbody>
                            </table>
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
