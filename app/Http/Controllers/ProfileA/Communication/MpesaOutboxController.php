<?php

namespace App\Http\Controllers\ProfileA\Communication;

use App\MpesaOutbox;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MpesaOutboxController extends Controller
{
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
        //
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
     * @param  \App\MpesaOutbox  $mpesaOutbox
     * @return \Illuminate\Http\Response
     */
    public function show(MpesaOutbox $mpesaOutbox)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MpesaOutbox  $mpesaOutbox
     * @return \Illuminate\Http\Response
     */
    public function edit(MpesaOutbox $mpesaOutbox)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MpesaOutbox  $mpesaOutbox
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MpesaOutbox $mpesaOutbox)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MpesaOutbox  $mpesaOutbox
     * @return \Illuminate\Http\Response
     */
    public function destroy(MpesaOutbox $mpesaOutbox)
    {
        //
    }
}
