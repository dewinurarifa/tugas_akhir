<?php

namespace App\Http\Controllers\Api;

use App\Models\Kontrak;
use App\Http\Requests\StoreKontrakRequest;
use App\Http\Requests\UpdateKontrakRequest;
use App\Http\Resources\KontrakResource;

class KontrakController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return KontrakResource::collection(Kontrak::with(['karyawan'])->latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreKontrakRequest $request)
    {
        return Kontrak::create($request->validated());
    }

    /**
     * Display the specified resource.
     */
    public function show(Kontrak $kontrak)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateKontrakRequest $request, Kontrak $kontrak)
    {
        return new KontrakResource(tap($kontrak)->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Kontrak $kontrak)
    {
        $kontrak->delete();
        return response()->noContent();
    }
}
