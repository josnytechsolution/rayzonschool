<?php

namespace App\Exports;

use App\ClassGrade;
use App\CurrentSession;
use App\FeePayment;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class FeePaymentExport implements FromCollection, WithHeadings, WithMapping
{
    private $class;

    public function __construct(int $class)
    {
        $this->class = $class;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $current_session = CurrentSession::Current()->first();
        if($this->class === 100)
        {
            return FeePayment::where('current_session_id', $current_session->id)->orderBy('receipt_no', 'desc')->get();
        }
        else
        {
            return FeePayment::where('current_session_id', $current_session->id)->where('class_grade_id', $this->class)->orderBy('receipt_no', 'desc')->get();
        }
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
            $row->student->name,
            $row->class_grade->name,
            $row->arrears,
            $row->fees,
            $row->paid,
            $row->pay_date,
            $row->slip_date,
            $row->bank->long_name,
            $row->ref_no,
            $row->teller->name,
        ];
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'RECIEPT NO', 'STUDENT NAME', 'CLASS/GRADE', 'ARREARS', 'FEES', 'TOTAL', 'PAY DATE', 'SLIP DATE', 'BANK DATE', 'REFERENCE NO', 'RECEIVED BY'
        ];
    }
}
