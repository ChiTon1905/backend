<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SearchResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {

        $paginationData = $this->resource->toArray();

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
                'publication_year' => $this->publication_year,
                'quantity' => $this->quantity,
                'price' => $this->price,
                'created_at' => $this->created_at,
                'updated_at' => $this->updated_at,
            ],
        ];
    }
}
