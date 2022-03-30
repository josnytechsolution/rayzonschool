<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OriginalMessage extends Model
{
    protected $fillable = [
        'slug',
        'message',
        'target',
        'status',
        'created_by',
        'updated_by'
    ];

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function sender()
    {
        return $this->belongsTo(User::class, 'updated_by', 'id');
    }
}
