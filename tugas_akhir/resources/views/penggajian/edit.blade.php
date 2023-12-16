@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3">
    <h5>Edit Penggajian</h5>
</div>
<form action="{{route('penggajian.update', [$penggajian])}}" method="post">
    @csrf
    @method('put')
    <div class="mb-3">
        <label for="id_kontrak" class="form-label">Kontrak</label>
        <select name="id_kontrak" id="id_kontrak" class="form-select">
            @foreach($kontraks as $kontrak)
                <option value="{{$kontrak->id}}" {{$kontrak->id === $penggajian->kontrak->id ? 'selected' : '' }}>Kontrak: An.{{$kontrak->karyawan->nama}}</option>
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label for="tunjangan" class="form-label">Tunjangan</label>
        <input id="tunjangan" name="tunjangan" type="number" class="form-control" value="{{$penggajian->tunjangan}}" required>
    </div>
    <div class="mb-3">
        <label for="total_gaji" class="form-label">Total Gaji</label>
        <input id="total_gaji" name="total_gaji" type="number" class="form-control" value="{{$penggajian->total_gaji}}" required>
    </div>

    <button type="submit" class="btn btn-primary">Ubah</button>
</form>
@endsection