<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DiscountLevel extends Model
{
    protected $fillable = [
        'name',
        'type',
        'discount',
        'created_by',
        'updated_by',
        'deleted_by',
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

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}
