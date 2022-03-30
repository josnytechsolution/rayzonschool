<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'SchoolBest') }}</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="{{ asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- DataTables -->
    <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <!-- Select2 -->
    <link rel="stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <!-- Toastr -->
    <link rel="stylesheet" href="{{ asset('plugins/toastr/toastr.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- JQVMap -->
    <link rel="stylesheet" href="{{ asset('plugins/jqvmap/jqvmap.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('dist/css/adminlte.min.css') }}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- summernote -->
    <link rel="stylesheet" href="{{ asset('plugins/summernote/summernote-bs4.css') }}">
    <link rel="icon" href="{{ asset('dist/img/schoolbest-mini-logo.png') }}" sizes="16x16" type="image/png">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <style>
        .no-radius{ border-radius: 0px; }
        .my-green { color: #10ac84; }
        .area-text {
            width: 100%;
            height: 400px;
            font-size: 14px;
            line-height: 18px;
            border: 1px solid #dddddd;
            padding: 10px;
        }
    </style>

    <style>
        .table-scrollbar {
            overflow: auto;
        }
    </style>

    <style>
        .loader {
            width: 250px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-family: helvetica, arial, sans-serif;
            text-transform: uppercase;
            font-weight: 900;
            color: #27ae60;
            letter-spacing: 0.2em;
        }
        .loader:before, .loader:after {
            content: "";
            display: block;
            width: 15px;
            height: 15px;
            background:  #27ae60;
            position: absolute;
            animation: load .7s infinite alternate ease-in-out;
        }

        .loader:before {
            top: 0;
        }

        .loader:after {
            bottom: 0;
        }

        @keyframes load {
            0% { left: 0; height: 30px; width: 15px }
            50% { height: 8px; width: 40px }
            100% { left: 235px; height: 30px; width: 15px}
        }

        #loading {
            display: none;
            text-align: center;
        }
    </style>



    <script type="text/javascript">
        window.setTimeout(function() {
            $(".alerts").fadeTo(500, 0).slideUp(500, function(){
                $(this).remove();
            });
        }, 5000);
    </script>

    <!-- page script -->
    <script>
        function checkSession() {
            $.post('{{ route('session.ajax.check') }}', { '_token' : '{!! csrf_token() !!}' }, function(data) {
                if (data == 'loggedOut') {
                    // User was logged out. Redirect to login page
                    document.getElementById('logout-form').submit();
                }
                else if (data != '') {
                    // User will be logged out soon.
                    //console.log(data);
                    $("#timeOut").modal();
                }
            });
        }
        setInterval(checkSession, 5000);
    </script>

</head>
<body class="hold-transition sidebar-mini sidebar-collapse layout-fixed layout-navbar-fixed text-sm" style="font-family: Nunito">

