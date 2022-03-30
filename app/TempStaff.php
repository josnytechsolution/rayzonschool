<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TempStaff extends Model
{
    protected $fillable = ['staff_member_id', 'created_by'];

    public function staff_member()
    {
        return $this->belongsTo(StaffMember::class);
    }
}
