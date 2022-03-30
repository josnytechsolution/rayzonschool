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
                    <h1 class="m-0 text-dark">Parent/Guardian Info</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Parent Details</li>
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
                    @if ($errors->any())
                        <div class="col-md-12 alert alert-danger">
                            @foreach ($errors->all() as $error)
                                <p class="mb-0 mt-0">{{ $error }}</p>
                            @endforeach
                        </div>
                    @endif

                    @if($message = Session::get('success'))
                        <div class="col-md-12 alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if (Session::has('error'))
                        <div class="col-md-12 alerts alert alert-danger">
                                <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('error') }}</p>
                        </div>
                    @endif

                <div class="col-md-12 mb-2">
                    <a href="{{ route('parent-details.index') }}" class="btn btn-secondary btn-flat btn-sm">
                        <i class="fa fa-arrow-left"></i> Back
                    </a>
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary card-outline no-radius">
                                <div class="card-header">
                                    <div class="card-title">
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"><a class="nav-link active" href="#basic" data-toggle="tab"><i class="fa fa-user"></i> BASIC INFORMATION</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#children" data-toggle="tab"><i class="fa fa-users"></i> CHILDREN</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#siblings" data-toggle="tab"><i class="fa fa-database"></i> FEE STATEMENT</a></li>
                                        </ul>
                                    </div>
                                    <div class="card-tools">
                                        <a href="{{ route('parent-details.edit', $parentDetail->slug) }}" class="btn btn-success btn-flat btn-sm">
                                            <i class="fa fa-edit"></i> Edit Parent
                                        </a>
                                        <a href="#deleteParent{{ $parentDetail->slug }}" class="btn btn-danger btn-flat btn-sm" data-toggle="modal">
                                            <i class="fa fa-trash"></i> Delete Parent
                                        </a>
                                        <!-- Start Delete Modal -->
                                        <div class="modal fade" id="deleteParent{{ $parentDetail->slug }}" tabindex="-1" role="dialog" aria-hidden="true">

                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content no-radius">
                                                    <form action="{{ route('parent-details.destroy', $parentDetail->slug) }}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        @method('DELETE')
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> <small>{{ strtoupper($parentDetail->parent_no) }}</small></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body text-sm">
                                                            <div class="col-md-12 mb-3">
                                                                <div class="alert alert-warning" style="text-align: center">
                                                                    <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                                    This action cannot be undone.<br>
                                                                    This will delete all information related to this this parent.<br>
                                                                    Are you you want to delete<br> {{ strtoupper($parentDetail->parent_no) }}?
                                                                </div>
                                                            </div>

                                                            <div class="col-md-12 mb-3">
                                                                <label>Enter Your Password<span class="text-danger"><sup>*</sup></span> </label>
                                                                <input type="password" name="password" class="form-control no-radius @error('password') is-invalid @enderror" required>
                                                                <small>This action requires your password</small>
                                                                @if($errors->has('password'))
                                                                    <p style="font-family:courier new;color:red;font-size:12px">
                                                                        {{ $errors->first('password') }}
                                                                    </p>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary btn-flat float-left" data-dismiss="modal"><i class="fa fa-times"></i> No! Cancel</button>
                                                            <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Student</button>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Edit Modal -->
                                    </div>
                                </div><!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="active tab-pane" id="basic">
                                            <div class="row p-4">
                                                <div class="col-md-12 mb-4">
                                                    <label class="text-muted">Parent Number</label>
                                                    <h5 class="text-bold">{{ $parentDetail->parent_no }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Father's Name</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->fname) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Father's Contact</label>
                                                    <h5 class="text-bold">{{ $parentDetail->fcontact }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Father's Email</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->femail) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Father's Occupation</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->foccupation) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Mother's Name</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->mname) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Mother's Contact</label>
                                                    <h5 class="text-bold">{{ $parentDetail->mcontact }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Mother's Email</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->memail) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Mother's Occupation</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->moccupation) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Guardian's Name</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->gname) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Guardian's Contact</label>
                                                    <h5 class="text-bold">{{ $parentDetail->gcontact }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Guardian's Email</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->gemail) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Guardian's Relation</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->grelation) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Dedicated Email</label>
                                                    <h5 class="text-bold">{{ strtoupper($parentDetail->dedicated_email) }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Primary SMS Contact</label>
                                                    <h5 class="text-bold">{{ $parentDetail->primary_contact }}</h5>
                                                </div>

                                                <div class="col-md-3 mb-4">
                                                    <label class="text-muted">Secondary SMS Contact</label>
                                                    <h5 class="text-bold">{{ $parentDetail->secondary_contact }}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.tab-pane -->

                                        <div class="tab-pane" id="children">
                                            <div class="col-md-12">
                                                @if(count($students) > 0)
                                                    <table id="example2" class="table table-striped">
                                                        <thead>
                                                            <th>#</th>
                                                            <th>PHOTO</th>
                                                            <th>ADM NO</th>
                                                            <th>STUDENT NAME</th>
                                                            <th>GENDER</th>
                                                            <th>CLASS</th>
                                                            <th>B. CERT NO</th>
                                                            <th>NEMIS UPI</th>
                                                            <th>BALANCE</th>
                                                        </thead>
                                                        <tbody>
                                                        @php($i =1)
                                                        @foreach($students as $student)
                                                            <tr>
                                                                <td style="vertical-align: middle">{{ $i }}</td>
                                                                <td style="vertical-align: middle"><img src="{{ asset($student->photo) }}" class="img img-fluid img-size-32"></td>
                                                                <td style="vertical-align: middle">
                                                                    <a href="{{ route('student-details.show', $student->slug) }}">{{ $student->admno }}</a>
                                                                </td>
                                                                <td style="vertical-align: middle">{{ $student->name }}</td>
                                                                <td style="vertical-align: middle">{{ $student->gender }}</td>
                                                                <td style="vertical-align: middle">{{ $student->classroom->name }}</td>
                                                                <td style="vertical-align: middle">{{ $student->birth_cert }}</td>
                                                                <td style="vertical-align: middle">{{ $student->nemis_upi }}</td>
                                                                <td style="vertical-align: middle">{{ number_format($student->balance,2) }}</td>
                                                            </tr>
                                                            @php(++$i)
                                                        @endforeach
                                                        </tbody>
                                                    </table>
                                                @else
                                                    <div class="col-md-12 alert alert-info text-center">
                                                        This Parent has no active students in this school.
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                        <!-- /.tab-pane -->

                                        <div class="tab-pane" id="siblings">
                                            <div class="col-md-12">
                                                @if(count($students) > 0)
                                                    <table id="example1" class="table table-striped">
                                                        <thead>
                                                            <th>#</th>
                                                            <th>REC. #</th>
                                                            <th>ADM NO</th>
                                                            <th>STUDENT NAME</th>
                                                            <th>TERM/YEAR</th>
                                                            <th>CLASS/GRADE</th>
                                                            <th>PAY DATE</th>
                                                            <th>BANK</th>
                                                            <th>REF. #</th>
                                                            <th style="vertical-align: middle;text-align: right">AMOUNT (KES)</th>
                                                        </thead>
                                                        <tbody>
                                                        @php($i =1)
                                                        @foreach($payments as $payment)
                                                            @php($timeline = App\StudentTimeline::where('student_id', $payment->student_id)->where('current_session_id', $payment->current_session_id)->first())
                                                            <tr @if($payment->pay_date === date('Y-m-d')) style="background-color: #55efc4" @endif>
                                                                <td style="vertical-align: middle">{{ $i }}</td>
                                                                <td style="vertical-align: middle">{{ $payment->receipt_no }}</td>
                                                                <td style="vertical-align: middle">{{ $payment->student->admno }}</td>
                                                                <td style="vertical-align: middle">{{ strtoupper($payment->student->name) }}</td>
                                                                <td style="vertical-align: middle">{{ $payment->current_session->name }}</td>
                                                                <td style="vertical-align: middle">{{ strtoupper($timeline->class_grade->long_name) }}</td>
                                                                <td style="vertical-align: middle">{{ date('d-m-Y', strtotime($payment->pay_date)) }}</td>
                                                                <td style="vertical-align: middle">{{ $payment->bank->name }}</td>
                                                                <td style="vertical-align: middle">{{ $payment->ref_no }}</td>
                                                                <td style="vertical-align: middle;text-align: right">{{ number_format($payment->paid,2) }}</td>
                                                            </tr>
                                                            @php(++$i)
                                                        @endforeach
                                                        </tbody>
                                                    </table>
                                                @else
                                                    <div class="col-md-12 alert alert-info text-center">
                                                        This Parent has no children in this school.
                                                    </div>
                                                @endif
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
