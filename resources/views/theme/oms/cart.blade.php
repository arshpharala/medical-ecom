@extends('theme.oms.layouts.app')
@section('content')
    <!-- breadcrumb-area-start -->
    <div class="breadcrumb-area pt-125 pb-125" style="background-image:url({{ asset('storage/' . ($page->banner ?? 'default-banner.jpg')) }})">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-wrapper">
                        <div class="breadcrumb-text">
                            <h2>Shopping Cart</h2>
                        </div>
                        <ul class="breadcrumb-menu">
                            <li><a href="{{ route('home') }}">Home</a></li>
                            <li><span>Cart</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area-end -->

    <!-- Cart Area Start -->
    <section class="cart-area pt-100 pb-100">
        <div class="container">
            @if($variants->count() > 0)
            <div class="row">
                <div class="col-12">
                    <div class="table-content table-responsive">
                        <table class="table" id="cart-table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Images</th>
                                    <th class="cart-product-name">Product</th>
                                    <th class="product-price">Unit Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($variants as $variant)
                                <tr data-variant-id="{{ $variant->id }}">
                                    <td class="product-thumbnail">
                                        <a href="{{ $variant->link }}">
                                            <img src="{{ $variant->image ?? asset('theme/medibazaar/assets/img/product/default.jpg') }}"
                                                 alt="{{ $variant->name }}"
                                                 style="width: 80px; height: 80px; object-fit: cover;">
                                        </a>
                                    </td>
                                    <td class="product-name">
                                        <a href="{{ $variant->link }}">
                                            {{ $variant->name }}
                                        </a>
                                        @if($variant->sku)
                                            <br><small class="text-muted">SKU: {{ $variant->sku }}</small>
                                        @endif
                                    </td>
                                    <td class="product-price">
                                        <span class="amount">{!! $variant->price_with_currency !!}</span>
                                    </td>
                                    <td class="product-quantity">
                                        <div class="quantity-control d-flex align-items-center justify-content-center">
                                            <button type="button" class="btn btn-outline-secondary qty-dec" data-variant-id="{{ $variant->id }}">−</button>
                                            <input type="number"
                                                   class="form-control text-center cart-qty-input mx-2"
                                                   value="{{ $variant->qty }}"
                                                   min="1"
                                                   style="width: 60px;"
                                                   data-variant-id="{{ $variant->id }}"
                                                   data-price="{{ $variant->price }}">
                                            <button type="button" class="btn btn-outline-secondary qty-inc" data-variant-id="{{ $variant->id }}">+</button>
                                        </div>
                                    </td>
                                    <td class="product-subtotal">
                                        <span class="amount item-subtotal">{!! $variant->currency !!} {{ number_format($variant->price * $variant->qty, 2) }}</span>
                                    </td>
                                    <td class="product-remove">
                                        <button type="button" class="btn-remove-item" data-variant-id="{{ $variant->id }}">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="coupon-all">
                                <div class="coupon d-flex gap-2">
                                    <input id="coupon_code" class="input-text form-control" name="coupon_code" value="{{ $cart['coupon']['code'] ?? '' }}"
                                        placeholder="Enter coupon code" type="text" style="max-width: 250px;">
                                    <button class="c-btn theme-btn-2" id="apply-coupon" type="button">Apply Coupon</button>
                                    @if(!empty($cart['coupon']['code']))
                                        <button class="c-btn btn-danger" id="remove-coupon" type="button">Remove</button>
                                    @endif
                                </div>
                                @if(!empty($cart['coupon']['code']))
                                    <div class="coupon-applied mt-2 text-success">
                                        <i class="fa fa-check-circle"></i> Coupon "{{ $cart['coupon']['code'] }}" applied!
                                        Discount: {{ $cart['coupon']['currency'] ?? 'USD' }} {{ number_format($cart['coupon']['discount'] ?? 0, 2) }}
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="cart-page-total float-end">
                                <h2>Cart Totals</h2>
                                <ul class="mb-20">
                                    <li>Subtotal <span id="cart-subtotal">{!! $cart['subTotal_with_currency'] ?? '' !!}</span></li>
                                    @if(($cart['coupon']['discount'] ?? 0) > 0)
                                    <li class="text-success">Discount <span id="cart-discount">- {!! $cart['coupon']['discount_with_currency'] ?? '' !!}</span></li>
                                    @endif
                                    <li>Tax <span id="cart-tax">{!! $cart['tax_with_currency'] ?? '' !!}</span></li>
                                    <li><strong>Total</strong> <span id="cart-total"><strong>{!! $cart['total_with_currency'] ?? '' !!}</strong></span></li>
                                </ul>
                                <a class="c-btn theme-btn" href="{{ route('checkout') }}">Proceed to Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @else
            <div class="row">
                <div class="col-12 text-center py-5">
                    <div class="empty-cart">
                        <i class="far fa-cart-plus" style="font-size: 80px; color: #ccc;"></i>
                        <h3 class="mt-4">Your cart is empty</h3>
                        <p class="text-muted">Looks like you haven't added any items to your cart yet.</p>
                        <a href="{{ route('products') }}" class="c-btn theme-btn mt-3">Continue Shopping</a>
                    </div>
                </div>
            </div>
            @endif
        </div>
    </section>
    <!-- Cart Area End -->
