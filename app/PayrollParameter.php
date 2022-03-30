<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PayrollParameter extends Model
{
    protected $fillable = [
        'name',
        'description',
        'type',
        'created_by',
        'created_at',
        'updated_by',
        'updated_at',
    ];
}
