<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BorrowDetailResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'buku_id' => $this->id_buku,
            'gambar' => asset('storage/' . $this->books->foto),
            'judul_buku' => $this->books->judul,
            'tanggal_peminjaman' => $this->tanggal_pinjam,
            'denda' => $this->denda,
            'status' => $this->st,
            'tanggal_pengembalian' => $this->tanggal_pengembalian,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
