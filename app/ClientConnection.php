<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClientConnection extends Model
{
    protected $fillable = [
        'connectionID',
        'connectionPassword',
    ];
}
