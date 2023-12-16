<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Kontrak>
 */
class KontrakFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'id_karyawan' => fake()->randomElement([1,2,3,4,5]),
            'awal_kontrak' => fake()->date(),
            'akhir_kontrak' => fake()->date(),
            'total_jam_kerja' => fake()->randomNumber(),
            'gaji_pokok' => fake()->randomNumber(),
        ];
    }
}
