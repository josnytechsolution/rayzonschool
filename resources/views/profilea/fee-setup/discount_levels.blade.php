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
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Discount Levels</h1>
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

                <div class="col-md-12 mb-2">
                    <button type="button" class="btn btn-primary btn-flat float-right" data-toggle="modal" data-target="#createDiscount">
                        <i class="fa fa-plus"></i> Create Discount Level
                    </button>
                </div>

                <div class="col-md-12">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">Discount Level List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>DISCOUNT NAME</th>
                                    <th>DISCOUNT</th>
                                    <th>TYPE</th>
                                    <th>STATUS</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($discount_levels as $discount_level)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $discount_level->name }}</td>
                                    <td>{{ $discount_level->discount }}</td>
                                    <td>{{ $discount_level->type }}</td>
                                    <td>
                                        @if($discount_level->status === 'Active')
                                            <button type="button" class="btn btn-success btn-xs btn-flat">
                                                {{ $discount_level->status }}
                                            </button>
                                        @else
                                            <button type="button" class="btn btn-danger btn-xs btn-flat">
                                                {{ $discount_level->status }}
                                            </button>
                                        @endif
                                    </td>
                                    <td class="text-center">
                                        @if($discount_level->status === 'Active')
                                            <a data-toggle="modal" href="#editDiscount{{ $discount_level->id }}">
                                                <i class="fa fa-edit text-success"></i>
                                            </a>
                                        @else
                                            <i class="fa fa-edit text-secondary"></i>
                                        @endif
                                    </td>
                                    <td class="text-center">
                                        @if($discount_level->status === 'Active')
                                            <a href="#deleteDiscount{{ $discount_level->id }}" data-toggle="modal">
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                        @else
                                            <i class="fa fa-trash text-secondary"></i>
                                        @endif
                                    </td>
                                </tr>

                                <!-- Start Create Class Fee Modal -->
                                <div class="modal fade" id="editDiscount{{ $discount_level->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('discount-levels.update', $discount_level->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">Edit {{ $discount_level->name }} Discount Level</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Discount Name</label>
                                                            <input type="text" name="name" class="form-control form-control-border @error('name') is-invalid @enderror no-radius" value="{{ old('name', $discount_level->name) }}">
                                                            @if($errors->has('name'))
                                                                <small class="text-danger">{{ $errors->first('name') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Discount Type</label>
                                                            <select name="type" class="form-control form-control-border @error('type') is-invalid @enderror no-radius" >
                                                                <option value="{{ $discount_level->type }}">{{ ucwords($discount_level->type) }}</option>
                                                                <option value="fixed">Fixed</option>
                                                                <option value="percentage">Percentage</option>
                                                            </select>
                                                            @if($errors->has('type'))
                                                                <small class="text-danger">{{ $errors->first('type') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Fee Amount</label>
                                                            <input type="text" name="discount" class="form-control @error('discount') is-invalid @enderror no-radius" value="{{ old('discount', $discount_level->discount) }}">
                                                            @if($errors->has('discount'))
                                                                <small class="text-danger">{{ $errors->first('discount') }}</small>
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
                                <div class="modal fade" id="deleteDiscount{{ $discount_level->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('discount-levels.destroy', $discount_level->id) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Class Fee</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this Discount Level.<br>
                                                            Are you you want to delete this Class Fee?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Class Fee</button>
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
                <div class="modal fade" id="createDiscount" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content no-radius">
                            <form action="{{ route('discount-levels.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Create Discount Level</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12 mt-2">
                                            <label>Discount Name</label>
                                            <input type="text" name="name" class="form-control form-control-border @error('name') is-invalid @enderror no-radius" value="{{ old('name') }}">
                                            @if($errors->has('name'))
                                                <small class="text-danger">{{ $errors->first('name') }}</small>
                                            @endif
                                        </div>
                                        <div class="form-group col-md-12 mt-2">
                                            <label>Discount Type</label>
                                            <select name="type" class="form-control form-control-border @error('type') is-invalid @enderror no-radius" >
                                                <option value="">--Select Type--</option>
                                                <option value="fixed">Fixed</option>
                                                <option value="percentage">Percentage</option>
                                            </select>
                                            @if($errors->has('type'))
                                                <small class="text-danger">{{ $errors->first('type') }}</small>
                                            @endif
                                        </div>
                                        <div class="form-group col-md-12 mt-2">
                                            <label>Fee Amount</label>
                                            <input type="text" name="discount" class="form-control form-control-border @error('discount') is-invalid @enderror no-radius" value="{{ old('discount') }}">
                                            @if($errors->has('discount'))
                                                <small class="text-danger">{{ $errors->first('discount') }}</small>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Save Discount Level</button>
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
