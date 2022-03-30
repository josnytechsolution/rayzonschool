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
                    <h1 class="m-0 text-dark">Subject Teachers</h1>
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
                            <h3 class="card-title"><i class="fa fa-user-graduate"></i> Assign Subject Teacher</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('subject-teachers.store') }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Teacher</label>
                                        <select name="staff_member_id" class="form-control select2 @error('staff_member_id') is-invalid @enderror no-radius">
                                            <option value="">--Select Teacher--</option>
                                            @foreach($staffMembers as $staffMember)
                                                <option value="{{ $staffMember->id }}">{{ strtoupper($staffMember->name) }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('staff_member_id'))
                                            <small class="text-danger">{{ $errors->first('staff_member_id') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Classroom</label>
                                        <select id="grade" name="classroom_id" class="form-control select2 @error('classroom_id') is-invalid @enderror no-radius">
                                              <option value="">--Select Subject--</option>
                                            @foreach($classrooms as $classroom)
                                               <option value="{{ $classroom->id }}">{{ strtoupper($classroom->long_name) }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('classroom_id'))
                                            <small class="text-danger">{{ $errors->first('classroom_id') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Class Subject</label>
                                        <select id="subjects" name="class_subject_id" class="form-control select2 @error('class_subject_id') is-invalid @enderror no-radius">
                                            <option value="">--Select Subject--</option>
                                        </select>
                                        @if($errors->has('class_subject_id'))
                                            <small class="text-danger">{{ $errors->first('class_subject_id') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right btn-block no-radius" >
                                            <i class="fa fa-save"></i> Save Subject Teacher
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
                            <h3 class="card-title">Subject Teachers List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>TEACHER</th>
                                    <th>SUBJECT</th>
                                    <th>CLASSROOM</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($subjectTeachers as $subjectTeacher)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $subjectTeacher->staff_member->name }}</td>
                                    <td>{{ $subjectTeacher->class_subject->name }}</td>
                                    <td>{{ $subjectTeacher->classroom->long_name }}</td>
                                    <td class="text-center">
                                        <a href="#editSubject{{ $subjectTeacher->id }}" data-toggle="modal">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteSubject{{ $subjectTeacher->id }}" data-toggle="modal">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="editSubject{{ $subjectTeacher->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('subject-teachers.update', $subjectTeacher->id) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-edit"></i> Edit Subject Teacher</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Teacher</label>
                                                            <select name="staff_member_id" class="form-control select2 @error('staff_member_id') is-invalid @enderror no-radius">
                                                                <option value="{{ $subjectTeacher->staff_member_id }}">{{ $subjectTeacher->staff_member->name }}</option>
                                                                @foreach($staffMembers as $staffMember)
                                                                    <option value="{{ $staffMember->id }}">{{ strtoupper($staffMember->name) }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('staff_member_id'))
                                                                <small class="text-danger">{{ $errors->first('staff_member_id') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Classroom</label>
                                                            <select id="grady" name="classroom_id" class="form-control select2 @error('classroom_id') is-invalid @enderror no-radius">
                                                                <option value="{{ $subjectTeacher->classroom_id }}">{{ $subjectTeacher->classroom->long_name }}</option>
                                                                @foreach($classrooms as $classroom)
                                                                    <option value="{{ $classroom->id }}">{{ strtoupper($classroom->long_name) }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('classroom_id'))
                                                                <small class="text-danger">{{ $errors->first('classroom_id') }}</small>
                                                            @endif
                                                        </div>
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Class Subject</label>
                                                            <select id="subjecty" name="class_subject_id" class="form-control select2 @error('class_subject_id') is-invalid @enderror no-radius">
                                                                <option value="{{ $subjectTeacher->class_subject_id }}">{{ $subjectTeacher->class_subject->name }}</option>
                                                            </select>
                                                            @if($errors->has('class_subject_id'))
                                                                <small class="text-danger">{{ $errors->first('class_subject_id') }}</small>
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
                                <div class="modal fade" id="deleteSubject{{ $subjectTeacher->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('subject-teachers.destroy', $subjectTeacher->id) }}" method="post" enctype="multipart/form-data">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Subject Teacher</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this subject teacher.<br>
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Subject Teacher</button>
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
