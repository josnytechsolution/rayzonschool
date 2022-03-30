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
                        EDIT FEE PAYMENT
                        <small>
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-primary">{{ strtoupper($feePayment->student->admno) }}</span>
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-primary">{{ strtoupper($feePayment->student->name) }}</span>
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-danger">{{ strtoupper($feePayment->student->classroom->name) }}</span>
                        </small>
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Fees Collection</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <hr>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">@include('errors') </div>

                <div class="col-md-12">
                    <!-- Payment -->
                    <div class="card card-primary card-outline no-radius">
                <form action="{{ route('fee-payment.update', $feePayment->id) }}" method="post">
                    @csrf
                    @method('PUT')
                        <div class="card-body">
                            <div class="row">
                                <input type="hidden" name="pid" value="{{ $feePayment->id }}">
                                <div class="col-md-4 mb-3">
                                    <label>Admission Number</label>
                                    <input type="text" class="form-control no-radius" value="{{ $feePayment->student->admno }}" disabled>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label>Student Name</label>
                                    <input type="text" class="form-control no-radius" value="{{ $feePayment->student->name }}" disabled>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label>Classroom</label>
                                    <input type="text" class="form-control no-radius" value="{{ $feePayment->student->classroom->name }}" disabled>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label>Receipt No</label>
                                    <input type="text" class="form-control no-radius" value="{{ $feePayment->receipt_no }}" disabled>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label>Fees Paid</label>
                                    <input type="text" name="paid" class="form-control @error('paid') is-invalid @enderror no-radius" value="{{ old('paid', $feePayment->paid) }}">
                                    @if($errors->has('paid'))
                                        <small class="text-danger">{{ $errors->first('paid') }}</small>
                                    @endif
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label>Select Bank</label>
                                    <select name="bank_id" id="ebank" class="form-control @error('bank_id') is-invalid @enderror no-radius">
                                        <option value="{{ $feePayment->bank_id }}">{{ $feePayment->bank->name }}</option>
                                        @foreach($banks as $bank)
                                            <option value="{{ $bank->id }}">{{ $bank->name." ".$bank->account_no }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('bank_id'))
                                        <small class="text-danger">{{ $errors->first('bank_id') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label>Reference No.</label>
                                    <input type="text" name="ref_no" id="erefno" class="form-control @error('ref_no') is-invalid @enderror no-radius" value="{{ old('ref_no', $feePayment->ref_no) }}">
                                    @if($errors->has('ref_no'))
                                        <small class="text-danger">{{ $errors->first('ref_no') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label>Reference No. status</label><br/>
                                    <div id="estatus" style="border: 1px solid #C4C4C4;height: 37px"></div>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label>Pay Date</label>
                                    <input type="date" name="pay_date" class="form-control @error('pay_date') is-invalid @enderror no-radius" value="{{ old('pay_date', $feePayment->pay_date) }}">
                                    @if($errors->has('pay_date'))
                                        <small class="text-danger">{{ $errors->first('pay_date') }}</small>
                                    @endif
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label>Slip Date</label>
                                    <input type="date" name="slip_date" class="form-control @error('slip_date') is-invalid @enderror no-radius" value="{{ old('slip_date', $feePayment->slip_date) }}">
                                    @if($errors->has('slip_date'))
                                        <small class="text-danger">{{ $errors->first('slip_date') }}</small>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary btn-flat float-right ml-3"> <i class="fa fa-save"></i> Save Changes</button>
                            <a href="{{ route('fee-payment.index') }}" class="btn btn-secondary btn-flat float-right"> <i class="fa fa-times"></i> Cancel</a>
                        </div>

                </form>
                    </div>
                    <!-- /.card -->
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
