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
                    <h1 class="m-0 text-dark">Class Managers</h1>
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
                            <h3 class="card-title"><i class="fa fa-user-graduate"></i> Assign Class Manager</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('class-managers.store') }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Classroom</label>
                                        <select name="classroom_id" class="form-control select2 @error('classroom_id') is-invalid @enderror no-radius">
                                              <option value="">--Select Classroom--</option>
                                            @foreach($classrooms as $classroom)
                                               <option value="{{ $classroom->id }}">{{ ucwords($classroom->long_name) }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('classroom_id'))
                                            <small class="text-danger">{{ $errors->first('classroom_id') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Teacher</label>
                                        <select name="staff_member_id" class="form-control select2 @error('staff_member_id') is-invalid @enderror no-radius">
                                            <option value="">--Select Teacher--</option>
                                            @foreach($teachers as $teacher)
                                                <option value="{{ $teacher->id }}">{{ ucwords($teacher->name) }} - {{ $teacher->staff_section->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('staff_member_id'))
                                            <small class="text-danger">{{ $errors->first('staff_member_id') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Save Class Manager
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
                            <h3 class="card-title">Class Managers List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>CLASSROOM</th>
                                    <th>MANAGER</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($classManagers as $classManager)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $classManager->classroom->long_name }}</td>
                                    <td>{{ $classManager->staff_member->name }}</td>
                                    <td class="text-center">
                                        <a href="#editManager{{ $classManager->id }}" data-toggle="modal">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteManager{{ $classManager->id }}" data-toggle="modal">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="editManager{{ $classManager->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('class-managers.update', $classManager->id) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-edit"></i> Edit Class Manager</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                        <div class="row">
                                                            <div class="form-group col-md-12 mt-2">
                                                                <label>Classroom</label>
                                                                <select name="classroom" class="form-control select2 @error('classroom') is-invalid @enderror no-radius">
                                                                    <option value="{{ $classManager->getOriginal('classroom_id') }}">{{ ucwords($classManager->classroom->long_name) }}</option>
                                                                    @foreach($classrooms as $classroom)
                                                                        <option value="{{ $classroom->id }}">{{ ucwords($classroom->long_name) }}</option>
                                                                    @endforeach
                                                                </select>
                                                                @if($errors->has('classroom'))
                                                                    <small class="text-danger">{{ $errors->first('classroom') }}</small>
                                                                @endif
                                                            </div>
                                                            <div class="form-group col-md-12 mt-2">
                                                                <label>Teacher</label>
                                                                <select name="staff_member" class="form-control select2 @error('staff_member') is-invalid @enderror no-radius">
                                                                    <option value="{{ $classManager->getOriginal('staff_member_id') }}">{{ ucwords($classManager->staff_member->name)." - ".$classManager->staff_member->staff_section->name }}</option>
                                                                    @foreach($teachers as $teacher)
                                                                        <option value="{{ $teacher->id }}">{{ ucwords($teacher->name) }} - {{ $teacher->staff_section->name }}</option>
                                                                    @endforeach
                                                                </select>
                                                                @if($errors->has('staff_member'))
                                                                    <small class="text-danger">{{ $errors->first('staff_member') }}</small>
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
                                <div class="modal fade" id="deleteManager{{ $classManager->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('class-managers.destroy', $classManager->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Class Manager</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this class manager.<br>
                                                            Are you you want to delete?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Class Manager</button>
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
