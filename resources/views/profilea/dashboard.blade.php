<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    @if(Auth::user()->profile === 'isSuper')
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-success no-radius">
                                <div class="inner">
                                    @php($current_session = App\CurrentSession::Current()->first())
                                    @php($collected = App\FeePayment::where('current_session_id', $current_session->id)->sum('paid'))
                                    <h3><small>{{ number_format($collected) }}</small></h3>

                                    <p>{{ $current_session->name }} Collection</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-coins"></i>
                                </div>
                                <a href="{{ route('fee-payment.index') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-info no-radius">
                                @php($balances = App\Student::Active()->Balance()->sum('balance'))
                                <div class="inner">
                                    <h3><small>{{ number_format($balances) }}</small></h3>

                                    <p>Total Balances</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-coins"></i>
                                </div>
                                <a href="{{ route('balances') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-warning no-radius">
                                @php($overpay = App\Student::Active()->Overpay()->sum('balance'))
                                <div class="inner">
                                    <h3><small>{{ number_format($overpay) }}</small></h3>

                                    <p>Fee Overpayment</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-coins"></i>
                                </div>
                                <a href="{{ route('overpays') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <!-- small box -->
                            <div class="small-box bg-danger no-radius">
                                @php($arrears = App\Student::Active()->Arrears()->sum('arrears'))
                                <div class="inner">
                                    <h3><small>{{ number_format($arrears) }}</small></h3>

                                    <p>Last Term Arrears</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-coins"></i>
                                </div>
                                <a href="{{ route('arrears') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                    @endif
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <!-- small box -->
                        <div class="small-box bg-primary no-radius">
                            <div class="inner">
                                @php($studs = App\Student::Active()->count())
                                <h3>{{ $studs }}</h3>

                                <p>TOTAL STUDENTS</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-users"></i>
                            </div>
                            <a href="{{ route('student-details.index') }}" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <!-- small box -->
                        <div class="small-box bg-secondary no-radius">
                            @php($males = App\Student::Active()->Male()->count())
                            <div class="inner">
                                <h3><small>{{ $males }}</small></h3>

                                <p>MALE STUDENTS</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-male"></i>
                            </div>
                            <a href="javascript:;" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <!-- small box -->
                        <div class="small-box bg-info no-radius">
                            @php($females = App\Student::Active()->Female()->count())
                            <div class="inner">
                                <h3><small>{{ $females }}</small></h3>

                                <p>FEMALE STUDENTS</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-female"></i>
                            </div>
                            <a href="javascript:;" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <!-- small box -->
                        <div class="small-box bg-success no-radius">
                            @php($new = App\Student::Active()->New()->count())
                            <div class="inner">
                                <h3><small>{{ $new }}</small></h3>

                                <p>{{ date('Y') }} ADMISSIONS</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="javascript:;" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary card-outline no-radius">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">
                                       <i class="fa fa-chart-bar"></i> Population Distribution</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex">
                                    <p class="d-flex flex-column">
                                        <span class="text-bold text-lg">{{ $studs }}</span>
                                        <span>Students</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->

                                <div class="position-relative mb-4">
                                    <canvas id="sales-chart" height="200"></canvas>
                                </div>

                                <div class="d-flex flex-row justify-content-end">
                                      <span class="mr-2">
                                        <i class="fas fa-square text-primary"></i> Male
                                      </span>

                                    <span>
                                    <i class="fas fa-square text-gray"></i> Female
                                  </span>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col-md-6 -->
                    <!-- Left col -->
                    <section class="col-md-6">
                        <div class="card card-success card-outline no-radius">
                            <div class="card-header border-0">
                                <h3 class="card-title">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    Fees Payment
                                </h3>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="chart mt-2" id="sales-chart" style="position: relative; height: 305px;">
                                    <canvas id="sales-chart-canvas" height="300" style="height: 300px;"></canvas>
                                </div>
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </section>
                    <!-- /.Left col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
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

