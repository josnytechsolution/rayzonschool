<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubjectTeacher extends Model
{
    protected $fillable = [
        'staff_member_id',
        'class_grade_id',
        'class_stream_id',
        'classroom_id',
        'class_subject_id',
        'created_by',
        'updated_by',
    ];

    public function staff_member()
    {
        return $this->belongsTo(StaffMember::class);
    }

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

    public function class_subject()
    {
        return $this->belongsTo(ClassSubject::class);
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function updator()
    {
        return $this->belongsTo(User::class, 'updated_by', 'id');
    }
}
