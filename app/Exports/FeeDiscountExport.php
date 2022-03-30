<?php

namespace App\Exports;

use App\CurrentSession;
use App\FeeDiscount;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class FeeDiscountExport implements FromCollection, WithHeadings, WithMapping
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
            return FeeDiscount::where('current_session_id', $current_session->id)->orderBy('amount', 'desc')->get();
        }
        else
        {
            return FeeDiscount::where('current_session_id', $current_session->id)->where('class_grade_id', $this->class)->orderBy('amount', 'desc')->get();
        }
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'ADMISSION NO', 'STUDENT NAME', 'GENDER', 'CLASS/GRADE', 'CONTACT', 'EMAIL ADDRESS', 'DISCOUNT NAME', 'DISCOUNT'
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
            $row->student->admno,
            $row->student->name,
            $row->student->gender,
            $row->class_grade->long_name,
            $row->student->parent_detail->primary_contact,
            $row->student->parent_detail->primary_email,
            $row->name,
            $row->amount,
        ];
    }
}
