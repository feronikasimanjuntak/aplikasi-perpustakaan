<?php

namespace App\Http\Controllers\office;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\Borrow;
use App\Models\BorrowDetail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ExcelExport;
use PDF;

class BorrowsController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax() ){
            $keywords = $request->keywords;
            $collection = Borrow::select('peminjaman.*')->join('users','peminjaman.created_by','=','users.id')
                ->where('users.role','!=','member')
                ->join('users as tableuser','peminjaman.id_user','=','tableuser.id')
                ->where('tableuser.name','like','%'.$request->keywords.'%')
                ->orderBy('peminjaman.created_at','DESC')
                ->paginate(5);
            return view('pages.office.borrow.list',compact('collection'));
        }
        return view('pages.office.borrow.main');
    }
    
    public function create()
    {
        $books = Book::get();
        $users = User::get();
        return view('pages.office.borrow.input',compact('books','users'),['borrow' => new Borrow]);
    }
    
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'books.*' => 'required',
            'users' => 'required',
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            if ($errors->has('books.*')) {
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('books.*'),
                ]);
            }else if($errors->has('users')){
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('users'),
                ]);
            }
        }
        $borrow = new Borrow;
        $borrow->id_user = $request->users;
        $borrow->tanggal = now();
        $borrow->st = 'dipinjam';
        $borrow->created_at = now();
        $borrow->created_by = Auth::user()->id;
        $borrow->updated_at = now();
        $borrow->save();
        foreach ($request->books as $key => $value) {
            $detail = new BorrowDetail;
            $detail->id_peminjaman = $borrow->id;
            $detail->id_buku = $value;
            $detail->tanggal_pinjam = now();
            $detail->st = 'dipinjam';
            $detail->save();
        }
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Tersimpan',
        ]);
    }

    public function show(Borrow $borrow)
    {
        $detail = BorrowDetail::where('id_peminjaman',$borrow->id)->get();
        return view('pages.office.borrow.show',compact('borrow','detail'));
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

    public function edit(Borrow $borrow)
    {
        $books = Book::get();
        $users = User::get();
        return view('pages.office.borrow.input',compact('books','users','borrow'));
    }

    public function update(Request $request, $borrow)
    {
        $validator = Validator::make($request->all(), [
            'books.*' => 'required',
            'users' => 'required',
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            if ($errors->has('books.*')) {
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('books.*'),
                ]);
            }else if($errors->has('users')){
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('users'),
                ]);
            }
        }
        // $borrow->id_user = $request->users;
        // $borrow->updated_at = now();
        // $borrow->update();
        // $Access = BorrowDetail::all();
        // foreach($Access as $list)
        // {
        //   $id_buku = $request->input('id_buku',$list->id_buku);
        //   $detail = BorrowDetail::where('id_peminjaman',$borrow);
        //   $detail->id_buku = $id_buku;
        //   $detail->update(request()->except(['_token','books','users']));
        // }

        foreach ($request->books as $key => $value) {
            dd($value);
            BorrowDetail::where('id_peminjaman',$borrow)->update(['id_buku'=>$value,'tanggal_pinjam' => now()]);
        }
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Diubah',
        ]);
    }

    public function return(Borrow $borrow){
        BorrowDetail::where('id_peminjaman',$borrow->id)->update(['st'=>'dikembalikan']);
        $borrow->st = 'dikembalikan';
        $books =  BorrowDetail::where('id_peminjaman',$borrow->id)->get();
        foreach ($books as $key => $value) {
            $value->tanggal_pengembalian = now();
            $value->update();
        }
        /* if($borrow->tanggal_pengembalian > ){
                $borrow->denda = 5000;
        }
        */
        $borrow->update();
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman berhasil dikembalikan',
        ]);
    }

    public function destroy(Borrow $borrow)
    {
        $borrow->delete();
        return response()->json([
            'alert' => 'success',
            'message' => 'Peminjaman Dihapus',
        ]);
    }

    public static function pdfDownload(){
        $data = Borrow::select('peminjaman.*','detail_peminjaman.*','buku.*','users.*')
        ->join('users','peminjaman.created_by','=','users.id')
        ->join('detail_peminjaman','peminjaman.id','=','detail_peminjaman.id_peminjaman')
        ->join('buku','buku.id','=','detail_peminjaman.id_buku')
        ->where('users.role','!=','member')
        ->orderBy('peminjaman.created_at','DESC')->get();
        $pdf = PDF::loadView('pages.office.borrow.pdf',compact('data'));
        return $pdf->download('Data Peminjaman Buku.pdf');
    }

    public static function excelDownload(){
        return Excel::download(new ExcelExport, 'Data Peminjaman Buku.csv',null,["ID","Judul"]);
    }
}
