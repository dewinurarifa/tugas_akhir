<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cuti>
 */
class CutiFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'jatah_cuti' => fake()->randomElement([1,2,3,4,5]),
            'saldo_cuti' => fake()->randomFloat(), 
            'id_karyawan' => fake()->randomElement([1,2,3,4,5]),
        ];
    }
}
