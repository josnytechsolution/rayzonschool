<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransportFleet extends Model
{
    protected $fillable = [
        'name',
        'long_name',
        'slug',
        'status',
        'created_by',
        'updated_by'
    ];

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Deleted',
        ][$status];
    }

    public function expenses()
    {
        return $this->hasMany(Expense::class);
    }
}
