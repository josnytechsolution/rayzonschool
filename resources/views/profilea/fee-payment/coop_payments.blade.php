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
                    <h5 class="m-0 text-dark">{{ strtoupper($current_session->name) }} COOP PAYMENTS FEES</h5>
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
                    <div class="card card-primary card-outline no-radius">
                            <div class="card-header">
                                <h3 class="card-title">
                                   <i class="fa fa-database"></i> {{ strtoupper($current_session->name) }} COOP PAYMENTS
                                </h3>

                                <div class="card-tools">
                                    <div class="btn-group">
                                        <div class="input-group-prepend ml-2">
                                            <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-filter"></i> Filter By Class
                                            </button>
                                            <div class="dropdown-menu">
                                                @php($class_grades = App\ClassGrade::Active()->orderBy('level', 'asc')->get())
                                                @foreach($class_grades as $class_grade)
                                                    <a class="dropdown-item text-muted" href="">
                                                        {{ $class_grade->long_name }}
                                                    </a>
                                                @endforeach
                                            </div>
                                        </div>

                                        <div class="input-group-prepend ml-2">
                                            <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-download"></i> Export
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item text-danger" href="">
                                                    <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                </a>
                                                <a class="dropdown-item text-success" href="#">
                                                    <i class="fa fa-file-excel text-success"></i> Export To Excel
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="example1" class="table table-bordered">
                                            <thead>
                                                <th>#</th>
                                                <th>ADM #</th>
                                                <th>STUDENT NAME</th>
                                                <th>CLASS/GRADE</th>
                                                <th style="text-align: right;">AMOUNT</th>
                                                <th>REFERENCE NO</th>
                                                <th>DATE/TIME</th>
                                                <th>STATUS</th>
                                            </thead>
                                            <tbody>
                                            @php($i = 1)
                                               @foreach($coop_payments as $coop_payment)
                                                   <tr>
                                                       <td style="vertical-align: middle">{{ $i }}</td>
                                                       <td style="vertical-align: middle">{{ $coop_payment->documentReferenceNumber }}</td>
                                                       <td style="vertical-align: middle">{{ strtoupper($coop_payment->student->name) }}</td>
                                                       <td style="vertical-align: middle">{{ strtoupper($coop_payment->student->class_grade->long_name) }}</td>
                                                       <td style="vertical-align: middle;text-align: right;">KES {{ number_format($coop_payment->totalAmount,2) }}</td>
                                                       <td style="vertical-align: middle">
                                                           <a href="#showMessage{{ $coop_payment->id }}" data-toggle="modal" title="Click To View SMS">
                                                               {{ $coop_payment->transactionReferenceCode }}
                                                           </a>
                                                       </td>
                                                       <td style="vertical-align: middle">{{ date('d-m-Y H:m:sa'), strtotime($coop_payment->transactionDate)  }}</td>
                                                       <td style="vertical-align: middle">
                                                         <a href="#" class="btn btn-success btn-block btn-flat btn-sm">Successful</a>
                                                       </td>

                                                       <!-- Start Delete Modal -->
                                                       <div class="modal fade" id="showMessage{{ $coop_payment->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                           <div class="modal-dialog modal-dialog-centered" role="document">
                                                               <div class="modal-content no-radius">
                                                                   <div class="modal-header pb-0 pt-0">
                                                                       <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-envelope-open-o text-primary"></i> SMS Sent To Parent</h5>
                                                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                           <span aria-hidden="true">&times;</span>
                                                                       </button>
                                                                   </div>
                                                                   <div class="modal-body p-0">
                                                                       @php($smses = App\CoopOutbox::where('coop_payment_id', $coop_payment->id)->orderBy('id', 'asc')->get())
                                                                       @foreach($smses as $sms)
                                                                           @php($status = App\MessageOutbox::where('messageId', $sms->messageId)->first())
                                                                           <div class="col-md-12 mt-3">
                                                                               <div class="alert @if($status->status === 'DeliveredToTerminal') alert-success @else alert-warning @endif">
                                                                                   <p>{{ $sms->message }}</p>
                                                                                   <p>{{ $status->status }} at {{ $sms->created_at }}</p>
                                                                               </div>
                                                                           </div>
                                                                       @endforeach
                                                                   </div>
                                                               </div>
                                                           </div>

                                                       </div>
                                                       <!-- End Delete Modal -->
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
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
