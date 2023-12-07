@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3 align-items-center my-3">
    <h5>Data Kontrak</h5>
    <a href="{{route('kontrak.create')}}" class="btn btn-success">Tambah</a>
</div>
<table class="table">
    <thead>
        <tr>
            <th>Nama Karyawan</th>
            <th>Awal Kontrak</th>
            <th>Akhir Kontrak</th>
            <th>Total Jam Kerja</th>
            <th>Gaji Pokok</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($kontraks as $kontrak)
            <tr>
                <td>{{$kontrak->karyawan->nama}}</td>
                <td>{{$kontrak->awal_kontrak}}</td>
                <td>{{$kontrak->akhir_kontrak}}</td>
                <td>{{$kontrak->total_jam_kerja}}</td>
                <td>{{$kontrak->gaji_pokok}}</td>
                <td>
                    <div class="d-flex gap-2">
                        <a href="{{route('kontrak.edit', [$kontrak])}}" class="btn btn-primary">Edit</a>
                        <form action="{{route('kontrak.destroy', [$kontrak])}}" method="post">
                            @csrf
                            @method('delete')
                        <button type="submit" class="btn btn-danger">Hapus</button>
                        </form>
                    </div>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection
