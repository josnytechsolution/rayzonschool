<?php

namespace App\Exports;

use App\CurrentSession;
use App\ParentDetail;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class ParentDetailExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ParentDetail::Active()->where('id', '>', 1)->orderBy('parent_no', 'asc')->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'PARENT NO', 'FATHER NAME', 'FATHER CONTACT', 'FATHER EMAIL', 'FATHER OCCUPATION', 'FATHER NAME', 'FATHER CONTACT', 'FATHER EMAIL', 'FATHER OCCUPATION', 'MOTHER NAME', 'MOTHER CONTACT', 'MOTHER EMAIL', 'MOTHER OCCUPATION', 'GUARDIAN NAME', 'GUARDIAN CONTACT', 'GUARDIAN EMAIL', 'GUARDIAN RELATION', 'STUDENTS'
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
            $row->parent_no,
            $row->fname,
            $row->fcontact,
            $row->femail,
            $row->foccupation,
            $row->mname,
            $row->mcontact,
            $row->memail,
            $row->moccupation,
            $row->gname,
            $row->gcontact,
            $row->gemail,
            $row->grelation,
            $row->students->count(),
        ];
    }
}
