<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Karyawan;

class Cuti extends Model
{
    use HasFactory;

    protected $fillable = [
        'jatah_cuti',
        'saldo_cuti',
        'id_karyawan',
    ];

    public function karyawan() {
        return $this->hasOne(Karyawan::class,'id', 'id_karyawan');
    }
}
