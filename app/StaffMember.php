<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StaffMember extends Model
{
    protected $fillable = [
        'slug',
        'member_no',
        'name',
        'idno',
        'gender',
        'marital',
        'dob',
        'reg_date',
        'phoneno1',
        'phoneno2',
        'email',
        'staff_department_id',
        'staff_section_id',
        'emp_type',
        'tsc_no',
        'pin',
        'nssf',
        'nhif',
        'bank_name',
        'bank_branch',
        'account_name',
        'account_no',
        'photo',
        'status',
        'created_by',
        'updated_by',
    ];

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Suspended',
            3 => 'Resigned',
        ][$status];
    }

    public function getGenderAttribute($gender)
    {
        return [
            1 => 'Male',
            2 => 'Female',
        ][$gender];
    }

    public function getMaritalAttribute($marital)
    {
        return [
            1 => 'Single',
            2 => 'Married',
            3 => 'Separated',
        ][$marital];
    }

    public function getEmpTypeAttribute($emptype)
    {
        return [
            1 => 'Permanent',
            2 => 'Probation',
            3 => 'Attachment',
        ][$emptype];
    }

    public function subject_teacher()
    {
        return $this->hasMany(SubjectTeacher::class);
    }

    public function staff_department()
    {
        return $this->belongsTo(StaffDepartment::class);
    }

    public function staff_section()
    {
        return $this->belongsTo(StaffSection::class);
    }

    public function staff_message()
    {
        return $this->hasMany(StaffMessage::class);
    }

    public function temp_staff()
    {
        return $this->hasMany(TempStaff::class);
    }

    public function class_manager()
    {
        return $this->hasMany(ClassManager::class);
    }
}
