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
        @page { size: A5 }
        /* body   { font-family: "Arial Unicode MS" } */
        body   { font-family: "Monaco" }
        p {font-size:14px;}
        th,td {font-size:12px}
        article { border-bottom: 1px solid black;}
        @media print {  .page-break	{ display: block; page-break-before: always; }	} /* fix for Chrome */
        @media all { .page-break { display: none; } }
        img {
            -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
            filter: grayscale(100%);
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid black;
        }
        .table th {
            border: 1px solid black;
            padding: 5px
        }

        .table td {
            border: 1px solid black;
            padding: 10px;
            font-size: 14px;
        }

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
      /*  window.onload(window.print()); */
    </script>
</head>

<!-- Set "A5", "A4" or "A3" for class name -->
<!-- Set also "landscape" if you need -->
<body class="A5 landscape">
<!-- Each sheet element should have the class "sheet" -->
<!-- "padding-**mm" is optional: you can set 10, 15, 20 or 25 -->
<section class="sheet padding-5mm" style="border: 1px solid black;">
    <table width="97%" style="margin-top: 10px;margin-bottom: 10px">
        <tr>
            <td><img src="{{ asset($profile->logo) }}" width='30%' /></td>
            <td style="text-align:right;font-size:16px">
                <b style="font-size:19px"> {{ strtoupper($profile->name) }}</b><br />
                <span>{{ strtoupper($profile->postal) }}</span><br>
                <span>{{ $profile->contact1.", ".$profile->contact2 }}</span><br>
                <span>{{ $profile->email1 }}</span><br>
                <span>{{ $profile->website }}</span>
            </td>
        </tr>
    </table>

    <article style="border: none;padding:5px;">
        <table width="97%">
            <tr><th align="center" style="font-size: 18px">SCHOOL FEE RECEIPT @if($printed > 1) (COPY) @endif</th></tr>
        </table>
    </article>

    <article style="border: 1px solid black;padding:5px;margin-bottom: 10px">
        <table width="97%">
            <tr>
                <th align="left" style="font-size: 14px;width:15%">RECEIPT NO:</th>
                <td align="left" style="font-size: 14px;width:30%">{{ $feePayment->receipt_no }}</td>
                <td style="width: 20%;"></td>
                <th align="right" style="font-size: 14px;width:15%">DATE:</th>
                <td align="right" style="font-size: 14px;">{{ date('d-m-Y', strtotime($feePayment->pay_date)) }}</td>
            </tr>
            <tr>
                <th align="left" style="font-size: 14px;width:15%">REF. NO:</th>
                <td align="left" style="font-size: 14px;width:30%">{{ $feePayment->ref_no }}</td>
                <td style="width: 20%;"></td>
                <th align="right" style="font-size: 14px;width:15%">TERM:</th>
                <td align="right" style="font-size: 14px;width:20%">{{ $feePayment->current_session->name }}</td>
            </tr>
            <tr>
                <th align="left" style="font-size: 14px;width:15%">DATE:</th>
                <td align="left" style="font-size: 14px;width:20%">{{ date('d-m-Y', strtotime($feePayment->pay_date)) }}</td>
                <td style="width: 20%;"></td>
                <th align="right" style="font-size: 14px;width:15%">ADMN NO:</th>
                <td align="right" style="font-size: 14px;width:20%">{{ $feePayment->student->admno }}</td>
            </tr>
            <tr>
                <th align="left" style="font-size: 14px;width:15%">STUDENT:</th>
                <td align="left" style="font-size: 14px;width:30%">{{ strtoupper($feePayment->student->name) }}</td>
                <td style="width: 20%;"></td>
                <th align="right" style="font-size: 14px;width:15%">CLASS:</th>
                <td align="right" style="font-size: 14px;width:20%">{{ strtoupper($feePayment->student->class_grade->long_name) }}</td>
            </tr>
        </table>
    </article>

    <article style="padding-top:5px;padding-bottom:5px;border:none;">
        <table class="table">
            <thead>
                <th align="left" width="80%">PAYMENT DESCRIPTION</th>
                <th align="right">AMOUNT (KES)</th>
            </thead>
            <tbody>
            @if($feePayment->arrears)
                <tr style="border: none"><td style="border: none;border-right: 1px solid black;padding:2px;padding-left: 5px" align="left">LAST TERM ARREARS</td> <td style="border: none;padding:2px;padding-right: 7px" align="right">{{ number_format($feePayment->arrears,2) }}</td></tr>
            @endif
            @if($feePayment->fees)
                <tr style="border: none;border-bottom: 1px solid black"><td style="border: none;border-right: 1px solid black;padding:2px;padding-left: 5px" align="left">SCHOOL FEES</td> <td style="border: none;padding:2px;padding-right: 7px" align="right">{{ number_format($feePayment->fees,2) }}</td></tr>
            @endif
            </tbody>
            <tfoot>
                <tr style="border: none"><td style="border: none;border-right: 1px solid black;padding:2px" align="right">TOTAL EXPECTED:</td> <td style="border: none;padding:2px;padding-right: 7px" align="right">{{ number_format($feePayment->expected,2) }}</td></tr>
                <tr style="border: none"><td style="border: none;border-right: 1px solid black;padding:2px" align="right">TOTAL PAID:</td> <td style="border: none;padding:2px;padding-right: 7px" align="right">{{ number_format($feePayment->paid,2) }}</td></tr>
                <tr style="border: none"><td style="border: none;border-right: 1px solid black;padding:2px" align="right">TOTAL BALANCE:</td> <td style="border: none;padding:2px;padding-right: 7px" align="right">{{ number_format($feePayment->balance,2) }}</td></tr>
            </tfoot>
        </table>
    </article>

    <article style="border: none">
        <p>
            <span style="font-size: 14px;font-weight:bold;">IMPORTANT NOTICE:</span><br>
            <span style="text-transform: uppercase">Fees once paid is not refundable.</span><br>
            <span style="text-transform: uppercase">The above balance may change if additional items are added to your fee structure.</span><br>
        </p>
    </article>
</section>
<div class="page-break"></div>

</body>

</html>
