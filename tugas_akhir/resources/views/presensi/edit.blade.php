@extends('layouts.dashboard')

@section('dashboard-content')
    <div class="d-flex gap-3">
        <h5>Edit Presensi</h5>
    </div>
    <form action="{{ route('presensi.update', [$presensi]) }}" method="post">
        @csrf
        @method('put')
        {{-- <div class="mb-3">
            <label for="jatah_cuti" class="form-label">Jatah Cuti</label>
            <input id="jatah_cuti" name="jatah_cuti" type="number" class="form-control" value="{{ $cuti->jatah_cuti }}"
                required>
        </div>
        <div class="mb-3">
            <label for="saldo_cuti" class="form-label">Saldo Cuti</label>
            <input id="saldo_cuti" name="saldo_cuti" type="number" class="form-control" value="{{ $cuti->saldo_cuti }}"
                required>
        </div>
        <div class="mb-3">
            <label for="id_karyawan" class="form-label">Karyawan</label>
            <select name="id_karyawan" id="id_karyawan" class="form-select">
                @foreach ($karyawans as $karyawan)
                    <option value="{{ $karyawan->id }}" {{ $karyawan->id === $cuti->karyawan->id ? 'selected' : '' }}>
                        {{ $karyawan->nama }}</option>
                @endforeach
            </select>
        </div> --}}

        <div class="mb-3">
            <label for="id_karyawan" class="form-label">Karyawan</label>
            <select name="id_karyawan" id="id_karyawan" class="form-select">
                @foreach ($karyawans as $karyawan)
                    <option value="{{ $karyawan->id }}" {{ $karyawan->id === $presensi->karyawan->id ? 'selected' : '' }}>
                        {{ $karyawan->nama }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="tanggal" class="form-label">Tanggal</label>
            <input type="date" name="tanggal" id="tanggal" class="form-control" value="{{ $presensi->tanggal }}">
        </div>
        <div class="mb-3">
            <label for="keterangan" class="form-label">Keterangan</label>
            <select name="keterangan" id="keterangan" class="form-select">
                <option value="Hadir" {{ $presensi->keterangan === 'Hadir' ? 'selected' : '' }}>Hadir</option>
                <option value="Izin" {{ $presensi->keterangan === 'Izin' ? 'selected' : '' }}>Izin</option>
                <option value="Sakit" {{ $presensi->keterangan === 'Sakit' ? 'selected' : '' }}>Sakit</option>
                <option value="Alpa" {{ $presensi->keterangan === 'Alpa' ? 'selected' : '' }}>Alpa</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Ubah</button>
    </form>
@endsection
