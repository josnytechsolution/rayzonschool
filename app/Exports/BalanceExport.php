<?php

namespace App\Exports;

use App\ClassGrade;
use App\CurrentSession;
use App\Student;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class BalanceExport implements FromCollection, WithHeadings, WithMapping
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
        if($this->class === 100)
        {
            return Student::Active()->Balance()->orderBy('balance', 'desc')->get();
        }
        else
        {
            return Student::Active()->Balance()->where('class_grade_id', $this->class)->orderBy('balance', 'desc')->get();
        }
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'ADMISSION NO', 'NAME', 'GENDER', 'CLASS/GRADE', 'CONTACT', 'EMAIL ADDRESS', 'BALANCE B/F', 'CURRENT BAL', 'TOTAL BALANCE'
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
            $row->admno,
            $row->name,
            $row->gender,
            $row->class_grade->name,
            $row->parent_detail->primary_contact,
            $row->parent_detail->primary_email,
            $row->arrears,
            $row->current,
            $row->balance,
        ];
    }
}
