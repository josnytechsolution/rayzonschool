<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Receipt</title>
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Normalize or reset CSS with your favorite library -->
    <link rel="stylesheet" href="{{ asset('dist/receipt/normalize-7.0.0.min.css') }}">

    <!-- Load paper.css for happy printing -->
    <link rel="stylesheet" href="{{ asset('dist/receipt/paper.css') }}">

    <!-- Set page size here: A5, A4 or A3 -->
    <!-- Set also "landscape" if you need -->
    <style>
        @font-face {
            font-family: 'Monaco';
            font-style: normal;
            font-weight: normal;
            src: local('Monaco'), url('Monaco.woff') format('woff');
        }
        @page { size: B7 }
        /* body   { font-family: "Arial Unicode MS" } */
        body   { font-family: "Monaco" }
        p {font-size:14px;}
        th,td {font-size:12px}
        article { border-bottom: 1px solid black;}
        @media print {  .page-break	{ display: block; page-break-before: always; }	} /* fix for Chrome */
        @media all { .page-break { display: none; } }

    </style>
    <script type="text/javascript">
        window.setTimeout(function() {
            $(".alerts").fadeTo(500, 0).slideUp(500, function(){
                $(this).remove();
            });
        }, 3000);
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
                    $("#timeOut").modal();
                }
            });
        }
        setInterval(checkSession, 1000);
    </script>
    <script>
        window.onload(window.print());
    </script>
</head>

<!-- Set "A5", "A4" or "A3" for class name -->
<!-- Set also "landscape" if you need -->
<body class="B7">
<!-- Each sheet element should have the class "sheet" -->
<!-- "padding-**mm" is optional: you can set 10, 15, 20 or 25 -->
<section class="sheet padding-2mm">
    <p style="text-align:center;font-size:12px">
        <img src="{{ asset($profile->logo) }}" width='50%' /><br/>
        <b style="font-size:19px"> {{ strtoupper($profile->name) }}</b><br />
        <span>{{ strtoupper($profile->postal) }}</span><br>
        <span>{{ $profile->contact1.", ".$profile->contact2 }}</span><br>
        <span>{{ $profile->email1 }}</span><br>
        <span>{{ $profile->website }}</span>
    </p>

    <article style="border-top: 1px solid black;padding:5px;">
        <table width="97%">
            <tr><th align="center">CUSTOMER RECEIPT @if($printed > 1) (COPY) @endif</th></tr>
        </table>
    </article>
    <article>
        <table width="97%">
            <tr><th align="left">Receipt No:</th><td align="right">{{ $feePayment->receipt_no }}</td></tr>
            <tr><th align="left">Ref No:</th> <td align="right">{{ $feePayment->ref_no }}</td></tr>
            <tr><th align="left">Term:</th> <td align="right">{{ $feePayment->current_session->name }}</td></tr>
            <tr><th align="left">Date:</th> <td align="right">{{ date('d-m-Y', strtotime($feePayment->pay_date)) }}</td></tr>
        </table>
    </article>

    <article style="padding-top:5px;padding-bottom:5px">
        <table width="97%">
            <tr><th align="left">Admn No:</th><td align="right">{{ $feePayment->student->admno }}</td></tr>
            <tr><th align="left">Student:</th><td align="right">{{ ucwords($feePayment->student->name) }}</td></tr>
            <tr><th align="left">Class:</th> <td align="right">{{ ucwords($feePayment->student->classroom->long_name) }}</td></tr>
        </table>
    </article>

    <article style="padding-top:5px;padding-bottom:5px">
        <table width="97%">
            <tr><th align="left" width="80%"><u>Payment Description</u></th><th align="right"><u>Amount</u></th></tr>
            @if($feePayment->arrears)
                <tr><td align="left">Last Term Arrears</td> <td align="right">{{ number_format($feePayment->arrears,2) }}</td></tr>
            @endif
            @if($feePayment->fees)
                <tr><td align="left">School Fees</td> <td align="right">{{ number_format($feePayment->fees,2) }}</td></tr>
            @endif
        </table>
    </article>

    <article style="padding-top:5px;padding-bottom:5px">
        <table width="97%">
            <tr><th align="left">Total Expected</th> <th align="right"><u>{{ number_format($feePayment->expected,2) }}</u></th></tr>
            <tr><th align="left">Total Paid</th> <th align="right"><u>{{ number_format($feePayment->paid,2) }}</u></th></tr>
            <tr><th align="left">Fees Balance</th> <th style="text-align:right;text-decoration:underline;">{{ number_format($feePayment->balance,2) }}</th></tr>
        </table>
    </article>

    <article>
        <p style="text-align:center">"{{ $profile->motto }}"</p>
    </article>
</section>
<div class="page-break"></div>

</body>

</html>
