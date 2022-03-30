<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CoopOutbox extends Model
{
    protected $fillable = [
        'coop_payment_id',
        'messageId',
        'message',
        'phone',
        'status',
    ];

    public function coop_payment()
    {
        return $this->belongsTo(CoopPayment::class);
    }
}
