<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentPromotion extends Model
{
    protected $fillable = [
        'student_id',
        'class_grade_id',
        'current_session_id',
        'fees',
        'arrears',
        'balance',
        'created_by',
        'updated_by',
    ];


    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }
}
