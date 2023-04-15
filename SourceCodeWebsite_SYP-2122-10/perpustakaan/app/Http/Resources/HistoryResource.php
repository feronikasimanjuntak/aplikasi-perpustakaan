<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class HistoryResource extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'tanggal_peminjaman' => $this->tanggal,
            'id_user' => $this->user->name,
            'status' => $this->st,
            'created_by' => $this->created_by_name->name,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'detail' =>  BorrowDetailResource::collection($this->detail),
        ];
    }
}
