<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassGrade extends Model
{
    protected $fillable = [
        'name',
        'long_name',
        'slug',
        'level',
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

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function classroom()
    {
        return $this->hasMany(Classroom::class);
    }

    public function student_fee()
    {
        return $this->hasMany(StudentFee::class);
    }

    public function transport_transport()
    {
        return $this->hasMany(StudentTransport::class);
    }

    public function fee_payment()
    {
        return $this->hasMany(FeePayment::class);
    }

    public function fee_discount()
    {
        return $this->hasMany(FeeDiscount::class);
    }

    public function students()
    {
        return $this->hasMany(Student::class);
    }

    public function student_timelines()
    {
        return $this->hasMany(StudentTimeline::class);
    }

    public function class_managers()
    {
        return $this->hasMany(ClassManager::class);
    }

    public function class_subjects()
    {
        return $this->hasMany(ClassSubject::class);
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

    public function student_promotion()
    {
        return $this->hasMany(StudentPromotion::class);
    }

}
