<?php

namespace App\Http\Controllers;

use App\Models\User;
use Spatie\Permission\Models\Role;
use Illuminate\Http\Request;

class RoletoUserController extends Controller
{
    public function giveRoleToUser(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'role' => 'required|string',
            'userId' => 'required',
        ]);

        // Get the role and permission from the request
        $roleName = $request->input('role');
        $userId = $request->input('userId');

        // Check if the role and permission exist
        $role = Role::where('name', $roleName)->first();
        $user = User::find($userId);





        if ($role && $user) {
            // Assign the permission to the role
            $user->assignRole($role);

            $userName = $user->name;

            return response()->json(['message' => "Role '$roleName' has been assigned to user '$userName'"], 200);
        }

        return response()->json(['message' => 'Role or user not found'], 404);
    }

    public function removeRoleToUser(Request $request)
    {
        $request->validate([
            'role' => 'required|string',
            'userId' => 'required',
        ]);

        // Get the role and permission from the request
        $roleName = $request->input('role');
        $userId = $request->input('userId');

        // Check if the role and permission exist
        $role = Role::where('name', $roleName)->first();
        $user = User::find($userId);

        if ($role && $user) {
            // Assign the permission to the role
            $user->removeRole($role);

            $userName = $user->name;

            return response()->json(['message' => "Role '$roleName' has been remove to user '$userName'"], 200);
        }

        return response()->json(['message' => 'Role or user not found'], 404);
    }
}
