<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TempStudent extends Model
{
    protected $fillable = ['student_id', 'created_by'];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
