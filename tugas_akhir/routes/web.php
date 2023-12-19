<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KaryawanController;
use App\Http\Controllers\CutiController;
use App\Http\Controllers\KontrakController;
use App\Http\Controllers\PenggajianController;
use App\Http\Controllers\PresensiController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('/karyawan', KaryawanController::class);
Route::resource('/cuti', CutiController::class);
Route::resource('/kontrak', KontrakController::class);
Route::resource('/penggajian', PenggajianController::class);
Route::resource('/presensi', PresensiController::class);
