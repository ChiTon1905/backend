<?php

namespace App\Http\Controllers;

use App\Models\Booklayout;
use Illuminate\Http\Request;
use App\Http\Requests\BooklayoutsRequest;
use App\Http\Resources\BooklayoutsResource;

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
    public function show($id)
    {
        $Booklayout = Booklayout::findOrFail($id);
        return new BooklayoutsResource($Booklayout);
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
        $Booklayout->delete();
        return  response(null,204);
    }
}
