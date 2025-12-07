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
                                        data-name="{{ $address->name }}"
                                        data-phone="{{ $address->phone }}"
                                        data-address="{{ $address->address }}"
                                        data-city="{{ $address->city_id }}"
                                        data-province="{{ $address->province_id }}">
                                        {{ $address->name }} - {{ $address->address }}@if($address->city), {{ $address->city->name ?? '' }}@endif
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        @endif
                        @endauth

                        <div id="address-form">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-3">
                                        <label>Full Name <span class="required">*</span></label>
                                        <input type="text" name="name" value="{{ old('name', isset($user) ? $user->name : '') }}"
                                               class="form-control @error('name') is-invalid @enderror" required>
                                        @error('name')
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
                                        <input type="text" name="address" value="{{ old('address') }}"
                                               class="form-control @error('address') is-invalid @enderror"
                                               placeholder="Street address" required>
                                        @error('address')
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
                                        <label>Area</label>
                                        <select name="area_id" id="area" class="form-select @error('area_id') is-invalid @enderror">
                                            <option value="">Select Area (optional)</option>
                                        </select>
                                        @error('area_id')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-3">
                                        <label>Landmark</label>
                                        <input type="text" name="landmark" value="{{ old('landmark') }}"
                                               class="form-control @error('landmark') is-invalid @enderror"
                                               placeholder="Near...">
                                        @error('landmark')
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
                                    @foreach($variants as $variant)
                                    <tr>
                                        <td>{{ $variant->name }} × {{ $variant->qty }}</td>
                                        <td>{{ price_format(active_currency(), $variant->price * $variant->qty) }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr class="cart-subtotal">
                                        <th>Subtotal</th>
                                        <td>{{ $cart['subTotal_with_currency'] }}</td>
                                    </tr>
                                    @if($cart['discount'] > 0)
                                    <tr class="cart-subtotal">
                                        <th>Discount</th>
                                        <td class="text-success">-{{ $cart['discount_with_currency'] }}</td>
                                    </tr>
                                    @endif
                                    <tr class="cart-subtotal">
                                        <th>Tax</th>
                                        <td>{{ $cart['tax_with_currency'] }}</td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td><strong>{{ $cart['total_with_currency'] }}</strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <div class="payment-method mt-4">
                            <h4>Payment Method</h4>

                            @foreach($gateways as $gateway)
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="payment_method"
                                       id="payment-{{ $gateway->gateway }}" value="{{ $gateway->gateway }}"
                                       {{ $loop->first ? 'checked' : '' }}>
                                <label class="form-check-label" for="payment-{{ $gateway->gateway }}">
                                    <i class="bi bi-credit-card me-2"></i>
                                    {{ ucfirst($gateway->gateway) }}
                                </label>
                            </div>
                            @endforeach
                        </div>

                        <!-- Stripe Card Element -->
                        <div id="stripe-card-element" class="mt-4" style="display: none;">
                            <label class="form-label mb-2"><strong>Card Details</strong></label>
                            <div id="card-element" class="form-control p-3" style="min-height: 50px;">
                                <!-- Stripe Elements will be mounted here -->
                            </div>
                            <div id="card-errors" class="text-danger mt-2" role="alert"></div>
                            <small class="text-muted mt-2 d-block">
                                <i class="bi bi-shield-lock"></i> Your payment is secured with SSL encryption
                            </small>
                        </div>

                        <!-- PayPal Button Container -->
                        <div id="paypal-button-container" class="mt-4" style="display: none;"></div>

                        <div class="order-button-payment mt-4">
                            <button type="button" id="place-order-btn" class="c-btn theme-btn w-100">
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
@if(config('services.paypal.client_id'))
<script src="https://www.paypal.com/sdk/js?client-id={{ config('services.paypal.client_id') }}&currency=USD"></script>
@endif

<script>
$(document).ready(function() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content;
    const stripePublishableKey = @json($stripeKey ?? null);

    // Declare Stripe variables at the top
    let stripe = null;
    let cardElement = null;
    let paypalInitialized = false;

    // Stripe initialization function
    function initStripe() {
        if (stripe) {
            console.log('Stripe already initialized');
            return;
        }

        console.log('Initializing Stripe with key:', stripePublishableKey ? 'present' : 'missing');

        if (!stripePublishableKey) {
            console.error('Stripe publishable key not configured');
            $('#card-errors').text('Stripe is not configured. Please contact support.');
            return;
        }

        try {
            stripe = Stripe(stripePublishableKey);
            const elements = stripe.elements();
            cardElement = elements.create('card', {
                style: {
                    base: {
                        fontSize: '16px',
                        color: '#32325d',
                        fontFamily: 'Arial, sans-serif',
                        '::placeholder': {
                            color: '#aab7c4'
                        }
                    },
                    invalid: {
                        color: '#fa755a',
                        iconColor: '#fa755a'
                    }
                }
            });
            cardElement.mount('#card-element');
            console.log('Stripe card element mounted successfully');

            cardElement.on('change', function(event) {
                const displayError = document.getElementById('card-errors');
                if (event.error) {
                    displayError.textContent = event.error.message;
                } else {
                    displayError.textContent = '';
                }
            });
        } catch(err) {
            console.error('Stripe initialization error:', err);
            $('#card-errors').text('Failed to initialize payment. Please refresh the page.');
        }
    }

    // PayPal initialization function
    function initPayPal() {
        if (paypalInitialized || typeof paypal === 'undefined') return;
        paypalInitialized = true;

        paypal.Buttons({
            createOrder: function(data, actions) {
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
                }).then(res => res.json()).then(data => data.id);
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
                    if (data.redirect) {
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

    // Validation function
    function validateForm() {
        const required = ['name', 'phone', 'address', 'province_id', 'city_id'];
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

    // Get form data helper
    function getFormData() {
        return {
            name: $('[name="name"]').val(),
            email: $('[name="email"]').val(),
            phone: $('[name="phone"]').val(),
            address: $('[name="address"]').val(),
            province_id: $('[name="province_id"]').val(),
            city_id: $('[name="city_id"]').val(),
            area_id: $('[name="area_id"]').val(),
            landmark: $('[name="landmark"]').val(),
            notes: $('[name="notes"]').val(),
            payment_method: $('[name="payment_method"]:checked').val()
        };
    }

    // Province -> City dependency
    $('#province').on('change', function() {
        const provinceId = $(this).val();
        $('#city').html('<option value="">Select City</option>');
        $('#area').html('<option value="">Select Area (optional)</option>');
        if (provinceId) {
            $.get(`{{ url('/ajax/cities') }}/${provinceId}`, function(response) {
                let options = '<option value="">Select City</option>';
                if (Array.isArray(response)) {
                    response.forEach(city => {
                        options += `<option value="${city.id}">${city.name}</option>`;
                    });
                }
                $('#city').html(options);
            });
        }
    });

    // City -> Area dependency
    $('#city').on('change', function() {
        const cityId = $(this).val();
        $('#area').html('<option value="">Select Area (optional)</option>');
        if (cityId) {
            $.get(`{{ url('/ajax/areas') }}/${cityId}`, function(response) {
                let options = '<option value="">Select Area (optional)</option>';
                if (Array.isArray(response)) {
                    response.forEach(area => {
                        options += `<option value="${area.id}">${area.name}</option>`;
                    });
                }
                $('#area').html(options);
            });
        }
    });

    // Saved address selection
    $('#saved-address').on('change', function() {
        const option = $(this).find(':selected');
        if (option.val()) {
            $('input[name="name"]').val(option.data('name'));
            $('input[name="phone"]').val(option.data('phone'));
            $('input[name="address"]').val(option.data('address'));
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

    // Place Order button click handler
    $('#place-order-btn').on('click', async function(e) {
        e.preventDefault();
        console.log('Place Order clicked');

        if (!validateForm()) {
            return false;
        }

        const paymentMethod = $('input[name="payment_method"]:checked').val();
        const form = $('#checkout-form');
        console.log('Payment method:', paymentMethod);

        if (paymentMethod === 'stripe') {
            if (!stripe || !cardElement) {
                console.error('Stripe not initialized');
                alert('Payment system is loading. Please wait a moment and try again.');
                initStripe(); // Try to initialize again
                return;
            }

            $('#place-order-btn').prop('disabled', true).text('Processing...');
            $('#card-errors').text('');

            try {
                console.log('Creating payment method...');
                const {error, paymentMethod: pm} = await stripe.createPaymentMethod({
                    type: 'card',
                    card: cardElement,
                });

                if (error) {
                    console.error('Stripe error:', error);
                    $('#card-errors').text(error.message);
                    $('#place-order-btn').prop('disabled', false).text('Place Order');
                    return;
                }

                console.log('Payment method created:', pm.id);

                // Submit order to server via AJAX
                const formData = new FormData(form[0]);
                formData.append('payment_method_id', pm.id);

                const response = await fetch(form.attr('action'), {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': csrfToken,
                        'Accept': 'application/json',
                    },
                    body: formData
                });

                const result = await response.json();
                console.log('Server response:', result);

                if (!response.ok) {
                    throw new Error(result.message || 'An error occurred');
                }

                // Handle Stripe confirmation if clientSecret is returned
                if (result.clientSecret) {
                    console.log('Confirming card payment...');
                    const { error: confirmError, paymentIntent } = await stripe.confirmCardPayment(result.clientSecret, {
                        payment_method: pm.id
                    });

                    if (confirmError) {
                        console.error('Confirm error:', confirmError);
                        $('#card-errors').text(confirmError.message);
                        $('#place-order-btn').prop('disabled', false).text('Place Order');
                        return;
                    }

                    console.log('Payment confirmed, sending to server...');
                    // Payment succeeded, confirm with server
                    const confirmResponse = await fetch('{{ route("stripe.confirm-payment") }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken,
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify({
                            order_id: result.order_id,
                            payment_intent_id: paymentIntent.id
                        })
                    });

                    const confirmResult = await confirmResponse.json();
                    console.log('Confirm result:', confirmResult);

                    if (confirmResult.redirect) {
                        window.location.href = confirmResult.redirect;
                    } else {
                        throw new Error('Payment confirmed but redirect URL missing');
                    }
                } else if (result.redirect) {
                    window.location.href = result.redirect;
                } else {
                    throw new Error('Unexpected response from server');
                }

            } catch (err) {
                console.error('Checkout error:', err);
                $('#card-errors').text(err.message || 'An error occurred during checkout');
                $('#place-order-btn').prop('disabled', false).text('Place Order');
            }
        } else if (paymentMethod === 'cod') {
            $('#place-order-btn').prop('disabled', true).text('Processing...');
            $('#checkout-form')[0].submit();
        }
    });

    // Trigger initial payment method after everything is set up
    setTimeout(function() {
        $('input[name="payment_method"]:checked').trigger('change');
    }, 100);
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
    background: #fff;
    min-height: 44px;
}

.order-button-payment .c-btn {
    font-size: 18px;
    padding: 15px 30px;
}

/* Fix select styling */
.checkout-form-list select,
.form-select {
    width: 100%;
    padding: 10px 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #fff;
    font-size: 14px;
    color: #333;
    appearance: auto;
    -webkit-appearance: auto;
    -moz-appearance: auto;
    cursor: pointer;
}

.checkout-form-list select:focus,
.form-select:focus {
    border-color: #00a8ff;
    outline: none;
    box-shadow: 0 0 0 2px rgba(0, 168, 255, 0.1);
}

.checkout-form-list input,
.checkout-form-list textarea {
    width: 100%;
    padding: 10px 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.checkout-form-list input:focus,
.checkout-form-list textarea:focus {
    border-color: #00a8ff;
    outline: none;
    box-shadow: 0 0 0 2px rgba(0, 168, 255, 0.1);
}

/* Payment method styling */
.payment-method .form-check {
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background: #fff;
}

.payment-method .form-check:hover {
    border-color: #00a8ff;
}

.payment-method .form-check-input:checked + .form-check-label {
    color: #00a8ff;
}

.form-check-label {
    cursor: pointer;
    font-weight: 500;
}
</style>
@endpush
