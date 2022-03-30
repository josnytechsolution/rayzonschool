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
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-primary">@if($mpesaPayment->student_id != NULL){{ strtoupper($mpesaPayment->student->admno) }}@endif</span>
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-primary">@if($mpesaPayment->student_id != NULL){{ strtoupper($mpesaPayment->student->name) }}@endif</span>
                            <i class="fa fa-angle-right text-muted"></i> <span class="text-danger">@if($mpesaPayment->student_id != NULL){{ strtoupper($mpesaPayment->student->classroom->name) }}@endif</span>
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
                <div class="col-md-12">
                    @if($message = Session::get('success'))
                        <div class="alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if (Session::has('error'))
                        <div class="alerts alert alert-danger">
                            <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('error') }}</p>
                        </div>
                    @endif
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <!-- Payment -->
                            <div class="card card-success card-outline no-radius">
                                <form action="{{ route('mpesa-payments.update', $mpesaPayment->id) }}" method="post">
                                    @csrf
                                    @method('PUT')
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 mb-4">
                                                <label>Select The Right Student</label>
                                                <select name="student_id" class="form-control select2 @error('student_id') is-invalid @enderror" >
                                                    @if($mpesaPayment->student_id != NULL)
                                                    <option value="{{ $mpesaPayment->student_id }}">{{ $mpesaPayment->student->admno." - ".$mpesaPayment->student->name }}</option>
                                                    @else
                                                        <option value="">Select A Student</option>
                                                    @endif
                                                    @foreach($students as $student)
                                                        <option value="{{ $student->id }}">{{ $student->admno." - ".$student->name." - ".$student->class_grade->long_name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label>Short Code</label>
                                                <input type="text" class="form-control no-radius" value="{{ $mpesaPayment->businessShortCode }}" disabled>
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label>Transaction Amount</label>
                                                <input type="text" class="form-control no-radius" value="{{ $mpesaPayment->transAmount }}" disabled>
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label>Reference No.</label><br/>
                                                <input type="text"  class="form-control no-radius" value="{{ $mpesaPayment->transID }}" disabled>
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label>Pay Date/Time</label>
                                                <input type="text" class="form-control no-radius" value="{{ date('d-m-Y H:m:sa', strtotime($mpesaPayment->transTime)) }}" disabled>
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label>Paid By</label>
                                                <input type="text" class="form-control no-radius" value="{{ strtoupper($mpesaPayment->firstName." ".$mpesaPayment->middleName." ".$mpesaPayment->lastName) }}" disabled>
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label>Contact</label>
                                                <input type="text" class="form-control no-radius" value="{{ $mpesaPayment->MSISDN }}" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <a href="{{ route('mpesa-payments.index') }}" class="btn btn-secondary btn-flat float-left"> <i class="fa fa-times"></i> Cancel</a>
                                        <a href="#editPayment" class="btn btn-success btn-flat float-right ml-3" data-toggle="modal"> <i class="fa fa-save"></i> Save Changes</a>
                                    </div>

                                    <!-- Start Delete Modal -->
                                    <div class="modal fade" id="editPayment" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content no-radius">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-edit text-success"></i> Edit Payment</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            Are you you want to edit this payment?
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
                                                    <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-trash"></i> Yes! Edit Payment</button>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!-- End Delete Modal -->
                                </form>
                            </div>
                            <!-- /.card -->

                        </div>
                        <div class="col-md-3"></div>
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