<!-- REQUIRED SCRIPTS -->

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
<!-- ChartJS -->
<script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
<!-- Sparkline -->
<script src="{{ asset('plugins/sparklines/sparkline.js') }}"></script>
<!-- JQVMap -->
<script src="{{ asset('plugins/jqvmap/jquery.vmap.min.js') }}"></script>
<script src="{{ asset('plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
<!-- jQuery Knob Chart -->
<script src="{{ asset('plugins/jquery-knob/jquery.knob.min.js') }}"></script>
<!-- daterangepicker -->
<script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
<script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="{{ asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
<!-- SweetAlert2 -->
<script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<!-- Toastr -->
<script src="{{ asset('plugins/toastr/toastr.min.js') }}"></script>
<!-- Select2 -->
<script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
<!-- Summernote -->
<script src="{{ asset('plugins/summernote/summernote-bs4.min.js') }}"></script>
<!-- DataTables -->
<script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
<!-- overlayScrollbars -->
<script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('dist/js/adminlte.js') }}"></script>
<script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>

<script>
    $(function () {
        'use strict'

        var ticksStyle = {
            fontColor: '#495057',
            fontStyle: 'bold'
        }

        let mode      = 'index'
        let intersect = true

        let $salesChart = $('#sales-chart')
        let salesChart  = new Chart($salesChart, {
            type   : 'bar',
            data   : {
                labels  : ['PG', 'PP1', 'PP2', 'GRD1', 'GRD2', 'GRD3', 'GRD4', 'GRD5', 'GRD6', 'GRD7', 'GRD8'],
                datasets: [
                    {
                        backgroundColor: '#007bff',
                        borderColor    : '#007bff',
                        data           : ["{{ $boys[0] }}", "{{ $boys[1] }}", "{{ $boys[2] }}", "{{ $boys[3] }}", "{{ $boys[4] }}", "{{ $boys[5] }}", "{{ $boys[6] }}", "{{ $boys[7] }}", "{{ $boys[8] }}", "{{ $boys[9] }}", "{{ $boys[10] }}"]
                    },
                    {
                        backgroundColor: '#ced4da',
                        borderColor    : '#ced4da',
                        data           : ["{{ $girls[0] }}", "{{ $girls[1] }}", "{{ $girls[2] }}", "{{ $girls[3] }}", "{{ $girls[4] }}", "{{ $girls[5] }}", "{{ $girls[6] }}", "{{ $girls[7] }}", "{{ $girls[8] }}", "{{ $girls[9] }}", "{{ $girls[10] }}"]
                    }
                ]
            },
            options: {
                maintainAspectRatio: false,
                tooltips           : {
                    mode     : mode,
                    intersect: intersect
                },
                hover              : {
                    mode     : mode,
                    intersect: intersect
                },
                legend             : {
                    display: false
                },
                scales             : {
                    yAxes: [{
                        // display: false,
                        gridLines: {
                            display      : true,
                            lineWidth    : '4px',
                            color        : 'rgba(0, 0, 0, .2)',
                            zeroLineColor: 'transparent'
                        },
                        ticks    : $.extend({
                            beginAtZero: true,

                            callback: function (value, index, values) {
                                if (value >= 0) {
                                    value += 'p'
                                }
                                return value
                            }
                        }, ticksStyle)
                    }],
                    xAxes: [{
                        display  : true,
                        gridLines: {
                            display: false
                        },
                        ticks    : ticksStyle
                    }]
                }
            }
        })

        // Donut Chart
        let pieChartCanvas = $('#sales-chart-canvas').get(0).getContext('2d')
        let pieData        = {
            labels: [
                'Total Balances',
                'Collected Fees',
            ],
            datasets: [
                {
                    data: ["{{ $balances }}", "{{ $collected }}"],
                    backgroundColor : ['#f56954', '#00a65a'],
                }
            ]
        }
        let pieOptions = {
            legend: {
                display: true
            },
            maintainAspectRatio : false,
            responsive : true,
        }
        //Create pie or doughnut chart
        // You can switch between pie and doughnut using the method below.
        let pieChart = new Chart(pieChartCanvas, {
            type: 'pie',
            data: pieData,
            options: pieOptions
        });
    })

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
</body>
</html>
