<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UsersResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'user_id' => $this->id,
            'google_id' => $this->google_id,
            'name' => $this->name,
            'email' => $this->email,
            'address' => $this->address,
            'phone' => $this->phone,
            'genre' => $this->genre,
            'token' => $this->createToken("Token")->plainTextToken,
            'roles' => $this->roles->pluck('name') ,
            'roles.permission' => $this->getPermissionsViaRoles() ,
            'permission' => $this->permissions->pluck('name')
        ];
    }
}
