<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use League\CommonMark\Reference\Reference;
use Illuminate\Database\Migrations\Migration;

class CreateImageTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(Schema::hasTable('images')) return;
        Schema::create('images', function (Blueprint $table) {
            $table->id();
            $table->string('image_path');

            $table->unsignedBigInteger('book_id');
            $table->foreign('book_id')
                    ->references('id')
                    ->on('books')
                    ->onDelete('cascade')
                    ->onDelete('cascade');

            $table->timestamps();
        });

        //DB::statement('INSERT INTO image (image_path, book_id) SELECT image_path, id FROM books');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('image');
        {/*Schema::table('books', function (Blueprint $table) {
            $table->dropColumn('image_path');
            $table->dropColumn('author_id');
        });*/}
    }
}
