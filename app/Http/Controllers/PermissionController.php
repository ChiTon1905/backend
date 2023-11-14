<?php

namespace App\Http\Controllers;

use App\Http\Requests\PermissionsRequest;
use App\Http\Resources\PermissionsResource;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;

use Spatie\Permission\Traits\RefreshesPermissionCache;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return PermissionsResource::collection(
            Permission::all()
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
    public function store(PermissionsRequest $request)
    {
        $permission = Permission::create(['name' => $request->input('name')]);

        return response()->json(['message' => 'Permission created successfully']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $permission = Permission::findById($id);

        return new PermissionsResource($permission);
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
    public function update(PermissionsRequest $request, $id)
    {
        $permission = Permission::find($id);

        $permission->update(['name' => $request->input('name')]);

        return response()->json(['message' => 'Permission updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $permission = Permission::find($id);

        // Check if the permission exists
        if ($permission) {
            $permission->delete();

            return response()->json(['message' => 'Permission deleted successfully']);
        } else {
            return response()->json(['message' => 'Permission not found'], 404);
        }
    }
}
