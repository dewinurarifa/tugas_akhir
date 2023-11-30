<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Penggajian>
 */
class PenggajianFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'id_kontrak' => fake()->randomElement([1,2,3]),
            'tunjangan' => fake()->randomNumber(),
            'total_gaji' => fake()->randomNumber()
        ];
    }
}
