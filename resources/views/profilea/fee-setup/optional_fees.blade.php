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
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Optional Fees</h1>
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

                <div class="col-md-12 mb-2">
                    <button type="button" class="btn btn-primary btn-flat float-right" data-toggle="modal" data-target="#createFee">
                        <i class="fa fa-plus"></i> Create Optional Fee
                    </button>
                </div>

                <div class="col-md-12">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">Optional Fees List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>YEAR</th>
                                    <th>FEE NAME</th>
                                    <th>AMOUNT</th>
                                    <th>STATUS</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($optional_fees as $optional_fee)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $optional_fee->current_session->name }}</td>
                                    <td>{{ $optional_fee->fee_parameter->name }}</td>
                                    <td>KES {{ number_format($optional_fee->amount) }}</td>
                                    <td>
                                        @if($optional_fee->status === 'Active')
                                            <button type="button" class="btn btn-success btn-xs btn-flat">
                                                {{ $optional_fee->status }}
                                            </button>
                                        @else
                                            <button type="button" class="btn btn-danger btn-xs btn-flat">
                                                {{ $optional_fee->status }}
                                            </button>
                                        @endif
                                    </td>
                                    <td class="text-center">
                                        @if($optional_fee->status === 'Active')
                                            <a data-toggle="modal" href="#editFee{{ $optional_fee->slug }}">
                                                <i class="fa fa-edit text-success"></i>
                                            </a>
                                        @else
                                            <i class="fa fa-edit text-secondary"></i>
                                        @endif

                                    </td>
                                    <td class="text-center">
                                        @if($optional_fee->status === 'Active')
                                            <a href="#deleteFee{{ $optional_fee->slug }}" data-toggle="modal">
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                        @else
                                            <i class="fa fa-trash text-secondary"></i>
                                        @endif

                                    </td>
                                </tr>

                                <!-- Start Create Class Fee Modal -->
                                <div class="modal fade" id="editFee{{ $optional_fee->slug }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('optional-fees.update', $optional_fee->slug) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">Edit {{ $optional_fee->name }} Optional Fee</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Financial Session</label>
                                                            <select name="current_session" class="form-control select2 @error('current_session') is-invalid @enderror no-radius">
                                                                <option value="{{ $optional_fee->current_session->id }}">{{ $optional_fee->current_session->name }}</option>
                                                                @foreach($current_sessions as $current_session)
                                                                    <option value="{{ $current_session->id }}">{{ ucwords($current_session->name) }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('current_session'))
                                                                <small class="text-danger">{{ $errors->first('current_session') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Fee Parameter</label>
                                                            <select name="fee_parameter" class="form-control select2 @error('fee_parameter') is-invalid @enderror no-radius">
                                                                <option value="{{ $optional_fee->fee_parameter_id }}">{{ $optional_fee->fee_parameter->name }}</option>
                                                                @foreach($fee_parameters as $fee_parameter)
                                                                    <option value="{{ $fee_parameter->id }}">{{ ucwords($fee_parameter->name) }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('grade'))
                                                                <small class="text-danger">{{ $errors->first('grade') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Fee Amount</label>
                                                            <input type="text" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius" value="{{ old('amount', $optional_fee->amount) }}">
                                                            @if($errors->has('amount'))
                                                                <small class="text-danger">{{ $errors->first('amount') }}</small>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Save Changes</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>

                                </div>
                                <!-- End Create Class Fee Modal -->

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteFee{{ $optional_fee->slug }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('optional-fees.destroy', $optional_fee->slug) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Optional Fee</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this fee.<br>
                                                            Are you you want to delete this Optional Fee?
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 mb-3">
                                                        <label>Enter Administrator Password<span class="text-danger"><sup>*</sup></span> </label>
                                                        <input type="password" name="password" class="form-control no-radius @error('password') is-invalid @enderror" required>
                                                        <small>This action requires Admin rights</small>
                                                        @if($errors->has('password'))
                                                            <p style="font-family:courier new;color:red;font-size:12px">
                                                                {{ $errors->first('password') }}
                                                            </p>
                                                        @endif
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> No! Cancel</button>
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Fee</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>

                                </div>
                                <!-- End Edit Modal -->

                                <?php $i++; ?>
                            @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Start Create Class Fee Modal -->
                <div class="modal fade" id="createFee" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content no-radius">
                            <form action="{{ route('optional-fees.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Create Optional Fee</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12 mt-2">
                                            <label>Financial Session</label>
                                            <select name="current_session" class="form-control select2 @error('current_session') is-invalid @enderror no-radius">
                                                <option value="">--Select Financial Session--</option>
                                                @foreach($current_sessions as $current_session)
                                                    <option value="{{ $current_session->id }}">{{ ucwords($current_session->name) }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('current_session'))
                                                <small class="text-danger">{{ $errors->first('current_session') }}</small>
                                            @endif
                                        </div>
                                        <div class="form-group col-md-12 mt-2">
                                            <label>Fee Parameter</label>
                                            <select name="fee_parameter" class="form-control select2 @error('fee_parameter') is-invalid @enderror no-radius">
                                                <option value="">--Select Fee Parameter--</option>
                                                @foreach($fee_parameters as $fee_parameter)
                                                    <option value="{{ $fee_parameter->id }}">{{ ucwords($fee_parameter->name) }}</option>
                                                @endforeach
                                            </select>
                                            @if($errors->has('grade'))
                                                <small class="text-danger">{{ $errors->first('grade') }}</small>
                                            @endif
                                        </div>
                                        <div class="form-group col-md-12 mt-2">
                                            <label>Fee Amount</label>
                                            <input type="text" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius">
                                            @if($errors->has('amount'))
                                                <small class="text-danger">{{ $errors->first('amount') }}</small>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Save Optional Fee</button>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
                <!-- End Create Class Fee Modal -->

            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
