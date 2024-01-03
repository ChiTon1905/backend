<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddReceiverColumnToOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('receiver')->nullable();
            $table->string('email_receiver')->nullable();
            $table->string('address_receiver')->nullable();
            $table->string('phone_receiver')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
           $table->dropColumn('receiver');
           $table->dropColumn('email_receiver');
           $table->dropColumn('phone_receiver');
           $table->dropColumn('address_receiver');
        });
    }
}
