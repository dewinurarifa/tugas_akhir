@extends('layouts.dashboard')

@section('dashboard-content')
    <div class="d-flex gap-3">
        <h5>Edit Kontrak</h5>
    </div>
    <form action="{{ route('kontrak.update', [$kontrak]) }}" method="post">
        @csrf
        @method('put')
        <div class="mb-3">
            <label for="awal_kontrak" class="form-label">Awal Kontrak</label>
            <input type="date" name="awal_kontrak" id="awal_kontrak" class="form-control"
                value="{{ $kontrak->awal_kontrak }}">
        </div>

        <div class="mb-3">
            <label for="akhir_kontrak" class="form-label">Akhir Kontrak</label>
            <input type="date" name="akhir_kontrak" id="akhir_kontrak" class="form-control"
                value="{{ $kontrak->akhir_kontrak }}">
        </div>

        <div class="mb-3">
            <label for="total_jam_kerja" class="form-label">Total Jam Kerja</label>
            <input type="number" name="total_jam_kerja" id="total_jam_kerja" class="form-control"
                value="{{ $kontrak->total_jam_kerja }}">
        </div>

        <div class="mb-3">
            <label for="gaji_pokok" class="form-label">Gaji Pokok</label>
            <input type="number" name="gaji_pokok" id="gaji_pokok" class="form-control" value="{{ $kontrak->gaji_pokok }}">
        </div>

        <div class="mb-3">
            <label for="id_karyawan" class="form-label">Karyawan</label>
            <select name="id_karyawan" id="id_karyawan" class="form-select">
                @foreach ($karyawans as $karyawan)
                    <option value="{{ $karyawan->id }}" {{ $karyawan->id === $kontrak->karyawan->id ? 'selected' : '' }}>
                        {{ $karyawan->nama }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Ubah</button>
    </form>
@endsection
