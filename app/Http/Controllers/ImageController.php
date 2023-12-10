<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class ImageController extends Controller
{
    public function uploadImage(Request $request, $id)
    {
        $book = Book::find($id);

        if (!$book) {
            return response()->json("Book not found", 404);
        }

        if ($request->hasFile('image_path')) {
            foreach ($request->file('image_path') as $image) {
                $name = rand() . '.' . $image->getClientOriginalExtension();
                $image->move('images', $name);
                $book->image()->create(['image_path' => $name]);
            }
        }

        return response()->json("Image for book created");
    }

    public function deleteImage($bookId, $imageId)
    {
        $book = Book::find($bookId);

        if (!$book) {
            return response()->json("Book not found", 404);
        }

        $image = $book->image()->find($imageId);

        if (!$image) {
            return response()->json("Image not found", 404);
        }

        $filePath = public_path('images/' . $image->image_path);

        // Check if the file exists before attempting to delete
        if (File::exists($filePath)) {
            // Delete the image file from public/images
            File::delete($filePath);

            // Delete the image record from the database
            $image->delete();

            return response()->json("Image deleted successfully");
        } else {
            return response()->json("File not found", 404);
        }
    }
}
