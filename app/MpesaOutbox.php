<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MpesaOutbox extends Model
{
    protected $fillable = [
        'mpesa_payment_id',
        'messageId',
        'message',
        'phone',
        'status',
    ];

    public function mpesa_payment()
    {
        return $this->belongsTo(MpesaPayment::class);
    }
}
