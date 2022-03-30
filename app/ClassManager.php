<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassManager extends Model
{
    protected $fillable = [
        'class_grade_id',
        'class_stream_id',
        'classroom_id',
        'staff_member_id',
        'created_by',
        'updated_by',
    ];

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function class_stream()
    {
        return $this->belongsTo(ClassStream::class);
    }

    public function classroom()
    {
        return $this->belongsTo(Classroom::class);
    }

    public function staff_member()
    {
        return $this->belongsTo(StaffMember::class);
    }
}
