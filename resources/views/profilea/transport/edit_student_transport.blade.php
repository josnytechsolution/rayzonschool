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
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">
                        {{ strtoupper($studentTransport->name) }}
                        <small>Edit Termly Transport</small>
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">School Transport</li>
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
                <div class="col-md-12">
                    @if($message = Session::get('success'))
                        <div class="alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if (Session::has('error'))
                        <div class="alerts alert alert-warning">
                                <p class="mb-0 mt-0">{{ Session::get('error') }}</p>
                        </div>
                    @endif
                </div>
                <div class="col-md-12">
                   <div class="row">
                       <div class="col-md-4"></div>
                       <div class="col-md-4">
                           <div class="card card-success card-outline no-radius">
                               <form action="{{ route('student-transports.update', $studentTransport->id) }}" method="post">
                                   @csrf
                                   @method('PUT')
                               <div class="card-header">
                                   <h3 class="card-title">Edit {{ $studentTransport->student->name }}'s Transport</h3>
                               </div>
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-md-12 alert alert-warning text-center">
                                           <b>The changes you make here will only apply to the current term only!</b>
                                       </div>
                                       <div class="col-md-12 form-group">
                                           <label>Transport Zone</label>
                                           <select id="etransport" name="transport_zone_id" class="form-control select2 @error('transport_zone_id') is-invalid @enderror no-radius">
                                               <option value="{{ $studentTransport->id }}">{{ $studentTransport->transport_zone_fee->transport_zone->name }}</option>
                                               @php($transport_zone_fees = App\TransportZoneFee::all())
                                               @foreach($transport_zone_fees as $transport_zone_fee)
                                                   <option value="{{ $transport_zone_fee->id }}">{{ $transport_zone_fee->transport_zone->name }}</option>
                                               @endforeach
                                           </select>
                                           @if($errors->has('transport_zone_id'))
                                               <small class="text-danger">{{ $errors->first('transport_zone_id') }}</small>
                                           @endif
                                       </div>

                                       <div class="col-md-12 form-group">
                                           <label>Transport Mode</label>
                                           <select id="eway" name="way" class="form-control select2 @error('way') is-invalid @enderror no-radius">
                                               <option value="{{ $studentTransport->getOriginal('way') }}">{{ $studentTransport->way." - ".$studentTransport->amount }}</option>

                                           </select>
                                           @if($errors->has('way'))
                                               <small class="text-danger">{{ $errors->first('way') }}</small>
                                           @endif
                                       </div>
                                   </div>
                               </div>
                               <div class="card-footer">
                                   <a href="{{ route('student-transports.index') }}" class="btn btn-secondary btn-flat float-left"><i class="fa fa-times"></i> Cancel</a>
                                   <button type="submit" class="btn btn-success btn-flat float-right"><i class="fa fa-save"></i> Save Changes</button>
                               </div>
                               </form>
                           </div>
                       </div>
                       <div class="col-md-4"></div>
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
