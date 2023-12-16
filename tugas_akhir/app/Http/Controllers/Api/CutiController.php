<?php

namespace App\Http\Controllers\Api;

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
        return CutiResource::collection(Cuti::with(['karyawan'])->latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCutiRequest $request)
    {
        return new CutiResource(Cuti::create($request->validated())->load('karyawan'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Cuti $cuti)
    {
        return new CutiResource($cuti);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCutiRequest $request, Cuti $cuti)
    {
        return new CutiResource(tap($cuti)->update($request->validated())->load('karyawan'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cuti $cuti)
    {
        $cuti->delete();
        return response()->noContent();
    }
}
