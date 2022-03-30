<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FeeParameter extends Model
{
    protected $fillable = [
        'name',
        'description',
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

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function student_fee()
    {
        return $this->hasMany(StudentFee::class);
    }
}