<div class="wrapper">

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
                        <h5 class="m-0 text-dark">{{ strtoupper($current_session->name) }} MPESA PAYMENTS FEES</h5>
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
                    <div class="col-md-12 mb-4">
                        <a href="#confirmTransaction" class="btn btn-primary float-right" data-toggle="modal">
                            <i class="fa fa-search"></i> Confirm Transaction
                        </a>
                        <!-- Start Class Invoices Modal -->
                        <div class="modal fade" id="confirmTransaction" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content no-radius">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <small aria-hidden="true" class="text-xs"><u>close</u></small>
                                                </button>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="form-group no-radius col-10">
                                                        <input type="text" id="code" class="form-control no-radius" placeholder="Enter Confirmation Code">
                                                    </div>
                                                    <div class="form-group no-radius col-2">
                                                        <button type="button" class="btn btn-flat no-radius" onclick="confirmPayment()">
                                                            <i class="fa fa-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="myDiv" class="col-md-12 py-5">
                                                <div class="loader" id="loading">Searching...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- End Modal -->
                    </div>
                    <div class="col-md-12">
                        <div class="card card-primary card-outline no-radius">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fa fa-database"></i> {{ strtoupper($current_session->name) }} MPESA PAYMENTS
                                </h3>

                                <div class="card-tools">
                                    <div class="btn-group">
                                        <div class="input-group-prepend ml-2">
                                            <button type="button" class="btn btn-secondary btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-filter"></i> Filter By Class
                                            </button>
                                            <div class="dropdown-menu">
                                                @php($class_grades = App\ClassGrade::Active()->orderBy('level', 'asc')->get())
                                                @foreach($class_grades as $class_grade)
                                                    <a class="dropdown-item text-muted" href="">
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
                                                <a class="dropdown-item text-danger" href="">
                                                    <i class="fa fa-file-pdf text-danger"></i> Export To PDF
                                                </a>
                                                <a class="dropdown-item text-success" href="#">
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
                                            <th>ADM #</th>
                                            <th>STUDENT NAME</th>
                                            <th>CLASS/GRADE</th>
                                            <th style="text-align: right;">AMOUNT</th>
                                            <th>REF. NO</th>
                                            <th>PAYER</th>
                                            <th>CONTACT</th>
                                            <th>DATE/TIME</th>
                                            <th>STATUS</th>
                                            </thead>
                                            <tbody>
                                            @php($i = 1)
                                            @foreach($mpesa_payments as $mpesa_payment)
                                                <tr>
                                                    <td style="vertical-align: middle">{{ $i }}</td>
                                                    <td style="vertical-align: middle">{{ $mpesa_payment->billRefNumber }}</td>
                                                    <td style="vertical-align: middle">@if($mpesa_payment->student_id != NULL) {{ strtoupper($mpesa_payment->student->name) }} @endif</td>
                                                    <td style="vertical-align: middle">@if($mpesa_payment->student_id != NULL) {{ strtoupper($mpesa_payment->student->class_grade->long_name) }} @endif</td>
                                                    <td style="vertical-align: middle;text-align: right;">KES {{ number_format($mpesa_payment->transAmount,2) }}</td>
                                                    <td style="vertical-align: middle">
                                                        <a href="#showMessage{{ $mpesa_payment->id }}" data-toggle="modal" title="Click To View SMS">
                                                            {{ $mpesa_payment->transID }}
                                                        </a>
                                                    </td>
                                                    <td style="vertical-align: middle">{{ $mpesa_payment->firstName." ".$mpesa_payment->middleName." ".$mpesa_payment->lastName }}</td>
                                                    <td style="vertical-align: middle">{{ $mpesa_payment->MSISDN }}</td>
                                                    <td style="vertical-align: middle">{{ date('d-m-Y H:m:sa'), strtotime($mpesa_payment->transTime)  }}</td>
                                                    <td style="vertical-align: middle">
                                                        @if($mpesa_payment->status === "Successful")
                                                            <a href="{{ route('mpesa-payments.edit', $mpesa_payment->id) }}" class="btn btn-success btn-flat btn-xs">Successful</a>
                                                        @else
                                                            <a href="{{ route('mpesa-payments.edit', $mpesa_payment->id) }}" class="btn btn-danger btn-flat btn-sm">Unsuccessful</a>
                                                        @endif
                                                    </td>
                                                    <!-- Start Delete Modal -->
                                                    <div class="modal fade" id="showMessage{{ $mpesa_payment->id }}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">

                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content no-radius">
                                                                <div class="modal-header pb-0 pt-0">
                                                                    <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-envelope-open-o text-primary"></i> SMS Sent To Parent</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body p-0">
                                                                    @php($smses = App\MpesaOutbox::where('mpesa_payment_id', $mpesa_payment->id)->orderBy('id', 'asc')->get())
                                                                    @foreach($smses as $sms)
                                                                        @php($status = App\MessageOutbox::where('messageId', $sms->messageId)->first())
                                                                        <div class="col-md-12 mt-3">
                                                                            <div class="alert @if($status->status === 'DeliveredToTerminal') alert-success @else alert-warning @endif">
                                                                                <p>{{ $sms->message }}</p>
                                                                                <p>{{ $status->status }} at {{ $sms->created_at }}</p>
                                                                            </div>
                                                                        </div>
                                                                    @endforeach
                                                                </div>
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
    @include('layouts.modals')

    <footer class="main-footer">
        <strong>Copyright &copy; {{ date('Y') }} <a href="https://josnytechsolution.com">Josnytech Solution</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 1.0.5
        </div>
    </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('plugins/jquery-ui/jquery-ui.min.js') }}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{ asset('plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<script src="{{ asset('plugins/toastr/toastr.min.js') }}"></script>
<script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
<script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
<script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<script src="{{ asset('dist/js/adminlte.js') }}"></script>
<script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
<script src="{{ asset('dist/js/pages/dashboard.js') }}"></script>
<script src="{{ asset('dist/js/pages/dashboard2.js') }}"></script>

<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        //Money Euro
        $('[data-mask]').inputmask()

        //Date range picker
        $('#reservationdate').datetimepicker({
            format: 'L'
        });
        //Date range picker
        $('#reservation').daterangepicker()
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY hh:mm A'
            }
        })
        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
                ranges   : {
                    'Today'       : [moment(), moment()],
                    'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                    'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate  : moment()
            },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        )

        //Timepicker
        $('#timepicker').datetimepicker({
            format: 'LT'
        })

        //Bootstrap Duallistbox
        $('.duallistbox').bootstrapDualListbox()

        //Colorpicker
        $('.my-colorpicker1').colorpicker()
        //color picker with addon
        $('.my-colorpicker2').colorpicker()

        $('.my-colorpicker2').on('colorpickerChange', function(event) {
            $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
        });

        $("input[data-bootstrap-switch]").each(function(){
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });

    })
