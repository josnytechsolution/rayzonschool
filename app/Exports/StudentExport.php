<?php

namespace App\Exports;

use App\ClassGrade;
use App\Student;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class StudentExport implements FromCollection, WithHeadings, WithMapping
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
            return Student::Active()->orderBy('admno', 'desc')->get();
        }
        elseif ($this->class === 101)
        {
            return Student::Active()->Male()->orderBy('admno', 'desc')->get();
        }
        elseif ($this->class === 102)
        {
            return Student::Active()->Female()->orderBy('admno', 'desc')->get();
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
        return [
            $row->admno,
            $row->name,
            $row->gender,
            $row->class_grade->name,
            $row->parent_detail->primary_contact,
            $row->parent_detail->primary_email,
            $row->birth_cert,
            $row->nemis_upi,
            $row->doa,
            $row->doa,
            $row->residence,
            $row->discount_level->name,
        ];
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'ADMISSION NO', 'NAME', 'GENDER', 'CLASS/GRADE', 'CONTACT', 'EMAIL ADDRESS', 'BC NO', 'NEMIS UPI', 'DATE OF ADMISSION', 'DATE OF BIRTH', 'RESIDENCE', 'DISCOUNT LEVEL'
        ];
    }
}
