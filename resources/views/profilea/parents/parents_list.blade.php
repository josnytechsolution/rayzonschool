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
            <div class="row mb-2 mt-4">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">PARENTS LIST</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Parents Details</li>
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
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fa fa-users"></i> Parents List
                            </h3>

                            <div class="card-tools">
                                <div class="btn-group">
                                    <a href="{{ route('parent-details.create') }}" class="btn btn-primary btn-flat btn-sm float-right">
                                        <i class="fa fa-user-plus"></i> New Parent
                                    </a>

                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-download"></i> Export
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item text-danger" href="{{ route('parentDetailPDF') }}" target="_blank">
                                                <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                            </a>
                                            <a class="dropdown-item text-success" href="{{ route('parentDetailExcel') }}">
                                                <i class="fa fa-file-excel text-success"></i> Export To Excel
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table id="example1" class="table table-striped">
                                <thead>
                                <th>#</th>
                                <th>Parent ID</th>
                                <th>P. Contact</th>
                                <th>S. Contact</th>
                                <th>Email Address</th>
                                <th>F. Name</th>
                                <th>F. Contact</th>
                                <th>M. Name</th>
                                <th>M. Contact</th>
                                <th>Students</th>
                                <th>Action</th>
                                </thead>
                                <tbody>
                                <?php $i = 1; ?>
                                @foreach($parents as $parent)
                                    <tr>
                                        <td style="vertical-align: middle">{{ $i }}</td>
                                        <td style="vertical-align: middle">
                                            <a href="{{ route('parent-details.show', $parent->slug) }}" >
                                                <u>{{ $parent->parent_no }}</u>
                                            </a>
                                        </td>
                                        <td style="vertical-align: middle">{{ $parent->primary_contact }}</td>
                                        <td style="vertical-align: middle">{{ $parent->secondary_contact }}</td>
                                        <td style="vertical-align: middle">{{ $parent->primary_email }}</td>
                                        <td style="vertical-align: middle">{{ ucwords($parent->fname) }}</td>
                                        <td style="vertical-align: middle">{{ $parent->fcontact }}</td>
                                        <td style="vertical-align: middle">{{ $parent->mname }}</td>
                                        <td style="vertical-align: middle">{{ $parent->mcontact }}</td>
                                        <td style="vertical-align: middle;text-align:center">{{ $parent->students->count() }}</td>
                                        <td style="vertical-align: middle;text-align:center">
                                            <div class="btn-group">
                                                <div class="input-group-prepend ml-2">
                                                    <button type="button" class="btn btn-info btn-flat btn-sm btn-block dropdown-toggle" data-toggle="dropdown">
                                                        Action
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item text-success"  href="{{ route('parent-details.edit', $parent->slug) }}">
                                                            <i class="fa fa-edit text-success"></i> Edit Parent
                                                        </a>
                                                        <a class="dropdown-item text-danger"  href="#deleteParent{{ $parent->slug }}" data-toggle="modal" data-background="static">
                                                            <i class="fa fa-trash text-danger"></i> Delete Parent
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <!-- Start Delete Modal -->
                                        <div class="modal fade" id="deleteParent{{ $parent->slug }}" tabindex="-1" role="dialog" aria-hidden="true">

                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content no-radius">
                                                    <form action="{{ route('parent-details.destroy', $parent->slug) }}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        @method('DELETE')
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($parent->parent_no) }}</small></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body text-sm">
                                                            <div class="col-md-12 mb-3">
                                                                <div class="alert alert-warning" style="text-align: center">
                                                                    <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                    This action cannot be undone.<br>
                                                                    This will delete all information related to this this student.<br>
                                                                    Are you you want to delete<br> {{ strtoupper($parent->parent_no) }}?
                                                                </div>
                                                            </div>

                                                            <div class="col-md-12 mb-3">
                                                                <label>Enter Your Password<span class="text-danger"><sup>*</sup></span> </label>
                                                                <input type="password" name="password" class="form-control no-radius @error('password') is-invalid @enderror" required>
                                                                <small>This action requires your password</small>
                                                                @if($errors->has('password'))
                                                                    <p style="font-family:courier new;color:red;font-size:12px">
                                                                        {{ $errors->first('password') }}
                                                                    </p>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> No! Cancel</button>
                                                            <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Student</button>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Edit Modal -->
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
