<?php

namespace App\Exports;

use App\ClassGrade;
use App\Student;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class FeeSummary implements FromCollection, WithHeadings, WithMapping
{
    private $class;

    public function __construct(int $class)
    {
        $this->class = $class;
    }

    /**
     * @return Collection
     */
    public function collection()
    {
        if($this->class === 100)
        {
            return Student::Active()->orderBy('admno', 'desc')->get();
        }
        else
        {
            return Student::Active()->where('class_grade_id', $this->class)->orderBy('admno', 'desc')->get();
        }
    }

    /**
     * @param mixed $row
     *
     * @return array
     */
    public function map($row): array
    {
        if($row->balance >= 0) {
            $balance = $row->balance;
            $overpay = 0;
        } else {
            $balance = 0;
            $overpay = $row->balance;
        }
        return [
            $row->current_session->name,
            $row->admno,
            $row->name,
            $row->class_grade->name,
            $row->expected,
            $row->paid,
            $balance,
            $overpay
        ];
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'TERM/YEAR', 'ADMISSION NO', 'NAME', 'CLASS/GRADE', 'EXPECTED', 'AMOUNT PAID', 'BALANCE', 'OVERPAY'
        ];
    }
}
