<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class UserSeeder extends Seeder
{
        public function run()
        {

                $faker = \Faker\Factory::create();

                for ($i=0; $i < 500; $i++) { 
                    $data = [
                            'username' => $faker->username,
                            'password'    => $faker->password,
                            'salt'      => $faker->password,
                            'avatar'    => null,
                            'role'      => 1,
                            'created_by'   => 0,
                            'created_date'  => date("Y-m-d H:i:s"),
                    ];

                    echo("Insert user ".($i+1));
    
                    // Using Query Builder
                    $this->db->table('user')->insert($data);
                }
        }
}