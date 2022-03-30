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
                    <h1 class="m-0 text-dark">Expenses</h1>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">@include('errors')</div>
                <div class="col-md-12 mb-2">
                    <a href="{{ route('expenses.create') }}" class="btn btn-primary btn-flat float-right">
                        <i class="fa fa-plus"></i> Add An Expense
                    </a>
                </div>
                <div class="col-md-12">
                    <div class="card card-primary card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title">{{ date('Y') }} EXPENSES LIST  <span class="text-danger">KES. {{ number_format($expenses->sum('amount'), 2) }}</span></h3>
                            <div class="card-tools">
                                <div class="btn-group float-right">

                                    <div class="input-group-prepend mr-2">
                                        <button type="button" class="btn btn-danger btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-download"></i> Export PDF
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="" target="_blank">
                                                Export General
                                            </a>
                                            <a class="dropdown-item" href="">
                                                Export Summary
                                            </a>
                                        </div>
                                    </div>
                                    <div class="input-group-prepend ml-2">
                                        <button type="button" class="btn btn-success btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-download"></i> Export To Excel
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="{{ route('exportExpense') }}">
                                                Export General
                                            </a>
                                            <a class="dropdown-item" href="{{ route('exportExpenseSummary', date('Y')) }}">
                                                Export Summary
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                <div class="modal fade" id="deleteDepartment{{ $expense->slug }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Expense</button>
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
