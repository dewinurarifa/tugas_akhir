<?php

namespace App\Http\Controllers;

use App\Models\Presensi;
use App\Http\Requests\StorePresensiRequest;
use App\Http\Requests\UpdatePresensiRequest;
use App\Http\Resources\KaryawanResource;
use App\Http\Resources\PresensiResource;
use App\Models\Karyawan;

class PresensiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('presensi.index', [
            'presensis' => PresensiResource::collection(Presensi::with(['karyawan'])->latest()->get())
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('presensi.create', [
            'karyawans' => KaryawanResource::collection(Karyawan::latest()->get())
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePresensiRequest $request)
    {
        Presensi::create($request->validated());
        return redirect()->route('presensi.index')->with('success', "Presensi berhasil ditambah");;
    }

    /**
     * Display the specified resource.
     */
    public function show(Presensi $presensi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Presensi $presensi)
    {
        return view('presensi.edit', [
            'presensi' => new PresensiResource($presensi),
            'karyawans' => KaryawanResource::collection(Karyawan::all())
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePresensiRequest $request, Presensi $presensi)
    {
        $updated_presensi = new PresensiResource(tap($presensi)->update($request->validated()));
        $nama_karyawan = $updated_presensi->karyawan->nama;
        return redirect()->route('presensi.index')->with('success', "Presensi karyawan $nama_karyawan berhasil diubah");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Presensi $presensi)
    {
        $presensi->delete();
        return redirect()->route('presensi.index')->with('success', "Presensi berhasil dihapus");;
    }
}
