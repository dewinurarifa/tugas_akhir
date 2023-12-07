@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3 align-items-center my-3">
    <h5>Data Karyawan</h5>
    <a href="{{route('karyawan.create')}}" class="btn btn-success">Tambah</a>
</div>
<table class="table">
    <thead>
        <tr>
            <th>Nama</th>
            <th>Tempat Lahir</th>
            <th>Tanggal Lahir</th>
            <th>Alamat</th>
            <th>Jabatan</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($karyawans as $karyawan)
            <tr>
                <td>{{$karyawan->nama}}</td>
                <td>{{$karyawan->tempat_lahir}}</td>
                <td>{{$karyawan->tanggal_lahir}}</td>
                <td>{{$karyawan->alamat}}</td>
                <td>{{$karyawan->jabatan}}</td>
                <td>
                    <div class="d-flex gap-2">
                        <a href="{{route('karyawan.edit', [$karyawan])}}" class="btn btn-primary">Edit</a>
                        <form action="{{route('karyawan.destroy', [$karyawan])}}" method="post">
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