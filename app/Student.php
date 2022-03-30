<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $fillable = [
        'parent_detail_id',
        'admno',
        'name',
        'classroom_id',
        'class_grade_id',
        'class_stream_id',
        'expected',
        'arrears',
        'current',
        'paid',
        'balance',
        'birth_cert',
        'nemis_upi',
        'gender',
        'dob',
        'doa',
        'yoc',
        'residence',
        'admn_type',
        'on_transport',
        'transport_zone_id',
        'way',
        'transport_fleet_id',
        'send_to',
        'photo',
        'status',
        'created_by',
        'updated_by',
        'deleted_by',
        'deleted_at'
    ];

    /**
     * Always capitalize the name when we save it to the database
     * @param $value
     */
    public function setNameAttribute($value) {
        $this->attributes['name'] = ucwords(strtolower($value));
    }

    public function getNameAttribute($value)
    {
        return ucwords(strtolower($value));
    }

    /**
     * Always capitalize the nemis when we save it to the database
     * @param $value
     */
    public function setNemisUpiAttribute($value) {
        $this->attributes['nemis_upi'] = strtoupper($value);
    }

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Inactive',
            3 => 'Alumnus',
        ][$status];
    }

    public function getAdmnTypeAttribute($admn_type)
    {
        return [
            1 => 'New Student',
            2 => 'Existing Student',
        ][$admn_type];
    }

    public function getGenderAttribute($gender)
    {
        return [
            1 => 'Male',
            2 => 'Female',
        ][$gender];
    }

    public function getSendToAttribute($send_to)
    {
        return [
            'primary_contact' => 'Primary Contact',
            'secondary_contact' => 'Secondary Contact',
            'both_contacts' => 'Both Contacts'
        ][$send_to];
    }


    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function scopeInactive($query)
    {
        return $query->where('status', 2);
    }

    public function scopeBalance($query)
    {
        return $query->where('balance', '>', 0);
    }

    public function scopeOverpay($query)
    {
        return $query->where('balance', '<', 0);
    }

    public function scopeArrears($query)
    {
        return $query->where('arrears', '>', 0);
    }

    public function scopeMale($query)
    {
        return $query->where('gender', 1);
    }

    public function scopeFemale($query)
    {
        return $query->where('gender', 2);
    }

    public function scopeAlumni($query)
    {
        return $query->where('status', 3);
    }

    public function scopeNew($query)
    {
        return $query->where('adm_type', 1)->whereYear('doa', date('Y'));
    }

    public function temp_student()
    {
        return $this->hasMany(TempStudent::class);
    }

    public function coop_payment()
    {
        return $this->hasMany(CoopPayment::class);
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function updator()
    {
        return $this->belongsTo(User::class, 'updated_by', 'id');
    }

    public function deleter()
    {
        return $this->belongsTo(User::class, 'deleted_by', 'id');
    }

    public function parent_detail()
    {
        return $this->belongsTo(ParentDetail::class);
    }

    public function classroom()
    {
        return $this->belongsTo(Classroom::class);
    }

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }

    public function class_stream()
    {
        return $this->belongsTo(ClassStream::class);
    }

    public function student_fee()
    {
        return $this->hasMany(StudentFee::class);
    }

    public function fee_payment()
    {
        return $this->hasMany(FeePayment::class);
    }

    public function discount_level()
    {
        return $this->belongsTo(DiscountLevel::class);
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

    public function student_transport()
    {
        return $this->hasMany(StudentTransport::class);
    }

    public function student_promotion()
    {
        return $this->hasMany(StudentPromotion::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }

    //Population by class

    public function scopeMalePG($query)
    {
        return $query->where('gender', 1);
    }

    public function transport_fleet()
    {
        return $this->belongsTo(TransportFleet::class);
    }
}
