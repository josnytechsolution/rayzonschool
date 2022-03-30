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
                            FEES COLLECTION
                            <small>
                                <i class="fa fa-angle-right text-muted"></i> <span class="text-primary">{{ strtoupper($student->admno) }}</span>
                                <i class="fa fa-angle-right text-muted"></i> <span class="text-primary">{{ strtoupper($student->name) }}</span>
                                <i class="fa fa-angle-right text-muted"></i> <span class="text-danger">{{ strtoupper($student->classroom->name) }}</span>
                            </small>
                        </h5>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item">
                                <a href="#collectFees" class="btn btn-primary btn-flat btn-sm" data-toggle="modal">CHOOSE ANOTHER STUDENT</a>
                            </li>
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
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <!-- Profile Image -->
                                <div class="card card-warning card-outline no-radius">
                                    <div class="card-body box-profile p-0 bg-warning">
                                        <div class="text-center">
                                            <img class="profile-user-img img-fluid img-circle"
                                                 src="{{ asset($student->photo) }}"
                                                 alt="User profile picture">
                                        </div>

                                        <h3 class="profile-username text-center">{{ $student->admno }}</h3>
                                        <p class="text-center">
                                            {{ strtoupper($student->name) }} <br>
                                            <span class="text-white">[ {{ strtoupper($student->discount_level->name) }} ]</span>
                                        </p>

                                        <ul class="list-group list-group-unbordered">

                                            <li class="list-group-item pl-2 pr-2 bg-dark">
                                                <b>FEES TYPE</b> <a class="float-right"><b>AMOUNT</b></a>
                                            </li>

                                            @foreach($studentFees as $studentFee)
                                                <li class="list-group-item pl-2 pr-2">
                                                    <a>{{ $studentFee->fee_parameter->name }}</a> <a class="float-right">{{ number_format($studentFee->amount,2) }}</a>
                                                </li>
                                            @endforeach

                                            @if($transport)
                                                <li class="list-group-item pl-2 pr-2">
                                                    <a>TRANSPORT - {{ $transport->transport_zone_fee->transport_zone->name }}</a>
                                                    <a class="float-right">{{ number_format($transport->amount,2) }}</a>
                                                </li>
                                                <li class="list-group-item pl-2 pr-2 bg-primary">
                                                    <b>TOTAL</b> <a class="float-right"><b>KES {{ number_format(($studentFees->sum('amount') + $transport->amount),2) }}</b></a>
                                                </li>
                                            @else
                                                <li class="list-group-item pl-2 pr-2 bg-primary">
                                                    <b>TOTAL</b> <a class="float-right"><b>KES {{ number_format($studentFees->sum('amount'),2) }}</b></a>
                                                </li>
                                            @endif
                                            @if(count($feeDiscounts) > 0)
                                                <li class="list-group-item pl-2 pr-2 bg-gray-light">
                                                    <b>LESS DISCOUNT</b> <a href="#showDiscounts" data-toggle="modal" class="float-right"><b>KES {{ number_format($feeDiscounts->sum('amount'),2) }}</b></a>
                                                </li>

                                                <!-- Start Show Discounts Modal -->
                                                <div class="modal fade" id="showDiscounts" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                    <div class="modal-dialog modal-lg" role="document">
                                                        <div class="modal-content no-radius">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-minus-circle"></i> FEE DISCOUNTS</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body text-sm">
                                                                <div class="col-md-12 mb-3">
                                                                    <table class="table table-striped">
                                                                        <thead>
                                                                        <th>#</th>
                                                                        <th>NAME</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>AMOUNT</th>
                                                                        </thead>
                                                                        <tbody>
                                                                        @php($i = 1)
                                                                        @foreach($feeDiscounts as $feeDiscount)
                                                                            <tr>
                                                                                <td>{{ $i }}</td>
                                                                                <td>{{ $feeDiscount->name }}</td>
                                                                                <td>{{ $feeDiscount->description }}</td>
                                                                                <td>{{ number_format($feeDiscount->amount,2) }}</td>
                                                                            </tr>
                                                                            @php(++$i)
                                                                        @endforeach
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- End Show Discounts Modal -->

                                                @if($transport)
                                                    <li class="list-group-item pl-2 pr-2 bg-primary">
                                                        <b>NET TOTAL</b> <a class="float-right"><b>KES {{ number_format(($studentFees->sum('amount') + $transport->amount - $feeDiscounts->sum('amount')),2) }}</b></a>
                                                    </li>
                                                @else
                                                    <li class="list-group-item pl-2 pr-2 bg-primary">
                                                        <b>NET TOTAL</b> <a class="float-right"><b>KES {{ number_format(($studentFees->sum('amount') - $feeDiscounts->sum('amount')),2) }}</b></a>
                                                    </li>
                                                @endif

                                            @endif
                                            <li class="list-group-item pl-2 pr-2 bg-gray-light">
                                                <b>FEES PAID</b> <a class="float-right"><b>KES {{ number_format($feePayment,2) }}</b></a>
                                            </li>
                                            <li class="list-group-item pl-2 pr-2 bg-info">
                                                <b>BALANCE</b> <a class="float-right"><b>KES {{ number_format($student->balance,2) }}</b></a>
                                            </li>
                                        </ul>

                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-9">
                                <!-- Payment -->
                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-header">
                                        <button class="btn btn-warning btn-flat">Last Term Balance: KES {{ number_format($student->arrears,2) }}</button>
                                        <button class="btn btn-primary btn-flat">Current Term Balance: KES {{ number_format($student->current,2) }}</button>
                                        <button class="btn btn-danger btn-flat">Total Balance: KES {{ number_format($student->balance,2) }}</button>
                                    </div>

                                    <form action="{{ route('fee-payment.store') }}" method="post">
                                        @csrf
                                        <div class="card-body">
                                            <input type="hidden" name="current_session_id" value="{{ $current_session->id }}">
                                            <input type="hidden" name="class_grade_id" value="{{ $student->class_grade_id }}">
                                            <input type="hidden" name="student_id" value="{{ $student->id }}">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    @if ($errors->any())
                                                        <div class="col-md-12 alert alert-danger">
                                                            @foreach ($errors->all() as $error)
                                                                <p class="mb-0 mt-0">{{ $error }}</p>
                                                            @endforeach
                                                        </div>
                                                    @endif

                                                    @if($message = Session::get('success'))
                                                        <div class="alerts alert alert-success">
                                                            {{ $message }}
                                                        </div>
                                                    @endif
                                                </div>
                                                <div class="col-md-4 mb-3">
                                                    <label>Expected Amount [ <span class="text-danger"> KES {{ number_format($student->balance,2) }}</span> ]</label>
                                                    <input type="text" name="paid" id="paid" onKeyUp="checkBal()" class="form-control @error('paid') is-invalid @enderror no-radius" value="{{ old('paid') }}">

                                                    <input type="hidden" id="expected" value="{{ $student->balance }}"/>
                                                    @if($errors->has('paid'))
                                                        <small class="text-danger">{{ $errors->first('paid') }}</small>
                                                    @endif
                                                </div>

                                                <div class="col-md-4 mb-3">
                                                    <label>Remaining Balance</label>
                                                    <input type="text" id="balance" class="form-control no-radius" readonly>
                                                </div>
                                                <div class="col-md-4 mb-3">
                                                    <label>Overpayment</label>
                                                    <input type="text" id="overpay" class="form-control no-radius" readonly>
                                                </div>
                                                <div class="col-md-4 mb-3">
                                                    <label>Select Bank</label>
                                                    <select name="bank_id" id="bank" class="form-control @error('bank_id') is-invalid @enderror no-radius">
                                                        <option value="">--Select Bank--</option>
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
                                                    <input type="text" name="ref_no" id="refno" class="form-control @error('ref_no') is-invalid @enderror no-radius" value="{{ old('ref_no') }}">
                                                    @if($errors->has('ref_no'))
                                                        <small class="text-danger">{{ $errors->first('ref_no') }}</small>
                                                    @endif
                                                </div>

                                                <div class="col-md-4 mb-3">
                                                    <label>Reference No. status</label><br/>
                                                    <div id="status" style="border: 1px solid #C4C4C4;height: 37px"></div>
                                                </div>

                                                <div class="col-md-4 mb-3">
                                                    <label>Pay Date</label>
                                                    <input type="date" name="pay_date" class="form-control @error('pay_date') is-invalid @enderror no-radius" value="{{ old('pay_date') }}">
                                                    @if($errors->has('pay_date'))
                                                        <small class="text-danger">{{ $errors->first('pay_date') }}</small>
                                                    @endif
                                                </div>

                                                <div class="col-md-4 mb-3">
                                                    <label>Slip Date</label>
                                                    <input type="date" name="slip_date" class="form-control @error('slip_date') is-invalid @enderror no-radius" value="{{ old('slip_date') }}">
                                                    @if($errors->has('slip_date'))
                                                        <small class="text-danger">{{ $errors->first('slip_date') }}</small>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-primary btn-flat float-right ml-3"> <i class="fa fa-save"></i> Save Payment</button>
                                            <button type="reset" class="btn btn-secondary btn-flat float-right"> <i class="fa fa-brush"></i> Reset</button>
                                        </div>

                                    </form>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
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