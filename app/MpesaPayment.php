<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MpesaPayment extends Model
{
    protected $fillable = [
        'student_id',
        'current_session_id',
        'transTime',
        'transAmount',
        'businessShortCode',
        'billRefNumber',
        'invoiceNumber',
        'orgAccountBalance',
        'thirdPartyTransID',
        'MSISDN',
        'firstName',
        'lastName',
        'middleName',
        'transID',
        'transactionType',
        'status',
    ];

    public function getStatusAttribute($status)
    {
        return [
            '1' => 'Successful',
            '2' => 'Unsuccessful',
        ][$status];
    }

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }

    public function mpesa_outbox()
    {
        return $this->hasMany(MpesaOutbox::class);
    }
}