@endsection

@push('scripts')
<script>
$(document).ready(function() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content;

    // Quantity increment
    $(document).on('click', '.qty-inc', function(e) {
        e.preventDefault();
        e.stopPropagation();
        const variantId = $(this).attr('data-variant-id');
        const $input = $(this).siblings('.cart-qty-input');
        let qty = parseInt($input.val()) + 1;
        $input.val(qty);
        updateCartItem(variantId, qty);
    });

    // Quantity decrement
    $(document).on('click', '.qty-dec', function(e) {
        e.preventDefault();
        e.stopPropagation();
        const variantId = $(this).attr('data-variant-id');
        const $input = $(this).siblings('.cart-qty-input');
        let qty = parseInt($input.val()) - 1;
        if (qty < 1) qty = 1;
        $input.val(qty);
        updateCartItem(variantId, qty);
    });

    // Manual quantity change
    $(document).on('change', '.cart-qty-input', function() {
        const variantId = $(this).attr('data-variant-id');
        let qty = parseInt($(this).val());
        if (qty < 1) qty = 1;
        $(this).val(qty);
        updateCartItem(variantId, qty);
    });

    // Remove item
    $(document).on('click', '.btn-remove-item', function() {
        const variantId = $(this).attr('data-variant-id');
        removeCartItem(variantId);
    });

    // Apply coupon
    $('#apply-coupon').on('click', function() {
        const code = $('#coupon_code').val().trim();
        if (!code) {
            alert('Please enter a coupon code');
            return;
        }
        applyCoupon(code);
    });

    // Remove coupon
    $('#remove-coupon').on('click', function() {
        removeCoupon();
    });

    function updateCartItem(variantId, qty) {
        $.ajax({
            url: `/cart/${variantId}`,
            method: 'PUT',
            data: { qty: qty },
            headers: { 'X-CSRF-TOKEN': csrfToken },
            success: function(response) {
                if (response.success) {
                    updateCartDisplay(response.cart);
                    updateRowSubtotal(variantId, response.variant);
                }
            },
            error: function(xhr) {
                console.error('Error updating cart:', xhr);
                alert('Failed to update cart. Please try again.');
            }
        });
    }

    function removeCartItem(variantId) {
        if (!confirm('Are you sure you want to remove this item?')) return;

        $.ajax({
            url: `/cart/${variantId}`,
            method: 'DELETE',
            headers: { 'X-CSRF-TOKEN': csrfToken },
            success: function(response) {
                if (response.success) {
                    $(`tr[data-variant-id="${variantId}"]`).fadeOut(300, function() {
                        $(this).remove();
                        if ($('#cart-table tbody tr').length === 0) {
                            location.reload();
                        }
                    });
                    updateCartDisplay(response.cart);
                }
            },
            error: function(xhr) {
                console.error('Error removing item:', xhr);
                alert('Failed to remove item. Please try again.');
            }
        });
    }

    function applyCoupon(code) {
        $.ajax({
            url: '/ajax/coupon/apply',
            method: 'POST',
            data: { code: code },
            headers: { 'X-CSRF-TOKEN': csrfToken },
            success: function(response) {
                if (response.success) {
                    location.reload();
                } else {
                    alert(response.message || 'Invalid coupon code');
                }
            },
            error: function(xhr) {
                const msg = xhr.responseJSON?.message || 'Failed to apply coupon';
                alert(msg);
            }
        });
    }

    function removeCoupon() {
        $.ajax({
            url: '/ajax/coupon/remove',
            method: 'POST',
            headers: { 'X-CSRF-TOKEN': csrfToken },
            success: function(response) {
                if (response.success) {
                    location.reload();
                }
            },
            error: function(xhr) {
                console.error('Error removing coupon:', xhr);
            }
        });
    }

    function updateCartDisplay(cart) {
        // Update totals using the formatted values from server
        if (cart.subTotal_with_currency) {
            $('#cart-subtotal').html(cart.subTotal_with_currency);
        }
        if (cart.tax_with_currency) {
            $('#cart-tax').html(cart.tax_with_currency);
        }
        if (cart.total_with_currency) {
            $('#cart-total').html(`<strong>${cart.total_with_currency}</strong>`);
        }

        // Update header cart count - number of unique items
        const itemCount = cart.count || Object.keys(cart.items || {}).length;
        $('.cart-count').each(function() {
            $(this).text(itemCount);
            if (itemCount > 0) {
                $(this).css('display', 'flex');
            } else {
                $(this).css('display', 'none');
            }
        });
    }

    function updateRowSubtotal(variantId, variant) {
        const row = $(`tr[data-variant-id="${variantId}"]`);
        const qty = parseInt(row.find('.cart-qty-input').val());
        const price = parseFloat(variant.cart_item?.price || row.find('.cart-qty-input').data('price'));
        const subtotal = (price * qty).toFixed(2);
        row.find('.item-subtotal').text(`{{ active_currency() }} ${subtotal}`);
    }
});
</script>
@endpush
