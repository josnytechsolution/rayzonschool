<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Fees Payments List</title>
    <style>
        @page{
            margin: 30px;
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
    <span style="font-size: 26px;font-weight: bold">{{ strtoupper($profile->name) }}</span><br>
    <span style="font-size: 24px;font-weight: bold">{{ $current_session->name }} FEES PAYMENTS LIST</span><br>
</p>

<p style="text-align: center;font-size: 18px;font-weight: bold">
     DOWNLOADED ON {{ date('d-m-Y H:i:sa') }}
</p>

<table>
    <tr>
        <th>#</th>
        <th>REC. #</th>
        <th>STUDENT NAME</th>
        <th>CLASS/GRADE</th>
        <th>AMOUNT</th>
        <th>PAY DATE</th>
        <th>BANK</th>
        <th>REF. #</th>
        <th>RECEIVED BY</th>
    </tr>
    <tbody>
    <?php $i = 1; ?>
    @foreach($payments as $payment)
        <tr style="width: 100%">
            <td style="text-align: center;width: 3%;">{{ $i }}</td>
            <td style="width: 5%;">{{ $payment->receipt_no }}</td>
            <td style="width: 15%;">{{ strtoupper($payment->student->name) }}</td>
            <td style="width: 8%;">{{ strtoupper($payment->student->class_grade->name) }}</td>
            <td style="width: 5%;">{{ number_format($payment->paid,2) }}</td>
            <td style="width: 6%;">{{ date('d-m-Y', strtotime($payment->pay_date)) }}</td>
            <td style="width: 8%;">{{ $payment->bank->name }}</td>
            <td style="width: 8%;">{{ $payment->ref_no }}</td>
            <td style="width: 10%;">{{ $payment->teller->name }}</td>
        </tr>
        <?php $i++; ?>
    @endforeach
    </tbody>
</table>

<!-- Optional JavaScript -->
</body>
</html>