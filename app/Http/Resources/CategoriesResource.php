<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoriesResource extends JsonResource
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
            'type' => 'Category',
            'attributes' => [
                'cat_name' => $this->name,
                'book_count' => $this->book->count(),
                'books' => BookResource::collection($this->book),
            ],
        ];
    }
}
