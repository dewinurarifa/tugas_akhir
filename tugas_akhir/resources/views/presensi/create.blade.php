@extends('layouts.dashboard')

@section('dashboard-content')
    <div class="d-flex gap-3">
        <h5>Tambah Presensi</h5>
    </div>
    <form action="{{ route('presensi.store') }}" method="post">
        @csrf
        <div class="mb-3">
            <label for="id_karyawan" class="form-label">Karyawan</label>
            <select name="id_karyawan" id="id_karyawan" class="form-select">
                @foreach ($karyawans as $karyawan)
                    <option value="{{ $karyawan->id }}">{{ $karyawan->nama }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="tanggal" class="form-label">Tanggal</label>
            <input type="date" name="tanggal" id="tanggal" class="form-control">
        </div>
        <div class="mb-3">
            <label for="keterangan" class="form-label">Keterangan</label>
            <select name="keterangan" id="keterangan" class="form-select">
                <option value="Hadir">Hadir</option>
                <option value="Izin">Izin</option>
                <option value="Sakit">Sakit</option>
                <option value="Alpa">Alpa</option>
            </select>
        </div>

        <button type="submit" class="btn btn-success">Tambah</button>
    </form>
@endsection
