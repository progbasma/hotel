<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('ht_bookings', function (Blueprint $table) {
            $table->after('sub_total', function () use ($table) {
                $table->unsignedDecimal('coupon_amount', 15)->default(0);
                $table->string('coupon_code', 20)->nullable();
            });
        });
    }

    public function down(): void
    {
        Schema::table('ht_bookings', function (Blueprint $table) {
            $table->dropColumn(['coupon_amount', 'coupon_code']);
        });
    }
};
