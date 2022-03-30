<?php

namespace App\Http\Controllers;

use App\Home;
use App\SchoolProfile;
use App\Student;
use App\User;
use PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if(Auth::user()->status === "Active")
        {
            if(Auth::user()->profile === "isSuper" || Auth::user()->profile === "isAdmin" || Auth::user()->profile === "isUser" )
            {
                    return redirect()->route('dashboard-a.index');
            }
            else
            {
                $message = "You are not allowed to use this portal! Kindly login via the correct portal!";
                return view('home')->with('message', $message);
            }
        }
        else
        {
            Auth::logout();
            return redirect('/login')->with('failed', 'You Account is Locked! Contact Administrator!');
        }
    }
}
