<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Students Fee Balances</title>
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
    <span style="font-size: 24px">STUDENT FEES BALANCES</span><br>
</p>

<p style="text-align: center;font-size: 18px;font-weight: bold">
    Print on {{ date('d-m-Y H:i:sa') }}
</p>

<table>
    <tr>
        <th>#</th>
        <th>ADM NO</th>
        <th>STUDENT NAME</th>
        <th>CLASSROOM</th>
        <th>CONTACT</th>
        <th style="text-align: right">ARREARS</th>
        <th style="text-align: right">CURRENT</th>
        <th style="text-align: right">TOTAL</th>
    </tr>
    <tbody>
    <?php $i = 1; ?>
    @foreach($students as $student)
        <tr style="width: 100%">
            <td style="text-align: center;width: 3%;">{{ $i }}</td>
            <td style="width: 5%;">{{ $student->admno }}</td>
            <td style="width: 15%;">{{ strtoupper($student->name) }}</td>
            <td style="width: 8%;">{{ strtoupper($student->class_grade->name) }}</td>
            <td style="width: 7%;">{{ $student->phoneno }}</td>
            <td style="width: 7%;text-align: right">{{ number_format($student->arrears,2) }}</td>
            <td style="width: 7%;text-align: right">{{ number_format($student->current,2) }}</td>
            <td style="width: 7%;text-align: right">{{ number_format($student->balance,2) }}</td>
        </tr>
        <?php $i++; ?>
    @endforeach
    </tbody>
    <div class="page-break"></div>
</table>

<!-- Optional JavaScript -->
</body>
</html>