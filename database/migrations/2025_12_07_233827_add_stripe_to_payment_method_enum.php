<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Change enum to include stripe and cod
        DB::statement("ALTER TABLE orders MODIFY COLUMN payment_method ENUM('card', 'paypal', 'stripe', 'cod') NOT NULL");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("ALTER TABLE orders MODIFY COLUMN payment_method ENUM('card', 'paypal') NOT NULL");
    }
};
