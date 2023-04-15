<?php

namespace App\Http\Controllers\office;

use App\Http\Controllers\Controller;
use App\Models\Borrow;
use App\Models\BorrowDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Exports\ExcelUserBorrow;
use Maatwebsite\Excel\Facades\Excel;
use PDF;

class UserBorrowController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax() ){
            $collection = Borrow::select('peminjaman.*')->join('users','peminjaman.created_by','=','users.id')
            ->where('users.role','=','member')
            ->orderBy('peminjaman.created_at','DESC')
            ->paginate(5);
            return view('pages.office.userBorrow.list',compact('collection'));
        }
        return view('pages.office.userBorrow.main');
    }

    public function confirm(Borrow $borrow)
    {
        BorrowDetail::where('id_peminjaman',$borrow->id)->update(['st'=>'dikonfirmasi peminjaman']);
        $borrow->st = 'dikonfirmasi peminjaman';
        $borrow->update();
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Dikonfirmasi',
        ]);
    }

    public function borrowed(Borrow $borrow)
    {
        BorrowDetail::where('id_peminjaman',$borrow->id)->update(['st'=>'dipinjam']);
        $borrow->st = 'dipinjam';
        $borrow->update();
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Dikonfirmasi',
        ]);
    }

    public function acc(Borrow $borrow)
    {
        BorrowDetail::where('id_peminjaman',$borrow->id)->update(['st'=>'sudah diperpanjang']);
        $borrow->st = 'sudah diperpanjang';
        $borrow->update();
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Dikonfirmasi',
        ]);
    }

    public function return(Borrow $borrow)
    {
        BorrowDetail::where('id_peminjaman',$borrow->id)->update(['st'=>'dikembalikan']);
        $borrow->st = 'dikembalikan';
        $borrow->update();
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Dikonfirmasi',
        ]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function edit(Borrow $borrow)
    {
        //
    }

    public function update(Request $request, Borrow $borrow)
    {
        //
    }

    public function destroy(Borrow $borrow)
    {
        //
    }

    public static function pdfDownload(){
        $data = Borrow::select('peminjaman.*','detail_peminjaman.*','buku.*','users.*')
        ->join('users','peminjaman.created_by','=','users.id')
        ->join('detail_peminjaman','peminjaman.id','=','detail_peminjaman.id_peminjaman')
        ->join('buku','buku.id','=','detail_peminjaman.id_buku')
        ->where('users.role','=','member')
        ->orderBy('peminjaman.created_at','DESC')->get();
        $pdf = PDF::loadView('pages.office.userBorrow.pdf',compact('data'));
        return $pdf->download('Data Peminjaman Buku.pdf');
    }

    public static function excelDownload(){
        return Excel::download(new ExcelUserBorrow, 'Data Peminjaman Buku.csv',null,["ID","Judul"]);
    }
}
