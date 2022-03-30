<?php

namespace App\Http\Controllers\ProfileA\SchoolSetup;

use App\PromotionHistory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PromotionHistoryController extends Controller
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
     * @param  \App\PromotionHistory  $promotionHistory
     * @return \Illuminate\Http\Response
     */
    public function show(PromotionHistory $promotionHistory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PromotionHistory  $promotionHistory
     * @return \Illuminate\Http\Response
     */
    public function edit(PromotionHistory $promotionHistory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PromotionHistory  $promotionHistory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PromotionHistory $promotionHistory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PromotionHistory  $promotionHistory
     * @return \Illuminate\Http\Response
     */
    public function destroy(PromotionHistory $promotionHistory)
    {
        //
    }
}
