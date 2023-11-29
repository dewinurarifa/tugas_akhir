@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3">
    <h5>Edit Karyawan</h5>
</div>
<form action="{{route('cuti.update', [$cuti])}}" method="post">
    @csrf
    @method('put')
    <div class="mb-3">
        <label for="jatah_cuti" class="form-label">Jatah Cuti</label>
        <input id="jatah_cuti" name="jatah_cuti" type="number" class="form-control" value="{{$cuti->jatah_cuti}}" required>
    </div>
    <div class="mb-3">
        <label for="saldo_cuti" class="form-label">Saldo Cuti</label>
        <input id="saldo_cuti" name="saldo_cuti" type="number" class="form-control" value="{{$cuti->saldo_cuti}}" required>
    </div>
    <div class="mb-3">
        <label for="id_karyawan" class="form-label">Karyawan</label>
        <select name="id_karyawan" id="id_karyawan" class="form-select">
            @foreach($karyawans as $karyawan)
                <option value="{{$karyawan->id}}" {{$karyawan->id === $cuti->karyawan->id ? 'selected' : '' }}>{{$karyawan->nama}}</option>
            @endforeach
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Ubah</button>
</form>
@endsection