<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class ChangeColumnTypeInTableOrder extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->integer('new_total')->after('total');
        });

        DB::table('orders')->update(['new_total' => DB::raw('CAST(total AS SIGNED)')]);

        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('total');
            $table->renameColumn('new_total', 'total');
        });
    }

    public function down()
    {
        // Đảo ngược quá trình
        Schema::table('orders', function (Blueprint $table) {
            $table->float('new_total', 8, 2)->after('total');
        });

        DB::table('orders')->update(['new_total' => DB::raw('CAST(total AS DECIMAL(8,2))')]);

        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('total');
            $table->renameColumn('new_total', 'total');
        });
    }
}
