<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\GaleriResource;
use App\Models\Galeri;
use Illuminate\Http\Request;

class GaleriController extends Controller
{
    public function index()
    {
        return GaleriResource::collection(
            Galeri::paginate(5)
        );
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Galeri $gallery)
    {
        //
    }

    public function update(Request $request, Galeri $gallery)
    {
        //
    }

    public function destroy(Galeri $gallery)
    {
        //
    }
}
