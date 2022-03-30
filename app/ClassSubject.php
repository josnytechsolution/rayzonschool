<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassSubject extends Model
{
    protected $fillable = [
        'name',
        'class_grade_id',
        'academic_subject_id',
        'created_by',
        'updated_by',
    ];

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function academic_subject()
    {
        return $this->belongsTo(AcademicSubject::class);
    }

    public function subject_teachers()
    {
        return $this->hasMany(SubjectTeacher::class);
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
