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
                            <li class="breadcrumb-item">
                                <a href="#studFee" class="btn btn-primary btn-flat btn-sm" data-toggle="modal">CHOOSE ANOTHER STUDENT</a>
                            </li>
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
                    <div class="col-md-12">@include('errors')</div>

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
                                                <b>Classroom</b> <a class="float-right">{{ strtoupper($student->classroom->name) }}</a>
                                            </li>
                                            <li class="list-group-item">
                                                <b>Grade</b> <a class="float-right">{{ strtoupper($student->class_grade->long_name) }}</a>
                                            </li>
                                            <li class="list-group-item">
                                                <b>Stream</b> <a class="float-right">{{ strtoupper($student->class_stream->long_name) }}</a>
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
                                            <li class="list-group-item text-primary">
                                                <b>Expected</b> <a class="float-right"><b>{{ number_format($student->expected,2) }}</b></a>
                                            </li>
                                            <li class="list-group-item text-success">
                                                <b>Paid</b> <a class="float-right"><b>{{ number_format($student->paid,2) }}</b></a>
                                            </li>
                                            <li class="list-group-item text-warning">
                                                <b>Arrears</b> <a class="float-right"><b>{{ number_format($student->arrears,2) }}</b></a>
                                            </li>
                                            <li class="list-group-item text-warning">
                                                <b>Balance</b> <a class="float-right"><b>{{ number_format($student->current,2) }}</b></a>
                                            </li>
                                            <li class="list-group-item text-danger">
                                                <b>Total Balance</b> <a class="float-right"><b>{{ number_format($student->balance,2) }}</b></a>
                                            </li>
                                        </ul>

                                        <a href="{{ route('collectFee', $student->slug) }}" class="btn btn-primary btn-block btn-flat"><b>Collect Fees</b></a>
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
                                            <div class="col-8">
                                                <ul class="nav nav-pills">
                                                    <li class="nav-item"><a class="nav-link active" href="#current" data-toggle="tab">{{ $current_session->name }}</a></li>
                                                    <li class="nav-item"><a class="nav-link" href="#payments" data-toggle="tab">PAYMENT HISTORY</a></li>
                                                    <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">ACTIVATION & PROMOTION</a></li>
                                                </ul>
                                            </div>

                                            <div class="col-4">
                                                <div class="input-group-prepend float-right">
                                                    <button type="button" class="btn btn-outline-default btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                        Menu
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a href="#offerDiscount" class="dropdown-item text-warning" data-toggle="modal">
                                                            <i class="fa fa-minus-circle"></i> Offer Discount
                                                        </a>
                                                        <a href="#optionalFee" class="dropdown-item text-primary" data-toggle="modal">
                                                            <i class="fa fa-mouse-pointer"></i> Optional Fee
                                                        </a>
                                                        <a href="#additionalFee" class="dropdown-item text-success" data-toggle="modal">
                                                            <i class="fa fa-plus-circle"></i> Additional Fee
                                                        </a>
                                                        <a href="#changeSession" class="dropdown-item text-dark" data-toggle="modal">
                                                            <i class="fa fa-exchange-alt"></i> Change Session
                                                        </a>
                                                    </div>
                                                </div>

                                                <!-- Start Offer Fee Discount Modal -->
                                                <div class="modal fade" id="offerDiscount" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content no-radius">
                                                            <form action="{{ route('fee-discounts.store') }}" method="post">
                                                                @csrf
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-minus-circle text-warning"></i> Offer Discount</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body text-sm">
                                                                    <div class="col-md-12">
                                                                        <input type="hidden" name="student_id" value="{{ $student->id }}" />
                                                                        <input type="hidden" name="class_grade_id" value="{{ $student->class_grade_id }}" />
                                                                        <input type="hidden" name="current_session_id" value="{{ $current_session->id }}" />
                                                                        <div class="col-md-12 form-group">
                                                                            <label>Discount Name</label>
                                                                            <input type="text" name="name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('name') }}" autocomplete="off">
                                                                            @if($errors->has('name'))
                                                                                <small class="text-danger">{{ $errors->first('name') }}</small>
                                                                            @endif
                                                                        </div>

                                                                        <div class="col-md-12 form-group">
                                                                            <label>Discount Description</label>
                                                                            <textarea name="description" class="form-control @error('description') is-invalid @enderror no-radius">{{ old('description') }}</textarea>
                                                                            @if($errors->has('description'))
                                                                                <small class="text-danger">{{ $errors->first('description') }}</small>
                                                                            @endif
                                                                        </div>

                                                                        <div class="col-md-12 form-group">
                                                                            <label>Discount Amount</label>
                                                                            <input type="number" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius" value="{{ old('amount') }}">
                                                                            @if($errors->has('amount'))
                                                                                <small class="text-danger">{{ $errors->first('amount') }}</small>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-minus-circle"></i> Offer Discount</button>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- End Offer Fee Discount Modal -->

                                                <!-- Start Optional Fee Modal -->
                                                <div class="modal fade" id="optionalFee" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content no-radius">
                                                            <form action="{{ route('student-fees.store') }}" method="post">
                                                                @csrf
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-mouse-pointer text-primary"></i> Add Optional Fee</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body p-0">
                                                                    <div class="col-md-12 p-0">
                                                                        <input type="hidden" name="type" value="optional" />
                                                                        <input type="hidden" name="student_id" value="{{ $student->id }}" />
                                                                        <input type="hidden" name="class_grade_id" value="{{ $student->class_grade_id }}" />
                                                                        <input type="hidden" name="current_session_id" value="{{ $current_session->id }}" />
                                                                        <div class="col-md-12 p-0">
                                                                            <table class="table">
                                                                                <thead>
                                                                                <th style="text-align: center"><input type="checkbox" checked disabled> </th>
                                                                                <th>FEE NAME</th>
                                                                                <th style="text-align: right">FEE AMOUNT</th>
                                                                                </thead>
                                                                                <tbody>
                                                                                @php($optionalFees = App\OptionalFee::where('current_session_id', $current_session->id)->get())
                                                                                @foreach($optionalFees as $optionalFee)
                                                                                    <tr>
                                                                                        <td style="text-align: center"><input type="checkbox" name="option[]" value="{{ $optionalFee->id }}"> </td>
                                                                                        <td>{{ $optionalFee->fee_parameter->name }}</td>
                                                                                        <td style="text-align: right" class="pr-3">{{ number_format($optionalFee->amount,2) }}</td>
                                                                                    </tr>
                                                                                @endforeach
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Add Optional Fee</button>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- End Optional Fee Modal -->

                                                <!-- Start Additional Fee Modal -->
                                                <div class="modal fade" id="additionalFee" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content no-radius">
                                                            <form action="{{ route('student-fees.store') }}" method="post">
                                                                @csrf
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-plus-circle text-primary"></i> Add Additional Fee</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body text-sm">
                                                                    <div class="col-md-12">
                                                                        <input type="hidden" name="type" value="additional" />
                                                                        <input type="hidden" name="student_id" value="{{ $student->id }}" />
                                                                        <input type="hidden" name="class_grade_id" value="{{ $student->class_grade_id }}" />
                                                                        <input type="hidden" name="current_session_id" value="{{ $current_session->id }}" />
                                                                        <div class="col-md-12 form-group">
                                                                            <label>Parameter Name</label>
                                                                            <select name="fee_parameter_id" class="form-control select2 @error('fee_parameter_id') is-invalid @enderror">
                                                                                <option value="">--Select Parameter</option>
                                                                                @php($feeParameters = App\FeeParameter::Active()->get())
                                                                                @foreach($feeParameters as $feeParameter)
                                                                                    <option value="{{ $feeParameter->id }}">{{ $feeParameter->name }}</option>
                                                                                @endforeach
                                                                            </select>
                                                                            @if($errors->has('fee_parameter_id'))
                                                                                <small class="text-danger">{{ $errors->first('fee_parameter_id') }}</small>
                                                                            @endif
                                                                        </div>

                                                                        <div class="col-md-12 form-group">
                                                                            <label>Description</label>
                                                                            <textarea name="description" class="form-control @error('description') is-invalid @enderror no-radius">{{ old('description') }}</textarea>
                                                                            @if($errors->has('description'))
                                                                                <small class="text-danger">{{ $errors->first('description') }}</small>
                                                                            @endif
                                                                        </div>

                                                                        <div class="col-md-12 form-group">
                                                                            <label>Amount</label>
                                                                            <input type="number" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius" value="{{ old('amount') }}">
                                                                            @if($errors->has('amount'))
                                                                                <small class="text-danger">{{ $errors->first('amount') }}</small>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-plus-circle"></i> Add Additional Fee</button>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- End Additional Fee Modal -->

                                                <!-- Start Additional Fee Modal -->
                                                <div class="modal fade" id="changeSession" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content no-radius">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-exchange-alt"></i> Change Session</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body text-sm">
                                                                <div class="col-md-12">
                                                                    @php($sesses = App\StudentTimeline::where('student_id', $student->id)->orderBy('current_session_id', 'desc')->get() )
                                                                    @foreach($sesses as $sess)
                                                                        <a href="{{ route('student-timelines.show', $sess->id) }}" class="btn btn-outline-info btn-flat btn-sm btn-block">
                                                                            <i class="fa fa-calendar"></i>  {{ $sess->current_session->name." - ".$sess->class_grade->long_name }}
                                                                        </a>
                                                                    @endforeach
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- End Additional Fee Modal -->
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
                                                            @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                                                                <th style="text-align: center;text-transform: uppercase">Edit</th>
                                                                <th style="text-align: center;text-transform: uppercase">Delete</th>
                                                            @endif
                                                            </thead>
                                                            <tbody>
                                                            @foreach($studentFees as $studentFee)
                                                                <tr>
                                                                    <td>{{ ucwords(strtolower($studentFee->fee_parameter->name)) }}</td>
                                                                    <td>{{ $studentFee->fee_parameter->description }}</td>
                                                                    <td style="text-align: right">{{ number_format($studentFee->amount,2) }}</td>
                                                                    @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                                                                        <td style="vertical-align: middle;text-align: center">
                                                                            <a href="#editStudFee{{ $studentFee->id }}" data-toggle="modal" class="text-success">edit_fee</a>
                                                                        </td>
                                                                        <td style="vertical-align: middle;text-align: center">
                                                                            <a href="#deleteStudFee{{ $studentFee->id }}" data-toggle="modal" class="text-danger">delete_fee</a>
                                                                        </td>

                                                                        <!-- Start Edit Modal -->
                                                                        <div class="modal fade" id="editStudFee{{ $studentFee->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content no-radius">
                                                                                    <form action="{{ route('student-fees.update', $studentFee->id) }}" method="post">
                                                                                        @csrf
                                                                                        @method('PUT')
                                                                                        <div class="modal-header">
                                                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-edit text-success"></i> Edit Fee {{ ucwords(strtolower($studentFee->fee_parameter->name)) }}</h5>
                                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                <span aria-hidden="true">&times;</span>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body">
                                                                                            <div class="col-md-12 form-group mb-3">
                                                                                                <label>Fee Amount <span class="text-danger"><sup>required</sup></span></label>
                                                                                                <input type="text" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius" value="{{ old('amount', $studentFee->amount) }}">
                                                                                                @if($errors->has('amount'))
                                                                                                    <small class="text-danger">{{ $errors->first('amount') }}</small>
                                                                                                @endif
                                                                                            </div>

                                                                                            <div class="col-md-12 mb-3 bg-gray-light mt-3 pt-2 pb-2">
                                                                                                <label>Enter Your Password <span class="text-danger"><sup>required</sup></span> </label>
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
                                                                                            <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                                                            <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> Save Change</button>
                                                                                        </div>
                                                                                    </form>

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <!-- End Edit Modal -->

                                                                        <!-- Start Delete Modal -->
                                                                        <div class="modal fade" id="deleteStudFee{{ $studentFee->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content no-radius">
                                                                                    <form action="{{ route('student-fees.destroy', $studentFee->id) }}" method="post">
                                                                                        @csrf
                                                                                        @method('DELETE')
                                                                                        <div class="modal-header">
                                                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Fee {{ ucwords(strtolower($studentFee->fee_parameter->name)) }}</h5>
                                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                <span aria-hidden="true">&times;</span>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body text-sm">
                                                                                            <div class="col-md-12 mb-3">
                                                                                                <div class="alert alert-warning" style="text-align: center">
                                                                                                    <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                                                    This action cannot be undone.<br>
                                                                                                    Are you you want to delete this Fee?
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
                                                                                            <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-trash"></i> Yes! Delete Fee</button>
                                                                                        </div>
                                                                                    </form>

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <!-- End Delete Modal -->
                                                                    @endif
                                                                </tr>
                                                            @endforeach
                                                            @if($studTransport)
                                                                <tr>
                                                                    <td>{{ ucwords(strtolower($studTransport->transport_zone_fee->transport_zone->name)) }}</td>
                                                                    <td>{{ $studTransport->way }}</td>
                                                                    <td style="text-align: right">{{ number_format($studTransport->amount,2) }}</td>
                                                                    <td></td>
                                                                    @if(Auth::user()->profile === 'isSuper' || Auth::user()->profile === 'isAdmin')
                                                                        <td style="vertical-align: middle;text-align: center">
                                                                            <a href="#deleteStudTransport{{ $studTransport->id }}" data-toggle="modal" class="text-danger">
                                                                                delete_transport
                                                                            </a>
                                                                        </td>
                                                                        <!-- Start Delete Modal -->
                                                                        <div class="modal fade" id="deleteStudTransport{{ $studTransport->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content no-radius">
                                                                                    <form action="{{ route('student-transports.destroy', $studTransport->id) }}" method="post">
                                                                                        @csrf
                                                                                        @method('DELETE')
                                                                                        <div class="modal-header">
                                                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Transport Fee</h5>
                                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                <span aria-hidden="true">&times;</span>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body text-sm">
                                                                                            <div class="col-md-12 mb-3">
                                                                                                <div class="alert alert-warning" style="text-align: center">
                                                                                                    <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                                                    This action cannot be undone.<br>
                                                                                                    Are you you want to delete Transport Fee?
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
                                                                                            <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-trash"></i> Yes! Delete Fee</button>
                                                                                        </div>
                                                                                    </form>

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <!-- End Delete Modal -->
                                                                    @endif
                                                                </tr>

                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>FEES TOTAL</b></td>
                                                                    <td style="text-align: right">
                                                                        <b>KES {{ number_format(($studentFees->sum('amount') + $studTransport->amount),2) }}</b>
                                                                    </td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                            @else
                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>FEES TOTAL</b></td>
                                                                    <td style="text-align: right">
                                                                        <b>KES {{ number_format($studentFees->sum('amount'),2) }}</b>
                                                                    </td>
                                                                    <td></td>
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
                                                                        <td style="vertical-align: middle;text-align: center">
                                                                            <a class="mr-2 text-success" href="#updateDiscount{{ $feeDiscount->id }}" data-toggle="modal">edit_discount</a>
                                                                        </td>
                                                                        <td style="vertical-align: middle;text-align: center">
                                                                            <a class="ml-2 text-danger" href="#deleteStudDiscount{{ $feeDiscount->id }}" data-toggle="modal">delete_discount </a>
                                                                        </td>
                                                                        <!-- Start Update Fee Discount Modal -->
                                                                        <div class="modal fade" id="updateDiscount{{ $feeDiscount->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content no-radius">
                                                                                    <form action="{{ route('fee-discounts.update', $feeDiscount->id) }}" method="post">
                                                                                        @csrf
                                                                                        @method('PUT')
                                                                                        <div class="modal-header">
                                                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-minus-circle text-warning"></i> Update Discount</h5>
                                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                <span aria-hidden="true">&times;</span>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body text-sm">
                                                                                            <div class="col-md-12">
                                                                                                <div class="col-md-12 form-group">
                                                                                                    <label>Discount Name</label>
                                                                                                    <input type="text" name="name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('name', $feeDiscount->name) }}" autocomplete="off">
                                                                                                    @if($errors->has('name'))
                                                                                                        <small class="text-danger">{{ $errors->first('name') }}</small>
                                                                                                    @endif
                                                                                                </div>

                                                                                                <div class="col-md-12 form-group">
                                                                                                    <label>Discount Description</label>
                                                                                                    <textarea name="description" class="form-control @error('description') is-invalid @enderror no-radius">{{ old('description', $feeDiscount->description) }}</textarea>
                                                                                                    @if($errors->has('description'))
                                                                                                        <small class="text-danger">{{ $errors->first('description') }}</small>
                                                                                                    @endif
                                                                                                </div>

                                                                                                <div class="col-md-12 form-group">
                                                                                                    <label>Discount Amount</label>
                                                                                                    <input type="number" name="amount" class="form-control @error('amount') is-invalid @enderror no-radius" value="{{ old('amount', $feeDiscount->amount) }}">
                                                                                                    @if($errors->has('amount'))
                                                                                                        <small class="text-danger">{{ $errors->first('amount') }}</small>
                                                                                                    @endif
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                                                                            <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Save Changes</button>
                                                                                        </div>
                                                                                    </form>

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <!-- End Update Fee Discount Modal -->

                                                                        <!-- Start Delete Modal -->
                                                                        <div class="modal fade" id="deleteStudDiscount{{ $feeDiscount->id }}" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content no-radius">
                                                                                    <form action="{{ route('fee-discounts.destroy', $feeDiscount->id) }}" method="post">
                                                                                        @csrf
                                                                                        @method('DELETE')
                                                                                        <div class="modal-header">
                                                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete {{ ucwords(strtolower($feeDiscount->name)) }} Discount</h5>
                                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                <span aria-hidden="true">&times;</span>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body text-sm">
                                                                                            <div class="col-md-12 mb-3">
                                                                                                <div class="alert alert-warning" style="text-align: center">
                                                                                                    <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                                                    This action cannot be undone.<br>
                                                                                                    Are you you want to delete Fee Discount?
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
                                                                                            <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-trash"></i> Yes! Delete Discount</button>
                                                                                        </div>
                                                                                    </form>

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <!-- End Delete Modal -->
                                                                    </tr>
                                                                @endforeach
                                                                <tr>
                                                                    <td style="text-align: right;" colspan="2"><b>DISCOUNT TOTAL</b></td>
                                                                    <td style="text-align: right">
                                                                        <b>KES {{ number_format($feeDiscounts->sum('amount'),2) }}</b>
                                                                    </td>
                                                                    <td></td>
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
                                                                    <td></td>
                                                                </tr>
                                                            @endif
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-12 mt-2">
                                                        <div class="btn-group float-right">
                                                            <a href="{{ route('invoicePDF', $student->slug) }}" class="btn btn-danger btn-flat" target="_blank">
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
                                                                        <th>VIEW</th>
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
                                                                                <td>
                                                                                    <a class="text-primary" href="{{ route('fee-payment.show', $feePayment->id) }}">
                                                                                        <i class="fa fa-eye text-primary"></i> View
                                                                                    </a>
                                                                                </td>
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

                                            <div class="tab-pane" id="settings">

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