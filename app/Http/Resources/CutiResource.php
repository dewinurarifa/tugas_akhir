<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CutiResource extends JsonResource
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
          'jatah_cuti' => $this->jatah_cuti,
          'saldo_cuti' => $this->saldo_cuti,
          'tahun' => $this->tahun,
          'karyawan' => new KaryawanResource($this->whenLoaded('karyawan')),
        ];
    }
}
