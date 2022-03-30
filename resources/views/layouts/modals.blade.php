<!-- Start Delete Modal -->
<div class="modal fade" id="timeOut" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"> Session Timeout</h5>
            </div>
            <div class="modal-body text-sm">
                <div class="col-md-12 mb-3">
                    <div class="alert alert-warning" style="text-align: center">
                        <i class="fa fa-clock fa-2x"></i><br>
                        You have not interacted with the system for sometime now.<br>
                        The system will log you out in 10 seconds.<br>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <form action="{{ route('sessionReset') }}" method="post">
                    @csrf
                    <button type="submit" class="btn btn-primary btn-flat float-left">
                        Stay Connected
                    </button>
                </form>

                <a class="btn btn-success btn-flat" href="{{ route('logout') }}"
                   onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                    {{ __('Logout') }}
                </a>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            </div>

        </div>
    </div>

</div>
<!-- End Edit Modal -->

<!-- Start Class Invoices Modal -->
<div class="modal fade" id="classFees" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-check text-primary"></i> Select Class/Grade</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 px-5">
                        @php($grades = App\ClassGrade::orderBy('name', 'asc')->get())
                        @foreach($grades as $grade)
                            <a href="{{ route('feeStructure', $grade->slug) }}" class="btn btn-outline-info btn-block btn-flat mt-2">{{ strtoupper($grade->name) }}</a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- End Class Invoices Modal -->

<!-- Start Class Invoices Modal -->
<div class="modal fade" id="classInvoices" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-check text-primary"></i> Select Class/Grade</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 px-5">
                        @php($grades = App\ClassGrade::orderBy('name', 'asc')->get())
                        @foreach($grades as $grade)
                            <a href="{{ route('invoicesPDF', $grade->id) }}" class="btn btn-outline-info btn-block btn-flat mt-2" target="_blank">{{ strtoupper($grade->name) }}</a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- End Class Invoices Modal -->

<!-- Start Student fees Modal -->
<div class="modal fade" id="studFee" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-check text-primary"></i> Select Student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('getStudent') }}" method="post">
                @csrf
                <div class="modal-body text-sm">
                    <div class="row">
                        <div class="form-group col-md-12 mt-2">
                            <label>Select Student</label>
                            <select name="stud" class="form-control select2 @error('stud') is-invalid @enderror no-radius">
                                <option value="">--Select Student--</option>
                                @php($studs = App\Student::Active()->orderBy('name', 'asc')->get())
                                @foreach($studs as $stud)
                                    <option value="{{ $stud->slug }}">{{ $stud->admno." ".ucwords($stud->name)." ".$stud->class_grade->name." ".$stud->parent_detail->primary_contact }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> View Student Fees</button>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- End Student Fees Modal -->

<!-- Start Student fees Modal -->
<div class="modal fade" id="collectFees" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user-check text-primary"></i> Select Student</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('collectFees') }}" method="post">
                @csrf
                <div class="modal-body text-sm">
                    <div class="row">
                        <div class="form-group col-md-12 mt-2">
                            <label>Select Student</label>
                            <select name="stud" class="form-control select2 @error('stud') is-invalid @enderror no-radius">
                                <option value="">--Select Student--</option>
                                @php($studs = App\Student::Active()->orderBy('name', 'asc')->get())
                                @foreach($studs as $stud)
                                    <option value="{{ $stud->slug }}">{{ $stud->admno." ".ucwords($stud->name)." ".$stud->class_grade->name." ".$stud->parent_detail->primary_contact }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> Collect Student Fees</button>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- End Student Fees Modal -->

<!-- Start Collected fees Report Modal -->
<div class="modal fade" id="collectedReport" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-calendar-alt"></i> Select Range</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('collectedFeeReport') }}" method="post">
                @csrf
                <div class="modal-body text-sm">
                    <div class="row">
                        <div class="form-group col-md-12 mt-2">
                            <label>Date From:</label>
                            <input type="date" name="date_from" class="form-control @error('date_from') is-invalid @enderror no-radius" required>
                            @if($errors->has('date_from'))
                                <small class="text-danger">{{ $errors->first('date_from') }}</small>
                            @endif
                        </div>

                        <div class="form-group col-md-12 mt-2">
                            <label>Date To:</label>
                            <input type="date" name="date_to" class="form-control @error('date_to') is-invalid @enderror no-radius" required>
                            @if($errors->has('date_to'))
                                <small class="text-danger">{{ $errors->first('date_to') }}</small>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-flat btn-block"><i class="fa fa-search"></i> Search</button>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- End Collected Fees Report Modal -->

<!-- Start Bank Report Modal -->
<div class="modal fade" id="bankReports" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content no-radius">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-calendar-alt"></i> Select Bank & Date Range</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('bankReport') }}" method="post">
                @csrf
                <div class="modal-body text-sm">
                    <div class="row">
                        <div class="form-group col-md-12 mt-2">
                            <label>Select Bank</label>
                            <select name="bank" class="form-control select2 @error('stud') is-invalid @enderror no-radius" required>
                                <option value="">--Select Bank--</option>
                                @php($banks = App\Bank::all())
                                @foreach($banks as $bank)
                                    <option value="{{ $bank->id }}">{{ ucwords($bank->name)." ".ucwords($bank->long_name)." ".ucwords($bank->account_no) }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-md-12 mt-2">
                            <label>Date From:</label>
                            <input type="date" name="date_from" class="form-control @error('date_from') is-invalid @enderror no-radius" required>
                            @if($errors->has('date_from'))
                                <small class="text-danger">{{ $errors->first('date_from') }}</small>
                            @endif
                        </div>

                        <div class="form-group col-md-12 mt-2">
                            <label>Date To:</label>
                            <input type="date" name="date_to" class="form-control @error('date_to') is-invalid @enderror no-radius" required>
                            @if($errors->has('date_to'))
                                <small class="text-danger">{{ $errors->first('date_to') }}</small>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-flat btn-block"><i class="fa fa-search"></i> Search</button>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- End Bank Report Modal -->