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
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">NEW STUDENT ADMISSION</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Students Details</li>
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


                    @if (Session::has('failed'))
                        <div class="col-md-12 alerts alert alert-danger">
                            <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('failed') }}</p>
                        </div>
                    @endif

                    @if (Session::has('no-parent'))
                        <div class="col-md-12 alerts alert alert-danger">
                            <p class="mb-0"><i class="fa fa-exclamation-triangle"></i> {{ Session::get('no-parent') }}</p>
                        </div>
                    @endif

                <div class="col-md-12 mb-2">
                    <a href="{{ route('student-details.index') }}" class="btn btn-secondary btn-flat">
                        <i class="fa fa-users"></i> View Students List
                    </a>
                </div>

                <div class="col-md-12">
                    <div class="card no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">
                               <i class="fa fa-plus-square"></i> Add New Student
                            </h3>
                        </div>
                        <div class="card-body">
                          <div class="row">
                        <form action="{{ route('student-details.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                              <div class="col-md-12">
                                  <div class="card card-primary card-outline card-outline-tabs">
                                      <div class="card-header p-0 border-bottom-0">
                                          <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                                              <li class="nav-item">
                                                  <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">New Parent</a>
                                              </li>
                                              <li class="nav-item">
                                                  <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">Existing Parent</a>
                                              </li>
                                          </ul>
                                      </div>
                                      <div class="card-body">
                                          <div class="tab-content" id="custom-tabs-four-tabContent">
                                              <div class="tab-pane fade show active" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                                                 <div class="row">
                                                     <div class="col-md-12 mb-3 p-0">
                                                         <div class="row">
                                                             <div class="col-md-12 mb-3"><p class="text-danger">Fill at least one parent's details</p></div>
                                                             <div class="col-md-3">
                                                                 <label>Parent/Guardian ID <sup class="text-danger">required</sup></label>
                                                                 <input id="parent" type="text" name="parent_no" class="form-control form-control-border @error('parent_no') is-invalid @enderror no-radius" value="{{ old('parent_no', $parent_no) }}">
                                                                 @if($errors->has('parent_no'))
                                                                     <small class="text-danger">{{ $errors->first('parent_no') }}</small>
                                                                 @endif
                                                                 <p id="show"></p>
                                                             </div>
                                                             <div class="col-md-3">
                                                                 <label>Primary SMS Contact</label>
                                                                 <input type="text" name="primary_contact" class="form-control form-control-border @error('primary_contact') is-invalid @enderror no-radius" value="{{ old('primary_contact') }}" placeholder="0712345678">
                                                                 @if($errors->has('primary_contact'))
                                                                     <small class="text-danger">{{ $errors->first('primary_contact') }}</small>
                                                                 @endif
                                                             </div>
                                                             <div class="col-md-3">
                                                                 <label>Secondary SMS Contact</label>
                                                                 <input type="text" name="secondary_contact" class="form-control form-control-border @error('secondary_contact') is-invalid @enderror no-radius" value="{{ old('secondary_contact') }}" placeholder="0712345678">
                                                                 @if($errors->has('secondary_contact'))
                                                                     <small class="text-danger">{{ $errors->first('secondary_contact') }}</small>
                                                                 @endif
                                                             </div>
                                                             <div class="col-md-3">
                                                                 <label>Primary Email Address</label>
                                                                 <input type="text" name="primary_email" class="form-control form-control-border @error('primary_email') is-invalid @enderror no-radius" value="{{ old('primary_email') }}">
                                                                 @if($errors->has('primary_email'))
                                                                     <small class="text-danger">{{ $errors->first('primary_email') }}</small>
                                                                 @endif
                                                             </div>
                                                         </div>
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Father's Name</label>
                                                         <input type="text" name="fname" class="form-control form-control-border @error('fname') is-invalid @enderror no-radius" value="{{ old('fname') }}">
                                                         @if($errors->has('fname'))
                                                             <small class="text-danger">{{ $errors->first('fname') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Father's Contact</label>
                                                         <input type="text" name="fcontact" class="form-control form-control-border @error('fcontact') is-invalid @enderror no-radius" placeholder="0712345678" value="{{ old('fcontact') }}">
                                                         @if($errors->has('fcontact'))
                                                             <small class="text-danger">{{ $errors->first('fcontact') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Father's Email Address</label>
                                                         <input type="email" name="femail" class="form-control form-control-border @error('femail') is-invalid @enderror no-radius" value="{{ old('femail') }}">
                                                         @if($errors->has('femail'))
                                                             <small class="text-danger">{{ $errors->first('femail') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Father's Occupation</label>
                                                         <input type="text" name="foccupation" class="form-control form-control-border @error('foccupation') is-invalid @enderror no-radius" value="{{ old('foccupation') }}">
                                                         @if($errors->has('foccupation'))
                                                             <small class="text-danger">{{ $errors->first('foccupation') }}</small>
                                                         @endif
                                                     </div>

                                                     <!-- MOTHER'S DETAILS -->
                                                     <div class="col-md-3 mb-4">
                                                         <label>Mother's Name</label>
                                                         <input type="text" name="mname" class="form-control form-control-border @error('mname') is-invalid @enderror no-radius" value="{{ old('mname') }}">
                                                         @if($errors->has('mname'))
                                                             <small class="text-danger">{{ $errors->first('mname') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Mother's Contact</label>
                                                         <input type="text" name="mcontact" class="form-control form-control-border @error('mcontact') is-invalid @enderror no-radius" placeholder="0712345678" value="{{ old('mcontact') }}">
                                                         @if($errors->has('mcontact'))
                                                             <small class="text-danger">{{ $errors->first('mcontact') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Mother's Email Address</label>
                                                         <input type="email" name="memail" class="form-control form-control-border @error('memail') is-invalid @enderror no-radius" value="{{ old('memail') }}">
                                                         @if($errors->has('memail'))
                                                             <small class="text-danger">{{ $errors->first('memail') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Mother's Occupation</label>
                                                         <input type="text" name="moccupation" class="form-control form-control-border @error('moccupation') is-invalid @enderror no-radius" value="{{ old('moccupation') }}">
                                                         @if($errors->has('moccupation'))
                                                             <small class="text-danger">{{ $errors->first('moccupation') }}</small>
                                                         @endif
                                                     </div>

                                                     <!-- GUARDIAN'S DETAILS -->
                                                     <div class="col-md-3 mb-4">
                                                         <label>Guardian's Name</label>
                                                         <input type="text" name="gname" class="form-control form-control-border @error('gname') is-invalid @enderror no-radius" value="{{ old('gname') }}">
                                                         @if($errors->has('gname'))
                                                             <small class="text-danger">{{ $errors->first('gname') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Guardian's Contact</label>
                                                         <input type="text" name="gcontact" class="form-control form-control-border @error('gcontact') is-invalid @enderror no-radius" placeholder="0712345678" value="{{ old('gcontact') }}">
                                                         @if($errors->has('gcontact'))
                                                             <small class="text-danger">{{ $errors->first('gcontact') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Guardian's Email Address</label>
                                                         <input type="email" name="gemail" class="form-control form-control-border @error('gemail') is-invalid @enderror no-radius" value="{{ old('gemail') }}">
                                                         @if($errors->has('gemail'))
                                                             <small class="text-danger">{{ $errors->first('gemail') }}</small>
                                                         @endif
                                                     </div>

                                                     <div class="col-md-3 mb-4">
                                                         <label>Relationship</label>
                                                         <input type="text" name="grelation" class="form-control form-control-border @error('grelation') is-invalid @enderror no-radius" value="{{ old('grelation') }}">
                                                         @if($errors->has('grelation'))
                                                             <small class="text-danger">{{ $errors->first('grelation') }}</small>
                                                         @endif
                                                     </div>
                                                 </div>
                                              </div>
                                              <div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
                                                  <div class="row">
                                                      <div class="col-md-12 mb-3 p-0">
                                                          <div class="row">
                                                              <div class="col-md-8">
                                                                  <select id="paro_no" name="paro_no" class="form-control select2">
                                                                      <option value="">--Select Parent by Parent No/Name/Contact--</option>
                                                                      @foreach($parents as $parent)
                                                                          <option value="{{ $parent->id }}">
                                                                              {{ $parent->parent_no." / ".$parent->fname." - ".$parent->fcontact." / ".$parent->mname." - ".$parent->mcontact." / ".$parent->gname." - ".$parent->gcontact }}
                                                                          </option>
                                                                      @endforeach
                                                                  </select>
                                                              </div>
                                                              <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                                                          </div>
                                                      </div>

                                                      <div class="col-md-12 mt-2">
                                                        <div id="result" class="row">

                                                        </div>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <!-- /.card -->
                                  </div>
                              </div>

                              <div class="col-md-12">
                                  <div class="card no-radius card-success card-outline">
                                      <div class="card-header">
                                          <h3 class="card-title"><i class="fa fa-child"></i> Student Information</h3>
                                      </div>
                                      <div class="card-body">
                                          <div class="row">
                                              <div class="col-md-12 mb-3 p-0">
                                                  <div class="col-md-4">
                                                      <label>Admission Number <sup class="text-danger">required</sup></label>
                                                      <input type="text" name="admno" class="form-control form-control-border @error('admno') is-invalid @enderror no-radius" value="{{ old('admno', $admno) }}">
                                                      @if($errors->has('admno'))
                                                          <small class="text-danger">{{ $errors->first('admno') }}</small>
                                                      @endif
                                                  </div>
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Student's Name <sup class="text-danger">required</sup></label>
                                                  <input type="text" name="name" class="form-control form-control-border @error('name') is-invalid @enderror no-radius" value="{{ old('name') }}">
                                                  @if($errors->has('name'))
                                                      <small class="text-danger">{{ $errors->first('name') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Birth Cert. No</label>
                                                  <input type="text" name="birth_cert" class="form-control form-control-border @error('birth_cert') is-invalid @enderror no-radius" value="{{ old('birth_cert') }}">
                                                  @if($errors->has('birth_cert'))
                                                      <small class="text-danger">{{ $errors->first('birth_cert') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>NEMIS UPI</label>
                                                  <input type="text" name="nemis_upi" class="form-control form-control-border @error('nemis_upi') is-invalid @enderror no-radius" value="{{ old('nemis_upi') }}">
                                                  @if($errors->has('nemis_upi'))
                                                      <small class="text-danger">{{ $errors->first('nemis_upi') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Date of Admission <sup class="text-danger">required</sup></label>
                                                  <input type="date" name="doa" class="form-control form-control-border @error('doa') is-invalid @enderror no-radius" value="{{ old('doa') }}">
                                                  @if($errors->has('doa'))
                                                      <small class="text-danger">{{ $errors->first('doa') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Date of Birth <sup class="text-danger">required</sup></label>
                                                  <input type="date" name="dob" class="form-control form-control-border @error('dob') is-invalid @enderror no-radius" max="{{ date('Y-m-d') }}" value="{{ old('dob') }}">
                                                  @if($errors->has('dob'))
                                                      <small class="text-danger">{{ $errors->first('dob') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Area of Residence</label>
                                                  <input type="text" name="residence" class="form-control form-control-border @error('residence') is-invalid @enderror no-radius" value="{{ old('residence') }}">
                                                  @if($errors->has('residence'))
                                                      <small class="text-danger">{{ $errors->first('residence') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Gender <sup class="text-danger">required</sup></label>
                                                  <select name="gender" class="form-control select2 @error('gender') is-invalid @enderror">
                                                      <option value="">--Select Option--</option>
                                                      <option value="1">Male</option>
                                                      <option value="2">Female</option>
                                                  </select>
                                                  @if($errors->has('gender'))
                                                      <small class="text-danger">{{ $errors->first('gender') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Classroom <sup class="text-danger">required</sup></label>
                                                  <select name="classroom" class="form-control select2 @error('classroom') is-invalid @enderror no-radius">
                                                      <option value="">--Select Option--</option>
                                                      @foreach($classrooms as $classroom)
                                                          <option value="{{ $classroom->id }}">{{ $classroom->name }}</option>
                                                      @endforeach
                                                  </select>
                                                  @if($errors->has('classroom'))
                                                      <small class="text-danger">{{ $errors->first('classroom') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Admission Type <sup class="text-danger">required</sup></label>
                                                  <select name="adm_type" class="form-control select2 @error('adm_type') is-invalid @enderror">
                                                      <option value="">--Select Option--</option>
                                                      <option value="1">New Admission</option>
                                                      <option value="2">Existing Student</option>
                                                  </select>
                                                  @if($errors->has('adm_type'))
                                                      <small class="text-danger">{{ $errors->first('adm_type') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Financial Session <sup class="text-danger">required</sup></label>
                                                  <select name="current_session" class="form-control select2 @error('current_session') is-invalid @enderror no-radius">
                                                      <option value="">--Select Financial Session--</option>
                                                      @foreach($current_sessions as $current_session)
                                                          <option value="{{ $current_session->id }}">{{ ucwords($current_session->name) }}</option>
                                                      @endforeach
                                                  </select>
                                                  @if($errors->has('current_session'))
                                                      <small class="text-danger">{{ $errors->first('current_session') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Discount Level <sup class="text-danger">required</sup></label>
                                                  <select name="discount_level" class="form-control select2 @error('discount_level') is-invalid @enderror no-radius">
                                                      <option value="">--Select Discount Level--</option>
                                                    @foreach($discount_levels as $discount_level)
                                                      <option value="{{ $discount_level->id }}">{{ $discount_level->name." (".$discount_level->discount.")" }}</option>
                                                     @endforeach
                                                  </select>
                                                  @if($errors->has('discount_level'))
                                                      <small class="text-danger">{{ $errors->first('discount_level') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Send SMS To: <sup class="text-danger">required</sup></label>
                                                  <select name="send_to" class="form-control select2 @error('send_to') is-invalid @enderror">
                                                      <option value="">--Select Option--</option>
                                                      <option value="primary_contact">Primary Contact</option>
                                                      <option value="secondary_contact">Secondary Contact</option>
                                                      <option value="both_contacts">Both Contacts</option>
                                                  </select>
                                                  @if($errors->has('send_to'))
                                                      <small class="text-danger">{{ $errors->first('send_to') }}</small>
                                                  @endif
                                              </div>

                                              <div class="col-md-3 mb-4">
                                                  <label>Photo</label>
                                                  <input type="file" name="photo" accept=".jpg,.jpeg,.png,.tiff" class="form-control">
                                                  @if($errors->has('photo'))
                                                      <small class="text-danger">{{ $errors->first('photo') }}</small>
                                                  @endif
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>

                              <div class="col-md-12">
                                  <div class="card no-radius card-danger card-outline">
                                      <div class="card-header">
                                          <h3 class="card-title"><i class="fa fa-dollar-sign"></i> Student Fees</h3>
                                      </div>
                                      <div class="card-body">
                                          <div class="row">
                                              <div id="fees" class="col-md-12 mb-3 p-0">

                                              </div>

                                              <div class="col-md-12 mb-3 p-0">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="col-md-12 mb-2">
                                                            <h5>Optional Fees <small class="text-muted" style="text-decoration: underline">select optional fees</small></h5>
                                                        </div>

                                                        @foreach($optional_fees as $optional_fee)
                                                            <div class="col-md-12 mb-3 mt-3">
                                                                <input type="checkbox" name="options[]" class="mr-2" value="{{ $optional_fee->id }}">
                                                                <span>{{ ucwords(strtolower($optional_fee->fee_parameter->name)) }} [ <span class="text-danger">KES. {{ number_format($optional_fee->amount,2) }}</span> ]</span>
                                                            </div>
                                                        @endforeach
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="col-md-12 mb-2">
                                                            <h5>Transport Details <small class="text-muted" style="text-decoration: underline">Select Transport Zone</small></h5>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label>Transport Zone</label>
                                                                    <select id="transport" name="transport_zone_id" class="form-control select2 @error('transport_zone_id') is-invalid @enderror no-radius">
                                                                        <option value="">--Select Option--</option>
                                                                        @foreach($transport_zone_fees as $transport_zone_fee)
                                                                            <option value="{{ $transport_zone_fee->id }}">{{ $transport_zone_fee->transport_zone->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                    @if($errors->has('transport_zone_id'))
                                                                        <small class="text-danger">{{ $errors->first('transport_zone_id') }}</small>
                                                                    @endif
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <label>Transport Mode</label>
                                                                    <select id="way" name="way" class="form-control select2 @error('way') is-invalid @enderror no-radius">
                                                                        <option value="">--Select Transport Zone--</option>

                                                                    </select>
                                                                    @if($errors->has('way'))
                                                                        <small class="text-danger">{{ $errors->first('way') }}</small>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>

                                                </div>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>

                              <div class="col-md-12">
                                  <button type="submit" class="btn btn-primary btn-flat float-right ml-2">
                                      <i class="fa fa-save"></i> Save Student
                                  </button>
                                  <button type="reset" class="btn btn-warning btn-flat float-right">
                                      <i class="fa fa-brush"></i> Clear Everything
                                  </button>
                              </div>
                        </form>
                          </div>
                            <!-- /.row -->
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
