<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\User;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    public function store(Request $request)
    {
        //Tim user
        $user = User::where('email', $request->input('email'))->first();

        $date = now();

        if($user) {
            $user->update([
                'address' => $request->input('address'),
                 'phone' => $request->input('phone')
             ]);

             // Create a new order
             $order = Order::create([
                 'user_id' => $user->id,
                 'date' => $date,
                 'total' => $request->input('total')
             ]);

             // Store order details
             foreach ($request->input('order_details') as $detail) {
                 OrderDetails::create([
                     'order_id' => $order->id,
                     'book_id' => $detail['id'],
                     'quantity' => $detail['quantity'],
                     'price' => $detail['price']
                 ]);
             }
        }


        // You can return a response here if needed
        return response()->json(['message' => 'Order created successfully']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
