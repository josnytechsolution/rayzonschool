<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StaffMessage extends Model
{
    protected $fillable = [
        'staff_member_id',
        'staff_department_id',
        'staff_section_id',
        'contact',
        'message',
        'created_by',
    ];

    public function staff_department()
    {
        return $this->belongsTo(StaffDepartment::class);
    }

    public function staff_section()
    {
        return $this->belongsTo(StaffSection::class);
    }

    public function staff_member()
    {
        return $this->belongsTo(StaffMember::class);
    }

    public function sender()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }
}
