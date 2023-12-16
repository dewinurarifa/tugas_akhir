<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreKontrakRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'id_karyawan' => ['required', 'exists:karyawans,id'],
            'awal_kontrak' => ['required', 'date'],
            'akhir_kontrak' => ['required', 'date'],
            'total_jam_kerja' => ['required', 'numeric'],
            'gaji_pokok' => ['required', 'numeric'],
        ];
    }
}
