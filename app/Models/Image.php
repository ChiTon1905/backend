<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'image_path',
        'book_id'
    ];

    protected $hidden = [
        //'laravel_through_key',
        'created_at',
        'updated_at'
    ];

    public function book()
    {
        return $this->belongsTo(Book::class);
    }
}
