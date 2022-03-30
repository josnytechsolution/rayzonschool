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
            <div class="row mb-2 mt-3">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">ACADEMIC SUBJECTS</h1>
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
                <div class="col-md-12">@include('errors')</div>
                <div class="col-md-4">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-sitemap"></i> CREATE ACADEMIC SUBJECT</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('academic-subjects.store') }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Code</label>
                                        <input type="text" name="code" class="form-control @error('code') is-invalid @enderror no-radius" value="{{ old('code') }}">
                                        <small class="text-muted">For example: ENG, KISW, SST, ....</small>
                                        @if($errors->has('code'))
                                            <small class="text-danger">{{ $errors->first('code') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Subject Name</label>
                                        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('name') }}">
                                        @if($errors->has('name'))
                                            <small class="text-danger">{{ $errors->first('name') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Save Subject
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title">ACADEMIC SUBJECTS LIST</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>SHORT NAME</th>
                                    <th>LONG NAME</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($academicSubjects as $academicSubject)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $academicSubject->code }}</td>
                                    <td>{{ $academicSubject->name }}</td>
                                    <td class="text-center">
                                        <a href="#editSubject{{ $academicSubject->id }}" data-toggle="modal">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteSubject{{ $academicSubject->id }}" data-toggle="modal">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="editSubject{{ $academicSubject->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('academic-subjects.update', $academicSubject->id) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-edit"></i> Edit Academic Subject</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                        <div class="row">
                                                            <div class="form-group col-md-12 mt-2">
                                                                <label>Code</label>
                                                                <input type="text" name="code" class="form-control @error('code') is-invalid @enderror no-radius" value="{{ old('code', $academicSubject->code) }}">
                                                                <small class="text-muted">For example: ENG, KISW, SST, ....</small>
                                                                @if($errors->has('code'))
                                                                    <small class="text-danger">{{ $errors->first('code') }}</small>
                                                                @endif
                                                            </div>
                                                            <div class="form-group col-md-12 mt-2">
                                                                <label>Subject Name</label>
                                                                <input type="text" name="name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('name', $academicSubject->name) }}">
                                                                @if($errors->has('name'))
                                                                    <small class="text-danger">{{ $errors->first('name') }}</small>
                                                                @endif
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                    <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> Save Changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Edit Modal -->

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteSubject{{ $academicSubject->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('academic-subjects.destroy', $academicSubject->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete {{ $academicSubject->name }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this subject.<br>
                                                            Are you you want to delete<br> {{ $academicSubject->name }}?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Subject</button>
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
