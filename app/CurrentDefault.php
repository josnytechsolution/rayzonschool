<?php


namespace App;


class CurrentDefault
{
    public static function CurrentSession()
    {
        return CurrentSession::Current()->first();
    }

    public static function SchoolProfile()
    {
        return SchoolProfile::findOrFail(1);
    }
}