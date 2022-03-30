<?php


namespace App;


class Compute
{
    public static function calcEngine($chars)
    {
        if ($chars < 161)
        {
            $units = 1;
        }
        elseif ($chars > 160 && $chars < 306)
        {
            $units = 2;
        }
        elseif ($chars > 305 && $chars < 458)
        {
            $units = 3;
        }

        $cost = $units * 0.8;

        return ['cost' => $cost, 'units' => $units];
    }
}