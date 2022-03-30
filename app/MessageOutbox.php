<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MessageOutbox extends Model
{
    protected $fillable = [
        'code',
        'externalMessageId',
        'messageId',
        'message',
        'phoneno',
        'characters',
        'sms_units',
        'sms_cost',
        'statusCode',
        'status',
        'delivered_at',
    ];
}
