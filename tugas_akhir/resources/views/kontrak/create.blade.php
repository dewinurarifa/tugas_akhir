@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3">
    <h5>Tambah Kontrak</h5>
</div>
<form action="{{route('kontrak.store')}}" method="post">
    @csrf

    <div class="mb-3">
        <label for="awal_kontrak" class="form-label">Awal Kontrak</label>
        <input type="date" name="awal_kontrak" id="awal_kontrak" class="form-control" value="{{old('awal_kontrak')}}">
    </div>

    <div class="mb-3">
        <label for="akhir_kontrak" class="form-label">Akhir Kontrak</label>
        <input type="date" name="akhir_kontrak" id="akhir_kontrak" class="form-control" value="{{old('akhir_kontrak')}}">
    </div>

    <div class="mb-3">
        <label for="total_jam_kerja" class="form-label">Total Jam Kerja</label>
        <input type="number" name="total_jam_kerja" id="total_jam_kerja" class="form-control" value="{{old('total_jam_kerja')}}">
    </div>

    <div class="mb-3">
        <label for="gaji_pokok" class="form-label">Gaji Pokok</label>
        <input type="number" name="gaji_pokok" id="gaji_pokok" class="form-control" value="{{old('gaji_pokok')}}">
    </div>

    <div class="mb-3">
        <label for="id_karyawan" class="form-label">Karyawan</label>
        <select name="id_karyawan" id="id_karyawan" class="form-select">
            @foreach($karyawans as $karyawan)
                <option value="{{$karyawan->id}}">{{$karyawan->nama}}</option>
            @endforeach
        </select>
    </div>

    <button type="submit" class="btn btn-success">Tambah</button>
</form>
@endsection
