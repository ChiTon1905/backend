<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\User;
use App\Models\Order;
use Illuminate\Http\Request;

class DashBoardController extends Controller
{
    public function ecommerce(Request $request)
    {

        $book = Book::all();

        $users = User::whereHas('roles', function ($query) {
            $query->where('name', 'user');
        })->get();

        $year = $request->input('year', date('Y')); // Lấy năm từ request hoặc mặc định là năm hiện tại

        // Lấy danh sách tất cả đơn hàng đã nhận trong năm cụ thể
        $receivedOrders = Order::where('has_received', 1)
            ->whereYear('created_at', $year)
            ->get();

        // Tính tổng doanh thu từ các đơn hàng đã nhận
        $totalRevenue = $receivedOrders->sum('total');

        $order = Order::whereYear('created_at', $year)
            ->take(10)
            ->get();

         // Sorting
         if ($request->has('sort_by') && $request->has('sort_order')) {
            $sortBy = $request->input('sort_by');
            $sortOrder = $request->input('sort_order');

            // Add validation for allowed columns to sort by
            $allowedColumns = ['name','total' ,'created_at', 'updated_at'];
            if (in_array($sortBy, $allowedColumns)) {
                $order->orderBy($sortBy, $sortOrder);
            }
        }

        $order_count = $receivedOrders->count();

        $book_count =  $book->count();

        $user_count = $users->count();

        return response()->json([
            'book_count' =>  $book_count,
            'user_count' =>  $user_count,
            'total_revenue' => $totalRevenue,
            'order_count' => $order_count,
            'order' => $order,
        ]);
    }
}
