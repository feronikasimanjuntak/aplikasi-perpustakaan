<?php
 
namespace App\Exports;

use App\Models\Book;
use App\Models\Borrow;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Contracts\View\View;
 
class ExcelBookExport implements FromView,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function view():View
    {
        $data = Book::get();
        return view('pages.office.book.pdf',compact('data'));
    }
    public function headings(): array
    {
        return ["Nama Buku", "Nama Peminjam","Tanggal Peminjaman","Tanggal Pengembalian","Status Peminjaman"];
    }
}