<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PermissionToRoleController extends Controller
{
    public function givePermissionToRole(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'role' => 'required|string',
            'permission' => 'required|string',
        ]);

        // Get the role and permission from the request
        $roleName = $request->input('role');
        $permissionName = $request->input('permission');

        // Check if the role and permission exist
        $role = Role::where('name', $roleName)->first();
        $permission = Permission::where('name', $permissionName)->first();

        if ($role && $permission) {
            // Assign the permission to the role
            $role->givePermissionTo($permission);

            return response()->json(['message' => "Permission '$permissionName' has been assigned to role '$roleName'"], 200);
        }

        return response()->json(['message' => 'Role or permission not found'], 404);
    }

    public function revokePermissiontoRole(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'role' => 'required|string',
            'permission' => 'required|string',
        ]);

        // Get the role and permission from the request
        $roleName = $request->input('role');
        $permissionName = $request->input('permission');

        // Check if the role and permission exist
        $role = Role::where('name', $roleName)->first();
        $permission = Permission::where('name', $permissionName)->first();

        if ($role && $permission) {
            // Revoke the permission to the role
            $role->revokePermissionTo($permission);

            return response()->json(['message' => "Permission '$permissionName' has been revoked to role '$roleName'"], 200);
        }

        return response()->json(['message' => 'Role or permission not found'], 404);
    }
}
