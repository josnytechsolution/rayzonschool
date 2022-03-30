<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StaffDepartment extends Model
{
    protected $fillable = [
        'name',
        'created_by',
        'updated_by',
    ];

    public function staff_section()
    {
        return $this->hasMany(StaffSection::class);
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
