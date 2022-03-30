<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Students Invoices</title>
    <style>
        @page{
            margin: 50px 50px 50px 20px;
            page-break-after: always;
        }
        html {
            font-family: 'Courier New', Courier, monospace;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
        }

        td, th {
            border: 1px solid #1a252f;
            text-align: left;
            padding: 4px 8px 4px 8px;
            vertical-align: middle;
        }
        .page-break {
            page-break-after: always;
        }
    </style>
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>

@foreach($students as $student)

    @php($studentFees = App\StudentFee::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get())
    @php($feePayments = App\FeePayment::where('student_id', $student->id)->where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get())
    @php($feeDiscounts = App\FeeDiscount::where('student_id', $student->id)->where('current_session_id', $current_session->id)->get())
    @php($studTransport = App\StudentTransport::where('student_id', $student->id)->where('current_session_id', $current_session->id)->first())
<div class="page">
<h1 style="text-align: right">INVOICE</h1>
<table>
    <tr>
        <td style="width: 400px;padding: 4px;text-align: center">
            <span style="font-size: 20px;font-weight: bold">{{ strtoupper($profile->name) }}</span><br>
            <span style="font-size: 18px;font-weight: bold">{{ strtoupper($profile->postal) }}</span><br>
            <span style="font-size: 18px;font-weight: bold">TEL: {{ strtoupper($profile->contact1.", ".$profile->contact2) }}</span><br>
            <span style="font-size: 18px;font-weight: bold">EMAIL: {{ $profile->email1 }}</span><br>
        </td>
        <td style="border: none;"></td>
        <td style="border: none;text-align: right;vertical-align: top">
            <h3>{{ date('d/m/Y') }}</h3>
            <h3>{{ $current_session->name }}</h3>
        </td>
    </tr>
</table>

<h3 style="margin-top: 30px">Invoice For:</h3>
<p>
    <span>{{ strtoupper($student->name) }}</span><br>
    <span>ADMISSION NO: {{ strtoupper($student->admno) }}</span><br>
    <span>CLASS/GRADE: {{ strtoupper($student->class_grade->long_name) }}</span><br>
</p>

<table style="margin-top: 30px;">
    <tr>
        <th style="text-transform: uppercase">Fee Category</th>
        <th style="text-transform: uppercase">Fee Description</th>
        <th style="text-align: right;text-transform: uppercase">Fee Amount</th>
    </tr>
    @foreach($studentFees as $studentFee)
        <tr>
            <td style="border-bottom: 1px solid #fff">{{ ucwords(strtolower($studentFee->fee_parameter->name)) }}</td>
            <td style="border-bottom: 1px solid #fff">{{ $studentFee->fee_parameter->description }}</td>
            <td style="text-align: right;border-bottom: 1px solid #fff">{{ number_format($studentFee->amount,2) }}</td>
        </tr>
    @endforeach
    @if($studTransport)
        <tr>
            <td>{{ ucwords(strtolower($studTransport->transport_zone_fee->transport_zone->name)) }}</td>
            <td>{{ $studTransport->way }}</td>
            <td style="text-align: right">{{ number_format($studTransport->amount,2) }}</td>
        </tr>

        <tr>
            <td style="text-align: right;border-bottom: 1px solid #ffffff;" colspan="2"><b>FEES TOTAL:</b></td>
            <td style="text-align: right;border-bottom: 1px solid #ffffff;"><b>KES {{ number_format(($studentFees->sum('amount') + $studTransport->amount),2) }}</b></td>
        </tr>
    @else
        <tr>
            <td style="text-align: right;border-bottom: 1px solid #ffffff;border-top: 2px solid #1a252f" colspan="2"><b>FEES TOTAL:</b></td>
            <td style="text-align: right;border-bottom: 1px solid #ffffff;border-top: 2px solid #1a252f">
                <b>KES {{ number_format($studentFees->sum('amount'),2) }}</b>
            </td>
        </tr>
    @endif

    @if(count($feeDiscounts) > 0)
        <tr>
            <td style="text-align: right;border-bottom: 1px solid #fff" colspan="2"><b>DISCOUNT TOTAL</b></td>
            <td style="text-align: right;border-bottom: 1px solid #fff">
                <b>KES {{ number_format($feeDiscounts->sum('amount'),2) }}</b>
            </td>
        </tr>
    @endif

    <tr>
        <td style="text-align: right;border-bottom: 1px solid #fff" colspan="2"><b>AMOUNT PAID:</b></td>
        <td style="text-align: right;border-bottom: 1px solid #fff"><b>KES {{ number_format($student->paid,2) }}</b></td>
    </tr>
    <tr>
        <td style="text-align: right;" colspan="2"><b>AMOUNT DUE:</b></td>
        <td style="text-align: right"><b>KES {{ number_format($student->balance,2) }}</b></td>
    </tr>
</table>

<h3 style="margin-top: 30px"><u>BANK DETAILS:</u></h3>

<span><b>{{ strtoupper($profile->name) }}</b></span><br>
@foreach($banks as $bank)
    <p>
        <span><b>BANK NAME:</b> {{ strtoupper($bank->long_name) }}</span><br>
        <span><b>BRANCH:</b> {{ strtoupper($bank->branch) }}</span><br>
        <span><b>ACC NO:</b> {{ $bank->account_no }}</span><br>
    </p>
@endforeach

<p style="text-align: center;margin-top: 50px"><strong>{{ $profile->motto }}</strong></p>
</div>
    <div class="page-break"></div>
@endforeach