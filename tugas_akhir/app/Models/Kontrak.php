<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Karyawan;

class Kontrak extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_karyawan',
        'awal_kontrak',
        'akhir_kontrak',
        'total_jam_kerja',
        'gaji_pokok'
    ];

    public function karyawan() {
        return $this->hasOne(Karyawan::class,'id', 'id_karyawan');
    }
}
