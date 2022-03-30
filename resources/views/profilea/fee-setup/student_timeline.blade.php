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
                <div class="row mb-2 mt-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">{{ strtoupper($student->admno." - ".$student->name) }} <small>Individual Fee Structure</small></h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item active">{{ $current_session->name }}</li>
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
                    <div class="col-md-12">@include('errors') </div>

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <!-- Profile Image -->
                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-body box-profile">
                                        <div class="text-center">
                                            <img class="profile-user-img img-fluid img-circle"
                                                 src="{{ asset($student->photo) }}"
                                                 alt="User profile picture">
                                        </div>

                                        <h3 class="profile-username text-center">
                                            <a href="{{ route('student-details.show', $student->slug) }}">{{ $student->admno }}</a>
                                        </h3>

                                        <p class="text-muted text-center">{{ strtoupper($student->name) }}</p>

                                        <ul class="list-group list-group-unbordered mb-3">
                                            <li class="list-group-item">
                                                <b>Grade</b> <a class="float-right">{{ strtoupper($studentTimeline->class_grade->long_name) }}</a>
                                            </li>
                                        </ul>

                                        <a href="javascript:;" class="btn @if($student->status === "Active") btn-success @else btn-danger @endif btn-block btn-flat"><b>Student is {{ $student->status }}</b></a>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->

                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-body box-profile">

                                        <h4 class="profile-username text-center">STUDENT FEES DETAILS</h4>

                                        <p class="text-muted text-center">{{ $current_session->name }}</p>

                                        <ul class="list-group list-group-unbordered mb-3">
                                            @foreach($studentFees as $studentFee)
                                                <li class="list-group-item text-dark">
                                                    <b>{{ $studentFee->fee_parameter->name }}</b> <span class="float-right"><b>{{ number_format($studentFee->amount,2) }}</b></span>
                                                </li>
                                            @endforeach
                                            @if($studTransport)
                                                <li class="list-group-item text-dark">
                                                    <b>{{ $studTransport->transport_zone_fee->transport_zone->name }} [{{ $studTransport->way }}]</b> <span class="float-right"><b>{{ number_format($studTransport->amount,2) }}</b></span>
                                                </li>
                                            @endif
                                            <li class="list-group-item text-warning">
                                                <b>FEE DISCOUNT</b> <span class="float-right"><b>{{ number_format($feeDiscounts->sum('amount'),2) }}</b></span>
                                            </li>

                                            @if($studTransport)
                                                @php($transportFee = $studTransport->amount)
                                            @else
                                                @php($transportFee = 0)
                                            @endif

                                            @php($totals = (($studentFees->sum('amount') + $transportFee) - $feeDiscounts->sum('amount')))
                                            <li class="list-group-item text-primary">
                                                <b>TOTAL FEE</b> <a class="float-right"><b>{{ number_format($totals,2) }}</b></a>
                                            </li>
                                            <li class="list-group-item text-success">
                                                <b>TOTAL PAID</b> <a class="float-right"><b>{{ number_format($feePayments->sum('paid'),2) }}</b></a>
                                            </li>
                                            @php($tBalance = ($totals - $feePayments->sum('paid')))
                                            <li class="list-group-item text-danger">
                                                <b>TOTAL BALANCE</b> <a class="float-right text-danger"><b>{{ number_format($tBalance,2) }}</b></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-9">
                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-12">
                                                <ul class="nav nav-pills">
                                                    <li class="nav-item"><a class="nav-link active" href="#current" data-toggle="tab">{{ $current_session->name }}</a></li>
                                                    <li class="nav-item"><a class="nav-link" href="#payments" data-toggle="tab">PAYMENT HISTORY</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div><!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="active tab-pane" id="current">
                                                <div class="row">
                                                    <div class="col-md-12 border-bottom">
                                                        <div class="row">
                                                            <div class="col-md-6 form-group">
                                                                <label>Name</label>
                                                                <input type="text"class="form-control no-radius" value="{{ $student->name }}" disabled >
                                                            </div>
                                                            <div class="col-md-6 form-group">
                                                                <label>Academic Term</label>
                                                                <input type="text"class="form-control no-radius" value="{{ $current_session->name }}" disabled >
                                                            </div>
                                                            <div class="col-md-6 form-group">
                                                                <label>Student Category</label>
                                                                <input type="text"class="form-control no-radius" value="{{ $student->discount_level->name }}" disabled >
                                                            </div>
                                                            <div class="col-md-6 form-group">
                                                                <label>Academic Year</label>
                                                                <input type="text"class="form-control no-radius" value="{{ $current_session->financial_year->name }}" disabled >
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 mt-4">
                                                        <table id="example2" class="table">
                                                            <thead class="bg-gray-light">
                                                            <th style="text-transform: uppercase">Fee Category</th>
                                                            <th style="text-transform: uppercase">Fee Description</th>
                                                            <th style="text-align: right;text-transform: uppercase">Fee Amount</th>
                                                            </thead>
                                                            <tbody>
                                                            @foreach($studentFees as $studentFee)
                                                                <tr>
                                                                    <td>{{ ucwords(strtolower($studentFee->fee_parameter->name)) }}</td>
                                                                    <td>{{ $studentFee->fee_parameter->description }}</td>
                                                                    <td style="text-align: right">{{ number_format($studentFee->amount,2) }}</td>
                                                                </tr>
                                                            @endforeach
                                                            @if($studTransport)
                                                                <tr>
                                                                    <td>{{ ucwords(strtolower($studTransport->transport_zone_fee->transport_zone->name)) }}</td>
                                                                    <td>{{ $studTransport->way }}</td>
                                                                    <td style="text-align: right">{{ number_format($studTransport->amount,2) }}</td>
                                                                </tr>

                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>FEES TOTAL</b></td>
                                                                    <td style="text-align: right">
                                                                        <b>KES {{ number_format(($studentFees->sum('amount') + $studTransport->amount),2) }}</b>
                                                                    </td>
                                                                </tr>
                                                            @else
                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>FEES TOTAL</b></td>
                                                                    <td style="text-align: right">
                                                                        <b>KES {{ number_format($studentFees->sum('amount'),2) }}</b>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                            @endif

                                                            @if(count($feeDiscounts) > 0)
                                                                <tr>
                                                                    <td class="bg-gray-light" colspan="6"><b>FEE DISCOUNTS</b></td>
                                                                </tr>
                                                                @foreach($feeDiscounts as $feeDiscount)
                                                                    <tr>
                                                                        <td>{{ ucwords(strtolower($feeDiscount->name)) }}</td>
                                                                        <td>{{ $feeDiscount->description }}</td>
                                                                        <td style="text-align: right">{{ number_format($feeDiscount->amount,2) }}</td>
                                                                    </tr>
                                                                @endforeach
                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>DISCOUNT TOTAL</b></td>
                                                                    <td style="text-align: right">
                                                                        <b>KES {{ number_format($feeDiscounts->sum('amount'),2) }}</b>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="bg-gray-light" colspan="5"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>FEES AFTER DISCOUNT</b></td>
                                                                    <td style="text-align: right">
                                                                        @if($studTransport)
                                                                            <b>KES {{ number_format(($studentFees->sum('amount') + $studTransport->amount - $feeDiscounts->sum('amount')),2) }}</b>
                                                                        @else
                                                                            <b>KES {{ number_format(($studentFees->sum('amount') - $feeDiscounts->sum('amount')),2) }}</b>
                                                                        @endif
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                            @endif
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-12 mt-2">
                                                        <div class="btn-group float-right">
                                                            <a href="{{ route('invoiceTimelinePDF', $studentTimeline->id) }}" class="btn btn-danger btn-flat" target="_blank">
                                                                <i class="fa fa-file-pdf"></i> Generate PDF
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="payments">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card no-radius">
                                                            <div class="card-header">
                                                                <h3 class="card-title">
                                                                    <i class="fa fa-clipboard-list"></i> PAYMENT HISTORY
                                                                </h3>
                                                                <div class="card-tools">
                                                                    <div class="input-group-prepend">
                                                                        <button type="button" class="btn btn-primary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                                            <i class="fa fa-download"></i> Export Statement
                                                                        </button>
                                                                        <div class="dropdown-menu">
                                                                            <a class="dropdown-item text-success" href="{{ route('exportStudentStatement', $student->id) }}">
                                                                                Export To Excel
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-body pr-1 pl-1 pb-0">
                                                                <div class="col-md-12">
                                                                    <table id="example1" class="table table-bordered">
                                                                        <thead>
                                                                        <th>#</th>
                                                                        <th>RECEIPT</th>
                                                                        <th>SESSION</th>
                                                                        <th>PAY DATE</th>
                                                                        <th>BANK NAME</th>
                                                                        <th>ACCOUNT NO</th>
                                                                        <th>REF. NO</th>
                                                                        <th style="text-align: right">AMOUNT</th>
                                                                        </thead>
                                                                        <tbody>
                                                                        @php($i=1)
                                                                        @foreach($feePayments as $feePayment)
                                                                            <tr>
                                                                                <td>{{ $i }}</td>
                                                                                <td>{{ $feePayment->receipt_no }}</td>
                                                                                <td>{{ $feePayment->current_session->name }}</td>
                                                                                <td>{{ $feePayment->pay_date }}</td>
                                                                                <td>{{ $feePayment->bank->name }}</td>
                                                                                <td>{{ $feePayment->bank->account_no }}</td>
                                                                                <td>{{ $feePayment->ref_no }}</td>
                                                                                <td style="text-align: right">{{ number_format($feePayment->paid,2) }}</td>
                                                                            </tr>
                                                                            @php(++$i)
                                                                        @endforeach
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-4"></div>
                                                </div>
                                            </div>
                                            <!-- /.tab-pane -->
                                        </div>
                                        <!-- /.tab-content -->
                                    </div><!-- /.card-body -->
                                </div>
                                <!-- /.nav-tabs-custom -->
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