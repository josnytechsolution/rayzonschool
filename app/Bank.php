<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    protected $fillable = [
        'slug',
        'name',
        'long_name',
        'branch',
        'account_name',
        'account_no',
        'status',
        'created_by',
        'updated_by',
        'deleted_by',
        'deleted_at'
    ];

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Deleted',
        ][$status];
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function fee_payment()
    {
        return $this->hasMany(FeePayment::class);
    }

    public function expenses()
    {
        return $this->hasMany(Expense::class);
    }
}
