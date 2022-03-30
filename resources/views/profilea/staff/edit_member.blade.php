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
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Staff Member <small>{{ strtoupper($staffMember->name) }}</small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Staff Management</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">@include('errors')</div>

                <div class="col-md-12">
                    <div class="card card-success card-outline no-radius">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-user-plus"></i> EDIT STAFF MEMBER</h3>
                        </div>
                        <div class="card-body">
                           <form action="{{ route('staff-members.update', $staffMember->slug) }}" method="POST">
                               @csrf
                               @method('PUT')
                               <div class="card card-secondary card-outline no-radius">
                                   <div class="card-header">
                                       <h3 class="card-title">Personal Info</h3>
                                   </div>
                                   <div class="card-body">
                                       <div class="row">
                                           <div class="col-md-12 mb-3 p-0">
                                               <div class="col-md-3">
                                                   <label>Member No<sup class="text-danger">*</sup></label>
                                                   <input type="text" name="member_no" class="form-control no-radius @error('member_no') is-invalid @enderror" value="{{ $staffMember->member_no }}" disabled/>
                                                   @if($errors->has('member_no'))
                                                       <small class="text-danger">{{ $errors->first('member_no') }}</small>
                                                   @endif
                                               </div>
                                           </div>

                                           <div class="col-md-12 mb-3">
                                               <div class="row">
                                                   <div class="col-md-3 mb-4">
                                                       <label>Member's Name<sup class="text-danger">*</sup></label>
                                                       <input type="text" name="name" class="form-control no-radius @error('name') is-invalid @enderror" value="{{ old('name', $staffMember->name) }}"/>
                                                       @if($errors->has('name'))
                                                           <small class="text-danger">{{ $errors->first('name') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>ID Number<sup class="text-danger">*</sup></label>
                                                       <input type="text" name="idno" class="form-control no-radius @error('idno') is-invalid @enderror" value="{{ old('idno', $staffMember->idno) }}"/>
                                                       @if($errors->has('idno'))
                                                           <small class="text-danger">{{ $errors->first('idno') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Gender<sup class="text-danger">*</sup></label>
                                                       <select type="text" name="gender" class="form-control no-radius @error('gender') is-invalid @enderror" >
                                                           <option value="{{ $staffMember->getOriginal('gender') }}">{{ $staffMember->gender }}</option>
                                                           <option value="1">Male</option>
                                                           <option value="2">Female</option>
                                                       </select>
                                                       @if($errors->has('gender'))
                                                           <small class="text-danger">{{ $errors->first('gender') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Marital Status<sup class="text-danger">*</sup></label>
                                                       <select type="text" name="marital" class="form-control no-radius @error('marital') is-invalid @enderror" >
                                                           <option value="{{ $staffMember->getOriginal('marital') }}">{{ $staffMember->marital }}</option>
                                                           <option value="1">Single</option>
                                                           <option value="2">Married</option>
                                                           <option value="3">Separated</option>
                                                       </select>
                                                       @if($errors->has('marital'))
                                                           <small class="text-danger">{{ $errors->first('marital') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Date Of Birth<sup class="text-danger">*</sup></label>
                                                       <input type="date" name="dob" class="form-control no-radius @error('dob') is-invalid @enderror" value="{{ old('dob', $staffMember->dob) }}"/>
                                                       @if($errors->has('dob'))
                                                           <small class="text-danger">{{ $errors->first('dob') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Contact 1<sup class="text-danger">*</sup></label>
                                                       <input type="text" name="phoneno1" class="form-control no-radius @error('phoneno1') is-invalid @enderror" value="{{ old('phoneno1', $staffMember->phoneno1) }}"/>
                                                       @if($errors->has('phoneno1'))
                                                           <small class="text-danger">{{ $errors->first('phoneno1') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Contact 2</label>
                                                       <input type="text" name="phoneno2" class="form-control no-radius @error('phoneno2') is-invalid @enderror" value="{{ old('phoneno2', $staffMember->phoneno2) }}"/>
                                                       @if($errors->has('phoneno2'))
                                                           <small class="text-danger">{{ $errors->first('phoneno2') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Email Address</label>
                                                       <input type="text" name="email" class="form-control no-radius @error('email') is-invalid @enderror" value="{{ old('email', $staffMember->email) }}"/>
                                                       @if($errors->has('email'))
                                                           <small class="text-danger">{{ $errors->first('email') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-3 mb-4">
                                                       <label>Status<sup class="text-danger">*</sup></label>
                                                       <select name="status" class="form-control no-radius @error('status') is-invalid @enderror" >
                                                           <option value="{{ $staffMember->getOriginal('status') }}">{{ $staffMember->status }}</option>
                                                           <option value="1">Active</option>
                                                           <option value="2">Suspended</option>
                                                           <option value="3">Resigned</option>
                                                       </select>
                                                       @if($errors->has('status'))
                                                           <small class="text-danger">{{ $errors->first('status') }}</small>
                                                       @endif
                                                   </div>

                                                   <div class="col-md-4 mb-4">
                                                       <label>Photo</label>
                                                       <input type="file" name="photo" class="form-control no-radius @error('email') is-invalid @enderror" />
                                                       @if($errors->has('photo'))
                                                           <small class="text-danger">{{ $errors->first('photo') }}</small>
                                                       @endif
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>

                               <div class="card card-success card-outline no-radius">
                                   <div class="card-header">
                                       <h3 class="card-title">Employment Details</h3>
                                   </div>
                                   <div class="card-body">
                                       <div class="row">
                                           <div class="col-md-3 mb-4">
                                               <label>Department<sup class="text-danger">*</sup></label>
                                               <select id="staffDepartment" type="text" name="staff_department_id" class="form-control no-radius @error('staff_department_id') is-invalid @enderror" >
                                                   <option value="{{ $staffMember->staff_department_id }}">{{ $staffMember->staff_department->name }}</option>
                                                   @foreach($departments as $department)
                                                       <option value="{{ $department->id }}">{{ $department->name }}</option>
                                                   @endforeach
                                               </select>
                                               @if($errors->has('staff_department_id'))
                                                   <small class="text-danger">{{ $errors->first('staff_department_id') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>Designation<sup class="text-danger">*</sup></label>
                                               <select id="staffSection" type="text" name="staff_section_id" class="form-control no-radius @error('staff_section_id') is-invalid @enderror" >
                                                   <option value="{{ $staffMember->staff_section_id }}">{{ $staffMember->staff_section->name }}</option>
                                               </select>
                                               @if($errors->has('staff_section_id'))
                                                   <small class="text-danger">{{ $errors->first('staff_section_id') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>Employment Type<sup class="text-danger">*</sup></label>
                                               <select name="emp_type" class="form-control no-radius @error('emp_type') is-invalid @enderror" >
                                                   <option value="{{ $staffMember->getOriginal('emp_type') }}">{{ $staffMember->emp_type }}</option>
                                                   <option value="1">Permanent</option>
                                                   <option value="2">Probation</option>
                                                   <option value="3">Attachment</option>
                                               </select>
                                               @if($errors->has('emp_type'))
                                                   <small class="text-danger">{{ $errors->first('emp_type') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>Date Of Employment<sup class="text-danger">*</sup></label>
                                               <input type="date" name="reg_date" class="form-control no-radius @error('reg_date') is-invalid @enderror" value="{{ old('reg_date', $staffMember->reg_date) }}"/>
                                               @if($errors->has('reg_date'))
                                                   <small class="text-danger">{{ $errors->first('reg_date') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>TSC Number</label>
                                               <input type="text" name="tsc_no" class="form-control no-radius @error('tsc_no') is-invalid @enderror" value="{{ old('tsc_no', $staffMember->tsc_no) }}"/>
                                               @if($errors->has('tsc_no'))
                                                   <small class="text-danger">{{ $errors->first('tsc_no') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>NHIF Number</label>
                                               <input type="text" name="nhif" class="form-control no-radius @error('nhif') is-invalid @enderror" value="{{ old('nhif', $staffMember->nhif) }}"/>
                                               @if($errors->has('nhif'))
                                                   <small class="text-danger">{{ $errors->first('nhif') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>NSSF Number</label>
                                               <input type="text" name="nssf" class="form-control no-radius @error('nssf') is-invalid @enderror" value="{{ old('nssf', $staffMember->nssf) }}"/>
                                               @if($errors->has('nssf'))
                                                   <small class="text-danger">{{ $errors->first('nssf') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>KRA PIN Number</label>
                                               <input type="text" name="pin" class="form-control no-radius @error('pin') is-invalid @enderror" value="{{ old('pin', $staffMember->pin) }}"/>
                                               @if($errors->has('pin'))
                                                   <small class="text-danger">{{ $errors->first('pin') }}</small>
                                               @endif
                                           </div>
                                       </div>
                                   </div>
                               </div>

                               <div class="card card-primary card-outline no-radius">
                                   <div class="card-header">
                                       <h3 class="card-title">Bank Details</h3>
                                   </div>
                                   <div class="card-body">
                                       <div class="row">
                                           <div class="col-md-3 mb-4">
                                               <label>Bank Name</label>
                                               <input type="text" name="bank_name" class="form-control no-radius @error('bank_name') is-invalid @enderror" value="{{ old('bank_name', $staffMember->bank_name) }}"/>
                                               @if($errors->has('bank_name'))
                                                   <small class="text-danger">{{ $errors->first('bank_name') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>Bank Branch</label>
                                               <input type="text" name="bank_branch" class="form-control no-radius @error('bank_branch') is-invalid @enderror" value="{{ old('bank_branch', $staffMember->bank_branch) }}"/>
                                               @if($errors->has('bank_branch'))
                                                   <small class="text-danger">{{ $errors->first('bank_branch') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>Account Name</label>
                                               <input type="text" name="account_name" class="form-control no-radius @error('account_name') is-invalid @enderror" value="{{ old('account_name', $staffMember->account_name) }}"/>
                                               @if($errors->has('account_name'))
                                                   <small class="text-danger">{{ $errors->first('account_name') }}</small>
                                               @endif
                                           </div>

                                           <div class="col-md-3 mb-4">
                                               <label>Account Number</label>
                                               <input type="text" name="account_no" class="form-control no-radius @error('account_no') is-invalid @enderror" value="{{ old('account_no', $staffMember->account_no) }}"/>
                                               @if($errors->has('account_no'))
                                                   <small class="text-danger">{{ $errors->first('account_no') }}</small>
                                               @endif
                                           </div>
                                       </div>
                                   </div>
                               </div>

                               <div class="col-md-12 mt-4">
                                   <button type="submit" class="btn btn-success btn-flat float-right">
                                       <i class="fa fa-save"></i> Save Changes
                                   </button>
                               </div>
                           </form>
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
