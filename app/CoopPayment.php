<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CoopPayment extends Model
{
    protected $fillable = [
        'student_id',
        'current_session_id',
        'transactionReferenceCode',
        'transactionDate',
        'totalAmount',
        'currency',
        'documentReferenceNumber',
        'bankCode',
        'branchCode',
        'paymentDate',
        'paymentReferenceCode',
        'paymentCode',
        'paymentMode',
        'paymentAmount',
        'additionalInfo',
        'accountNumber',
        'accountName',
        'institutionCode',
        'institutionName',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function coop_outbox()
    {
        return $this->hasMany(CoopOutbox::class);
    }
}
