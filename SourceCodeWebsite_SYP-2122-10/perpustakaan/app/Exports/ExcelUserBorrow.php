<?php
 
namespace App\Exports;

use App\Models\Borrow;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Contracts\View\View;
 
class ExcelUserBorrow implements FromView,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function view():View
    {
        $data = Borrow::select('peminjaman.*','detail_peminjaman.*','buku.*','users.*')->join('users','peminjaman.created_by','=','users.id')
        ->join('detail_peminjaman','peminjaman.id','=','detail_peminjaman.id_peminjaman')
        ->join('buku','buku.id','=','detail_peminjaman.id_buku')
        ->where('users.role','=','member')
        ->orderBy('peminjaman.created_at','DESC')->get();
        return view('pages.office.borrow.pdf',compact('data'));
    }
    public function headings(): array
    {
        return ["Nama Buku", "Nama Peminjam","Tanggal Peminjaman","Tanggal Pengembalian","Status Peminjaman"];
    }
}