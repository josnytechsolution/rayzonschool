<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExpenseSection extends Model
{
    protected $fillable = ['expense_department_id', 'name', 'created_by', 'updated_by'];

    public function expenses()
    {
        return $this->hasMany(Expense::class);
    }

    public function expense_department()
    {
        return $this->belongsTo(ExpenseDepartment::class);
    }
}
