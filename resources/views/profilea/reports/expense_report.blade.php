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
            <div class="row mt-2">
                <div class="col-sm-6">
                    <h5 class="m-0 text-dark">
                        FILTER EXPENSES REPORT
                        <small>Reports</small>
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Reports</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <hr>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- Filter by date -->
                <div class="col-md-3">
                    <div class="card card-warning card-outline no-radius" style="border-bottom: 10px solid #ffc107">
                        <div class="card-header border-bottom-0">
                            <h3 class="card-title"> <i class="fa fa-filter text-warning"></i> FILTER BY DATE</h3>
                        </div>
                            <div class="card-body">
                                <form action="{{ route('filterByDate') }}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label>Date Between</label>
                                            <input type="date" name="from_date" class="form-control @error('from_date') is-invalid @enderror no-radius" value="{{ old('from_date') }}">

                                            @if($errors->has('from_date'))
                                                <small class="text-danger">{{ $errors->first('from_date') }}</small>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-12 mb-3">
                                            <label>And Date</label>
                                            <input type="date" name="to_date" class="form-control @error('to_date') is-invalid @enderror no-radius" value="{{ old('to_date') }}">
                                            @if($errors->has('to_date'))
                                                <small class="text-danger">{{ $errors->first('to_date') }}</small>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-12 mb-0">
                                            <button type="submit" class="btn btn-warning btn-flat btn-block no-radius" >
                                                Generate Reports
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>

                <!-- Filter by Department -->
                <div class="col-md-3">
                    <div class="card card-primary card-outline no-radius" style="border-bottom: 10px solid #007bff">
                        <div class="card-header border-bottom-0">
                            <h3 class="card-title"> <i class="fa fa-filter text-primary"></i> FILTER BY DEPARTMENT/SECTION</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('filterByDepartment') }}" method="POST">
                                @csrf
                                <div class="row">

                                    <div class="form-group col-md-6 mb-3">
                                        <label>Department</label>
                                        <select id="department" name="expense_department_id" class="form-control select2 @error('expense_department_id') is-invalid @enderror" >
                                            <option value="">--Select Department--</option>
                                            @foreach($departments as $department)
                                                <option value="{{ $department->id }}">{{ $department->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('expense_department_id'))
                                            <small class="text-danger">{{ $errors->first('expense_department_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-4">
                                        <label>Section</label>
                                        <select id="section" name="expense_section_id" class="form-control select2 @error('expense_section_id') is-invalid @enderror" >
                                            <option value="">--Select Section--</option>

                                        </select>
                                        @if($errors->has('expense_section_id'))
                                            <small class="text-danger">{{ $errors->first('expense_section_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-3">
                                        <label>Date Between</label>
                                        <input type="date" name="from_date" class="form-control @error('expense_date') is-invalid @enderror no-radius" value="{{ old('expense_date') }}">
                                        @if($errors->has('expense_date'))
                                            <small class="text-danger">{{ $errors->first('expense_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-3">
                                        <label>And Date</label>
                                        <input type="date" name="to_date" class="form-control @error('expense_date') is-invalid @enderror no-radius" value="{{ old('expense_date') }}">
                                        @if($errors->has('expense_date'))
                                            <small class="text-danger">{{ $errors->first('expense_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12 mb-0">
                                        <button type="submit" class="btn btn-primary btn-flat btn-block no-radius" >
                                            Generate Report
                                        </button>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Filter by Bank -->
                <div class="col-md-3">
                    <div class="card card-success card-outline no-radius" style="border-bottom: 10px solid #28a745">
                        <div class="card-header border-bottom-0">
                            <h3 class="card-title"> <i class="fa fa-filter text-success"></i> FILTER BY BANK</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('filterByBank') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12 mb-4">
                                        <label>Debit Bank/Account</label>
                                        <select name="bank_id" class="form-control select2 @error('bank_id') is-invalid @enderror" >
                                            <option value="">--Select Bank--</option>
                                            @foreach($banks as $bank)
                                                <option value="{{ $bank->id }}">{{ $bank->name." ".$bank->account_no }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('bank_id'))
                                            <small class="text-danger">{{ $errors->first('bank_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-3">
                                        <label>Date Between</label>
                                        <input type="date" name="from_date" class="form-control @error('expense_date') is-invalid @enderror no-radius" value="{{ old('expense_date') }}">
                                        @if($errors->has('expense_date'))
                                            <small class="text-danger">{{ $errors->first('expense_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-3">
                                        <label>And Date</label>
                                        <input type="date" name="to_date" class="form-control @error('expense_date') is-invalid @enderror no-radius" value="{{ old('expense_date') }}">
                                        @if($errors->has('expense_date'))
                                            <small class="text-danger">{{ $errors->first('expense_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12 mb-0">
                                        <button type="submit" class="btn btn-success btn-flat btn-block no-radius" >
                                            Generate Report
                                        </button>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Filter by Vehicle -->
                <div class="col-md-3">
                    <div class="card card-danger card-outline no-radius" style="border-bottom: 10px solid #dc3545">
                        <div class="card-header border-bottom-0">
                            <h3 class="card-title"> <i class="fa fa-filter text-danger"></i> FILTER BY VEHICLE</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('filterByVehicle') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="form-group col-md-12 mb-4">
                                        <label>Transport Vehicles</label>
                                        <select name="transport_fleet_id" class="form-control select2 @error('transport_fleet_id') is-invalid @enderror" >
                                            <option value="">--Select Vehicle--</option>
                                            @foreach($fleets as $fleet)
                                                <option value="{{ $fleet->id }}">{{ $fleet->name." ".$fleet->reg_no }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('transport_fleet_id'))
                                            <small class="text-danger">{{ $errors->first('transport_fleet_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-3">
                                        <label>Date Between</label>
                                        <input type="date" name="from_date" class="form-control @error('from_date') is-invalid @enderror no-radius" value="{{ old('from_date') }}">
                                        @if($errors->has('from_date'))
                                            <small class="text-danger">{{ $errors->first('from_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-6 mb-3">
                                        <label>And Date</label>
                                        <input type="date" name="to_date" class="form-control @error('to_date') is-invalid @enderror no-radius" value="{{ old('to_date') }}">
                                        @if($errors->has('to_date'))
                                            <small class="text-danger">{{ $errors->first('to_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12 mb-0">
                                        <button type="submit" class="btn btn-danger btn-flat btn-block no-radius" >
                                            Generate Report
                                        </button>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Expenses List -->
                <div class="col-md-12 mt-4">
                    <div class="card card-secondary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title">{{ date('Y') }} EXPENSES LIST <span class="text-danger">KES. {{ number_format($expenses->sum('amount'), 2) }}</span></h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>DEPARTMENT</th>
                                    <th>SECTION</th>
                                    <th>VEHICLE</th>
                                    <th>DESCRIPTION</th>
                                    <th>DATE</th>
                                    <th>AMOUNT</th>
                                    <th>P TYPE</th>
                                    <th>BANK</th>
                                    <th>ACCOUNT NO</th>
                                    <th>REF. NO</th>
                                    <th>ACTION</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $i = 1; ?>
                                @foreach($expenses as $expense)
                                    <tr>
                                        <td>{{ $i }}</td>
                                        <td>{{ $expense->expense_department->name }}</td>
                                        <td>{{ $expense->expense_section->name }}</td>
                                        <td>
                                            @if($expense->transport_fleet_id != NULL)
                                                {{ $expense->transport_fleet->reg_no }}
                                            @else
                                            @endif
                                        </td>
                                        <td>{{ $expense->description }}</td>
                                        <td>{{ $expense->expense_date }}</td>
                                        <td>{{ number_format($expense->amount,2) }}</td>
                                        <td>{{ $expense->payment_type }}</td>
                                        <td>{{ $expense->bank->name }}</td>
                                        <td>{{ $expense->account_no }}</td>
                                        <td>{{ $expense->ref_no }}</td>
                                        <td class="text-center">
                                            <a href="{{ route('expenses.edit', $expense->slug) }}" class="mr-4">
                                                <i class="fa fa-edit text-success"></i>
                                            </a>
                                            <a href="#deleteDepartment{{ $expense->slug }}" data-toggle="modal">
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                        </td>
                                    </tr>

                                    <!-- Start Delete Modal -->
                                    <div class="modal fade" id="deleteDepartment{{ $expense->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content no-radius">
                                                <form action="{{ route('expenses.destroy', $expense->slug) }}" method="post" enctype="multipart/form-data">
                                                    @csrf
                                                    @method('DELETE')
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete {{ strtoupper($expense->description) }}</h5>
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
                                                                Are you you want to delete<br> {{ strtoupper($expense->description) }}?
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
                                                        <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Department</button>
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
