<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Cuti;

class Karyawan extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama',
        'tempat_lahir',
        'tanggal_lahir',
        'alamat',
        'jabatan'
    ];

    public function cutis() {
        return $this->hasMany(Cuti::class, 'id_karyawan');
    }
}
