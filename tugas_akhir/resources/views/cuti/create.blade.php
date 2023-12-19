@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3">
    <h5>Tambah Cuti</h5>
</div>
<form action="{{route('cuti.store')}}" method="post">
    @csrf
    <div class="mb-3">
        <label for="jatah_cuti" class="form-label">Jatah Cuti</label>
        <input id="jatah_cuti" name="jatah_cuti" type="number" class="form-control" value="{{old('jatah_cuti')}}" required>
    </div>
    <div class="mb-3">
        <label for="saldo_cuti" class="form-label">Saldo Cuti</label>
        <input id="saldo_cuti" name="saldo_cuti" type="number" class="form-control" value="{{old('saldo_cuti')}}" required>
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
