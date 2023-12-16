<?php

namespace App\Http\Controllers;

use App\Models\Penggajian;
use App\Models\Kontrak;
use App\Http\Requests\StorePenggajianRequest;
use App\Http\Requests\UpdatePenggajianRequest;
use App\Http\Resources\PenggajianResource;
use App\Http\Resources\KontrakResource;

class PenggajianController extends Controller
{
     /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('penggajian.index', [
            'penggajians'=> PenggajianResource::collection(Penggajian::with(['kontrak' => ['karyawan']])->latest()->get())
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('penggajian.create', [
            'kontraks' => KontrakResource::collection(Kontrak::latest()->get())
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePenggajianRequest $request)
    {
        Penggajian::create($request->validated());
        return redirect()->route('penggajian.index')->with('success', "Penggajian berhasil ditambah");;
    }

    /**
     * Display the specified resource.
     */
    public function show(Penggajian $penggajian)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Penggajian $penggajian)
    {
        return view('penggajian.edit', [
            'penggajian' => new PenggajianResource($penggajian),
            'kontraks' => KontrakResource::collection(Kontrak::all())
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePenggajianRequest $request, Penggajian $penggajian)
    {
        $updated_penggajian = new PenggajianResource(tap($penggajian)->update($request->validated()));
        $nama_karyawan = $updated_penggajian->kontrak->karyawan->nama;
        return redirect()->route('penggajian.index')->with('success', "Penggajian karyawan $nama_karyawan berhasil diubah");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Penggajian $penggajian)
    {
        $penggajian->delete();
        return redirect()->route('penggajian.index')->with('success', "Penggajian berhasil dihapus");;
    }
}
