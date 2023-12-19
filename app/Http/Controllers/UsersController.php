<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\UsersRequest;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\UsersResource;
use Spatie\Permission\Models\Role;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return UsersResource::collection(
            User::take(100)->get()
        );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UsersRequest $request)
    {
        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
        ]);

        return response()->json(['message' => 'User created successfully']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);

        return new UsersResource($user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::find($id);

        $validatedData = $request->validate([
            'name' => 'string|max:255',
            'email' => 'email|unique:users,email,' . $user->id,
        ]);

        $user->update([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'address' => $request->input('address'),
            'phone' => $request->input('phone'),
            'genre' => $request->input('genre')
        ]);

        return response()->json(['message' => 'User updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $user->delete();

        return response()->json(['message' => 'User deleted successfully']);
    }

    public function customer()
    {
        // Get users with the 'user' role
        $users = User::whereHas('roles', function ($query) {
            $query->where('name', 'user');
        })->get();

        // Do something with the users or return as JSON
        return response()->json(['users' => $users], 200);
    }

    public function employee()
    {
        // Get users without the 'user' role
        $users = User::whereDoesntHave('roles', function ($query) {
            $query->where('name', 'user');
        })->with('roles')->get();

        // Do something with the users or return as JSON
        return response()->json(['users' => $users], 200);
    }

    public function lock($id)
    {
        $user = User::find($id);

        // Check if the user is already locked
        if ($user->is_locked == true) {
            return response()->json(['message' => 'User is already locked']);
        } else {

            // Lock the user
            $user->update(['is_locked' => true]);

            return response()->json(['message' => 'User locked successfully']);
        }
    }

    public function unlock($id)
    {
        $user = User::find($id);
        if ($user->is_locked == false) {
            return response()->json(['message' => 'User is already unlocked']);
        }
        $user->update(['is_locked' => false]);

        return response()->json(['message' => 'User unlocked successfully']);
    }
}
