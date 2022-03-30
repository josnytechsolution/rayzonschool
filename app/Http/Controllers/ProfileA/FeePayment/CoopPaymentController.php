<?php

namespace App\Http\Controllers\ProfileA\FeePayment;

use App\CoopPayment;
use App\CurrentDefault;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CoopPaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $current_session = CurrentDefault::CurrentSession();
        $coop_payments = CoopPayment::orderBy('id', 'desc')->get();
        return view('profilea.fee-payment.coop_payments', compact('coop_payments', 'current_session'));
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
     * @param  \App\CoopPayment  $coopPayment
     * @return \Illuminate\Http\Response
     */
    public function show(CoopPayment $coopPayment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CoopPayment  $coopPayment
     * @return \Illuminate\Http\Response
     */
    public function edit(CoopPayment $coopPayment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CoopPayment  $coopPayment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CoopPayment $coopPayment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CoopPayment  $coopPayment
     * @return \Illuminate\Http\Response
     */
    public function destroy(CoopPayment $coopPayment)
    {
        //
    }
}
