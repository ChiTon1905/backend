<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Requests\LanguagesRequest;
use App\Http\Resources\LanguagesResource;
use App\Http\Resources\LanguagesShowResource;

class LanguagesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return LanguagesResource::collection(
            Language::all()
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
    public function store(LanguagesRequest $request)
    {
        Language::create($request->validated());
        return response()->json("language created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id,Request $request)
    {
        $language = Language::findOrFail($id);

        $perPage = $request->input('per_page', 12);

        $book = Book::where('language_id', $language->id)->with('image')->paginate($perPage);

        return new LanguagesShowResource($language, $book);
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
    public function update(LanguagesRequest $request, $id)
    {
        $language = Language::findOrFail($id);
        $language->update($request->validated());
        return response()->json("language updated");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $language = Language::findOrFail($id);
        $BooksCount = $language->book()->count();

        if ($BooksCount > 0) {
            return response()->json(['message' => 'Cannot delete  with associated books.'], 422);
        }

        $language->delete();
        return  response(null,204);
    }
}
