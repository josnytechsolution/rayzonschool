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
                        <h1 class="m-0 text-dark">EDIT {{ strtoupper($student->name) }}</h1>
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
                                    <i class="fa fa-edit"></i> Edit Student
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <form action="{{ route('student-details.update', $student->slug) }}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        @method('PUT')
                                        <div class="col-md-12">
                                            <div class="card no-radius card-success card-outline">
                                                <div class="card-header">
                                                    <h3 class="card-title"><i class="fa fa-child"></i> Student Information</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-3 mb-4">
                                                            <label>Admission Number <sup class="text-danger">required</sup></label>
                                                            <input type="text" name="admno" class="form-control @error('admno') is-invalid @enderror no-radius" value="{{ old('admno', $student->admno) }}">
                                                            @if($errors->has('admno'))
                                                                <small class="text-danger">{{ $errors->first('admno') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Student's Name <sup class="text-danger">required</sup></label>
                                                            <input type="text" name="name" class="form-control @error('name') is-invalid @enderror no-radius" value="{{ old('name', $student->name) }}">
                                                            @if($errors->has('name'))
                                                                <small class="text-danger">{{ $errors->first('name') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Birth Cert. No</label>
                                                            <input type="text" name="birth_cert" class="form-control @error('birth_cert') is-invalid @enderror no-radius" value="{{ old('birth_cert', $student->birth_cert) }}">
                                                            @if($errors->has('birth_cert'))
                                                                <small class="text-danger">{{ $errors->first('birth_cert') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>NEMIS UPI</label>
                                                            <input type="text" name="nemis_upi" class="form-control @error('nemis_upi') is-invalid @enderror no-radius" value="{{ old('nemis_upi', $student->nemis_upi) }}">
                                                            @if($errors->has('nemis_upi'))
                                                                <small class="text-danger">{{ $errors->first('nemis_upi') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Date of Admission <sup class="text-danger">required</sup></label>
                                                            <input type="date" name="doa" class="form-control @error('doa') is-invalid @enderror no-radius" value="{{ old('doa', $student->doa) }}">
                                                            @if($errors->has('doa'))
                                                                <small class="text-danger">{{ $errors->first('doa') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Date of Birth <sup class="text-danger">required</sup></label>
                                                            <input type="date" name="dob" class="form-control @error('dob') is-invalid @enderror no-radius" max="{{ date('Y-m-d') }}" value="{{ old('dob', $student->dob) }}">
                                                            @if($errors->has('dob'))
                                                                <small class="text-danger">{{ $errors->first('dob') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Area of Residence</label>
                                                            <input type="text" name="residence" class="form-control @error('residence') is-invalid @enderror no-radius" value="{{ old('residence', $student->residence) }}">
                                                            @if($errors->has('residence'))
                                                                <small class="text-danger">{{ $errors->first('residence') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Gender <sup class="text-danger">required</sup></label>
                                                            <select name="gender" class="form-control select2 @error('gender') is-invalid @enderror">
                                                                <option value="{{ $student->getOriginal('gender') }}">{{ $student->gender }}</option>
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
                                                                <option value="{{ $student->getOriginal('classroom_id') }}">{{ $student->classroom->name }}</option>
                                                                @foreach($classrooms as $classroom)
                                                                    <option value="{{ $classroom->id }}">{{ $classroom->name }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('classroom'))
                                                                <small class="text-danger">{{ $errors->first('classroom') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-3">
                                                            <label>Discount Level <sup class="text-danger">required</sup></label>
                                                            <select name="discount_level" class="form-control select2 @error('discount_level') is-invalid @enderror no-radius">
                                                                <option value="{{ $student->getOriginal('discount_level_id') }}">{{ $student->discount_level->name }}</option>
                                                                @foreach($discount_levels as $discount_level)
                                                                    <option value="{{ $discount_level->id }}">{{ $discount_level->name }}</option>
                                                                @endforeach
                                                            </select>
                                                            @if($errors->has('discount_level'))
                                                                <small class="text-danger">{{ $errors->first('discount_level') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-3">
                                                            <label>Send SMS To: <sup class="text-danger">required</sup></label>
                                                            <select name="send_to" class="form-control select2 @error('send_to') is-invalid @enderror">
                                                                <option value="{{ $student->getOriginal('send_to') }}">{{ $student->send_to }}</option>
                                                                <option value="primary_contact">Primary Contact</option>
                                                                <option value="secondary_contact">Secondary Contact</option>
                                                                <option value="both_contacts">Both Contacts</option>
                                                            </select>
                                                            @if($errors->has('send_to'))
                                                                <small class="text-danger">{{ $errors->first('send_to') }}</small>
                                                            @endif
                                                        </div>

                                                        <div class="col-md-3 mb-4">
                                                            <label>Status <sup class="text-danger">required</sup></label>
                                                            <select name="status" class="form-control select2 @error('status') is-invalid @enderror">
                                                                <option value="{{ $student->getOriginal('status') }}">{{ $student->status }}</option>
                                                                <option value="2">Inactive</option>
                                                            </select>
                                                            @if($errors->has('status'))
                                                                <small class="text-danger">{{ $errors->first('status') }}</small>
                                                            @endif
                                                        </div>

                                                        @if($student->transport_fleet_id != NULL || $student->transport_zone_id != NULL)
                                                            <div class="col-md-3 mb-4">
                                                                <label>Transport Vehicle</label>
                                                                <select name="transport_fleet_id" class="form-control select2 @error('transport_fleet_id') is-invalid @enderror no-radius">
                                                                    <option value="{{ $student->transport_fleet_id }}">{{ $student->transport_fleet->name ?? __("Select Vehicle")  }}</option>
                                                                    @php($transport_fleets = \App\TransportFleet::all())
                                                                    @foreach($transport_fleets as $transport_fleet)
                                                                        <option value="{{ $transport_fleet->id }}">{{ $transport_fleet->name." - ".$transport_fleet->reg_no }}</option>
                                                                    @endforeach
                                                                </select>
                                                                @if($errors->has('transport_fleet_id'))
                                                                    <small class="text-danger">{{ $errors->first('transport_fleet_id') }}</small>
                                                                @endif
                                                            </div>
                                                        @endif

                                                        <div class="col-md-3 mb-4">
                                                            <label>Photo</label>
                                                            <input type="file" name="photo" accept=".jpg,.jpeg,.png,.tiff">
                                                            @if($errors->has('photo'))
                                                                <small class="text-danger">{{ $errors->first('photo') }}</small>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card card-info card-outline no-radius">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                        <i class="fa fa-user"></i> Parent Information
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="col-md-12">
                                                        <label>Parent/Guardian<sup class="text-danger">*</sup></label>
                                                        <select id="paro_no" name="parent_detail_id" class="form-control select2 @error('parent_detail_id') is-invalid @enderror no-radius">
                                                            <option value="{{ $student->parent_detail_id }}">{{ $student->parent_detail->parent_no." - ".$student->parent_detail->fcontact." / ".$student->parent_detail->mname." - ".$student->parent_detail->mcontact." / ".$student->parent_detail->gname." - ".$student->parent_detail->gcontact }}</option>
                                                            @foreach($parents as $parent)
                                                                <option value="{{ $parent->id }}">
                                                                    {{ $parent->parent_no." - ".$parent->fname." - ".$parent->fcontact." / ".$parent->mname." - ".$parent->mcontact." / ".$parent->gname." - ".$parent->gcontact }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        @if($errors->has('parent_detail_id'))
                                                            <small class="text-danger">{{ $errors->first('parent_detail_id') }}</small>
                                                        @endif
                                                    </div>
                                                    <div class="col-md-12 mt-4">
                                                        <div id="result" class="row">
                                                            <div class="col-md-12 mb-3 p-0">
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <label>Parent/Guardian ID</label>
                                                                        <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->parent_no }}" readonly>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <label>Dedicated SMS Contact</label>
                                                                        <input type="text" name="primary_contact" class="form-control @error('primary_contact') is-invalid @enderror no-radius" value="{{ old('primary_contact', $student->parent_detail->primary_contact) }}" readonly>
                                                                        @if($errors->has('primary_contact'))
                                                                            <small class="text-danger">{{ $errors->first('primary_contact') }}</small>
                                                                        @endif
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <label>Secondary SMS Contact</label>
                                                                        <input type="text" name="secondary_contact" class="form-control @error('secondary_contact') is-invalid @enderror no-radius" value="{{ old('secondary_contact', $student->parent_detail->secondary_contact) }}" readonly>
                                                                        @if($errors->has('secondary_contact'))
                                                                            <small class="text-danger">{{ $errors->first('secondary_contact') }}</small>
                                                                        @endif
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <label>Primary Email Address</label>
                                                                        <input type="text" name="primary_email" class="form-control @error('primary_email') is-invalid @enderror no-radius" value="{{ old('primary_email', $student->parent_detail->primary_email) }}" readonly>
                                                                        @if($errors->has('primary_email'))
                                                                            <small class="text-danger">{{ $errors->first('primary_email') }}</small>
                                                                        @endif
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Father's Name</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->fname }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Father's Contact</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->fcontact }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Father's Email Address</label>
                                                                <input type="email" class="form-control no-radius" value="{{ $student->parent_detail->femail }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Father's Occupation</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->foccupation }}" readonly>
                                                            </div>

                                                            <!-- MOTHER'S DETAILS -->
                                                            <div class="col-md-3 mb-2">
                                                                <label>Mother's Name</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->mname }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Mother's Contact</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->mcontact }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Mother's Email Address</label>
                                                                <input type="email" class="form-control no-radius" value="{{ $student->parent_detail->memail }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Mother's Occupation</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->moccupation }}" readonly>
                                                            </div>

                                                            <!-- GUARDIAN'S DETAILS -->
                                                            <div class="col-md-3 mb-2">
                                                                <label>Guardian's Name</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->gname }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Guardian's Contact</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->gcontact }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Guardian's Email Address</label>
                                                                <input type="email" class="form-control no-radius" value="{{ $student->parent_detail->gemail }}" readonly>
                                                            </div>

                                                            <div class="col-md-3 mb-2">
                                                                <label>Guardian's Occupation</label>
                                                                <input type="text" class="form-control no-radius" value="{{ $student->parent_detail->grelation }}" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary btn-flat btn-sm float-right">
                                                <i class="fa fa-save"></i> Save Changes
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
