<?php

namespace App\Http\Resources;

use App\Http\Resources\BookResource;
use Illuminate\Http\Resources\Json\JsonResource;

class PublishersShowResource extends JsonResource
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
            'type' => 'Publishers',
            'attributes' => [
                'name' => $this->name,
                'books' => BookResource::collection($this->book),
            ],
        ];
    }
}
