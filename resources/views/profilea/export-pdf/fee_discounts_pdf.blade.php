<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Students Fee Discounts</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <style>
        @page{
            margin: 30px;
            page-break-before: always;
            page-break-after: always;
        }
        html {
            font-family: "Nunito", sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
            page-break-after: always;
        }

        td, th {
            border: 1px solid #1a252f;
            text-align: left;
            padding: 4px 8px 4px 8px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<p style="text-align: center;">
    <span style="font-size: 26px">{{ strtoupper($profile->name) }}</span><br>
    <span style="font-size: 24px">STUDENT FEES DISCOUNTS</span><br>
</p>

<p style="text-align: center;font-size: 18px;font-weight: bold">
    Print on {{ date('d-m-Y H:i:sa') }}
</p>

<table>
    <tr>
        <th>#</th>
        <th>ADM NO</th>
        <th>STUDENT NAME</th>
        <th>CLASS</th>
        <th>CONTACT</th>
        <th style="text-align: right">AMOUNT</th>
    </tr>
    <tbody>
    <?php $i = 1; ?>
    @foreach($discounts as $discount)
        <tr style="width: 100%">
            <td style="text-align: center;width: 3%;">{{ $i }}</td>
            <td style="width: 5%;">{{ $discount->student->admno }}</td>
            <td style="width: 15%;">{{ strtoupper($discount->student->name) }}</td>
            <td style="width: 8%;">{{ strtoupper($discount->class_grade->long_name) }}</td>
            <td style="width: 7%;">{{ $discount->student->phoneno }}</td>
            <td style="width: 7%;text-align: right">{{ number_format($discount->amount,2) }}</td>
        </tr>
        <?php $i++; ?>
    @endforeach
    </tbody>
    <tfoot>
    <td colspan="5" style="text-align: right"><b>TOTAL</b></td>
    <td style="width: 7%;text-align: right"><b>{{ number_format($discount->sum('amount'),2) }}</b></td>
    </tfoot>
    <div class="page-break"></div>
</table>

<!-- Optional JavaScript -->
</body>
</html>