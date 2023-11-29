<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\User;
use Illuminate\Http\Request;

class OrderHistoryController extends Controller
{
    public function orderHistory(Request $request)
    {
        $order = Order::where('user_id', $request->input('user_id'))->paginate(8);

        return [
            'order' => $order,
            'pagination' => [
                'current_page' => $order->currentPage(),
                'total_pages' => $order->lastPage(),
            ],
        ];
    }

    public function showOrderDetailHistory(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $orderDetails = $order->orderDetails()->with('book.image', 'book.categories', 'book.publisher', 'book.booklayout' , 'book.authors')->get();
        $user = User::where('id', $order->user_id)->first();

        return [
            'users' => $user,
            'order' => $order,
            'orderDetails' => $orderDetails,
        ];
    }
}
