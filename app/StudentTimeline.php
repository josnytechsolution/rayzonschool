<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentTimeline extends Model
{
   protected $fillable = [
       'student_id',
       'current_session_id',
       'class_grade_id',
       'description',
   ];

   public function student()
   {
       return $this->belongsTo(Student::class);
   }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }

    public function class_grade()
    {
        return $this->belongsTo(ClassGrade::class);
    }
}
