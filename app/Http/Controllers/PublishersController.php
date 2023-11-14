<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Publisher;
use Illuminate\Http\Request;
use App\Http\Requests\PublishersRequest;
use App\Http\Resources\PublishersResource;
use App\Http\Resources\PublishersShowResource;

class PublishersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return PublishersResource::collection(
            Publisher::all()
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
    public function store(PublishersRequest $request)
    {
        Publisher::create($request->validated());
        return response()->json("Publisher created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id,Request $request)
    {
        $Publisher = Publisher::find($id);

        $perPage = $request->input('per_page', 12);

        $book = Book::where('publisher_id', $Publisher->id)->with('image')->paginate($perPage);
        return new PublishersShowResource($Publisher, $book);
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
    public function update(PublishersRequest $request, $id)
    {
        $Publisher = Publisher::findOrFail($id);
        $Publisher->update($request->validated());
        return response()->json("Publisher updated");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Publisher = Publisher::findOrFail($id);
        $Publisher->delete();
        return  response(null,204);
    }
}
