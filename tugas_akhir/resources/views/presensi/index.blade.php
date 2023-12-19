@extends('layouts.dashboard')

@section('dashboard-content')
    <div class="d-flex gap-3 align-items-center my-3">
        <h5>Data Presensi</h5>
        <a href="{{ route('presensi.create') }}" class="btn btn-success">Tambah</a>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>Nama</th>
                <th>Tanggal</th>
                <th>Keterangan</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @foreach ($presensis as $presensi)
                <tr>
                    <td>{{ $presensi->karyawan->nama }}</td>
                    <td>{{ $presensi->tanggal }}</td>
                    <td>{{ $presensi->keterangan }}</td>
                    <td>
                        <div class="d-flex gap-2">
                            <a href="{{ route('presensi.edit', [$presensi]) }}" class="btn btn-primary">Edit</a>
                            <form action="{{ route('presensi.destroy', [$presensi]) }}" method="post">
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
