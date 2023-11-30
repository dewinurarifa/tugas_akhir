<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penggajian extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_kontrak',
        'tunjangan',
        'total_gaji',
    ];

    public function kontrak() {
        return $this->hasOne(Kontrak::class,'id', 'id_kontrak');
    }
}
