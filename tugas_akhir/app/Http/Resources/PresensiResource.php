<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PresensiResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'id_karyawan' => $this->id_karyawan,
            'tanggal' => $this->tanggal,
            'keterangan' => $this->keterangan,
            'karyawan' => new KaryawanResource($this->whenLoaded('karyawan'))
        ];
    }
}
