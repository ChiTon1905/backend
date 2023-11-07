<?php

use App\Models\Publisher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookController;
use App\Http\Controllers\AuthorsController;
use App\Http\Controllers\LanguagesController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\PromotionsController;
use App\Http\Controllers\PublishersController;
use App\Http\Controllers\BooklayoutsController;

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

Route::apiResource('/authors', AuthorsController::class);

Route::get('/categories', [CategoriesController::class,'index']);
Route::get('/categories/{id}', [CategoriesController::class, 'show']);
Route::post('/categories/store', [CategoriesController::class, 'store']);
Route::post('/categories/{id}', [CategoriesController::class, 'update']);
Route::post('/categories/delete/{id}', [CategoriesController::class, 'destroy']);

Route::get('/books', [BookController::class, 'index']);
Route::get('/books/{id}', [BookController::class, 'show']);
Route::post('/books/store', [BookController::class, 'store']);
Route::post('/books/{id}', [BookController::class, 'update']);
Route::post('/books/delete/{id}', [BookController::class, 'destroy']);

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


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
