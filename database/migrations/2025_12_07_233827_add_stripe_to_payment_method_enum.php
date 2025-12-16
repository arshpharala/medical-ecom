<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Change enum to include stripe and cod
        DB::statement("ALTER TABLE ec_orders MODIFY COLUMN payment_method ENUM('card', 'paypal', 'stripe', 'cod') NOT NULL");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("ALTER TABLE ec_orders MODIFY COLUMN payment_method ENUM('card', 'paypal') NOT NULL");
    }
};
