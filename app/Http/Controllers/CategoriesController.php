<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Categories;
use Illuminate\Http\Request;
use App\Http\Resources\CategoriesResource;
use App\Http\Requests\StoreCategoriesRequest;
use App\Http\Requests\UpdateCategoriesRequest;
use App\Http\Resources\CategoryPaginateResource;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return CategoriesResource::collection(
            Categories::all()
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
     * @param  \App\Http\Requests\StoreCategoriesRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCategoriesRequest $request)
    {
        Categories::create($request->validated());
        return response()->json("category created");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Categories  $categories
     * @return \Illuminate\Http\Response
     */
    public function show($id,Request $request)
    {
        $perPage = $request->input('per_page', 12);

        $categories = Categories::find($id);

        $book = Book::where('categories_id', $categories->id)->with('image') ->paginate($perPage);

        return new CategoryPaginateResource($categories, $book);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Categories  $categories
     * @return \Illuminate\Http\Response
     */
    public function edit(Categories $categories)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCategoriesRequest  $request
     * @param  \App\Models\Categories  $categories
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCategoriesRequest $request, $id)
    {
        $category = Categories::find($id);
        $category->update(
            [
                'name' => $request->input('name')
            ]
        );
        return response()->json("category updated");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categories  $categories
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Categories::find($id);
        $associatedBooksCount = $category->book()->count();

        if ($associatedBooksCount > 0) {
            return response()->json(['message' => 'Cannot delete category with associated books.'], 422);
        }

        // If no associated books, proceed with deletion
        $category->delete();
        return  response(null, 204);
    }
}
