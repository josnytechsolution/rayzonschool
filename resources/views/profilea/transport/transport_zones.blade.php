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
                    <h1 class="m-0 text-dark">Transport Zones</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">School Transport</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
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
                <div class="col-md-4">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-plus"></i> Add Transport Zone</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('transport-zones.store') }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label>Zone Name</label>
                                        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('name') }}">
                                        @if($errors->has('name'))
                                            <small class="text-danger">{{ $errors->first('name') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Long Name</label>
                                        <input type="text" name="long_name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('long_name') }}">
                                        @if($errors->has('long_name'))
                                            <small class="text-danger">{{ $errors->first('long_name') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Areas Covered</label>
                                        <textarea name="areas" class="form-control @error('areas') is-invalid @enderror no-radius" rows="3">{{ old('areas') }}</textarea>
                                        @if($errors->has('areas'))
                                            <small class="text-danger">{{ $errors->first('areas') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Save Zone
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">Transport Zones List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>LONG NAME</th>
                                    <th>AREAS</th>
                                    <th>STATUS</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($transport_zones as $transport_zone)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $transport_zone->name }}</td>
                                    <td>{{ $transport_zone->long_name }}</td>
                                    <td>{{ $transport_zone->areas }}</td>
                                    <td>{{ $transport_zone->status }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('transport-zones.edit', $transport_zone->slug) }}">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteZone{{ $transport_zone->slug }}" data-toggle="modal">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteZone{{ $transport_zone->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('transport-zones.destroy', $transport_zone->slug) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete {{ strtoupper($transport_zone->long_name) }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this Zone.<br>
                                                            Are you you want to delete<br> {{ strtoupper($transport_zone->long_name) }}?
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 mb-3">
                                                        <label>Enter Administrator Password<span class="text-danger"><sup>*</sup></span> </label>
                                                        <input type="password" name="password" class="form-control no-radius @error('password') is-invalid @enderror" required>
                                                        <small>This action requires Admin rights</small>
                                                        @if($errors->has('password'))
                                                            <p style="font-family:courier new;color:red;font-size:12">
                                                                {{ $errors->first('password') }}
                                                            </p>
                                                        @endif
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> No! Cancel</button>
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Class</button>
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
