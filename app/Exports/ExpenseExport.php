<?php

namespace App\Exports;

use App\Expense;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class ExpenseExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return Collection
    */
    public function collection()
    {
        return Expense::whereYear('expense_date', date('Y'))->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'DEPARTMENT',
            'SECTION',
            'VEHICLE',
            'DESCRIPTION',
            'EXPENSE DATE',
            'AMOUNT',
            'PAYMENT TYPE',
            'BANK NAME',
            'BANK ACCOUNT',
            'REF. NO'
        ];
    }

    /**
     * @param mixed $row
     *
     * @return array
     */
    public function map($row): array
    {
        if($row->transport_fleet_id != NULL)
        {
           $vehicle = $row->transport_fleet->reg_no;
        }
        else
        {
            $vehicle = "";
        }

        return [
            $row->expense_department->name,
            $row->expense_section->name,
            $vehicle,
            $row->description,
            $row->expense_date,
            $row->amount,
            $row->payment_type,
            $row->bank->name,
            $row->account_no,
            $row->ref_no
        ];
    }
}
