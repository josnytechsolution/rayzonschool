<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classroom extends Model
{
    protected $fillable = [
        'name',
        'long_name',
        'slug',
        'class_grade_id',
        'class_stream_id',
        'status',
        'created_by',
        'updated_by'
    ];

    public function getStatusAttribute($status)
    {
        return[
            1 => 'Active',
            2 => 'Inactive'
        ][$status];
    }

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function class_stream()
    {
        return $this->belongsTo(ClassStream::class);
    }

    public function class_managers()
    {
        return $this->hasMany(ClassManager::class);
    }

    public function student()
    {
        return $this->hasMany(Student::class);
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
