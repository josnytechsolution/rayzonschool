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
                    <h5 class="m-0 text-dark">
                        SEND SMS TO SELECTED STAFF MEMBERS
                    </h5>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Communication</li>
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
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 mb-3">@include('errors')</div>
                        <div class="col-md-6">
                            <div class="card card-success card-outline no-radius">
                                <div class="card-header">
                                    <h3 class="card-title">SELECT STAFF MEMBER(S)</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 mb-4">
                                                <div class="row">
                                                    <div class="col-10">
                                                        <label>Staff Member<sup class="text-danger">*</sup></label>
                                                        <select name="staff_member_id" id="staff_member_id" class="form-control select2 no-radius @error('staff_member_id') is-invalid @enderror" required>
                                                            <option value="">--Select Option--</option>
                                                            @foreach($members as $member)
                                                                <option value="{{ $member->id }}">{{ $member->member_no." - ".$member->name." - ".$member->staff_section->name." - ".$member->phoneno1 }}</option>
                                                            @endforeach
                                                        </select>
                                                        @if($errors->has('staff_member_id'))
                                                            <small class="text-danger">{{ $errors->first('staff_member_id') }}</small>
                                                        @endif
                                                    </div>
                                                    <div class="col-2">
                                                        <label class="text-white">..</label><br>
                                                        <button type="submit" class="btn btn-primary btn-flat float-right" id="add-staff"><i class="fa fa-plus"></i></button>
                                                    </div>
                                                </div>
                                        </div>
                                        <div class="col-md-12 mb-4">
                                            <table class="table table-striped">
                                                <thead>
                                                <th>#</th>
                                                <th>MEM. NO</th>
                                                <th>MEMBER NAME</th>
                                                <th>DESIGNATION</th>
                                                <th>CONTACT</th>
                                                <th></th>
                                                </thead>
                                                <tbody id="populate-data">
                                                @php($i = 1)
                                                @foreach($temps as $temp)
                                                    <tr>
                                                        <td>{{ $i }}</td>
                                                        <td>{{ $temp->staff_member->member_no }}</td>
                                                        <td>{{ $temp->staff_member->name }}</td>
                                                        <td>{{ $temp->staff_member->staff_section->name }}</td>
                                                        <td>{{ $temp->staff_member->phoneno1 }}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-outline-danger btn-xs" onClick="deleteStaff({{ $temp->id }})"><i class='fa fa-trash'></i> </button>
                                                        </td>
                                                    </tr>
                                                    @php($i++)
                                                @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-12">
                                <div class="card card-primary card-outline no-radius">
                                    <div class="card-header">
                                        <h3 class="card-title text-primary">
                                            <i class="fa fa-edit"></i> Compose New Message
                                        </h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <form action="{{ route('sendToSelectedStaffMembers') }}" method="post">
                                        @csrf
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12 border bg-gray-light p-3 mb-3">
                                                    <label class="text-primary">INSTRUCTIONS:</label><br>
                                                    <div class="row">
                                                        <div class="col-md-12">For staff member name use: <code>full_name</code></div>
                                                    </div>
                                                    <label class="text-danger" style="margin-top: 20px;">SAMPLE MESSAGE:</label><br>
                                                    <span class="text-dark">Dear <code>full_name</code> , Kindly note, we will hold our termly meeting this coming Saturday starting at 9am. Keep time!</span>
                                                </div>

                                                <div class="col-md-12 form-group">
                                                    <label>Compose Message:<span class="text-danger">*</span></label>
                                                    <textarea name="message" id="textarea" class="form-control" rows="7" maxlength="445"></textarea>

                                                    @if($errors->has('message'))
                                                        <p class="text-danger">{{ $errors->first('message') }}</p>
                                                    @endif
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <p id="textarea_feedback" class="help-block text-primary font-italic"></p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer">
                                            <div class="float-right">
                                                <button type="submit" class="btn btn-primary btn-flat"><i class="far fa-paper-plane"></i> Send Message</button>
                                            </div>
                                            <button type="reset" class="btn btn-default btn-flat"><i class="fas fa-brush"></i> Discard</button>
                                        </div>
                                        <!-- /.card-footer -->
                                    </form>
                                </div>
                                <!-- /.card -->
                            </div>
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
<script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
<script src="{{ asset('plugins/sparklines/sparkline.js') }}"></script>
<script src="{{ asset('plugins/jqvmap/jquery.vmap.min.js') }}"></script>
<script src="{{ asset('plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
<script src="{{ asset('plugins/jquery-knob/jquery.knob.min.js') }}"></script>
<script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
<script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
<script src="{{ asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
<script src="{{ asset('plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<script src="{{ asset('plugins/toastr/toastr.min.js') }}"></script>
<script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
<script src="{{ asset('plugins/summernote/summernote-bs4.min.js') }}"></script>
<script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
<script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<script src="{{ asset('dist/js/adminlte.js') }}"></script>
<script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
<script src="{{ asset('dist/js/demo.js') }}"></script>

<script src="{{ asset('dist/js/pages/dashboard.js') }}"></script>
<script src="{{ asset('dist/js/pages/dashboard2.js') }}"></script>


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


<script type="text/javascript">

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $("#add-staff").click(function(e){

        e.preventDefault();

        let staff_member_id = $("#staff_member_id").val();
        let url = '{{ route('addMember') }}';

        $.ajax({
            url:url,
            method:'POST',
            data:{
                staff_member_id:staff_member_id,
            },
            success:function(response){
                if(response.success){
                    toastr.success(response.message);

                    let temps = response.results;

                    $('#populate-data').empty();
                    $('#populate-data').append(temps);
                }else{
                    toastr.error(response.message)
                }
            },
            error:function(error){
                console.log(error)
            }
        });
    });

    function deleteStaff(id) {

        let url = '/profilea/delete-staff-member/' + id;

        $.ajax({
            url:url,
            method:'GET',
            data:{},
            success:function(response){
                if(response.success){
                    toastr.success(response.message);

                    let temps = response.results;


                    $('#populate-data').empty();
                    $('#populate-data').append(temps);
                }else{
                    toastr.error(response.message)
                }
            },
            error:function(error){
                console.log(error)
            }
        });
    }



</script>

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true,
            "autoWidth": false,
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
    })
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

<script type="text/javascript">
    $(document).ready(function() {
        let text_max = 160;
        let page_number = 1;

        $('#textarea_feedback').html(page_number + ' page(s) / ' + text_max + ' characters remaining');

        $('#textarea').keyup(function() {
            let text_length = $('#textarea').val().length;
            let text_rem = text_max - text_length;
            let text_remaining = "";
            let text_remain = "";

            if(text_length <= 160)
            {
                page_number = 1;
                text_remaining = text_max - text_length;
            }
            else if(text_length >= 161 && text_length <= 306)
            {
                page_number = 2;
                text_remain = 306;
                text_remaining = text_remain - text_length;
            }
            else
            {
                page_number = 3;
                text_remain = 457;
                text_remaining = text_remain - text_length;
            }

            $('#textarea_feedback').html(page_number + ' Page(s) / ' + text_remaining + ' Characters Remaining');
        });
    });

</script>

</body>
</html>

