<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PenggajianResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'kontrak' => new KontrakResource($this->whenLoaded('kontrak')),
            'tunjangan' => $this->tunjangan,
            'total_gaji' => $this->total_gaji,
        ];
    }
}
