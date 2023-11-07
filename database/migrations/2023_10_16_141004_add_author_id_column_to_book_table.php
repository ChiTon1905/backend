<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAuthorIdColumnToBookTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('books', function (Blueprint $table) {
            $table->unsignedBigInteger('author_id');
            $table->foreign('author_id')
                    ->references('id')
                    ->on('authors')
                    ->cascade('update');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('books', function (Blueprint $table) {
            $table->unsignedBigInteger('author_id');
            $table->foreign('author_id')
                    ->references('id')
                    ->on('authors')
                    ->cascade('update');
        });
    }
}
