<?php

namespace App\Exports;

use App\Expense;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class ExpenseSummaryExport implements FromCollection, WithHeadings, WithMapping
{
    private $year;

    public function __construct(int $year)
    {
        $this->year = $year;
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return DB::table('expenses')->whereYear('expense_date', $this->year)->select('expense_section_id')->distinct()->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'DEPARTMENT',
            'SECTION',
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
