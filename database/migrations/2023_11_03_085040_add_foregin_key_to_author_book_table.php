<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeginKeyToAuthorBookTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('author_book', function (Blueprint $table) {
            $table->foreign('author_id')
                ->references('id')
                ->on('authors')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();

            $table->foreign('book_id')
                ->references('id')
                ->on('books')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('author_book', function (Blueprint $table) {
            $table->foreign('author_id')
                ->references('id')
                ->on('authors')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();

            $table->foreign('book_id')
                ->references('id')
                ->on('books')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
        });
    }
}