</script>
<script>
    function confirmPayment() {
        let code = $("#code").val();
        let _token = $('input[name="_token"]').val();

        document.getElementById('loading').style.display = 'block';

        $.ajax({
            url:"{{ route('confirmTransaction') }}",
            method:"POST",
            data:{code:code, _token:_token},
            success:function(result) {
                $("#myDiv").empty();
                $("#myDiv").append(result);
            }
        })
    }
</script>


<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true,
            "autoWidth": false,
        });
        $("#example3").DataTable({
            "responsive": true,
            "autoWidth": false,
        });
        $("#example4").DataTable({
            "responsive": true,
            "autoWidth": false,
        });
        $("#example5").DataTable({
            "responsive": true,
            "autoWidth": false,
        });
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#sessionReset').on('click',function(){
            $.ajax({
                type: 'POST',
                url: '/ajax-reset',
                data: '_token = {{ csrf_token() }}'
            });
            return false;
        });
    });
</script>

<script>
    @if(Session::has('restricted'))
    toastr.error("{{ session('restricted') }}");
    @endif

    @if(Session::has('success'))
    toastr.success("{{ session('success') }}");
    @endif

    @if(Session::has('failed'))
    toastr.warning("{{ session('failed') }}");
    @endif

    @if(Session::has('error'))
    toastr.error("{{ session('error') }}");
    @endif

    @if($errors->any())
    @foreach ($errors->all() as $error)
    toastr.error("{{ $error }}");
    @endforeach
    @endif
</script>

<script type="text/javascript">
    $(function() {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        $('.swalDefaultSuccess').click(function() {
            Toast.fire({
                icon: 'success',
                title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.swalDefaultInfo').click(function() {
            Toast.fire({
                icon: 'info',
                title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.swalDefaultError').click(function() {
            Toast.fire({
                icon: 'error',
                title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.swalDefaultWarning').click(function() {
            Toast.fire({
                icon: 'warning',
                title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.swalDefaultQuestion').click(function() {
            Toast.fire({
                icon: 'question',
                title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });

        $('.toastrDefaultSuccess').click(function() {
            toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
        });
        $('.toastrDefaultInfo').click(function() {
            toastr.info('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
        });

        $('.toastrDefaultError').click(function() {
            toastr.error('You cannot make changes to a passed session.')
        });

        $('.toastfDefaultError').click(function() {
            toastr.error('You cannot make changes to a passed year.')
        });

        $('.toastrDefaultWarning').click(function() {
            toastr.warning('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
        });

        $('.toastsDefaultDefault').click(function() {
            $(document).Toasts('create', {
                title: 'Toast Title',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultTopLeft').click(function() {
            $(document).Toasts('create', {
                title: 'Toast Title',
                position: 'topLeft',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultBottomRight').click(function() {
            $(document).Toasts('create', {
                title: 'Toast Title',
                position: 'bottomRight',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultBottomLeft').click(function() {
            $(document).Toasts('create', {
                title: 'Toast Title',
                position: 'bottomLeft',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultAutohide').click(function() {
            $(document).Toasts('create', {
                title: 'Toast Title',
                autohide: true,
                delay: 750,
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultNotFixed').click(function() {
            $(document).Toasts('create', {
                title: 'Toast Title',
                fixed: false,
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultFull').click(function() {
            $(document).Toasts('create', {
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
                title: 'Toast Title',
                subtitle: 'Subtitle',
                icon: 'fas fa-envelope fa-lg',
            })
        });
        $('.toastsDefaultFullImage').click(function() {
            $(document).Toasts('create', {
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
                title: 'Toast Title',
                subtitle: 'Subtitle',
                image: '../../dist/img/user3-128x128.jpg',
                imageAlt: 'User Picture',
            })
        });
        $('.toastsDefaultSuccess').click(function() {
            $(document).Toasts('create', {
                class: 'bg-success',
                title: 'Toast Title',
                subtitle: 'Subtitle',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultInfo').click(function() {
            $(document).Toasts('create', {
                class: 'bg-info',
                title: 'Toast Title',
                subtitle: 'Subtitle',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultWarning').click(function() {
            $(document).Toasts('create', {
                class: 'bg-warning',
                title: 'Toast Title',
                subtitle: 'Subtitle',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
        $('.toastsDefaultDanger').click(function() {
            $(document).Toasts('create', {
                class: 'bg-danger',
                title: 'Request Denied!',
                subtitle: 'Subtitle',
                body: 'This Session has passed hence cannot be changed.'
            })
        });
        $('.toastsDefaultMaroon').click(function() {
            $(document).Toasts('create', {
                class: 'bg-maroon',
                title: 'Toast Title',
                subtitle: 'Subtitle',
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        });
    });

</script>

</body>
</html>
