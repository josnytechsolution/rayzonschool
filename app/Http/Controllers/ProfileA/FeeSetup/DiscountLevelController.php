<?php

namespace App\Http\Controllers\ProfileA\FeeSetup;

use App\DiscountLevel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class DiscountLevelController extends Controller
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
        $discount_levels = DiscountLevel::all();
       return view('profilea.fee-setup.discount_levels', compact('discount_levels'));
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
        $request->validate([
           'name'      => 'required|string|unique:discount_levels',
           'type'      => 'required|string',
           'discount'  => 'required|numeric',
        ]);

        $data = new DiscountLevel();
        $data->name     = $request->name;
        $data->type     = $request->type;
        $data->discount = $request->discount;
        $data->created_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Discount Level added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\DiscountLevel  $discountLevel
     * @return \Illuminate\Http\Response
     */
    public function show(DiscountLevel $discountLevel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\DiscountLevel  $discountLevel
     * @return \Illuminate\Http\Response
     */
    public function edit(DiscountLevel $discountLevel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\DiscountLevel  $discountLevel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DiscountLevel $discountLevel)
    {
        $request->validate([
            'name'      => 'required|string|unique:discount_levels,name,'.$discountLevel->id,
            'type'      => 'required|string',
            'discount'  => 'required|numeric',
        ]);

        $data = $discountLevel;
        $data->name       = $request->name;
        $data->type       = $request->type;
        $data->discount   = $request->discount;
        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Discount Level has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\DiscountLevel $discountLevel
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, DiscountLevel $discountLevel)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $discountLevel->status = 2;
            $discountLevel->deleted_by = Auth::user()->id;
            $discountLevel->deleted_at = now();
            $discountLevel->save();

            return redirect()->back()->with('success', 'The Discount Level has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
