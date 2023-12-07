@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3">
    <h5>Edit Karyawan</h5>
</div>
<form action="{{route('karyawan.update', [$karyawan])}}" method="post">
    @csrf
    @method('put')
    <div class="mb-3">
        <label for="nama" class="form-label">Nama</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $karyawan->nama }}" required>
    </div>
    <div class="mb-3">
        <label for="tempat_lahir" class="form-label">Tempat Lahir</label>
        <input id="tempat_lahir" name="tempat_lahir" type="text" class="form-control" value="{{ $karyawan->tempat_lahir }}" required>
    </div>
    <div class="mb-3">
        <label for="tanggal_lahir" class="form-label">Tanggal Lahir</label>
        <input id="tanggal_lahir" name="tanggal_lahir" type="date" class="form-control" value="{{ $karyawan->tanggal_lahir }}" required>
    </div>
    <div class="mb-3">
        <label for="alamat" class="form-label">Alamat</label>
        <input id="alamat" name="alamat" type="text" class="form-control" value="{{ $karyawan->alamat }}" required>
    </div>
    <div class="mb-3">
        <label for="jabatan" class="form-label">Jabatan</label>
        <input id="jabatan" name="jabatan" type="text" class="form-control" value="{{ $karyawan->jabatan }}" required>
    </div>

    <button type="submit" class="btn btn-primary">Ubah</button>
</form>
@endsection