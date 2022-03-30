<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CurrentSession extends Model
{
    protected $fillable = [
        'name',
        'financial_year_id',
        'academic_term_id',
        'status',
        'created_by',
        'updated_by'
    ];

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Past',
            2 => 'Active',
            3 => 'Future',
        ][$status];
    }

    public function scopeCurrent($query)
    {
        return $query->where('status', 2);
    }

    public function financial_year()
    {
        return $this->belongsTo(FinancialYear::class);
    }

    public function academic_term()
    {
        return $this->belongsTo(AcademicTerm::class);
    }

    public function transport_zone_fee()
    {
        return $this->hasMany(TransportZoneFee::class);
    }

    public function one_time_fee()
    {
        return $this->hasMany(OneTimeFee::class);
    }

    public function optional_fee()
    {
        return $this->hasMany(OptionalFee::class);
    }

    public function class_fee()
    {
        return $this->hasMany(ClassFee::class);
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

    public function mpesa_payments()
    {
        return $this->hasMany(MpesaPayment::class);
    }

    public function student_timelines()
    {
        return $this->hasMany(StudentTimeline::class);
    }

    public function student_promotion()
    {
        return $this->hasMany(StudentPromotion::class);
    }

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}
