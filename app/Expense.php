<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    protected $fillable = [
        'slug',
        'expense_department_id',
        'expense_section_id',
        'transport_fleet_id',
        'description',
        'expense_date',
        'amount',
        'payment_type',
        'bank_id',
        'account_no',
        'ref_no',
        'created_by',
        'updated_by',
    ];

    public function getPaymentTypeAttribute($payment_type)
    {
        return [
            1 => 'Cash',
            2 => 'Cheque',
            3 => 'Direct Deposit',
            4 => 'Mobile Transfer'
        ][$payment_type];
    }

    public function expense_department()
    {
        return $this->belongsTo(ExpenseDepartment::class);
    }

    public function expense_section()
    {
        return $this->belongsTo(ExpenseSection::class);
    }

    public function bank()
    {
        return $this->belongsTo(Bank::class);
    }

    public function transport_fleet()
    {
        return $this->belongsTo(TransportFleet::class);
    }
}
