<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'profile', 'position', 'parent_detail_id', 'status', 'created_by', 'updated_by'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getProfileAttribute($profile)
    {
        return [
            1 => 'isSuper',
            2 => 'isAdmin',
            3 => 'isUser',
            4 => 'isParent',
            5 => 'isParent',
        ][$profile];
    }

    public function scopeIsSuper($query)
    {
        return $query->where('profile', 1);
    }

    public function scopeIsAdmin($query)
    {
        return $query->where('profile', 2);
    }

    public function scopeIsUser($query)
    {
        return $query->where('profile', 3);
    }

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Suspended',
        ][$status];
    }

    public function scopeIsActive($query)
    {
        return $query->where('status', 1);
    }

    public function scopeWote($query)  {  return $query->where('id', '>', 1)->where('profile', '<', 4); }
}
