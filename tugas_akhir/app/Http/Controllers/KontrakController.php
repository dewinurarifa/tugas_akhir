<?php

namespace App\Http\Controllers;

use App\Models\Kontrak;
use App\Http\Requests\StoreKontrakRequest;
use App\Http\Requests\UpdateKontrakRequest;
use App\Http\Resources\KaryawanResource;
use App\Http\Resources\KontrakResource;
use App\Models\Karyawan;

class KontrakController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('kontrak.index', [
            'kontraks' => KontrakResource::collection(Kontrak::with(['karyawan'])->latest()->get())
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('kontrak.create', [
            'karyawans' => KaryawanResource::collection(Karyawan::latest()->get())
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreKontrakRequest $request)
    {
        Kontrak::create($request->validated());
        return redirect()->route('kontrak.index')->with('success', "Kontrak berhasil ditambah");;
    }

    /**
     * Display the specified resource.
     */
    public function show(Kontrak $kontrak)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Kontrak $kontrak)
    {
        return view('kontrak.edit', [
            'kontrak' => new KontrakResource($kontrak),
            'karyawans' => KaryawanResource::collection(Karyawan::all())
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateKontrakRequest $request, Kontrak $kontrak)
    {
        $updated_kontrak = new KontrakResource(tap($kontrak)->update($request->validated()));
        $nama_karyawan = $updated_kontrak->karyawan->nama;
        return redirect()->route('kontrak.index')->with('success', "Kontrak karyawan $nama_karyawan berhasil diubah");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Kontrak $kontrak)
    {
        $kontrak->delete();
        return redirect()->route('kontrak.index')->with('success', "Kontrak berhasil dihapus");;
    }
}
