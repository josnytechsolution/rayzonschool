<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransportZoneFee extends Model
{
    protected $fillable = [
        'slug',
        'transport_zone_id',
        'one_way',
        'two_way',
        'current_session_id',
        'created_by',
        'updated_by'
    ];

    public function getWayAttribute($way)
    {
        return [
            1 => 'One Way',
            2 => 'Two Way',
        ][$way];
    }

    public function transport_zone()
    {
        return $this->belongsTo(TransportZone::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }
    
    public function student_transports()
    {
        return $this->hasMany(StudentTransport::class);
    }
}
