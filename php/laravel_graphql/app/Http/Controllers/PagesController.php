<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\User;

class PagesController extends Controller
{
  public function welcome() {
    // Demo token generation, for real app you would use some
    // kind of authentication
    $user = User::first();
    $token = JWTAuth::fromUser($user);
    return view('pages.welcome', ['token' => $token]);
  }
}
