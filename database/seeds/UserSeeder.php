<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('professions')->insert([
            'name' => 'Rober',
	        'email' => 'sehuanez@gmail.com',
	        'email_verified_at' => now(),
	        'password' => '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
	        'type' => 'invitado',
	        'status' => 'activo',
	        'remember_token' => str_random(10),
        ]);
    }
}
