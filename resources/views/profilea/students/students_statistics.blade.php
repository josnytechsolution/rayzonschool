@extends('layouts.main')

@section('content')


<!-- Navbar -->
@include('profilea.layouts.admin_navbar')
<!-- /.navbar -->

<!-- Main Sidebar Container -->
@include('profilea.layouts.admin_aside')
<!-- End Main Sidebar Container -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2 mt-4">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">STUDENTS STATISTICS</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard-a.index') }}">Home</a></li>
                        <li class="breadcrumb-item active">Students Details</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 mb-3 py-3" style="background-color: #ffffff">
                                @php($boys = App\Student::Active()->Male()->count())
                                <button type="submit" class="btn btn-primary btn-flat shadow-lg">
                                    {{ $boys }} <i class="fa fa-male"></i> MALE STUDENTS
                                </button>

                                @php($girls = App\Student::Active()->Female()->count())
                                <button type="submit" class="btn btn-warning btn-flat shadow-lg">
                                    {{ $girls }} <i class="fa fa-female"></i> FEMALE STUDENTS
                                </button>

                                @php($all = App\Student::Active()->count())
                                <button type="submit" class="btn btn-success btn-flat shadow-lg">
                                    {{ $girls }} <i class="fa fa-female"></i> FEMALE STUDENTS
                                </button>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-outline card-primary no-radius">
                                <div class="card-header">
                                    <h3 class="card-title">
                                      <i class="fa fa-child"></i>  KINDERGARTEN
                                    </h3>
                                </div>
                                <div class="card-body" style="overflow: auto">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                           <th></th>
                                           <th style="text-align: center;vertical-align: middle;">PG</th>
                                           <th style="text-align: center;vertical-align: middle;">PP1</th>
                                           <th style="text-align: center;vertical-align: middle;">PP2</th>
                                           <th style="text-align: center;vertical-align: middle;">TOTAL</th>
                                        </thead>
                                        <tbody>
                                           <tr>
                                               <th style="text-align: center;vertical-align: middle;">BOYS</th>
                                               <td style="text-align: center;vertical-align: middle;">
                                                   @php($pgb = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 1); })->get())
                                                   {{ $pgb->count() }}
                                               </td>
                                               <td style="text-align: center;vertical-align: middle;">
                                                   @php($pp1b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 2); })->get())
                                                   {{ $pp1b->count() }}
                                               </td>
                                               <td style="text-align: center;vertical-align: middle;">
                                                   @php($pp2b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 3); })->get())
                                                   {{ $pp2b->count() }}
                                               </td>
                                               <th style="text-align: center;vertical-align: middle;">
                                                   {{ $pgb->count() + $pp1b->count() + $pp2b->count() }}
                                               </th>
                                           </tr>

                                           <tr>
                                               <th style="text-align: center;vertical-align: middle;">GIRLS</th>
                                               <td style="text-align: center;vertical-align: middle;">
                                                   @php($pgg = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 1); })->get())
                                                   {{ $pgg->count() }}
                                               </td>
                                               <td style="text-align: center;vertical-align: middle;">
                                                   @php($pp1g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 2); })->get())
                                                   {{ $pp1g->count() }}
                                               </td>
                                               <td style="text-align: center;vertical-align: middle;">
                                                   @php($pp2g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 3); })->get())
                                                   {{ $pp2g->count() }}
                                               </td>
                                               <th style="text-align: center;vertical-align: middle;">
                                                   {{ $pgg->count() + $pp1g->count() + $pp2g->count() }}
                                               </th>
                                           </tr>

                                           <tr>
                                               <th style="text-align: center;vertical-align: middle;">TOTAL</th>
                                               <th style="text-align: center;vertical-align: middle;">
                                                   @php($pgt = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 1); })->get())
                                                   {{ $pgt->count() }}
                                               </th>
                                               <th style="text-align: center;vertical-align: middle;">
                                                   @php($pp1t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 2); })->get())
                                                   {{ $pp1t->count() }}
                                               </th>
                                               <th style="text-align: center;vertical-align: middle;">
                                                   @php($pp2t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 3); })->get())
                                                   {{ $pp2t->count() }}
                                               </th>
                                               <th style="text-align: center;vertical-align: middle;">
                                                   {{ $pgt->count() + $pp1t->count() + $pp2t->count() }}
                                               </th>
                                           </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-outline card-success no-radius">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fa fa-child"></i>  LOWER PRIMARY
                                    </h3>
                                </div>
                                <div class="card-body" style="overflow: auto">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <th></th>
                                        <th style="text-align: center;vertical-align: middle;">GD1</th>
                                        <th style="text-align: center;vertical-align: middle;">GD2</th>
                                        <th style="text-align: center;vertical-align: middle;">GD3</th>
                                        <th style="text-align: center;vertical-align: middle;">TOTAL</th>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th style="text-align: center;vertical-align: middle;">BOYS</th>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd1b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 4); })->get())
                                                {{ $gd1b->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd2b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 5); })->get())
                                                {{ $gd2b->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd3b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 6); })->get())
                                                {{ $gd3b->count() }}
                                            </td>
                                            <th style="text-align: center;vertical-align: middle;">
                                                {{ $gd1b->count() + $gd2b->count() + $gd3b->count() }}
                                            </th>
                                        </tr>

                                        <tr>
                                            <th style="text-align: center;vertical-align: middle;">GIRLS</th>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd1g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 4); })->get())
                                                {{ $gd1g->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd2g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 5); })->get())
                                                {{ $gd2g->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd3g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 6); })->get())
                                                {{ $gd3g->count() }}
                                            </td>
                                            <th style="text-align: center;vertical-align: middle;">
                                                {{ $gd1g->count() + $gd2g->count() + $gd3g->count() }}
                                            </th>
                                        </tr>

                                        <tr>
                                            <th style="text-align: center;vertical-align: middle;">TOTAL</th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd1t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 4); })->get())
                                                {{ $gd1t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd2t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 5); })->get())
                                                {{ $gd2t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd3t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 6); })->get())
                                                {{ $gd3t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                {{ $gd1t->count() + $gd2t->count() + $gd3t->count() }}
                                            </th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-outline card-warning no-radius">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fa fa-child"></i>  UPPER PRIMARY
                                    </h3>
                                </div>
                                <div class="card-body" style="overflow: auto">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <th></th>
                                        <th style="text-align: center;vertical-align: middle;">GD4</th>
                                        <th style="text-align: center;vertical-align: middle;">GD4</th>
                                        <th style="text-align: center;vertical-align: middle;">GD6</th>
                                        <th style="text-align: center;vertical-align: middle;">GD7</th>
                                        <th style="text-align: center;vertical-align: middle;">GD8</th>
                                        <th style="text-align: center;vertical-align: middle;">TOTAL</th>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th style="text-align: center;vertical-align: middle;">BOYS</th>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd4b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 7); })->get())
                                                {{ $gd4b->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd5b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 8); })->get())
                                                {{ $gd5b->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd6b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 9); })->get())
                                                {{ $gd6b->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd7b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 10); })->get())
                                                {{ $gd7b->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd8b = App\Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 11); })->get())
                                                {{ $gd8b->count() }}
                                            </td>
                                            <th style="text-align: center;vertical-align: middle;">
                                                {{ $gd4b->count() + $gd5b->count() + $gd6b->count() + $gd7b->count() + $gd8b->count() }}
                                            </th>
                                        </tr>

                                        <tr>
                                            <th style="text-align: center;vertical-align: middle;">GIRLS</th>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd4g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 7); })->get())
                                                {{ $gd4g->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd5g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 8); })->get())
                                                {{ $gd5g->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd6g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 9); })->get())
                                                {{ $gd6g->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd7g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 10); })->get())
                                                {{ $gd7g->count() }}
                                            </td>
                                            <td style="text-align: center;vertical-align: middle;">
                                                @php($gd8g = App\Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 11); })->get())
                                                {{ $gd8g->count() }}
                                            </td>
                                            <th style="text-align: center;vertical-align: middle;">
                                                {{ $gd4g->count() + $gd5g->count() + $gd6g->count() + $gd7g->count() + $gd8g->count() }}
                                            </th>
                                        </tr>

                                        <tr>
                                            <th style="text-align: center;vertical-align: middle;">TOTAL</th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd4t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 7); })->get())
                                                {{ $gd4t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd5t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 8); })->get())
                                                {{ $gd5t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd6t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 9); })->get())
                                                {{ $gd6t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd7t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 10); })->get())
                                                {{ $gd7t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                @php($gd8t = App\Student::Active()->whereHas('class_grade', function ($query) { $query->where('level', '=', 11); })->get())
                                                {{ $gd8t->count() }}
                                            </th>
                                            <th style="text-align: center;vertical-align: middle;">
                                                {{ $gd4t->count() + $gd5t->count() + $gd6t->count() + $gd7t->count() + $gd8t->count() }}
                                            </th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
