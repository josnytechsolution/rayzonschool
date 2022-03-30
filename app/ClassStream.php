<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassStream extends Model
{
    protected $fillable = [
        'name',
        'long_name',
        'slug',
        'status',
        'created_by',
        'updated_by'
    ];

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Inactive',
        ][$status];
    }

    public function classroom()
    {
        return $this->hasMany(Classroom::class);
    }

    public function class_manager()
    {
        return $this->hasMany(ClassManager::class);
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
