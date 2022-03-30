<?php

namespace App\Http\Controllers\ProfileA\Settings;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
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
        $users = User::Wote()->get();
        return view('profilea.settings.user_management', compact('users'));
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
            'name'      => ['required', 'string', 'max:191'],
            'email'     => ['required', 'string', 'email', 'max:191', 'unique:users'],
            'password'  => ['required', 'string', 'min:8', 'confirmed'],
            'position'  => ['required', 'string'],
            'profile'   => ['required', 'numeric'],
        ]);

        $data = new User();
        $data->name        = ucwords($request->name);
        $data->email       = strtolower($request->email);
        $data->position    = ucwords($request->position);
        $data->profile     = $request->profile;
        $data->password    = Hash::make($request->password);
        $data->created_by  = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'User created successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //dd($request->all());
        $request->validate([
            'name'      => ['required', 'string', 'max:191'],
            'email'     => ['required', 'string', 'email', 'max:191', 'unique:users,email,'.$user->id],
            'position'  => ['required', 'string'],
            'profile'   => ['required', 'numeric'],
            'status'    => ['required', 'numeric'],
            'password'  => ['nullable', 'string', 'min:8', 'confirmed'],
        ]);

        $data = $user;
        $data->name        = ucwords($request->name);
        $data->email       = strtolower($request->email);
        $data->position    = ucwords($request->position);
        $data->profile     = $request->profile;
        $data->password    = Hash::make($request->password);
        $data->status      = $request->status;
        $data->updated_by  = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'User updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, User $user)
    {
        //
    }
}
