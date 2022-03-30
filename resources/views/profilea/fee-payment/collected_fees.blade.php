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
                    <h5 class="m-0 text-dark">COLLECTED FEES</h5>
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
                                   <i class="fa fa-database"></i> {{ strtoupper($current_session->name) }} COLLECTED FEES
                                </h3>

                                <div class="card-tools">
                                    <div class="btn-group">
                                        <div class="input-group-prepend ml-2">
                                            <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-filter"></i> Filter By Class
                                            </button>
                                            <div class="dropdown-menu">
                                                @php($class_grades = App\ClassGrade::Active()->orderBy('id', 'asc')->get())
                                                @foreach($class_grades as $class_grade)
                                                    <a class="dropdown-item text-muted" href="{{ route('paymentByClass', $class_grade->slug) }}">
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
                                                <a class="dropdown-item text-danger" href="{{ route('exportFeePDF', "all-classes") }}" target="_blank">
                                                    <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                </a>
                                                <a class="dropdown-item text-success" href="{{ route('exportFeeExcel', 100) }}">
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
                                                <th>REC. #</th>
                                                <th>STUDENT NAME</th>
                                                <th>CLASS/GRADE</th>
                                                <th>AMOUNT</th>
                                                <th>PAY DATE</th>
                                                <th>SLIP DATE</th>
                                                <th>BANK</th>
                                                <th>REF. #</th>
                                                <th>ACTION</th>
                                            </thead>
                                            <tbody>
                                            @php($i = 1)
                                               @foreach($payments as $payment)
                                                   <tr @if($payment->pay_date === date('Y-m-d')) style="background-color: #55efc4" @endif>
                                                       <td style="vertical-align: middle">{{ $i }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->receipt_no }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->student->name }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->class_grade->long_name }}</td>
                                                       <td style="vertical-align: middle">{{ number_format($payment->paid,2) }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->pay_date }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->slip_date }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->bank->name }}</td>
                                                       <td style="vertical-align: middle">{{ $payment->ref_no }}</td>
                                                       <td style="vertical-align: middle">
                                                           <div class="input-group-prepend">
                                                               <button type="button" class="btn btn-info btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                                   Action
                                                               </button>
                                                               <div class="dropdown-menu">
                                                                   <a class="dropdown-item text-primary" href="{{ route('fee-payment.show', $payment->id) }}">
                                                                      <i class="fa fa-eye text-primary"></i> View Payment
                                                                   </a>
                                                                   @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                                                                   <a class="dropdown-item text-success" href="{{ route('fee-payment.edit', $payment->id) }}">
                                                                      <i class="fa fa-edit text-success"></i> Edit Payment
                                                                   </a>
                                                                   <div class="dropdown-divider"></div>
                                                                   <a class="dropdown-item text-danger" href="#deletePayment{{ $payment->id }}" data-toggle="modal">
                                                                      <i class="fa fa-trash text-danger"></i> Delete Payment
                                                                   </a>
                                                                   @endif
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <!-- Start Delete Modal -->
                                                       <div class="modal fade" id="deletePayment{{ $payment->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                           <div class="modal-dialog modal-dialog-centered" role="document">
                                                               <div class="modal-content no-radius">
                                                                   <form action="{{ route('fee-payment.destroy', $payment->id) }}" method="post">
                                                                       @csrf
                                                                       @method('DELETE')
                                                                       <div class="modal-header">
                                                                           <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Payment</h5>
                                                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                               <span aria-hidden="true">&times;</span>
                                                                           </button>
                                                                       </div>
                                                                       <div class="modal-body text-sm">
                                                                           <div class="col-md-12 mb-3">
                                                                               <div class="alert alert-warning" style="text-align: center">
                                                                                   <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                                   This action cannot be undone.<br>
                                                                                   This will delete all information related to this payment.<br>
                                                                                   Are you you want to delete this payment?
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
                                                                           <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-trash"></i> Yes! Delete Payment</button>
                                                                       </div>
                                                                   </form>

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
