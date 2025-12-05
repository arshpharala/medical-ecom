@extends('theme.medibazaar.layouts.app')

@section('content')
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area pt-125 pb-125" style="background-image:url({{ asset('theme/medibazaar/assets/img/bg/breadcrumb-bg.jpg') }})">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="breadcrumb-wrapper">
                    <div class="breadcrumb-text">
                        <h2>Order Confirmation</h2>
                    </div>
                    <ul class="breadcrumb-menu">
                        <li><a href="{{ route('home') }}">Home</a></li>
                        <li><span>Order Confirmation</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Order Confirmation Area Start -->
<section class="order-confirmation-area pt-100 pb-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="order-success-box text-center mb-50">
                    <div class="success-icon mb-4">
                        <i class="bi bi-check-circle-fill text-success" style="font-size: 80px;"></i>
                    </div>
                    <h2 class="mb-3">Thank You for Your Order!</h2>
                    <p class="lead">Your order has been placed successfully.</p>
                    <p class="order-number">
                        Order Number: <strong>{{ $order->order_number }}</strong>
                    </p>
                </div>

                <div class="order-details-box">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="order-info-box mb-4">
                                <h4><i class="bi bi-info-circle"></i> Order Information</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td>Order Number:</td>
                                        <td><strong>{{ $order->order_number }}</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Order Date:</td>
                                        <td>{{ $order->created_at->format('F d, Y h:i A') }}</td>
                                    </tr>
                                    <tr>
                                        <td>Payment Method:</td>
                                        <td>{{ ucfirst($order->payment_method) }}</td>
                                    </tr>
                                    <tr>
                                        <td>Order Status:</td>
                                        <td>
                                            <span class="badge bg-{{ $order->status === 'completed' ? 'success' : ($order->status === 'pending' ? 'warning' : 'info') }}">
                                                {{ ucfirst($order->status) }}
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="shipping-info-box mb-4">
                                <h4><i class="bi bi-truck"></i> Shipping Address</h4>
                                @if($order->address)
                                <address>
                                    <strong>{{ $order->address->first_name }} {{ $order->address->last_name }}</strong><br>
                                    {{ $order->address->address_line_1 }}<br>
                                    @if($order->address->address_line_2)
                                        {{ $order->address->address_line_2 }}<br>
                                    @endif
                                    {{ $order->address->city }}, {{ $order->address->province->name ?? '' }}<br>
                                    {{ $order->address->postal_code }}<br>
                                    Phone: {{ $order->address->phone }}
                                </address>
                                @endif
                            </div>
                        </div>
                    </div>

                    <div class="order-items-box">
                        <h4><i class="bi bi-bag"></i> Order Items</h4>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th class="text-center">Quantity</th>
                                        <th class="text-end">Price</th>
                                        <th class="text-end">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($order->lineItems as $item)
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                @if($item->productVariant && $item->productVariant->product)
                                                    <img src="{{ asset('storage/' . ($item->productVariant->image ?? $item->productVariant->product->image ?? 'default-product.jpg')) }}"
                                                         alt="{{ $item->productVariant->product->name }}"
                                                         style="width: 50px; height: 50px; object-fit: cover; margin-right: 15px;">
                                                @endif
                                                <div>
                                                    <strong>{{ $item->product_name }}</strong>
                                                    @if($item->variant_name)
                                                        <br><small class="text-muted">{{ $item->variant_name }}</small>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">{{ $item->qty }}</td>
                                        <td class="text-end">{{ $order->currency }} {{ number_format($item->price, 2) }}</td>
                                        <td class="text-end">{{ $order->currency }} {{ number_format($item->price * $item->qty, 2) }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="3" class="text-end"><strong>Subtotal:</strong></td>
                                        <td class="text-end">{{ $order->currency }} {{ number_format($order->subtotal, 2) }}</td>
                                    </tr>
                                    @if($order->discount > 0)
                                    <tr class="text-success">
                                        <td colspan="3" class="text-end">Discount:</td>
                                        <td class="text-end">- {{ $order->currency }} {{ number_format($order->discount, 2) }}</td>
                                    </tr>
                                    @endif
                                    <tr>
                                        <td colspan="3" class="text-end">Tax:</td>
                                        <td class="text-end">{{ $order->currency }} {{ number_format($order->tax, 2) }}</td>
                                    </tr>
                                    @if($order->shipping > 0)
                                    <tr>
                                        <td colspan="3" class="text-end">Shipping:</td>
                                        <td class="text-end">{{ $order->currency }} {{ number_format($order->shipping, 2) }}</td>
                                    </tr>
                                    @endif
                                    <tr class="table-active">
                                        <td colspan="3" class="text-end"><strong>Total:</strong></td>
                                        <td class="text-end"><strong>{{ $order->currency }} {{ number_format($order->total, 2) }}</strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="order-actions text-center mt-5">
                    @auth
                    <a href="{{ route('customers.profile') }}" class="c-btn theme-btn me-3">
                        <i class="bi bi-person"></i> View My Orders
                    </a>
                    @endauth
                    <a href="{{ route('products.index') }}" class="c-btn theme-btn-2">
                        <i class="bi bi-arrow-left"></i> Continue Shopping
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Order Confirmation Area End -->
@endsection

@push('styles')
<style>
.order-success-box {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
    padding: 50px 30px;
    border-radius: 15px;
}

.order-details-box {
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 2px 15px rgba(0,0,0,0.08);
}

.order-info-box,
.shipping-info-box {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
}

.order-info-box h4,
.shipping-info-box h4,
.order-items-box h4 {
    margin-bottom: 20px;
    color: #333;
    font-size: 18px;
}

.order-info-box h4 i,
.shipping-info-box h4 i,
.order-items-box h4 i {
    margin-right: 8px;
    color: var(--theme-color, #3B82F6);
}

.order-number {
    font-size: 18px;
    background: #fff;
    display: inline-block;
    padding: 10px 25px;
    border-radius: 30px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.order-items-box {
    margin-top: 30px;
    padding-top: 30px;
    border-top: 1px solid #eee;
}

.order-actions .c-btn {
    padding: 12px 30px;
}
</style>
@endpush
