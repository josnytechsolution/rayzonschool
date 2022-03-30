<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OptionalFee extends Model
{
    protected $fillable = [
        'financial_year_id',
        'academic_term_id',
        'fee_parameter_id',
        'amount',
        'status',
        'updated_by',
        'deleted_by'
    ];

    public function getStatusAttribute($status)
    {
        return [
            1 => 'Active',
            2 => 'Deleted'
        ][$status];
    }

    public function financial_year()
    {
        return $this->belongsTo(FinancialYear::class);
    }

    public function academic_term()
    {
        return $this->belongsTo(AcademicTerm::class);
    }

    public function fee_parameter()
    {
        return $this->belongsTo(FeeParameter::class);
    }

    public function current_session()
    {
        return $this->belongsTo(CurrentSession::class);
    }
}
