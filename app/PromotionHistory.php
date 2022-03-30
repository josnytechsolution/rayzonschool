<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PromotionHistory extends Model
{
    protected $fillable = [
        'class_from',
        'class_to',
        'from_session_id',
        'to_session_id',
        'created_by',
    ];
}
