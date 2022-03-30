<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\Session\Session;
//use Session;
use Illuminate\Http\Request;


class SessionController extends Controller
{
    public function ajaxCheck()
    {
        // Configuration
        $maxIdleBeforeLogout = 1000 * 1;
        $maxIdleBeforeWarning = 900 * 1;
        $warningTime = $maxIdleBeforeLogout - $maxIdleBeforeWarning;

        // Calculate the number of seconds since the use's last activity
        $idleTime = date('U') - session()->get('lastActive');

        // Warn user they will be logged out if idle for too long
        if ($idleTime > $maxIdleBeforeWarning && empty(session()->get('idleWarningDisplayed'))) {

            session()->put('idleWarningDisplayed', true);

            return 'You have ' . $warningTime . ' seconds left before you are logged out';
        }

        // Log out user if idle for too long
        if ($idleTime > $maxIdleBeforeLogout && empty(session()->get('logoutWarningDisplayed'))) {

            // *** Do stuff to log out user here

            session()->put('logoutWarningDisplayed', true);

            return 'loggedOut';
        }

        return '';
    }

    public function ajaxReset()
    {
        session()->put('lastActive', date('U'));
        session()->forget('idleWarningDisplayed');
        session()->forget('logoutWarningDisplayed');

       return redirect()->back();
    }
}
