<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BookResource extends JsonResource
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
                'type' => 'Book',
                'attributes' => [
                    'name' => $this->name,
                    'image' => $this->image,
                    'category' => $this->categories,
                    'authors' => $this->authors,
                    'publisher' => $this->publisher,
                    'booklayout' => $this->booklayout,
                    'language' => $this->language,
                    'promotion' => $this->promotion,
                    'description' => $this->description,
                    'publication_day' => $this->publication_day,
                    'quantity' => $this->quantity,
                    'price' => $this->price,
                    'created_at' => $this->created_at,
                    'updated_at' => $this->updated_at
                ],
        ];
    }
}
