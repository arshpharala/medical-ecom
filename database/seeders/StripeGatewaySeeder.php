<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\CMS\PaymentGateway;

class StripeGatewaySeeder extends Seeder
{
    public function run(): void
    {
        PaymentGateway::updateOrCreate(
            ['gateway' => 'stripe'],
            [
                'key' => 'pk_test_51SNTLzHdtcETBVzjLx2V59wy2vhu6blNuiZNVdsnZE2tqBrdu9C4tRQ93lLJI6YNBBH5BQ01fURKgnBlDRm2biwg00XTW8JDql',
                'secret' => 'sk_test_51SNTLzHdtcETBVzjGQBuIJqav7ljRi1hiXR3F1goIDduu8lWy9xHe8a6i33MHquwE1gGVVvWZoxk5vLIIAqgzLoP006DGN7Io5',
                'is_active' => true,
            ]
        );
    }
}
