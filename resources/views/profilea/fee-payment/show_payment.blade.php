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
                        PAYMENT REPORT
                        <small>
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-primary"></span>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-lg-4 col-md-3 col-sm-12"></div>
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="card no-radius">
                                <div class="card-body">
                                    <p class="text-center">
                                        <img src="{{ asset($profile->logo) }}" class="img-fluid" width="40%" >
                                    </p>
                                    <p class="pb-0 text-center">
                                        <span style="font-size:24px"><b>{{ strtoupper($profile->name) }}</b></span><br>
                                        <span>{{ strtoupper($profile->postal) }}</span><br>
                                        <span class="text-md">{{ $profile->contact1.", ".$profile->contact2 }}</span><br>
                                        <span class="text-md">{{ $profile->email1 }}</span><br>
                                        <span class="text-md">{{ $profile->website }}</span>
                                    </p>

                                    <table style="width: 100%">
                                        <tr style="border-top: 1px solid #000000;border-bottom: 1px solid #000000;">
                                            <th class="p-2" style="font-size: 18px;text-align: center" colspan="2">SCHOOL FEES RECEIPT</th>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr style="margin-top: 50px">
                                            <th style="font-size: 14px;text-align: left;">Receipt No.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ $feePayment->receipt_no }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Ref No.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ $feePayment->ref_no }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Term.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ $feePayment->current_session->name }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Date.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ date('d-m-Y', strtotime($feePayment->pay_date)) }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr style="border-bottom: 1px solid #000000;"><td></td></tr>

                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr style="margin-top: 50px">
                                            <th style="font-size: 14px;text-align: left;">Adm No.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ $feePayment->student->admno }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Name.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ ucwords($feePayment->student->name) }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Classroom.</th>
                                            <td style="font-size: 14px;text-align: right;">{{ ucwords($feePayment->student->classroom->long_name) }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr style="border-bottom: 1px solid #000000;"><td></td></tr>

                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr style="margin-top: 50px">
                                            <th style="font-size: 14px;text-align: left;"><u>Description</u></th>
                                            <th style="font-size: 14px;text-align: right;"><u>Amount(KES)</u></th>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        @if($feePayment->arrears)
                                        <tr>
                                            <td style="font-size: 14px;text-align: left;">Last Term Arrears</td>
                                            <td style="font-size: 14px;text-align: right;">{{ number_format($feePayment->arrears,2) }}</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        @endif
                                        @if($feePayment->fees)
                                        <tr>
                                            <td style="font-size: 14px;text-align: left;">School Fees</td>
                                            <td style="font-size: 14px;text-align: right;">{{ number_format($feePayment->fees,2) }}</td>
                                        </tr>
                                        @endif
                                        <tr><td></td></tr>
                                        <tr style="border-bottom: 1px solid #000000;"><td></td></tr>

                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Total Expected</th>
                                            <th style="font-size: 14px;text-align: right;">{{ number_format($feePayment->expected,2) }}</th>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Total Paid</th>
                                            <th style="font-size: 14px;text-align: right;">{{ number_format($feePayment->paid,2) }}</th>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <th style="font-size: 14px;text-align: left;">Balance</th>
                                            <th style="font-size: 14px;text-align: right;">{{ number_format($feePayment->balance,2) }}</th>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <td style="font-size: 12px;text-align: center" colspan="2">A negative figure means an overpayment</td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr><td></td></tr>
                                        <tr style="border-top: 1px solid #000000;border-bottom: 1px solid #000000;">
                                            <th class="p-2" style="font-size: 18px;text-align: center" colspan="2">"{{ $profile->motto }}"</th>
                                        </tr>
                                    </table>
                                </div>
                                <div class="card-footer">
                                    @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                                    <a href="{{ route('fee-payment.edit', $feePayment->id) }}" class="btn btn-success btn-flat">
                                        <i class="fa fa-edit"></i> Edit Payment
                                    </a>
                                    @endif
                                    <a href="{{ route('printReceipt', $feePayment->id) }}" target="_blank" class="btn btn-primary btn-flat float-right">
                                        <i class="fa fa-print"></i> Print Receipt
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-3 col-sm-12"></div>
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
