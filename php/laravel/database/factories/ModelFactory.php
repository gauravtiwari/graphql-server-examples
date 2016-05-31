<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(App\User::class, function (Faker\Generator $faker) {
  return [
    'name' => $faker->name,
    'first_name' => $faker->firstName,
    'last_name' => $faker->lastName,
    'username' => $faker->username,
    'email' => $faker->safeEmail,
    'password' => bcrypt(str_random(10)),
    'remember_token' => str_random(10),
  ];
});


$factory->define(App\Post::class, function (Faker\Generator $faker) {
  return [
    'title' => $faker->sentence,
    'body' => $faker->paragraph,
    'user_id' => function () {
      return App\User::all()->random()->id;
    },
  ];
});


$factory->define(App\Comment::class, function (Faker\Generator $faker) {
  return [
    'body' => $faker->paragraph,
    'user_id' => function () {
      return App\User::all()->random()->id;
    },
    'post_id' => function () {
      return App\Post::all()->random()->id;
    },
  ];
});
