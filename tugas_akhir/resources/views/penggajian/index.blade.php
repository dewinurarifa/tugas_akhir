@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3 align-items-center my-3">
    <h5>Data Penggajian</h5>
    <a href="{{route('penggajian.create')}}" class="btn btn-success">Tambah</a>
</div>
<table class="table">
    <thead>
        <tr>
            <th>Nama Karyawan</th>
            <th>Akhir Kontrak</th>
            <th>Total Jam Kerja</th>
            <th>Gaji Pokok</th>
            <th>Tunjangan</th>
            <th>Total Gaji</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($penggajians as $penggajian)
            <tr>
                <td>{{$penggajian->kontrak->karyawan->nama}}</td>
                <td>{{$penggajian->kontrak->akhir_kontrak}}</td>
                <td>{{$penggajian->kontrak->total_jam_kerja}}</td>
                <td>{{$penggajian->kontrak->gaji_pokok}}</td>
                <td>{{$penggajian->tunjangan}}</td>
                <td>{{$penggajian->total_gaji}}</td>
                <td>
                    <div class="d-flex gap-2">
                        <a href="{{route('penggajian.edit', [$penggajian])}}" class="btn btn-primary">Edit</a>
                        <form action="{{route('penggajian.destroy', [$penggajian])}}" method="post">
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