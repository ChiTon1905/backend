<?php

use App\Models\Publisher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\GoogleController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\AuthorsController;
use App\Http\Controllers\PaymentController;
use Spatie\Permission\Contracts\Permission;
use App\Http\Controllers\DataBookController;
use App\Http\Controllers\WishListController;
use App\Http\Controllers\LanguagesController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PromotionsController;
use App\Http\Controllers\PublishersController;
use App\Http\Controllers\RoletoUserController;
use App\Http\Controllers\BooklayoutsController;
use App\Http\Controllers\OrderHistoryController;
use App\Http\Controllers\PermissionToRoleController;
use App\Http\Controllers\PermissionToUserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/authors', [AuthorsController::class,'index']);
Route::get('/authors/{id}', [AuthorsController::class, 'show']);
Route::post('/authors/store', [AuthorsController::class, 'store']);
Route::post('/authors/{id}', [AuthorsController::class, 'update']);
Route::post('/authors/delete/{id}', [AuthorsController::class, 'destroy']);

Route::get('/categories', [CategoriesController::class,'index']);
Route::get('/categories/{id}', [CategoriesController::class, 'show']);
Route::post('/categories/store', [CategoriesController::class, 'store']);
Route::post('/categories/{id}', [CategoriesController::class, 'update']);
Route::post('/categories/delete/{id}', [CategoriesController::class, 'destroy']);

Route::get('/books/index', [DataBookController::class, 'index']);
Route::get('/books', [BookController::class, 'index']);
Route::get('/books/{id}', [BookController::class, 'show']);
Route::post('/books/store', [BookController::class, 'store']);
Route::post('/books/{id}', [BookController::class, 'update']);
Route::post('/books/delete/{id}', [BookController::class, 'destroy']);
Route::post('/books/uploadimage/{id}', [ImageController::class, 'uploadImage']);
Route::post('/books/{bookId}/images/{imageId}', [ImageController::class, 'deleteImage']);

Route::get('/languages', [LanguagesController::class, 'index']);
Route::get('/languages/{id}', [LanguagesController::class, 'show']);
Route::post('/languages/store', [LanguagesController::class, 'store']);
Route::post('/languages/{id}', [LanguagesController::class, 'update']);
Route::post('/languages/delete/{id}', [LanguagesController::class, 'destroy']);

Route::get('/publishers', [PublishersController::class, 'index']);
Route::get('/publishers/{id}', [PublishersController::class, 'show']);
Route::post('/publishers/store', [PublishersController::class, 'store']);
Route::post('/publishers/{id}', [PublishersController::class, 'update']);
Route::post('/publishers/delete/{id}', [PublishersController::class, 'destroy']);

Route::get('/booklayouts', [BooklayoutsController::class, 'index']);
Route::get('/booklayouts/{id}', [BooklayoutsController::class, 'show']);
Route::post('/booklayouts/store', [BooklayoutsController::class, 'store']);
Route::post('/booklayouts/{id}', [BooklayoutsController::class, 'update']);
Route::post('/booklayouts/delete/{id}', [BooklayoutsController::class, 'destroy']);

Route::get('/promotions', [PromotionsController::class, 'index']);
Route::get('/promotions/{id}', [PromotionsController::class, 'show']);
Route::post('/promotions/store', [PromotionsController::class, 'store']);
Route::post('/promotions/{id}', [PromotionsController::class, 'update']);
Route::post('/promotions/delete/{id}', [PromotionsController::class, 'destroy']);

Route::get('/permissions', [PermissionController::class, 'index']);
Route::get('/permissions/{id}', [PermissionController::class, 'show']);
Route::post('/permissions/store', [PermissionController::class, 'store']);
Route::post('/permissions/{id}', [PermissionController::class, 'update']);
Route::post('/permissions/delete/{id}', [PermissionController::class, 'destroy']);

Route::get('/roles', [RolesController::class, 'index']);
Route::get('/roles/{id}', [RolesController::class, 'show']);
Route::post('/roles/store', [RolesController::class, 'store']);
Route::post('/roles/{id}', [RolesController::class, 'update']);
Route::post('/roles/delete/{id}', [RolesController::class, 'destroy']);

Route::get('/users', [UsersController::class, 'index']);
Route::get('/users/{id}', [UsersController::class, 'show']);
Route::post('/users/store', [UsersController::class, 'store']);
Route::post('/users/{id}', [UsersController::class, 'update']);
Route::post('/users/delete/{id}', [UsersController::class, 'destroy']);

Route::post('/give-permission-to-role', [PermissionToRoleController::class, 'givePermissionToRole']);
Route::post('/revoke-permission-to-role', [PermissionToRoleController::class, 'revokePermissionToRole']);

Route::post('/give-role-to-user', [RoletoUserController::class, 'giveRoleToUser']);
Route::post('/remove-role-to-user', [RoletoUserController::class, 'removeRoleToUser']);

Route::post('/give-permission-to-user', [PermissionToUserController::class, 'givePermissionToUser']);

Route::post('/search', [SearchController::class, 'search']);


Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);


Route::post('/loginWithGoogle', [GoogleController::class, 'loginWithGoogle']);

Route::get('/login/google', [GoogleController::class, 'redirectToGoogle']);
Route::get('/login/google/callback', [GoogleController::class, 'handleGoogleCallback']);

Route::post('/save-google-user', [GoogleController::class, 'saveUser']);

Route::post('/store-order', [OrderController::class, 'store']);

Route::get('/orderhistory',[OrderHistoryController::class,'orderHistory']);
Route::get('/orderhistory/{id}',[OrderHistoryController::class,'showOrderDetailHistory']);

Route::post('/wishlist/createordelete',[WishListController::class,'createorDeleteWishList']);
Route::get('/wishlist',[WishListController::class,'showWishList']);

Route::post('/process-payment', [PaymentController::class, 'process_payment']);

//protected route
Route::group(['middleware' => ['auth:sanctum']], function(){
    Route::post('logout', [AuthController::class, 'logout']);


});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
