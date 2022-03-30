<?php

namespace App\Exports;

use App\FeePayment;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class StudentStatementExport implements FromCollection, WithHeadings, WithMapping
{
    private $id;

    public function __construct(int $id)
    {
        $this->id = $id;
    }

    /**
    * @return Collection
    */
    public function collection()
    {
        return FeePayment::where('student_id', $this->id)->orderBy('id', 'desc')->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'RECEIPT NO',
            'TERM/YEAR',
            'CLASS/GRADE',
            'PAY DATE',
            'BANK NAME',
            'REF. NO',
            'AMOUNT'
        ];
    }

    /**
     * @param mixed $row
     *
     * @return array
     */
    public function map($row): array
    {
        return [
            $row->receipt_no,
            $row->current_session->name,
            $row->class_grade->long_name,
            $row->pay_date,
            $row->bank->name,
            $row->ref_no,
            $row->paid
        ];
    }
}
