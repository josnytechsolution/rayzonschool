<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ParentDetail extends Model
{
    protected $fillable = [
        'parent_no',
        'dedicated_phone',
        'dedicated_email',
        'fname',
        'fcontact',
        'femail',
        'foccupation',
        'mname',
        'mcontact',
        'memail',
        'moccupation',
        'gname',
        'gcontact',
        'gemail',
        'grelation',
        'status',
        'created_by',
        'updated_by' ,
        'deleted_by',
        'deleted_at'
    ];

    /**
     * Always capitalize the name when we save it to the database
     * @param $value
     */
    public function setFNameAttribute($value) {
        $this->attributes['fname'] = ucwords(strtolower($value));
    }

    /**
     * Always capitalize the name when we save it to the database
     * @param $value
     */
    public function setMNameAttribute($value) {
        $this->attributes['mname'] = ucwords(strtolower($value));
    }

    /**
     * Always capitalize the name when we save it to the database
     * @param $value
     */
    public function setGNameAttribute($value) {
        $this->attributes['gname'] = ucwords(strtolower($value));
    }

    /**
     * Always capitalize the first name when we retrieve it
     * @param $value
     * @return string
     */
    public function getFNameAttribute($value) {
        return ucwords(strtolower($value));
    }

    /**
     * Always capitalize the first name when we retrieve it
     * @param $value
     * @return string
     */
    public function getMNameAttribute($value) {
        return ucwords(strtolower($value));
    }

    /**
     * Always capitalize the first name when we retrieve it
     * @param $value
     * @return string
     */
    public function getGNameAttribute($value) {
        return ucwords(strtolower($value));
    }


    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Deleted',
        ][$status];
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function scopeInactive($query)
    {
        return $query->where('status', 2);
    }

    public function students()
    {
        return $this->hasMany(Student::class);
    }

    public function fee_payments()
    {
        return $this->hasMany(FeePayment::class);
    }
}
