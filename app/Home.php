<?php

namespace App;

use Illuminate\Support\Facades\Auth;

class Home
{
   public static function resetToHome()
   {
       $message = "Welcome, {Auth::user()->name}. Today is {date('Y-m-d')}";

       //If active redirect by user role
       if(Auth::user()->isAdmin())
       {
           return redirect()->route('dashboard-a.index')->with('welcome', $message);
       }

       if(Auth::user()->isSecretary())
       {
           return redirect()->route('dashboard-ab.index')->with('welcome', $message);
       }

       if(Auth::user()->isAccountant())
       {
           return redirect()->route('dashboard-abc.index')->with('welcome', $message);
       }

       return redirect()->route('dashboard-a.index')->with('welcome', $message);
   }
}

?>