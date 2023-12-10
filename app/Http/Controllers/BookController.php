<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Image;
use App\Models\Author;
use Illuminate\Http\Request;
use App\Http\Requests\BookRequest;
use App\Http\Resources\BookResource;
use App\Http\Requests\UpdateBookRequest;
use App\Http\Resources\BookPaginateResource;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 12);

        $data = Book::paginate($perPage);


        return BookPaginateResource::collection(
            $data
        );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BookRequest $request)
    {
        $book = new Book();
        $book->name = $request->name;
        $book->description = $request->description;
        $book->publication_day = $request->publication_day;
        $book->quantity = $request->quantity;
        $book->price = $request->price;
        $book->categories_id = $request->categories_id;
        $book->promotion_id = $request->promotion_id;
        $book->booklayout_id = $request->booklayout_id;
        $book->publisher_id = $request->publisher_id;
        $book->language_id = $request->language_id;


        $book->save();

        if ($request->hasFile('image_path')) {
            foreach ($request->file('image_path') as $image) {
                $name = rand() . '.' . $image->getClientOriginalExtension();
                $image->move('images', $name);
                $book->image()->create(['image_path' => $name]);
            }
        }

        $author = Author::find($request->author_id);
        $book->authors()->sync($author);

        return response()->json("Book and image created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $book = Book::find($id);
        return new BookResource($book);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //can chinh sua chua co update image
        $book = Book::findOrFail($id);

        $validatedData = $request->validate([
            'name' => 'required|string',
            'description' => 'nullable|string',
            'publication_day' => 'nullable|date',
            'quantity' => 'required|integer',
            'price' => 'required|numeric',
            'categories_id' => 'required|exists:categories,id',
            'promotion_id' => 'nullable|exists:promotions,id',
            'booklayout_id' => 'required|exists:booklayouts,id',
            'publisher_id' => 'required|exists:publishers,id',
            'language_id' => 'required|exists:languages,id',
        ]);

        $book->update($validatedData);

        $author = Author::find($request->author_id);
        $book->authors()->sync($author);

        return new BookResource($book);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        // Find the book by ID or return a 404 response
        $book = Book::findOrFail($id);

        // Check if the book is associated with any order_detail
        if ($book->orderDetails()->exists()) {
            return response()->json("Cannot delete the book because it is associated with order_details", 422);
        }

        // Delete the associated images
        foreach ($book->image as $image) {
            $this->deleteImageFile($image->image_path);
        }

        // Delete the book
        $book->delete();

        return response()->json(null, 204);
    }

    private function deleteImageFile($imageName)
    {
        $filePath = public_path('images/' . $imageName);

        // Check if the file exists before attempting to delete
        if (file_exists($filePath)) {
            // Delete the image file from public/images
            unlink($filePath);
        }
    }
}
