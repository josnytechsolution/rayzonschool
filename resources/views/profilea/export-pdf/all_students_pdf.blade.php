<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Students List</title>
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
    <span style="font-size: 26px">{{ strtoupper($profile->name) }}</span><br>
    <span style="font-size: 24px">{{ strtoupper($profile->postal) }}</span><br>
    <span style="font-size: 20px">{{ $profile->contact1 }}</span><br>
</p>

<p style="text-align: center;font-size: 18px;font-weight: bold">
   @if($grade) {{ strtoupper($grade) }} @endif @if($gender) {{ strtoupper($gender) }} @endif STUDENTS LIST - Print on {{ date('d-m-Y H:i:sa') }}
</p>

<table>
    <tr>
        <th>#</th>
        <th>ADM NO</th>
        <th>STUDENT NAME</th>
        <th>CLASSROOM</th>
        <th>CONTACT</th>
        <th>BC NO.</th>
        <th>NEMIS</th>
        <th>D.O.A</th>
        <th>D.O.B</th>
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
            <td style="width: 7%;">{{ $student->birth_cert }}</td>
            <td style="width: 5%;">{{ strtoupper($student->nemis_upi) }}</td>
            <td style="width: 8%;">{{ date('d-m-Y', strtotime($student->doa)) }}</td>
            <td style="width: 8%;">{{ date('d-m-Y', strtotime($student->dob)) }}</td>
        </tr>
        <?php $i++; ?>
    @endforeach
    </tbody>
</table>


</body>
</html>