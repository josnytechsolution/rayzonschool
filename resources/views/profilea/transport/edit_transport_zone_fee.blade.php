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
                    <h1 class="m-0 text-dark">Edit Transport Zone Fees</h1>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    @if($message = Session::get('success'))
                        <div class="alerts alert alert-success">
                            {{ $message }}
                        </div>
                    @endif

                    @if (\Session::has('error'))
                        <div class="alerts alert alert-warning">
                                <p class="mb-0 mt-0">{{ \Session::get('error') }}</p>
                        </div>
                    @endif

                </div>
                <div class="col-md-3">
                    <div class="card card-primary card-outline no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fa fa-plus"></i> Edit Transport Zone Fee</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('transport-zone-fees.update', $transportZoneFee->slug) }}" method="post">
                                @csrf
                                @method('PUT')
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label>Transport Zone</label>
                                        <select name="transport_zone_id" class="form-control select2 @error('transport_zone_id') is-invalid @enderror no-radius" value="{{ old('transport_zone_id') }}">
                                            <option value="{{ $transportZoneFee->transport_zone->id }}">{{ $transportZoneFee->transport_zone->name }}</option>
                                            @foreach($transport_zones as $transport_zone)
                                                <option value="{{ $transport_zone->id }}">{{ $transport_zone->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('transport_zone_id'))
                                            <small class="text-danger">{{ $errors->first('transport_zone_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label>One Way Fee</label>
                                        <input type="text" name="one_way" class="form-control @error('one_way') is-invalid @enderror no-radius" value="{{ old('one_way', $transportZoneFee->one_way) }}">
                                        @if($errors->has('one_way'))
                                            <small class="text-danger">{{ $errors->first('one_way') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label>Two Way Fee</label>
                                        <input type="text" name="two_way" class="form-control @error('two_way') is-invalid @enderror no-radius" value="{{ old('two_way',  $transportZoneFee->two_way) }}">
                                        @if($errors->has('two_way'))
                                            <small class="text-danger">{{ $errors->first('two_way') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label>Current Session</label>
                                        <select name="current_session_id" class="form-control select2 @error('current_session_id') is-invalid @enderror no-radius" value="{{ old('financial_year_id') }}">
                                            <option value="{{ $transportZoneFee->current_session_id }}">{{ $transportZoneFee->current_session->name }}</option>
                                            @foreach($current_sessions as $current_session)
                                                <option value="{{ $current_session->id }}">{{ $current_session->name }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('current_session_id'))
                                            <small class="text-danger">{{ $errors->first('current_session_id') }}</small>
                                        @endif
                                    </div>

                                    <div class="form-group col-md-12 mt-4">
                                        <button type="submit" class="btn btn-primary float-right no-radius" >
                                            <i class="fa fa-save"></i> Save Changes
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="card card-primary card-outline no-radius bg-white">
                        <div class="card-header">
                            <h3 class="card-title">Transport Zone Fees List</h3>
                        </div>
                        <div class="card-body">

                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>ZONE NAME</th>
                                    <th style="text-align: right;">ONE WAY</th>
                                    <th style="text-align: right;">TWO WAY</th>
                                    <th style="text-align: right;">TERM</th>
                                    <th style="text-align: right;">YEAR</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                                </thead>
                                <tbody>
                            <?php $i = 1; ?>
                            @foreach($zone_fees as $zone_fee)
                                <tr>
                                    <td>{{ $i }}</td>
                                    <td>{{ $zone_fee->transport_zone->name }}</td>
                                    <td style="text-align: right;">{{ number_format($zone_fee->one_way,2) }}</td>
                                    <td style="text-align: right;">{{ number_format($zone_fee->two_way,2) }}</td>
                                    <td style="text-align: right;">{{ $zone_fee->current_session->academic_term->name }}</td>
                                    <td style="text-align: right;">{{ $zone_fee->current_session->financial_year->name }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('transport-zone-fees.edit', $zone_fee->slug) }}">
                                            <i class="fa fa-edit text-success"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="#deleteZone{{ $zone_fee->slug }}" data-toggle="modal">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>

                                <!-- Start Delete Modal -->
                                <div class="modal fade" id="deleteZone{{ $zone_fee->slug }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content no-radius">
                                            <form action="{{ route('transport-zone-fees.destroy', $zone_fee->slug) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-trash text-danger"></i> Delete Zone Fee</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-sm">
                                                    <div class="col-md-12 mb-3">
                                                        <div class="alert alert-warning" style="text-align: center">
                                                            <i class="fa fa-exclamation-triangle fa-2x"></i><br>
                                                            This action cannot be undone.<br>
                                                            This will delete all information related to this Zone Fee.<br>
                                                            Are you you want to delete zone fee?
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
                                                    <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-save"></i> Yes! Delete Zone Fee</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>

                                </div>
                                <!-- End Edit Modal -->

                                <?php $i++; ?>
                            @endforeach
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
