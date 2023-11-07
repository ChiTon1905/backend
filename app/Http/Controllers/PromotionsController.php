<?php

namespace App\Http\Controllers;


use Carbon\Carbon;
use App\Models\Promotion;

use Illuminate\Http\Request;
use App\Http\Requests\PromotionsRequest;
use App\Http\Resources\PromotionsResource;

class PromotionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return PromotionsResource::collection(
            Promotion::all()
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
    public function store(PromotionsRequest $request)
    {
        $p = new Promotion();
        $p->name = $request->name;
        $p->description = $request->description;
        $p->start_date = Carbon::createFromFormat('d-m-Y', $request->input('start_date'));
        $p->end_date = Carbon::createFromFormat('d-m-Y', $request->input('end_date'));
        $p->discount = $request->discount;

        $p->save();

        return response()->json("Promotion created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $Promotion = Promotion::find($id);
        return new PromotionsResource($Promotion);
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
        $p = Promotion::findOrFail($id);

        $p->update([
            'name' => $request->input('name'),
            'description' => $request->input('description'),
            'start_date' => Carbon::createFromFormat('d-m-Y', $request->input('start_date')),
            'end_date' => Carbon::createFromFormat('d-m-Y', $request->input('end_date')),
            'discount' => $request->input('discount'),
        ]);

        return new PromotionsResource($p);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $p = Promotion::findOrFail($id);
        $p->delete();
        return  response(null, 204);
    }
}
