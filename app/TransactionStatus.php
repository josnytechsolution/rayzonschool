<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransactionStatus extends Model
{
    protected $fillable = [
        'result_code',
        'result_desc',
        'originator_conversation_id',
        'conversation_id',
        'transaction_id',
        'receipt_no',
        'conversationid',
        'finalised_time',
        'amount',
        'transaction_status',
        'reason_type',
        'transaction_reason',
        'debit_party_charges',
        'debit_account_type',
        'initiated_time',
        'originator_conversationid',
        'credit_party_name',
        'debit_party_name',
    ];
}
