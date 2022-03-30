<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolProfile extends Model
{
    protected $fillable = [
        'name',
        'motto',
        'postal',
        'physical',
        'contact1',
        'contact2',
        'contact3',
        'contact4',
        'email1',
        'email2',
        'email3',
        'email4',
        'website',
        'logo',
        'created_by',
        'created_at',
        'updated_by',
        'updated_at',
    ];
}
