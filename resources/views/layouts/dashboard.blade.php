@extends('layouts.master')
@section('master-content')
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <div class="a navbar-brand">Dashboard</div>
    </div>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a href="#" class="nav-link active">Home</a>
            </li>
            <li class="nav-item">
                <a href="/karyawan" class="nav-link">Karyawan</a>
            </li>
            <li class="nav-item">
                <a href="/cuti" class="nav-link">Cuti</a>
            </li>
            <li class="nav-item">
                <a href="/kontrak" class="nav-link">Kontrak</a>
            </li>
            <li class="nav-item">
                <a href="/penggajian" class="nav-link">Penggajian</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    @yield('dashboard-content')
 </div>
@endsection
