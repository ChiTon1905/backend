<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Author_Book extends Model
{
    use HasFactory;

    protected $fillable = [
        'author_id',
        'book_id'
    ];

    protected $hidden = [

        'created_at',
        'updated_at'
    ];

}
