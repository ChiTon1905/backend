<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use App\Http\Resources\UsersResource;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Log;

class GoogleController extends Controller
{

    public function saveUser(Request $request)
    {

        // Check if the user already exists in the database
        $user = User::where('email', $request->input('email'))->first();

        if ($user) {
            if ($user->is_locked == true) {
                Auth::logout(); // Logout the user
                return response()->json(['message' => 'User is locked'], 403);
            }
            // If the user exists, you can update their information if needed
            $user->update([
                'name' => $request->input('name'),
                'google_id' => $request->input('sub'),
            ]);
        } else {
            // If the user does not exist, create a new user
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'google_id' => $request->input('sub'),
                'password' => Hash::make('user123')
            ]);
        }

        $user->assignRole('user');

        // Assuming you want to authenticate the user after saving the information
        Auth::login($user);

        $token = $user->createToken('AppName')->accessToken;

        return [
            'user' => $user,
            'token' => $user->createToken('Api token of' . $user->name)->plainTextToken,
        ];
    }
}
