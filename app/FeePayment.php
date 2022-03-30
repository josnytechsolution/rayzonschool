<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FeePayment extends Model
{
    protected $fillable = [
        'parent_detail_id',
        'student_id',
        'receipt_no',
        'current_session_id',
        'class_grade_id',
        'expected',
        'fees',
        'arrears',
        'paid',
        'balance',
        'pay_date',
        'slip_date',
        'bank_id',
        'ref_no',
        'print',
        'created_by',
        'updated_by',
        'deleted_by',
        'deleted_at'
    ];

    public function parent_detail()
    {
        return $this->belongsTo(ParentDetail::class);
    }

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

    public function bank()
    {
        return $this->belongsTo(Bank::class);
    }

    public function teller()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }
}
