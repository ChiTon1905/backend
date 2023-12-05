<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Booklayout;
use Illuminate\Http\Request;
use App\Http\Requests\BooklayoutsRequest;
use App\Http\Resources\BooklayoutsResource;
use App\Http\Resources\BooklayoutsShowResource;

class BooklayoutsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return BooklayoutsResource::collection(
            Booklayout::all()
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
    public function store(BooklayoutsRequest $request)
    {
        Booklayout::create($request->validated());
        return response()->json("Booklayout created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id,Request $request)
    {
        $Booklayout = Booklayout::findOrFail($id);

        $perPage = $request->input('per_page', 12);

        $book = Book::where('booklayout_id', $Booklayout->id)->with('image')->paginate($perPage);
        return new BooklayoutsShowResource($Booklayout, $book);
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
    public function update(BooklayoutsRequest $request, $id)
    {
        $Booklayout = Booklayout::findOrFail($id);
        $Booklayout->update($request->validated());
        return response()->json("Booklayout updated");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Booklayout = Booklayout::findOrFail($id);
        $BooksCount = $Booklayout->book()->count();

        if ($BooksCount > 0) {
            return response()->json(['message' => 'Cannot delete with associated books.'], 422);
        }
        $Booklayout->delete();
        return  response(null,204);
    }
}
