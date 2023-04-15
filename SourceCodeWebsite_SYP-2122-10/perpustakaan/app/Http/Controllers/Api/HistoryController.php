<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\HistoryResource;
use App\Models\Borrow;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function __construct()
    { 
        $this->middleware('auth:api');
    }

    public function index()
    {
        return HistoryResource::collection(
            Borrow::where('id_user', auth()->user()->id)->orderByDesc('created_at')->with('detail')->paginate(5)
        );
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Borrow $borrow)
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
}
