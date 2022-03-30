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
                    <h1 class="m-0 text-dark">Financial Sessions</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Fees Setup</li>
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

                    @if (Session::has('error'))
                        <div class="alerts alert alert-danger">
                                <p class="mb-0 mt-0">{{ Session::get('error') }}</p>
                        </div>
                    @endif

                </div>
                <div class="col-md-4">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-plus"></i> Create Financial Session</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('financial-sessions.store') }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12 mt-2">
                                        <label>Academic Term</label>
                                        <select name="academic_term" class="form-control select2 @error('academic_term') is-invalid @enderror no-radius">
                                            <option value="">--Select Financial Year--</option>
                                            @foreach($academic_terms as $academic_term)
                                                <option value="{{ $academic_term->id }}">{{ $academic_term->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('academic_term'))
                                            <small class="text-danger">{{ $errors->first('academic_term') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label>Fianacial Year</label>
                                        <select name="financial_year" class="form-control select2 @error('financial_year') is-invalid @enderror no-radius">
                                            <option value="">--Select Financial Year--</option>
                                         @foreach($financial_years as $financial_year)
                                             <option value="{{ $financial_year->id }}">{{ $financial_year->name }}</option>
                                         @endforeach
                                        </select>
                                        @if($errors->has('financial_year'))
                                            <small class="text-danger">{{ $errors->first('financial_year') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Save Session
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
                            <h3 class="card-title">Financial Sessions List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>SESSION</th>
                                    <th>YEAR</th>
                                    <th>TERM</th>
                                    <th>STATUS</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($financial_sessions as $financial_session)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $financial_session->name }}</td>
                                    <td>{{ $financial_session->financial_year->name }}</td>
                                    <td>{{ $financial_session->academic_term->name }}</td>
                                    <td>{{ $financial_session->status }}</td>
                                    <td class="text-center">
                                        @if($financial_session->status === "Future")
                                            <a href="#editFSess{{ $financial_session->slug }}" data-toggle="modal">
                                                <i class="fa fa-edit text-success"></i>
                                            </a>
                                        @else
                                            <a href="javascript:;" class="toastrDefaultError">
                                                <i class="fa fa-edit text-gray"></i>
                                            </a>
                                        @endif
                                    </td>
                                    <td class="text-center">
                                        @if($financial_session->status === "Future")
                                            <a href="#deleteFSess{{ $financial_session->slug }}" data-toggle="modal">
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                        @else
                                            <a href="javascript:;" class="toastrDefaultError">
                                                <i class="fa fa-trash text-gray"></i>
                                            </a>
                                        @endif
                                    </td>
                                </tr>

                                <!-- Start Edit Modal -->
                                <div class="modal fade" id="editFSess{{ $financial_session->slug }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('financial-sessions.update', $financial_session->slug) }}" method="post">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-edit text-success"></i> Edit Session {{ strtoupper($financial_session->name) }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="row">
                                                        <div class="form-group col-md-12 mt-2">
                                                            <label>Academic Term</label>
                                                            <select name="academic_term" class="form-control select2 @error('academic_term') is-invalid @enderror no-radius">
                                                                <option value="{{ $financial_session->academic_term_id }}">{{ $financial_session->academic_term->name }}</option>
                                                                @foreach($academic_terms as $academic_term)
                                                                    <option value="{{ $academic_term->id }}">{{ $academic_term->name }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('academic_term'))
                                                                <small class="text-danger">{{ $errors->first('academic_term') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="form-group col-md-12">
                                                            <label>Fianacial Year</label>
                                                            <select name="financial_year" class="form-control select2 @error('financial_year') is-invalid @enderror no-radius">
                                                                <option value="{{ $financial_session->financial_year_id }}">{{ $financial_session->financial_year->name }}</option>
                                                                @foreach($financial_years as $financial_year)
                                                                    <option value="{{ $financial_year->id }}">{{ $financial_year->name }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('financial_year'))
                                                                <small class="text-danger">{{ $errors->first('financial_year') }}</small>
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
                                <div class="modal fade" id="deleteFSess{{ $financial_session->slug }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('financial-sessions.destroy', $financial_session->slug) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Class: {{ strtoupper($financial_session->name) }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this class.<br>
                                                            Are you you want to delete<br> {{ strtoupper($financial_session->name) }}?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Session</button>
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
