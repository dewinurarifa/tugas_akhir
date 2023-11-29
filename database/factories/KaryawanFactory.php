<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Karyawan>
 */
class KaryawanFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
        'nama' => fake()->name(),
        'tempat_lahir' => fake()->state(),
        'tanggal_lahir' => fake()->date(),
        'alamat' => fake()->address(),
        'jabatan' => fake()->randomElement(['Direktur', 'Manager', 'Administrasi']),
        ];
    }
}
