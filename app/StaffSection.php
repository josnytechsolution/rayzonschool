<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StaffSection extends Model
{
    protected $fillable = [
        'staff_department_id',
        'name',
        'created_by',
        'updated_by',
    ];

    public function staff_department()
    {
        return $this->belongsTo(StaffDepartment::class);
    }

    public function staff_member()
    {
        return $this->hasMany(StaffMember::class);
    }

    public function staff_message()
    {
        return $this->hasMany(StaffMessage::class);
    }
}
