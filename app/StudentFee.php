<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentFee extends Model
{
    protected $fillable = [
        'student_id',
        'current_session_id',
        'fee_parameter_id',
        'description',
        'class_grade_id',
        'amount',
        'status',
        'created_by',
        'updated_by',
        'deleted_by',
        'deleted_at',
    ];


    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Inactive',
            3 => 'Deleted',
            4 => 'Alumnus',
        ][$status];
    }

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }

    public function fee_parameter()
    {
        return $this->belongsTo(FeeParameter::class);
    }

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function discount_level()
    {
        return $this->belongsTo(DiscountLevel::class);
    }
}
