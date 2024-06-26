<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AuthorsResource extends JsonResource
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
            'id' => (string)$this->id,
                'type' => 'Author',
                'attributes' => [
                    'name' => $this->name,
                    'books' => $this->books,
                    'created_at' => $this->created_at,
                    'updated_at' => $this->updated_at
                ]
        ];
    }
}
