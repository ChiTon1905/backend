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
        // Get the current year
        $currentYear = date('Y');

        $orders = Order::with('user')
            ->whereYear('date', $currentYear)
            ->orderByDesc('date') // Orders by the date in descending order
            ->take(100)
            ->get();

        return response()->json(['orders' => $orders], 200);
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
        // thay doi ham`
        $user = User::find($request->input('user_id'));

        $date = now();

        if ($user) {
            $user->update([
                'address' => $request->input('address'),
                'phone' => $request->input('phone')
            ]);

            // Create a new order
            $order = Order::create([
                'user_id' => $user->id,
                'date' => $date,
                'total' => $request->input('total'),
                'payment' => $request->input('payment')
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
        // Retrieve the order with the given ID
        $order = Order::findOrFail($id);

        // Check if the order exists
        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        $orderDetails = $order->orderDetails()->with('book.image', 'book.categories', 'book.publisher', 'book.booklayout', 'book.authors')->get();
        $user = User::where('id', $order->user_id)->first();

        // You can customize the response format as needed
        return [
            'users' => $user,
            'order' => $order,
            'orderDetails' => $orderDetails,
        ];
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
        $order = Order::find($id);
        // Check if the order has already been received
        if ($order->has_received) {
            return response()->json(['message' => 'Đơn hàng đã được xác nhận nhận từ trước']);
        }

        // Check if the order has been cancel by user
        if ($order->status === 'hủy') {
            return response()->json(['message' => 'Đơn hàng đã bị hủy từ trước']);
        }

        $orderDetails = $order->orderDetails;
        foreach ($orderDetails as $orderDetail) {
            $book = $orderDetail->book;
            $newQuantity = $book->quantity - $orderDetail->quantity;

            // If the available quantity is less than the ordered quantity, reject the order
            if ($newQuantity < 0) {
                return response()->json(['message' => 'Không đủ số lượng sách trong kho']);
            }

            // Update the quantity of the book
            $book->update(['quantity' => $newQuantity]);
        }

        $order->update(
            [
                'status' => 'xác nhận'
            ]
        );
        return response()->json(['message' => "Đã xác nhận đơn hàng"]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        // Delete associated order_details
        $order->orderDetails()->delete();

        // Delete the Order
        $order->delete();

        return response()->json("Đã xóa đơn hàng và các chi tiết liên quan");
    }

    public function confirmReceived($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        // Check if the order has already been received
        if ($order->has_received) {
            return response()->json(['message' => 'Đơn hàng đã được xác nhận nhận từ trước']);
        }

        // Check if the order has been cancel by user
        if ($order->status === 'hủy') {
            return response()->json(['message' => 'Đơn hàng đã bị hủy từ trước']);
        }

        // Check if the order has been confirmed by the shop
        if ($order->status !== 'xác nhận') {
            return response()->json(['message' => 'Cửa hàng chưa xác nhận đơn hàng']);
        }


        // Update the status and set has_received to true
        $order->update(['status' => 'đã nhận', 'has_received' => true]);

        return response()->json(['message' => 'Bạn đã xác nhận đã nhận đơn hàng']);
    }

    public function cancelOrder($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        // Check if the order has already been cancelled or received
        if ($order->status === 'hủy') {
            return response()->json(['message' => 'Đơn hàng đã bị hủy từ trước']);
        } elseif ($order->status === 'đã nhận') {
            return response()->json(['message' => 'Đơn hàng đã được xác nhận nhận, không thể hủy']);
        }
        if ($order->status === 'chưa xác nhận') {
            $order->update(['status' => 'hủy']);
            return response()->json(['message' => 'Đơn hàng đã được hủy']);
        } else {
            // Update the status to 'hủy'
            $order->update(['status' => 'hủy']);

            $orderDetails = $order->orderDetails;

            // Adjust book quantities
            foreach ($orderDetails as $orderDetail) {
                $book = $orderDetail->book;
                $newQuantity = $book->quantity + $orderDetail->quantity;

                // Update the quantity of the book
                $book->update(['quantity' => $newQuantity]);
            }

            return response()->json(['message' => 'Đơn hàng đã được hủy']);
        }
    }

    public function pendingOrder($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        // Check if the order has already been cancelled or received
        if ($order->status === 'hủy') {
            return response()->json(['message' => 'Đơn hàng đã bị hủy từ trước']);
        } elseif ($order->status === 'đã nhận') {
            return response()->json(['message' => 'Đơn hàng đã được xác nhận nhận, không thể chưa xác nhận']);
        }

        // Update the status to 'chưa xác nhận'
        $order->update(['status' => 'chưa xác nhận']);

        $orderDetails = $order->orderDetails;

        // Adjust book quantities
        foreach ($orderDetails as $orderDetail) {
            $book = $orderDetail->book;
            $newQuantity = $book->quantity + $orderDetail->quantity;

            // Update the quantity of the book
            $book->update(['quantity' => $newQuantity]);
        }

        return response()->json(['message' => 'Đơn hàng chưa xác nhận']);
    }
}
