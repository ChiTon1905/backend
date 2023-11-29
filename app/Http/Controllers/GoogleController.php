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
    public function loginWithGoogle(Request $request)
    {
        $response = Http::post('https://www.googleapis.com/oauth2/v3/tokeninfo', [
            'access_token' => $request->input('access_token'),
        ]);

        $googleUserData = $response->json();

        $user = User::where('google_id', $googleUserData['sub'])->first();

        // If the user doesn't exist, create a new user
        if (!$user) {
            $user = User::create([
                'name' => $googleUserData['name'],
                'email' => $googleUserData['email'],
                'google_id' => $googleUserData['sub'],
            ]);
        }

        // Log in the user
        Auth::login($user);

        // You may generate a Sanctum token here if needed
        $token = $user->createToken('token-google')->plainTextToken;
        return response()->json(['token' => $token, 'user' => $user]);
    }

    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        try {
            $googleUser = Socialite::driver('google')->user();
            // Check if the user exists in your database
            $user = User::where('email', $googleUser->getEmail())->first();

            if (!$user) {
                // Create a new user
                $user = User::create([
                    'name' => $googleUser->getName(),
                    'email' => $googleUser->getEmail(),
                    // Add any other fields you want to fill
                ]);
            }

            // Log in the user
            Auth::login($user);

            // Generate and return a Sanctum token
            $token = $user->createToken('google-login')->plainTextToken;
            return response()->json(['token' => $token, 'user' => $user]);
        } catch (\Exception $e) {
            // Handle exception
            return response()->json(['error' => 'Google login failed'], 500);
        }
    }

    public function saveUser(Request $request)
    {

        // Check if the user already exists in the database
        $user = User::where('email', $request->input('email'))->first();

        if ($user) {
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

        // Assuming you want to authenticate the user after saving the information
        Auth::login($user);

        $token = $user->createToken('AppName')->accessToken;

        return [
            'user' => $user,
            'token' => $user->createToken('Api token of' . $user->name)->plainTextToken,
        ];
    }
}
