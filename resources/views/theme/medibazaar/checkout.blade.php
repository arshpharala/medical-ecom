@extends('theme.medibazaar.layouts.app')

@section('content')
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area pt-125 pb-125" style="background-image:url({{ asset('theme/medibazaar/assets/img/bg/breadcrumb-bg.jpg') }})">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="breadcrumb-wrapper">
                    <div class="breadcrumb-text">
                        <h2>Checkout</h2>
                    </div>
                    <ul class="breadcrumb-menu">
                        <li><a href="{{ route('home') }}">Home</a></li>
                        <li><a href="{{ route('cart.index') }}">Cart</a></li>
                        <li><span>Checkout</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Checkout Area Start -->
<section class="checkout-area pt-100 pb-100">
    <div class="container">
        <form id="checkout-form" method="POST" action="{{ route('checkout') }}">
            @csrf
            <div class="row">
                <div class="col-lg-6">
                    <div class="checkbox-form">
                        <h3>Billing Details</h3>

                        @guest
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="alert alert-info">
                                    <p class="mb-0">Already have an account? <a href="{{ route('login') }}">Login</a> for faster checkout</p>
                                </div>
                            </div>
                        </div>
                        @endguest

                        @auth
                        @if($addresses->count() > 0)
                        <div class="row mb-4">
                            <div class="col-12">
                                <label class="form-label">Select Saved Address</label>
                                <select name="address_id" id="saved-address" class="form-select">
                                    <option value="">-- Enter new address --</option>
                                    @foreach($addresses as $address)
                                    <option value="{{ $address->id }}"
                                        data-name="{{ $address->first_name }} {{ $address->last_name }}"
                                        data-phone="{{ $address->phone }}"
                                        data-address="{{ $address->address_line_1 }}"
                                        data-city="{{ $address->city }}"
                                        data-province="{{ $address->province_id }}"
                                        data-postal="{{ $address->postal_code }}">
                                        {{ $address->first_name }} {{ $address->last_name }} - {{ $address->address_line_1 }}, {{ $address->city }}
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        @endif
                        @endauth

                        <div id="address-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-3">
                                        <label>First Name <span class="required">*</span></label>
                                        <input type="text" name="first_name" value="{{ old('first_name', $user->first_name ?? '') }}"
                                               class="form-control @error('first_name') is-invalid @enderror" required>
                                        @error('first_name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-3">
                                        <label>Last Name <span class="required">*</span></label>
                                        <input type="text" name="last_name" value="{{ old('last_name', $user->last_name ?? '') }}"
                                               class="form-control @error('last_name') is-invalid @enderror" required>
                                        @error('last_name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            @guest
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-3">
                                        <label>Email Address <span class="required">*</span></label>
                                        <input type="email" name="email" value="{{ old('email') }}"
                                               class="form-control @error('email') is-invalid @enderror" required>
                                        @error('email')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            @endguest

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-3">
                                        <label>Phone <span class="required">*</span></label>
                                        <input type="tel" name="phone" value="{{ old('phone', $user->phone ?? '') }}"
                                               class="form-control @error('phone') is-invalid @enderror" required>
                                        @error('phone')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-3">
                                        <label>Address <span class="required">*</span></label>
                                        <input type="text" name="address_line_1" value="{{ old('address_line_1') }}"
                                               class="form-control @error('address_line_1') is-invalid @enderror"
                                               placeholder="Street address" required>
                                        @error('address_line_1')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-3">
                                        <label>Province/State <span class="required">*</span></label>
                                        <select name="province_id" id="province" class="form-select @error('province_id') is-invalid @enderror" required>
                                            <option value="">Select Province</option>
                                            @foreach($provinces as $province)
                                                <option value="{{ $province->id }}" {{ old('province_id') == $province->id ? 'selected' : '' }}>
                                                    {{ $province->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('province_id')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-3">
                                        <label>City <span class="required">*</span></label>
                                        <select name="city_id" id="city" class="form-select @error('city_id') is-invalid @enderror" required>
                                            <option value="">Select City</option>
                                        </select>
                                        @error('city_id')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-3">
                                        <label>Postal Code <span class="required">*</span></label>
                                        <input type="text" name="postal_code" value="{{ old('postal_code') }}"
                                               class="form-control @error('postal_code') is-invalid @enderror" required>
                                        @error('postal_code')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="checkout-form-list mb-3">
                                    <label>Order Notes (optional)</label>
                                    <textarea name="notes" rows="3" class="form-control"
                                              placeholder="Notes about your order, e.g. special delivery instructions">{{ old('notes') }}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="your-order mb-30">
                        <h3>Your Order</h3>
                        <div class="your-order-table table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="product-name">Product</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody id="order-items">
                                    <!-- Items will be loaded via AJAX or can be passed from controller -->
                                </tbody>
                                <tfoot>
                                    <tr class="cart-subtotal">
                                        <th>Subtotal</th>
                                        <td id="order-subtotal">Loading...</td>
                                    </tr>
                                    <tr class="cart-subtotal" id="discount-row" style="display: none;">
                                        <th>Discount</th>
                                        <td id="order-discount" class="text-success"></td>
                                    </tr>
                                    <tr class="cart-subtotal">
                                        <th>Tax</th>
                                        <td id="order-tax">Loading...</td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td id="order-total"><strong>Loading...</strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <div class="payment-method mt-4">
                            <h4>Payment Method</h4>

                            @foreach($gateways as $gateway)
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="payment_method"
                                       id="payment-{{ $gateway->slug }}" value="{{ $gateway->slug }}"
                                       {{ $loop->first ? 'checked' : '' }}>
                                <label class="form-check-label" for="payment-{{ $gateway->slug }}">
                                    @if($gateway->icon)
                                        <img src="{{ asset('storage/' . $gateway->icon) }}" alt="{{ $gateway->name }}" height="24">
                                    @endif
                                    {{ $gateway->name }}
                                </label>
                                @if($gateway->description)
                                    <small class="d-block text-muted">{{ $gateway->description }}</small>
                                @endif
                            </div>
                            @endforeach
                        </div>

                        <!-- Stripe Card Element -->
                        <div id="stripe-card-element" class="mt-4" style="display: none;">
                            <div id="card-element" class="form-control p-3">
                                <!-- Stripe Elements will be mounted here -->
                            </div>
                            <div id="card-errors" class="text-danger mt-2" role="alert"></div>
                        </div>

                        <!-- PayPal Button Container -->
                        <div id="paypal-button-container" class="mt-4" style="display: none;"></div>

                        <div class="order-button-payment mt-4">
                            <button type="submit" id="place-order-btn" class="c-btn theme-btn w-100">
                                Place Order
                            </button>
                        </div>

                        <input type="hidden" name="payment_intent_id" id="payment_intent_id">
                        <input type="hidden" name="paypal_order_id" id="paypal_order_id">
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Checkout Area End -->
@endsection

@push('scripts')
<script src="https://js.stripe.com/v3/"></script>
<script src="https://www.paypal.com/sdk/js?client-id={{ config('services.paypal.client_id') }}&currency=USD"></script>

<script>
$(document).ready(function() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content;

    // Load cart items
    loadCartItems();

    // Province -> City dependency
    $('#province').on('change', function() {
        const provinceId = $(this).val();
        if (provinceId) {
            $.get(`/api/provinces/${provinceId}/cities`, function(cities) {
                let options = '<option value="">Select City</option>';
                cities.forEach(city => {
                    options += `<option value="${city.id}">${city.name}</option>`;
                });
                $('#city').html(options);
            });
        }
    });

    // Saved address selection
    $('#saved-address').on('change', function() {
        const option = $(this).find(':selected');
        if (option.val()) {
            // Populate form with saved address data
            const name = option.data('name');
            const [firstName, ...lastNameParts] = name.split(' ');
            $('input[name="first_name"]').val(firstName);
            $('input[name="last_name"]').val(lastNameParts.join(' '));
            $('input[name="phone"]').val(option.data('phone'));
            $('input[name="address_line_1"]').val(option.data('address'));
            $('input[name="postal_code"]').val(option.data('postal'));
            $('#province').val(option.data('province')).trigger('change');

            setTimeout(() => {
                $('#city').val(option.data('city'));
            }, 500);
        }
    });

    // Payment method toggle
    $('input[name="payment_method"]').on('change', function() {
        const method = $(this).val();
        $('#stripe-card-element').hide();
        $('#paypal-button-container').hide();
        $('#place-order-btn').show();

        if (method === 'stripe') {
            $('#stripe-card-element').show();
            initStripe();
        } else if (method === 'paypal') {
            $('#paypal-button-container').show();
            $('#place-order-btn').hide();
            initPayPal();
        }
    });

    // Trigger initial payment method
    $('input[name="payment_method"]:checked').trigger('change');

    function loadCartItems() {
        $.get('/cart', function(response) {
            // Cart data should be loaded - using session data
        }).fail(function() {
            // Fallback - reload page or show error
        });

        // For now, let's make an AJAX call to get cart data
        $.ajax({
            url: '/api/cart',
            method: 'GET',
            success: function(cart) {
                updateOrderSummary(cart);
            },
            error: function() {
                // Cart data passed from controller can be used
                console.log('Using server-side cart data');
            }
        });
    }

    function updateOrderSummary(cart) {
        const currency = cart.currency || 'USD';
        let itemsHtml = '';

        if (cart.items) {
            Object.values(cart.items).forEach(item => {
                itemsHtml += `
                    <tr>
                        <td>${item.name || 'Product'} × ${item.qty}</td>
                        <td>${currency} ${(item.price * item.qty).toFixed(2)}</td>
                    </tr>
                `;
            });
        }

        $('#order-items').html(itemsHtml);
        $('#order-subtotal').text(`${currency} ${parseFloat(cart.subtotal || 0).toFixed(2)}`);
        $('#order-tax').text(`${currency} ${parseFloat(cart.tax || 0).toFixed(2)}`);
        $('#order-total').html(`<strong>${currency} ${parseFloat(cart.total || 0).toFixed(2)}</strong>`);

        if (cart.coupon && cart.coupon.discount > 0) {
            $('#discount-row').show();
            $('#order-discount').text(`-${currency} ${parseFloat(cart.coupon.discount).toFixed(2)}`);
        }
    }

    // Stripe initialization
    let stripe, cardElement;
    function initStripe() {
        if (stripe) return;

        stripe = Stripe('{{ config('services.stripe.key') }}');
        const elements = stripe.elements();
        cardElement = elements.create('card', {
            style: {
                base: {
                    fontSize: '16px',
                    color: '#32325d',
                }
            }
        });
        cardElement.mount('#card-element');

        cardElement.on('change', function(event) {
            const displayError = document.getElementById('card-errors');
            if (event.error) {
                displayError.textContent = event.error.message;
            } else {
                displayError.textContent = '';
            }
        });
    }

    // PayPal initialization
    let paypalInitialized = false;
    function initPayPal() {
        if (paypalInitialized) return;
        paypalInitialized = true;

        paypal.Buttons({
            createOrder: function(data, actions) {
                // Get form data and validate
                if (!validateForm()) {
                    return Promise.reject('Please fill in all required fields');
                }

                return fetch('/checkout/paypal/create', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken
                    },
                    body: JSON.stringify(getFormData())
                }).then(res => res.json()).then(data => {
                    return data.id;
                });
            },
            onApprove: function(data, actions) {
                $('#paypal_order_id').val(data.orderID);
                return fetch('/checkout/paypal/capture/' + data.orderID, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken
                    },
                    body: JSON.stringify(getFormData())
                }).then(res => res.json()).then(data => {
                    if (data.success) {
                        window.location.href = data.redirect;
                    } else {
                        alert(data.message || 'Payment failed');
                    }
                });
            },
            onError: function(err) {
                console.error('PayPal error:', err);
                alert('An error occurred with PayPal. Please try again.');
            }
        }).render('#paypal-button-container');
    }

    // Form submission for Stripe
    $('#checkout-form').on('submit', async function(e) {
        e.preventDefault();

        if (!validateForm()) {
            return false;
        }

        const paymentMethod = $('input[name="payment_method"]:checked').val();

        if (paymentMethod === 'stripe') {
            $('#place-order-btn').prop('disabled', true).text('Processing...');

            const {error, paymentMethod: pm} = await stripe.createPaymentMethod({
                type: 'card',
                card: cardElement,
            });

            if (error) {
                $('#card-errors').text(error.message);
                $('#place-order-btn').prop('disabled', false).text('Place Order');
                return;
            }

            // Add payment method ID to form
            $('<input>').attr({
                type: 'hidden',
                name: 'payment_method_id',
                value: pm.id
            }).appendTo('#checkout-form');
        } else if (paymentMethod === 'cod') {
            $('#place-order-btn').prop('disabled', true).text('Processing...');
        }

        // Submit form
        this.submit();
    });

    function validateForm() {
        const required = ['first_name', 'last_name', 'phone', 'address_line_1', 'province_id', 'city_id', 'postal_code'];
        @guest
        required.push('email');
        @endguest

        let isValid = true;
        required.forEach(field => {
            const input = $(`[name="${field}"]`);
            if (!input.val()) {
                input.addClass('is-invalid');
                isValid = false;
            } else {
                input.removeClass('is-invalid');
            }
        });

        if (!isValid) {
            alert('Please fill in all required fields');
        }

        return isValid;
    }

    function getFormData() {
        return {
            first_name: $('[name="first_name"]').val(),
            last_name: $('[name="last_name"]').val(),
            email: $('[name="email"]').val(),
            phone: $('[name="phone"]').val(),
            address_line_1: $('[name="address_line_1"]').val(),
            province_id: $('[name="province_id"]').val(),
            city_id: $('[name="city_id"]').val(),
            postal_code: $('[name="postal_code"]').val(),
            notes: $('[name="notes"]').val(),
            payment_method: $('[name="payment_method"]:checked').val()
        };
    }
});
</script>
@endpush

@push('styles')
<style>
.your-order {
    background: #f5f5f5;
    padding: 30px;
    border-radius: 8px;
}

.your-order h3 {
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 15px;
}

.your-order-table table {
    width: 100%;
}

.your-order-table th,
.your-order-table td {
    padding: 12px 0;
    border-bottom: 1px solid #ddd;
}

.payment-method h4 {
    margin-bottom: 15px;
}

.checkout-form-list label {
    display: block;
    margin-bottom: 5px;
    font-weight: 500;
}

.checkout-form-list .required {
    color: red;
}

#card-element {
    border: 1px solid #ddd;
    border-radius: 4px;
}

.order-button-payment .c-btn {
    font-size: 18px;
    padding: 15px 30px;
}
</style>
@endpush
