@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3">
    <h5>Tambah Penggajian</h5>
</div>
<form action="{{route('penggajian.store')}}" method="post">
    @csrf
    <div class="mb-3">
        <label for="id_kontrak" class="form-label">kontrak</label>
        <select name="id_kontrak" id="id_kontrak" class="form-select">
            @foreach($kontraks as $kontrak)
                <option value="{{$kontrak->id}}">Kontrak: An.{{$kontrak->karyawan->nama}}</option>
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label for="tunjangan" class="form-label">Tunjangan</label>
        <input id="tunjangan" name="tunjangan" type="number" class="form-control" value="{{old('tunjangan')}}" required>
    </div>
    <div class="mb-3">
        <label for="total_gaji" class="form-label">Total Gaji</label>
        <input id="total_gaji" name="total_gaji" type="number" class="form-control" value="{{old('total_gaji')}}" required>
    </div>
    <button type="submit" class="btn btn-success">Tambah</button>
</form>
@endsection