<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AcademicTerm extends Model
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
            2 => 'Deleted',
        ][$status];
    }

    public function transport_zone_fee()
    {
        return $this->hasMany(TransportZoneFee::class);
    }

    public function current_sessions()
    {
        return $this->hasMany(CurrentSession::class);
    }
}
