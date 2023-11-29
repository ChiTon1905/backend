<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Resources\SearchResource;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $book = Book::with('categories', 'language', 'publisher', 'authors', 'booklayout');

        //search theo ten moi bang cos quan he voi book
        if ($request->has('search')) {
            $searchTerm = '%' . $request->input('search') . '%';

            $book->where(function ($query) use ($searchTerm) {
                $query->where('books.name', 'like', $searchTerm)
                    ->orWhereHas('categories', function ($subQuery) use ($searchTerm) {
                        $subQuery->where('name', 'like', $searchTerm);
                    })
                    ->orWhereHas('language', function ($subQuery) use ($searchTerm) {
                        $subQuery->where('name', 'like', $searchTerm);
                    })
                    ->orWhereHas('publisher', function ($subQuery) use ($searchTerm) {
                        $subQuery->where('name', 'like', $searchTerm);
                    })
                    ->orWhereHas('booklayout', function ($subQuery) use ($searchTerm) {
                        $subQuery->where('name', 'like', $searchTerm);
                    })
                    ->orWhereHas('authors', function ($subQuery) use ($searchTerm) {
                        $subQuery->where('name', 'like', $searchTerm);
                    });
            });
        }

        //Tu day,filter name = name trong input moi chay , khong co gan dung
        if ($request->has('language')) {
            $languageFilter = $request->input('language');
            $book->whereHas('language', function ($subQuery) use ($languageFilter) {
                $subQuery->where('name', $languageFilter);
            });
        }

        if ($request->has('categories')) {
            $Filter = $request->input('categories');
            $book->whereHas('categories', function ($subQuery) use ($Filter) {
                $subQuery->where('name', $Filter);
            });

        }

        if ($request->has('publisher')) {
            $Filter = $request->input('publisher');
            $book->whereHas('publisher', function ($subQuery) use ($Filter) {
                $subQuery->where('name', $Filter);
            });
        }

        if ($request->has('booklayout')) {
            $Filter = $request->input('booklayout');
            $book->whereHas('booklayout', function ($subQuery) use ($Filter) {
                $subQuery->where('name', $Filter);
            });
        }

        //filter mutilple name author
        if ($request->has('author')) {
            $Filter = $request->input('author');
            $book->whereHas('authors', function ($subQuery) use ($Filter) {
                $subQuery->where('name', $Filter);
            });
        }

        // Sorting
        if ($request->has('sort_by') && $request->has('sort_order')) {
            $sortBy = $request->input('sort_by');
            $sortOrder = $request->input('sort_order');

            // Add validation for allowed columns to sort by
            $allowedColumns = ['name','price' ,'created_at', 'updated_at'];
            if (in_array($sortBy, $allowedColumns)) {
                $book->orderBy($sortBy, $sortOrder);
            }
        }

        $totalCount = $book->count();

        $perPage = $request->input('per_page', 8);

        $paginatedBooks = $book->paginate($perPage);

        return [
            "total_count" => $totalCount,
            "data" => SearchResource::collection($paginatedBooks),
            'pagination' => [
                'current_page' => $paginatedBooks->currentPage(),
                'total_pages' => $paginatedBooks->lastPage(),
            ],
        ];
    }
}
