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
                    <h1 class="m-0 text-dark">Payroll Parameters</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Staff Payroll</li>
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
                <div class="col-md-12">@include('errors')</div>

                <div class="col-md-12">
                    <!-- Application buttons -->
                    <div class="card no-radius">
                        <div class="card-body">
                            <a href="{{ route('payroll-parameters.index') }}" class="btn btn-app">
                                <span class="badge bg-success">{{ $parameters->count() }}</span>
                                <i class="fas fa-th"></i> parameters
                            </a>
                            <a class="btn btn-app">
                                <i class="fas fa-wrench"></i> settings
                            </a>
                            <a class="btn btn-app">
                                <i class="fas fa-coins"></i> salaries
                            </a>
                            <a class="btn btn-app">
                                <i class="fas fa-plus"></i> allowances
                            </a>
                            <a class="btn btn-app">
                                <i class="fas fa-minus"></i> deductions
                            </a>
                            <a class="btn btn-app">
                                <i class="fas fa-barcode"></i> payslip
                            </a>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>

                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"> <i class="fa fa-th"></i> PAYROLL PARAMETERS LIST</h3>
                            <div class="card-tools">
                                <a href="#addParameter" class="btn btn-outline-primary btn-sm btn-flat" data-toggle="modal">
                                    <i class="fa fa-plus-circle"></i> Payroll Parameter
                                </a>
                            </div>

                            <!-- Start Modal -->
                            <div class="modal fade" id="addParameter" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content no-radius">
                                        <form action="{{ route('payroll-parameters.store') }}" method="post" enctype="multipart/form-data">
                                            @csrf

                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-plus-circle text-primary"></i> Add Parameter</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body text-sm">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label>Parameter Name <sup class="text-danger">required</sup></label>
                                                        <input type="text" name="name" class="form-control form-control-border @error('name') is-invalid @enderror no-radius" value="{{ old('name') }}">
                                                        @if($errors->has('name'))
                                                            <small class="text-danger">{{ $errors->first('name') }}</small>
                                                        @endif
                                                    </div>
                                                    <div class="form-group col-md-12 mt-2">
                                                        <label>Parameter Description <sup class="text-danger">required</sup></label>
                                                        <input type="text" name="description" class="form-control form-control-border @error('description') is-invalid @enderror no-radius" value="{{ old('description') }}">
                                                        @if($errors->has('description'))
                                                            <small class="text-danger">{{ $errors->first('description') }}</small>
                                                        @endif
                                                    </div>
                                                    <div class="form-group col-md-12 mt-2">
                                                        <label>Parameter Type <sup class="text-danger">required</sup></label>
                                                        <select name="type" class="form-control @error('type') is-invalid @enderror no-radius">
                                                            <option value="">--Select Option--</option>
                                                            <option value="allowance">allowance</option>
                                                            <option value="deduction">deduction</option>
                                                        </select>
                                                        @if($errors->has('type'))
                                                            <small class="text-danger">{{ $errors->first('type') }}</small>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Save Parameter</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>

                            </div>
                            <!-- End Modal -->
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>PARAMETER NAME</th>
                                    <th>DESCRIPTION</th>
                                    <th>PARAMETER TYPE</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($parameters as $parameter)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $parameter->name }}</td>
                                    <td>{{ $parameter->description }}</td>
                                    <td class="@if($parameter->type === "allowance") text-info @else text-warning @endif">{{ $parameter->type }}</td>
                                    <td class="text-center">
                                        <a href="#editParameter{{ $parameter->id }}" class="text-success" data-toggle="modal">
                                            edit_parameter
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteParameter{{ $parameter->id }}" class="text-danger" data-toggle="modal">
                                            delete_parameter
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Modal -->
                                <div class="modal fade" id="editParameter{{ $parameter->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('payroll-parameters.update', $parameter->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('PUT')

                                                <div class="modal-header">
                                                    <h5 class="modal-title text-success" id="exampleModalCenterTitle"><i class="fa fa-edit"></i> Edit Parameter</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <label>Name <sup class="text-danger">required</sup></label>
                                                            <input type="text" name="name" class="form-control form-control-border @error('name') is-invalid @enderror no-radius" value="{{ old('name', $parameter->name) }}">
                                                            @if($errors->has('name'))
                                                                <small class="text-danger">{{ $errors->first('name') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Description <sup class="text-danger">required</sup></label>
                                                            <input type="text" name="description" class="form-control form-control-border @error('description') is-invalid @enderror no-radius" value="{{ old('description', $parameter->description) }}">
                                                            @if($errors->has('description'))
                                                                <small class="text-danger">{{ $errors->first('description') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Type <sup class="text-danger">required</sup></label>
                                                            <select name="type" class="form-control form-control-border @error('type') is-invalid @enderror no-radius">
                                                                <option value="{{ $parameter->type }}">{{ $parameter->type }}</option>
                                                                <option value="allowance">allowance</option>
                                                                <option value="deduction">deduction</option>
                                                            </select>
                                                            @if($errors->has('type'))
                                                                <small class="text-danger">{{ $errors->first('type') }}</small>
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
                                <!-- End Modal -->

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteParameter{{ $parameter->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('payroll-parameters.destroy', $parameter->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete {{ strtoupper($parameter->name) }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this parameter.<br>
                                                            Are you you want to delete<br> {{ strtoupper($parameter->name) }}?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Parameter</button>
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
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
