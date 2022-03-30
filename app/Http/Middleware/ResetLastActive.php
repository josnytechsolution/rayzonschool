<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Session\Session;
//use Session;

class ResetLastActive
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
        session()->put('lastActive', date('U'));
        session()->forget('idleWarningDisplayed');
        session()->forget('logoutWarningDisplayed');

        return $next($request);

    }
}
