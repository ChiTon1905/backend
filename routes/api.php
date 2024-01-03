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
use App\Http\Controllers\DashBoardController;
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

//protected route

Route::get('/authors', [AuthorsController::class, 'index']);
Route::get('/authors/{id}', [AuthorsController::class, 'show']);

Route::get('/categories', [CategoriesController::class, 'index']);
Route::get('/categories/{id}', [CategoriesController::class, 'show']);


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


Route::get('/publishers', [PublishersController::class, 'index']);
Route::get('/publishers/{id}', [PublishersController::class, 'show']);

Route::get('/booklayouts', [BooklayoutsController::class, 'index']);
Route::get('/booklayouts/{id}', [BooklayoutsController::class, 'show']);


Route::get('/promotions', [PromotionsController::class, 'index']);
Route::get('/promotions/{id}', [PromotionsController::class, 'show']);


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
Route::post('/manage-permissions-to-user/{id}', [PermissionToUserController::class, 'manageUserPermissions']);

Route::post('/give-role-to-user', [RoletoUserController::class, 'giveRoleToUser']);
Route::post('/remove-role-to-user', [RoletoUserController::class, 'removeRoleToUser']);
Route::post('/manage-role-to-user/{id}', [RoletoUserController::class, 'manageUserRoles']);

Route::post('/give-permission-to-user', [PermissionToUserController::class, 'givePermissionToUser']);
Route::get('/customer', [UsersController::class, 'customer']);
Route::get('/employee', [UsersController::class, 'employee']);

Route::post('/search', [SearchController::class, 'search']);


Route::post('login', [AuthController::class, 'login']);

Route::post('register', [AuthController::class, 'register']);

Route::post('/save-google-user', [GoogleController::class, 'saveUser']);

Route::post('/store-order', [OrderController::class, 'store']);

Route::get('/orderhistory', [OrderHistoryController::class, 'orderHistory']);
Route::get('/orderhistory/{id}', [OrderHistoryController::class, 'showOrderDetailHistory']);
Route::get('/order/{id}', [OrderController::class, 'show']);
Route::get('/order', [OrderController::class, 'index']);
Route::post('/order/{id}', [OrderController::class, 'update']);
Route::post('/order/delete/{id}', [OrderController::class, 'destroy']);
Route::post('/order/confirm-order/{id}', [OrderController::class, 'confirmReceived']);
Route::post('/order/cancel-order/{id}', [OrderController::class, 'cancelOrder']);
Route::post('/order/pending-order/{id}', [OrderController::class, 'pendingOrder']);
Route::post('/order/boom-order/{id}', [OrderController::class, 'flaker']);



Route::post('/wishlist/createordelete', [WishListController::class, 'createorDeleteWishList']);
Route::get('/wishlist', [WishListController::class, 'showWishList']);

Route::post('/process-payment', [PaymentController::class, 'process_payment']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('check', [AuthController::class, 'check']);

    Route::middleware('permission:category.store')->post('/categories/store', [CategoriesController::class, 'store']);
    Route::middleware('permission:category.update')->post('/categories/{id}', [CategoriesController::class, 'update']);
    Route::middleware('permission:category.delete')->post('/categories/delete/{id}', [CategoriesController::class, 'destroy']);

    Route::middleware('permission:author.store')->post('/authors/store', [AuthorsController::class, 'store']);
    Route::middleware('permission:author.update')->post('/authors/{id}', [AuthorsController::class, 'update']);
    Route::middleware('permission:author.delete')->post('/authors/delete/{id}', [AuthorsController::class, 'destroy']);

    Route::middleware('permission:language.store')->post('/languages/store', [LanguagesController::class, 'store']);
    Route::middleware('permission:language.update')->post('/languages/{id}', [LanguagesController::class, 'update']);
    Route::middleware('permission:language.delete')->post('/languages/delete/{id}', [LanguagesController::class, 'destroy']);

    Route::middleware('permission:publisher.store')->post('/publishers/store', [PublishersController::class, 'store']);
    Route::middleware('permission:publisher.update')->post('/publishers/{id}', [PublishersController::class, 'update']);
    Route::middleware('permission:publisher.delete')->post('/publishers/delete/{id}', [PublishersController::class, 'destroy']);

    Route::middleware('permission:booklayout.store')->post('/booklayouts/store', [BooklayoutsController::class, 'store']);
    Route::middleware('permission:booklayout.update')->post('/booklayouts/{id}', [BooklayoutsController::class, 'update']);
    Route::middleware('permission:booklayout.delete')->post('/booklayouts/delete/{id}', [BooklayoutsController::class, 'destroy']);

    Route::middleware('permission:promotion.store')->post('/promotions/store', [PromotionsController::class, 'store']);
    Route::middleware('permission:promotion.update')->post('/promotions/{id}', [PromotionsController::class, 'update']);
    Route::middleware('permission:promotion.delete')->post('/promotions/delete/{id}', [PromotionsController::class, 'destroy']);

    Route::middleware('permission:user.lock')->post('/users/{id}/lock', [UsersController::class, 'lock']);
    Route::middleware('permission:user.unlock')->post('/users/{id}/unlock', [UsersController::class, 'unlock']);
});

    Route::get('/dashboard', [DashBoardController::class, 'ecommerce']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
