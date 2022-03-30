<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExpenseDepartment extends Model
{
    protected $fillable = ['name', 'created_by', 'updated_by'];

    public function expenses()
    {
        return $this->hasMany(Expense::class);
    }

    public function expense_section()
    {
        return $this->hasMany(ExpenseSection::class);
    }
}
