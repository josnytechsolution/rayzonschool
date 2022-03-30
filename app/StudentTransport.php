<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentTransport extends Model
{
    protected $fillable = [
        'student_id',
        'current_session_id',
        'class_grade_id',
        'transport_zone_fee_id',
        'way',
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
            2 => 'Deleted',
        ][$status];
    }

    public function getWayAttribute($way)
    {
        return [
            1 => 'One Way',
            2 => 'Two Way',
        ][$way];
    }

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function transport_zone_fee()
    {
        return $this->belongsTo(TransportZoneFee::class);
    }
}
