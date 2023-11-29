<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KontrakResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'awal_kontrak' => $this->awal_kontrak,
            'akhir_kontrak' => $this->akhir_kontrak,
            'total_jam_kerja' => $this->total_jam_kerja,
            'gaji_pokok' => $this->gaji_pokok,
            'karyawan' => new KaryawanResource($this->whenLoaded('karyawan')),
        ];
    }
}
