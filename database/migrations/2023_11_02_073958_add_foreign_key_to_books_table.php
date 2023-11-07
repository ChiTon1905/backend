<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeyToBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('books', function (Blueprint $table) {
            $table->unsignedBigInteger('publishers_id');
            $table->foreign('publishers_id')
                    ->references('id')
                    ->on('publishers')
                    ->cascade('update');

            $table->unsignedBigInteger('languages_id');
            $table->foreign('languages_id')
                    ->references('id')
                    ->on('languages')
                    ->cascade('update');

            $table->unsignedBigInteger('promotions_id');
            $table->foreign('promotions_id')
                    ->references('id')
                    ->on('promotions')
                    ->cascade('update');

            $table->unsignedBigInteger('booklayouts_id');
            $table->foreign('booklayouts_id')
                    ->references('id')
                    ->on('booklayouts')
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
            $table->unsignedBigInteger('publishers_id');
            $table->foreign('publishers_id')
                    ->references('id')
                    ->on('publishers')
                    ->cascade('update');

            $table->unsignedBigInteger('languages_id');
            $table->foreign('languages_id')
                    ->references('id')
                    ->on('languages')
                    ->cascade('update');

            $table->unsignedBigInteger('promotions_id');
            $table->foreign('promotions_id')
                    ->references('id')
                    ->on('promotions')
                    ->cascade('update');

            $table->unsignedBigInteger('booklayouts_id');
            $table->foreign('booklayouts_id')
                    ->references('id')
                    ->on('booklayouts')
                    ->cascade('update');

        });
    }
}
