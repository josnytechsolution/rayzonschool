<?php

namespace App\Http\Controllers\ProfileA;

use App\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pgb = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 1); })->count();
        $p1b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 2); })->count();
        $p2b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 3); })->count();
        $g1b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 4); })->count();
        $g2b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 5); })->count();
        $g3b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 6); })->count();
        $g4b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 7); })->count();
        $g5b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 8); })->count();
        $g6b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 9); })->count();
        $g7b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 10); })->count();
        $g8b = Student::Active()->Male()->whereHas('class_grade', function ($query) { $query->where('level', '=', 11); })->count();


        $pgg = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 1); })->count();
        $p1g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 2); })->count();
        $p2g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 3); })->count();
        $g1g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 4); })->count();
        $g2g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 5); })->count();
        $g3g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 6); })->count();
        $g4g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 7); })->count();
        $g5g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 8); })->count();
        $g6g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 9); })->count();
        $g7g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 10); })->count();
        $g8g = Student::Active()->Female()->whereHas('class_grade', function ($query) { $query->where('level', '=', 11); })->count();

        $boys = [$pgb, $p1b, $p2b, $g1b, $g2b, $g3b, $g4b, $g5b, $g6b, $g7b, $g8b];
        $girls = [$pgg, $p1g, $p2g, $g1g, $g2g, $g3g, $g4g, $g5g, $g6g, $g7g, $g8g];
        //dd($pgb);
        return view('profilea.dashboard', compact('boys', 'girls'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
