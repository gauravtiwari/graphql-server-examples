<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use JWTAuth;
use JWTFactory;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\User;

class PagesController extends Controller
{
  public function welcome() {
    $user = User::first();
    $token = JWTAuth::fromUser($user);
    return view('pages.welcome', ['token' => $token]);
  }
}
