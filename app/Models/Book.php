<?php

namespace App\Models;

use Illuminate\Pagination\Paginator;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Book extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'name',
        'description',
        'publication_year',
        'quantity',
        'price',
        'categories_id',
        'promotion_id',
        'publisher_id',
        'booklayout_id',
        'language_id',
    ];

    protected $hidden = [
        //'laravel_through_key',
        'created_at',
        'updated_at'
    ];

    public function categories()
    {
        return $this->belongsTo(Categories::class);
    }

    public function booklayout()
    {
        return $this->belongsTo(Booklayout::class);
    }

    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }

    public function promotion()
    {
        return $this->belongsTo(Promotion::class);
    }

    public function image(){
        return $this->hasMany(Image::class);
    }

    public function authors() {
        return $this->belongsToMany(Author::class);
    }

    public function orderDetails(){
        return $this->hasMany(OrderDetails::class);
    }

    public function wishlist(){
        return $this->hasMany(WishList::class);
    }
}
