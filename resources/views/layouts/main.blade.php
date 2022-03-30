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

@yield('content')

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

<!-- Page specific script -->
<script>
    $(function () {
        bsCustomFileInput.init();
    });
</script>

<script type="text/javascript">

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $("#add-student").click(function(e){

        e.preventDefault();

        let student_id = $("#student_id").val();
        let url = '{{ route('addStudent') }}';

        $.ajax({
            url:url,
            method:'POST',
            data:{
                student_id:student_id,
            },
            success:function(response){
                if(response.success){
                    toastr.success(response.message)

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

    function deleteTemp(id) {

        let url = '/profilea/delete-temp-student/' + id;

        $.ajax({
            url:url,
            method:'GET',
            data:{},
            success:function(response){
                if(response.success){
                    toastr.success(response.message)

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
    // The Calender
    $('#calendar').datetimepicker({
        format: 'L',
        inline: true
    })
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
    $(document).ready(function(){

        $('#toClass').change(function(){
            let toClass = $("#toClass").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('getFees') }}",
                method:"POST",
                data:{toClass:toClass, _token:_token},
                success:function(result) {
                    $("#tableShow").empty();
                    $("#tableShow").append(result);
                }
            })
        });
    });
</script>

<script>
    $(document).ready(function(){

        $('#activateTo').change(function(){
            let activateTo = $("#activateTo").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('getFees') }}",
                method:"POST",
                data:{toClass:activateTo, _token:_token},
                success:function(result) {
                    $("#tableShow2").empty();
                    $("#tableShow2").append(result);
                }
            })
        });
    });
</script>

<script>
    $(document).ready(function(){

        $('#department').change(function(){
            let department = $("#department").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('getSection') }}",
                method:"POST",
                data:{department:department, _token:_token},
                success:function(result) {
                    $("#section").empty();
                    $("#section").append(result);
                }
            })
        });
    });
</script>

<script>
    $(document).ready(function(){

        $('#transport').change(function(){
            let transport = $("#transport").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('transport') }}",
                method:"POST",
                data:{transport:transport, _token:_token},
                success:function(result) {
                    $("#way").empty();
                    $("#way").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#etransport').change(function(){
            let transport = $("#etransport").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('transport') }}",
                method:"POST",
                data:{transport:transport, _token:_token},
                success:function(result) {
                    $("#eway").empty();
                    $("#eway").append(result);
                }
            })
        });
    });
</script>

<script>
    $(document).ready(function(){

        $('#paro_no').change(function(){
            let paro_no = $("#paro_no").val();
            let _token = $('input[name="_token"]').val();

            $("#result").empty();
            $.ajax({
                url:"{{ route('get-parent') }}",
                method:"POST",
                data:{paro_no:paro_no, _token:_token},
                success:function(result) {
                    $("#result").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#parent').change(function(){
            let parent = $("#parent").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('checkParent') }}",
                method:"POST",
                data:{parent:parent, _token:_token},
                success:function(result) {
                    $("#show").empty();
                    $("#show").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#refno').change(function(){
            let bank = $("#bank").val();
            let refno = $("#refno").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('checkBank') }}",
                method:"POST",
                data:{bank:bank, refno:refno, _token:_token},
                success:function(result) {
                    $("#status").empty();
                    $("#status").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#erefno').change(function(){
            let bank = $("#ebank").val();
            let refno = $("#erefno").val();
            let pid = $("#pid").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('checkeBank') }}",
                method:"POST",
                data:{bank:bank, refno:refno, pid:pid, _token:_token},
                success:function(result) {
                    $("#estatus").empty();
                    $("#estatus").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#staffDepartment').change(function(){
            let staffDepartment = $("#staffDepartment").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('staffSection') }}",
                method:"POST",
                data:{staffDepartment:staffDepartment, _token:_token},
                success:function(result) {
                    $("#staffSection").empty();
                    $("#staffSection").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#grade').change(function(){
            let grade = $("#grade").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('getSubject') }}",
                method:"POST",
                data:{grade:grade, _token:_token},
                success:function(result) {
                    $("#subjects").empty();
                    $("#subjects").append(result);
                }
            })
        });

    });
</script>

<script>
    $(document).ready(function(){

        $('#grady').change(function(){
            let grade = $("#grady").val();
            let _token = $('input[name="_token"]').val();

            $.ajax({
                url:"{{ route('getSubject') }}",
                method:"POST",
                data:{grade:grade, _token:_token},
                success:function(result) {
                    $("#subjecty").empty();
                    $("#subjecty").append(result);
                }
            })
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

<script>
    function checkBal() {
        if (document.getElementById('expected').value != "" && document.getElementById('paid').value != "") {
            data = parseFloat(document.getElementById('expected').value);
            document.getElementById('balance').value = data - parseFloat(document.getElementById('paid').value);

            document.getElementById('overpay').value = 0;
            if (parseFloat(document.getElementById('expected').value) < parseFloat(document.getElementById('paid').value)){

                document.getElementById('balance').value = 0;

                document.getElementById('overpay').value = parseFloat(document.getElementById('paid').value) - data;
            }
        }
    }
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