<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoryPaginateResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function __construct($resource, $book)
    {
        parent::__construct($resource);
        $this->book = $book;
    }

    public function toArray($request)
    {
        return [
            'id' => (string)$this->id,
            'type' => 'Category',
            'attributes' => [
                'cat_name' => $this->name,
                'books' => BookResource::collection($this->book),
            ],
        ];
    }
}
