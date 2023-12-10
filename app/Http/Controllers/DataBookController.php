<?php

namespace App\Http\Controllers;

use App\Http\Resources\BookResource;
use App\Models\Book;
use Illuminate\Http\Request;

class DataBookController extends Controller
{
    public function index(Request $request)
    {

        $data = Book::all();


        return BookResource::collection(
           $data
        );
    }
}
