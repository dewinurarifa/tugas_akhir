<?php

namespace App\Http\Controllers;

use App\Models\Cuti;
use App\Models\Karyawan;
use App\Http\Requests\StoreCutiRequest;
use App\Http\Requests\UpdateCutiRequest;
use App\Http\Resources\CutiResource;
use App\Http\Resources\KaryawanResource;

class CutiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('cuti.index', [
            'cutis'=> CutiResource::collection(Cuti::with(['karyawan'])->latest()->get())
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('cuti.create', [
            'karyawans' => KaryawanResource::collection(Karyawan::latest()->get())
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCutiRequest $request)
    {
        Cuti::create($request->validated());
        return redirect()->route('cuti.index')->with('success', "Cuti berhasil ditambah");;
    }

    /**
     * Display the specified resource.
     */
    public function show(Cuti $cuti)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Cuti $cuti)
    {
        return view('cuti.edit', [
            'cuti' => new CutiResource($cuti),
            'karyawans' => KaryawanResource::collection(Karyawan::all())
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCutiRequest $request, Cuti $cuti)
    {
        $updated_cuti = new CutiResource(tap($cuti)->update($request->validated()));
        $nama_karyawan = $updated_cuti->karyawan->nama;
        return redirect()->route('cuti.index')->with('success', "Cuti karyawan $nama_karyawan berhasil diubah");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cuti $cuti)
    {
        $cuti->delete();
        return redirect()->route('cuti.index')->with('success', "Cuti berhasil dihapus");;
    }
}
