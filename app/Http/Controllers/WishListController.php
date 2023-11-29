<?php

namespace App\Http\Controllers;

use App\Models\WishList;
use Illuminate\Http\Request;

class WishListController extends Controller
{
    public function createOrDeleteWishList(Request $request)
    {
        $wishlist = WishList::where('user_id', $request->input('user_id'))
                            ->where('book_id', $request->input('book_id'))
                            ->first();

        if($wishlist){
            $wishlist->delete();
            return response()->json(['message' => 'Wishlist item deleted successfully']);
        } else {
            WishList::create([
                'user_id' => $request->input('user_id'),
                'book_id' => $request->input('book_id')
            ]);

            return response()->json(['message' => 'Wishlist item created successfully']);
        }
    }

    public function showWishList(Request $request){
        $user_id = $request->input('user_id');

        $wishlist = WishList::with('book.image','book.categories','book.promotion')
        ->where('user_id', $user_id)
        ->paginate(8);

        return [
            'wishlist' => $wishlist
        ];
    }
}
