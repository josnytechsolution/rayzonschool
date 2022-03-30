<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AcademicSubject extends Model
{
    protected $fillable = [
        'name',
        'code',
        'created_by',
        'updated_by',
    ];

    public function class_subject()
    {
        return $this->hasMany(ClassSubject::class);
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
