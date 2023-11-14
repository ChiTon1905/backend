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

}
