<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class LanguagesResource extends JsonResource
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
                'type' => 'Language',
                'attributes' => [
                    'name' => $this->name,
                    'books' => BookResource::collection($this->book),
                ]
        ];
    }
}
