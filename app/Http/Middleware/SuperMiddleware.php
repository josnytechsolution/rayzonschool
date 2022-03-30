<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class SuperMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::user()->profile === 'isSuper')
        {
            return $next($request);
        }
        else
        {
            return redirect()->back()->with('failed', 'Access Denied!');
        }
    }
}
