<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Students Fee Balances</title>
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
    <style>
        @page{
            margin: 30px;
            page-break-before: always;
            page-break-after: always;
        }
        html {
            font-family: "Muli", sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            font-size: 10px;
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
    <span style="font-size: 18px">{{ strtoupper($profile->name) }}</span><br>
    <span style="font-size: 16px">STUDENT FEES SUMMARY</span>
</p>

<p style="text-align: center;font-size: 14px;font-weight: bold">
    Print on {{ date('d-m-Y H:i:sa') }}
</p>

<table>
    <tr>
        <th>#</th>
        <th>TERM/YEAR</th>
        <th>ADM NO</th>
        <th>STUDENT NAME</th>
        <th>CLASSROOM</th>
        <th style="text-align: right">EXPECTED</th>
        <th style="text-align: right">PAID</th>
        <th style="text-align: right">BALANCE</th>
        <th style="text-align: right">OVERPAY</th>
    </tr>
    <tbody>
    <?php $i = 1; ?>
    @foreach($students as $student)
        <tr style="width: 100%">
            <td style="text-align: center;width: 3%;">{{ $i }}</td>
            <td style="width: 11%;">{{ $current_session->name }}</td>
            <td style="width: 7%;">{{ $student->admno }}</td>
            <td style="width: 27%;">{{ strtoupper($student->name) }}</td>
            <td style="width: 12%;">{{ strtoupper($student->class_grade->name) }}</td>
            <td style="width: 10%;text-align: right">{{ number_format($student->expected) }}</td>
            <td style="width: 10%;text-align: right">{{ number_format($student->paid) }}</td>
            <td style="width: 10%;text-align: right">  @if($student->balance > 0) {{ number_format($student->balance) }} @else 0 @endif </td>
            <td style="width: 10%;text-align: right">@if($student->balance < 0) {{ number_format($student->balance) }} @else 0 @endif </td>
        </tr>
        <?php $i++; ?>
    @endforeach

    @if($id != "all-classes")
        <?php
        $clas = \App\ClassGrade::where('slug', $id)->first();
        $balance = \App\Student::Active()->where('balance', '>', 0)->where('class_grade_id', $clas->id)->get();
        $overpay = \App\Student::Active()->where('balance', '<', 0)->where('class_grade_id', $clas->id)->get();
        ?>
    @else
        @php($balance = \App\Student::Active()->where('balance', '>', 0)->get())
        @php($overpay = \App\Student::Active()->where('balance', '<', 0)->get())
    @endif
    <tr style="width: 100%">
        <th style="text-align: right;width: 60%;" colspan="5">TOTAL</th>
        <th style="width: 10%;text-align: right">{{ number_format($students->sum('expected')) }}</th>
        <th style="width: 10%;text-align: right">{{ number_format($students->sum('paid')) }}</th>
        <th style="width: 10%;text-align: right">{{ number_format($balance->sum('balance')) }}</th>
        <th style="width: 10%;text-align: right">{{ number_format($overpay->sum('balance')) }}</th>
    </tr>
    </tbody>
    <div class="page-break"></div>
</table>

<!-- Optional JavaScript -->
</body>
</html>