<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;

class PermissionToUserController extends Controller
{
    public function givePermissionToUser(Request $request){
        $request->validate([
            'permission' => 'required|string',
            'userId' => 'required',
        ]);

        // Get the role and permission from the request
        $permissionName = $request->input('permission');
        $userId = $request->input('userId');



        // Check if the role and permission exist
        $permission = Permission::where('name', $permissionName)->first();
        $user = User::find($userId);

        if ($permission && $user) {
            // Assign the permission to the role
            $user->givePermissionTo($permission);

            $userName = $user->name;

            return response()->json(['message' => "Permission '$permissionName' has been assign to user '$userName'"], 200);
        }

        return response()->json(['message' => 'Permission or user not found'], 404);
    }

    public function manageUserPermissions(Request $request, $id)
    {
        // Validate the incoming request data
        $request->validate([
            'permissions' => 'required|array',
        ]);

        // Get the permissions from the request
        $permissions = $request->input('permissions');

        // Check if the user exists
        $user = User::find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        // Get Permissions models for the given Permissions names
        $permissionModels = Permission::whereIn('name', $permissions)->get();

        // Use syncPermissions to replace the user's cPermissions with the provided Permissions
        $user->syncPermissions($permissionModels);

        $userName = $user->name;

        return response()->json(['message' => "Permissions have been replaced for user '$userName'"], 200);
    }

}
