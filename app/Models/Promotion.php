<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    use HasFactory;


    protected $fillable = [
        'name',
        'description',
        'start_date',
        'end_date',
        'discount'
    ];

    protected $dates = [
        'start_date',
        'end_date',
    ];

    protected $hidden = [

        'created_at',
        'updated_at'
    ];

    public function book(){
        return $this->hasMany(Book::class);
    }

}
