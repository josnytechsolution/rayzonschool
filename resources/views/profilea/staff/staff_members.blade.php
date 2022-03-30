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
                    <h1 class="m-0 text-dark">STAFF MEMBERS</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Staff Management</li>
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
                <div class="col-md-12">@include('errors')</div>

                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-users"></i> STAFF MEMBERS LIST</h3>
                            <div class="card-tools">
                                <a href="{{ route('staff-members.create') }}" class="btn btn-primary btn-flat"><i class="fa fa-user-plus"></i> Add Member </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>EMP NO</th>
                                    <th>MEMBER NAME</th>
                                    <th>DEPARTMENT</th>
                                    <th>SECTION</th>
                                    <th>ID NUMBER</th>
                                    <th>REG. DATE</th>
                                    <th>CONTACT</th>
                                    <th>EMAIL ADDRESS</th>
                                    <th>ACTION</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($members as $member)
                                <tr>
                                    <td style="vertical-align: middle">{{ $i }}</td>
                                    <td style="vertical-align: middle">
                                        <a href="{{ route('staff-members.show', $member->slug) }}"><u>{{ $member->member_no }}</u></a>
                                    </td>
                                    <td style="vertical-align: middle">{{ $member->name }}</td>
                                    <td style="vertical-align: middle">{{ $member->staff_department->name }}</td>
                                    <td style="vertical-align: middle">{{ $member->staff_section->name }}</td>
                                    <td style="vertical-align: middle">{{ $member->idno }}</td>
                                    <td style="vertical-align: middle">{{ $member->reg_date }}</td>
                                    <td style="vertical-align: middle">{{ $member->phoneno1 }}</td>
                                    <td style="vertical-align: middle">{{ $member->email }}</td>
                                    <td style="vertical-align: middle" class="text-center">
                                       <div class="input-group-prepend">
                                           <button type="button" class="btn btn-info btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                               <i class="fa fa-cog"></i>
                                           </button>
                                           <div class="dropdown-menu">
                                               <a href="{{ route('staff-members.show', $member->slug) }}" class="text-primary dropdown-item">
                                                   <i class="fa fa-eye text-primary"></i> View Member
                                               </a>
                                               <a href="{{ route('staff-members.edit', $member->slug) }}" class="text-success dropdown-item">
                                                   <i class="fa fa-edit text-success"></i> Edit Member
                                               </a>
                                               <div class="dropdown-divider"></div>
                                               <a href="#deleteMember{{ $member->slug }}" class="text-danger dropdown-item" data-toggle="modal">
                                                   <i class="fa fa-trash text-danger"></i> Delete Member
                                               </a>
                                           </div>
                                       </div>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteMember{{ $member->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('staff-members.destroy', $member->slug) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete {{ strtoupper($member->name) }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this Section.<br>
                                                            Are you you want to delete<br> {{ strtoupper($member->name) }}?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Member</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>

                                </div>
                                <!-- End Delete Modal -->

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
