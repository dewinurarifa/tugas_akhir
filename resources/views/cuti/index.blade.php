@extends('layouts.dashboard')

@section('dashboard-content')
<div class="d-flex gap-3 align-items-center my-3">
    <h5>Data Cuti</h5>
    <a href="{{route('cuti.create')}}" class="btn btn-success">Tambah</a>
</div>
<table class="table">
    <thead>
        <tr>
            <th>Nama</th>
            <th>Saldo Cuti</th>
            <th>Jatah Cuti</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($cutis as $cuti)
            <tr>
                <td>{{$cuti->karyawan->nama}}</td>
                <td>{{$cuti->saldo_cuti}}</td>
                <td>{{$cuti->jatah_cuti}}</td>
                <td>
                    <div class="d-flex gap-2">
                        <a href="{{route('cuti.edit', [$cuti])}}" class="btn btn-primary">Edit</a>
                        <form action="{{route('cuti.destroy', [$cuti])}}" method="post">
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