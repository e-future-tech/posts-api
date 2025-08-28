<?php

namespace Database\Seeders;

use App\Models\Post;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Category;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{

    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        $user = User::take(5)->get();
        $categories = Category::take(6)->get();

        $user->each(function ($user) use ($categories) {
            // Buat 3 postingan untuk masing-masing user
            Post::factory(6)->create([
                'user_id' => $user->id,
                'category_id' => $categories->random()->id,
            ]);
        });
    }
}
