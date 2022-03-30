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
            <div class="row mb-2 mt-4">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Edit An Expense</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Expenses</li>
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
                    <div class="card card-success card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-plus"></i> Edit Expense</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('expenses.update', $expense->slug) }}" method="post">
                                @csrf
                                @method('PUT')

                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Department</label>
                                        <select id="department" name="expense_department_id" class="form-control select2 @error('expense_department_id') is-invalid @enderror" >
                                            <option value="{{ $expense->expense_department_id }}">{{ $expense->expense_department->name }}</option>
                                            @foreach($departments as $department)
                                                <option value="{{ $department->id }}">{{ $department->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('expense_department_id'))
                                            <small class="text-danger">{{ $errors->first('expense_department_id') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Section</label>
                                        <select id="section" name="expense_section_id" class="form-control select2 @error('expense_section_id') is-invalid @enderror" >
                                            <option value="{{ $expense->expense_section_id }}">{{ $expense->expense_section->name }}</option>

                                        </select>
                                        @if($errors->has('expense_section_id'))
                                            <small class="text-danger">{{ $errors->first('expense_section_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Transport Vehicles</label>
                                        <select name="transport_fleet_id" class="form-control select2 @error('transport_fleet_id') is-invalid @enderror" >
                                            <option value="{{ $expense->transport_fleet_id }}">@if($expense->transport_fleet_id != NULL) {{ $expense->transport_fleet->name }} @else --Select Vehicle-- @endif</option>
                                            @foreach($fleets as $fleet)
                                                <option value="{{ $fleet->id }}">{{ $fleet->name." ".$fleet->reg_no }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('transport_fleet_id'))
                                            <small class="text-danger">{{ $errors->first('transport_fleet_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Expense Description</label>
                                        <input type="text" name="description" class="form-control @error('description') is-invalid @enderror no-radius" value="{{ old('description', $expense->description) }}">
                                        @if($errors->has('description'))
                                            <small class="text-danger">{{ $errors->first('description') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Expense Date</label>
                                        <input type="date" name="expense_date" class="form-control @error('expense_date') is-invalid @enderror no-radius" value="{{ old('expense_date', $expense->expense_date) }}">
                                        @if($errors->has('expense_date'))
                                            <small class="text-danger">{{ $errors->first('expense_date') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Expense Amount</label>
                                        <input type="text" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius" value="{{ old('amount', $expense->amount) }}">
                                        @if($errors->has('amount'))
                                            <small class="text-danger">{{ $errors->first('amount') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Payment Type</label>
                                        <select name="payment_type" class="form-control @error('payment_type') is-invalid @enderror" >
                                            <option value="{{ $expense->getOriginal('payment_type') }}">{{ $expense->payment_type }}</option>
                                            <option value="1">Cash</option>
                                            <option value="2">Cheque</option>
                                            <option value="3">Deposit/Transfer</option>
                                            <option value="4">Mobile Transfer</option>
                                        </select>
                                        @if($errors->has('payment_type'))
                                            <small class="text-danger">{{ $errors->first('payment_type') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Debit Bank/Account</label>
                                        <select name="bank_id" class="form-control @error('bank_id') is-invalid @enderror" >
                                            <option value="{{ $expense->getOriginal('bank_id') }}">{{ $expense->bank->name." ".$expense->bank->account_no }}</option>
                                            @foreach($banks as $bank)
                                                <option value="{{ $bank->id }}">{{ $bank->name." ".$bank->account_no }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('bank_id'))
                                            <small class="text-danger">{{ $errors->first('bank_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Client's Account/Till/Paybill No</label>
                                        <input type="text" name="account_no" class="form-control @error('account_no') is-invalid @enderror no-radius" value="{{ old('account_no', $expense->account_no) }}">
                                        @if($errors->has('account_no'))
                                            <small class="text-danger">{{ $errors->first('account_no') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-4 mt-3">
                                        <label>Reference/Cheque No.</label>
                                        <input type="text" name="ref_no" class="form-control @error('ref_no') is-invalid @enderror no-radius" value="{{ old('ref_no', $expense->ref_no) }}">
                                        @if($errors->has('ref_no'))
                                            <small class="text-danger">{{ $errors->first('ref_no') }}</small>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-12 mt-3">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Save Changes
                                        </button>
                                    </div>
                                </div>
                            </form>
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
