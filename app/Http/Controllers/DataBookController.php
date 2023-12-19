<?php

namespace App\Http\Controllers;

use App\Http\Resources\BookResource;
use App\Models\Book;
use Illuminate\Http\Request;

class DataBookController extends Controller
{
    public function index(Request $request)
    {
        // Get the publishers parameter from the request
        $publishers = $request->input('publishers');

        // Start with the base query
        $query = Book::query();

        // If publishers parameter is provided, filter by publisher names
        if ($publishers) {
            $publisherNames = explode(',', $publishers);

            // Use the relationship to filter by publisher names
            $query->whereHas('publisher', function ($query) use ($publisherNames) {
                $query->whereIn('name', $publisherNames);
            });
        }

        // Take 100 records and get the results
        $data = $query->take(100)->get();

        // Check if there are any records
        if ($data->isEmpty()) {
            // Handle the case where no records were found
            return response()->json(['message' => 'No records found.'], 404);
        }

        // Return the filtered results using BookResource
        return BookResource::collection($data);
    }
}
