<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Parents Details List</title>
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
            font-size: 9px;
            page-break-after: always;
        }

        td, th {
            border: 1px solid #1a252f;
            text-align: left;
            padding: 4px 8px 4px 8px;
            vertical-align: middle;
            text-wrap: normal;
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
    Parents Details List - Print on {{ date('d-m-Y H:i:sa') }}
</p>

<table>
    <tr>
        <th>#</th>
        <th>PARENT NO</th>
        <th>F NAME</th>
        <th>F CONTACT</th>
        <th>F EMAIL</th>
        <th>F OCC</th>
        <th>M NAME</th>
        <th>M CONTACT</th>
        <th>M EMAIL</th>
        <th>M OCC</th>
        <th>G NAME</th>
        <th>G CONTACT</th>
        <th>G EMAIL</th>
        <th>G REL</th>
    </tr>
    <tbody>
    <?php $i = 1; ?>
    @foreach($parents as $parent)
        <tr style="width: 100%">
            <td style="text-align: center;width: 3%;">{{ $i }}</td>
            <td style="width: 5%">{{ $parent->parent_no }}</td>
            <td style="width: 5%">{{ strtoupper($parent->fname) }}</td>
            <td style="width: 5%">{{ $parent->fcontact }}</td>
            <td style="width: 5%">{{ $parent->femail }}</td>
            <td style="width: 5%">{{ $parent->foccupation }}</td>
            <td style="width: 5%">{{ strtoupper($parent->mname) }}</td>
            <td style="width: 5%">{{ $parent->mcontact }}</td>
            <td style="width: 5%">{{ $parent->memail }}</td>
            <td style="width: 5%">{{ $parent->moccupation }}</td>
            <td style="width: 5%">{{ strtoupper($parent->gname) }}</td>
            <td style="width: 5%">{{ $parent->gcontact }}</td>
            <td style="width: 5%">{{ $parent->gemail }}</td>
            <td style="width: 5%">{{ $parent->grelation }}</td>
        </tr>
        <?php $i++; ?>
    @endforeach
    </tbody>
</table>

<!-- Optional JavaScript -->
</body>
</html>