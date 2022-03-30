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
            <div class="row mb-2 mt-2">
                <div class="col-sm-12">
                    <h1 class="m-0">{{ strtoupper($classGrade->long_name) }} {{ $currentSession->name }} FEE STRUCTURE</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">@include('errors') </div>

                <div class="col-md-12">
                    <div class="card no-radius">
                        <div class="card-body">
                            <h2 class="text-primary"><i class="fa fa-angle-double-right"></i> MANDATORY FEES</h2>
                            <table class="col-12 table table-hover">
                                <thead>
                                    <th>FEE NAME</th>
                                    <th>FEE DESCRIPTION</th>
                                    <th class="text-right">FEE AMOUNT (KSH)</th>
                                </thead>
                                <tbody>
                                   @foreach($classFees as $classFee)
                                       <tr>
                                           <td>{{ $classFee->fee_parameter->name }}</td>
                                           <td>{{ $classFee->fee_parameter->description }}</td>
                                           <td class="text-right">{{ number_format($classFee->amount,2) }}</td>
                                       </tr>
                                   @endforeach
                                      <tr>
                                          <td colspan="2" class="text-right"><b>TOTAL FEE</b></td>
                                          <td class="text-right"><b>KSH. {{ number_format($classFees->SUM('amount'),2) }}</b></td>
                                      </tr>
                                </tbody>
                            </table>


                        @if($optionalFees->count() > 0)
                            <h2 class="text-success mt-5"><i class="fa fa-angle-double-right"></i> OPTIONAL FEES</h2>
                            <table class="col-12 table table-hover">
                                <thead>
                                <th>FEE NAME</th>
                                <th>FEE DESCRIPTION</th>
                                <th class="text-right">FEE AMOUNT (KSH)</th>
                                </thead>
                                <tbody>
                                @foreach($optionalFees as $optionalFee)
                                    <tr>
                                        <td>{{ $optionalFee->fee_parameter->name }}</td>
                                        <td>{{ $optionalFee->fee_parameter->description }}</td>
                                        <td class="text-right">{{ number_format($optionalFee->amount,2) }}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>


                        @endif

                            <h2 class="text-info mt-5"><i class="fa fa-angle-double-right"></i> ONE-TIME FEES (Payable During Registration)</h2>
                            <table class="col-12 table table-hover">
                                <thead>
                                <th>FEE NAME</th>
                                <th>FEE DESCRIPTION</th>
                                <th class="text-right">FEE AMOUNT (KSH)</th>
                                </thead>
                                <tbody>
                                @foreach($onetimeFees as $onetimeFee)
                                    <tr>
                                        <td>{{ $onetimeFee->fee_parameter->name }}</td>
                                        <td>{{ $onetimeFee->fee_parameter->description }}</td>
                                        <td class="text-right">{{ number_format($onetimeFee->amount,2) }}</td>
                                    </tr>
                                @endforeach
                                    <tr>
                                        <td colspan="2" class="text-right"><b>TOTAL FEE</b></td>
                                        <td class="text-right"><b>KSH. {{ number_format($onetimeFees->SUM('amount'),2) }}</b></td>
                                    </tr>
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
