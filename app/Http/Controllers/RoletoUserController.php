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

    public function manageUserRoles(Request $request, $id)
    {
        // Validate the incoming request data
        $request->validate([
            'roles' => 'required|array',
        ]);

        // Get the roles and user ID from the request
        $roles = $request->input('roles');

        // Check if the user exists
        $user = User::find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        // Get role models for the given role names
        $roleModels = Role::whereIn('name', $roles)->get();

        // Use syncRoles to replace the user's roles with the provided roles
        $user->syncRoles($roleModels);

        $userName = $user->name;

        return response()->json(['message' => "Roles have been replaced for user '$userName'"], 200);
    }
}
