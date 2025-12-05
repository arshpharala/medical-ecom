@extends('theme.medibazaar.layouts.app')

@section('content')
    <!-- breadcrumb-area-start -->
    <div class="breadcrumb-area pt-125 pb-125" style="background-color: #f5f5f5;">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-wrapper">
                        <div class="breadcrumb-text">
                            <h2>My Account</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area-end -->

    <!-- Profile Area Start -->
    <section class="profile-area pt-80 pb-80">
        <div class="container">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-lg-3 col-md-4">
                    <div class="profile-sidebar mb-30">
                        <div class="profile-user-info text-center p-4" style="background: #f8f9fa; border-radius: 8px;">
                            <div class="profile-avatar mb-3">
                                <i class="fas fa-user-circle" style="font-size: 80px; color: #007bff;"></i>
                            </div>
                            <h5 class="mb-1">{{ $user->name }}</h5>
                            <p class="text-muted mb-0">{{ $user->email }}</p>
                        </div>

                        <div class="profile-menu mt-4">
                            <ul class="list-unstyled">
                                <li class="mb-2">
                                    <a href="#orders" class="d-block p-3 bg-light rounded active-tab" data-tab="orders" style="text-decoration: none; color: #333;">
                                        <i class="fas fa-shopping-bag me-2"></i> My Orders
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <a href="#account" class="d-block p-3 bg-light rounded" data-tab="account" style="text-decoration: none; color: #333;">
                                        <i class="fas fa-user me-2"></i> Account Details
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <form action="{{ route('logout') }}" method="POST">
                                        @csrf
                                        <button type="submit" class="d-block w-100 p-3 bg-light rounded border-0 text-start" style="cursor: pointer;">
                                            <i class="fas fa-sign-out-alt me-2"></i> Logout
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-lg-9 col-md-8">
                    <!-- Orders Tab -->
                    <div id="orders-tab" class="profile-tab-content">
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="mb-0">My Orders</h4>
                            </div>
                            <div class="card-body">
                                @if($user->orders->count() > 0)
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Order #</th>
                                                    <th>Date</th>
                                                    <th>Items</th>
                                                    <th>Total</th>
                                                    <th>Payment Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($user->orders as $order)
                                                    <tr>
                                                        <td>
                                                            <strong>{{ $order->reference_number }}</strong>
                                                        </td>
                                                        <td>{{ $order->created_at->format('M d, Y') }}</td>
                                                        <td>{{ $order->lineItems->count() }} item(s)</td>
                                                        <td>
                                                            <strong>
                                                                {{ $order->currency->symbol ?? '$' }}{{ number_format($order->total, 2) }}
                                                            </strong>
                                                        </td>
                                                        <td>
                                                            @php
                                                                $statusClass = match($order->payment_status) {
                                                                    'paid' => 'success',
                                                                    'pending' => 'warning',
                                                                    'failed' => 'danger',
                                                                    default => 'secondary'
                                                                };
                                                            @endphp
                                                            <span class="badge bg-{{ $statusClass }}">
                                                                {{ ucfirst($order->payment_status ?? 'Pending') }}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <button type="button"
                                                                    class="btn btn-sm btn-outline-primary view-order-btn"
                                                                    data-order-id="{{ $order->id }}"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#orderModal{{ $order->id }}">
                                                                View Details
                                                            </button>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Order Detail Modals -->
                                    @foreach($user->orders as $order)
                                        <div class="modal fade" id="orderModal{{ $order->id }}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Order Details - {{ $order->reference_number }}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row mb-4">
                                                            <div class="col-md-6">
                                                                <h6>Order Information</h6>
                                                                <p class="mb-1"><strong>Order #:</strong> {{ $order->reference_number }}</p>
                                                                <p class="mb-1"><strong>Date:</strong> {{ $order->created_at->format('M d, Y h:i A') }}</p>
                                                                <p class="mb-1"><strong>Payment Method:</strong> {{ ucfirst($order->payment_method ?? 'N/A') }}</p>
                                                                <p class="mb-0"><strong>Payment Status:</strong>
                                                                    <span class="badge bg-{{ $statusClass }}">{{ ucfirst($order->payment_status ?? 'Pending') }}</span>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <h6>Billing Address</h6>
                                                                @if($order->billingAddress)
                                                                    <p class="mb-0">
                                                                        {{ $order->billingAddress->name ?? '' }}<br>
                                                                        {{ $order->billingAddress->address ?? '' }}<br>
                                                                        {{ $order->billingAddress->city->name ?? '' }}, {{ $order->billingAddress->province->name ?? '' }}<br>
                                                                        {{ $order->billingAddress->phone ?? '' }}
                                                                    </p>
                                                                @else
                                                                    <p class="text-muted">No billing address</p>
                                                                @endif
                                                            </div>
                                                        </div>

                                                        <h6>Order Items</h6>
                                                        <div class="table-responsive">
                                                            <table class="table table-sm">
                                                                <thead class="table-light">
                                                                    <tr>
                                                                        <th>Product</th>
                                                                        <th class="text-center">Qty</th>
                                                                        <th class="text-end">Price</th>
                                                                        <th class="text-end">Subtotal</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    @foreach($order->lineItems as $item)
                                                                        <tr>
                                                                            <td>
                                                                                {{ $item->productVariant->product->translation->name ?? $item->productVariant->sku ?? 'Product' }}
                                                                                @if($item->productVariant->name)
                                                                                    <br><small class="text-muted">{{ $item->productVariant->name }}</small>
                                                                                @endif
                                                                            </td>
                                                                            <td class="text-center">{{ $item->quantity }}</td>
                                                                            <td class="text-end">{{ $order->currency->symbol ?? '$' }}{{ number_format($item->price, 2) }}</td>
                                                                            <td class="text-end">{{ $order->currency->symbol ?? '$' }}{{ number_format($item->subtotal, 2) }}</td>
                                                                        </tr>
                                                                    @endforeach
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <td colspan="3" class="text-end"><strong>Subtotal:</strong></td>
                                                                        <td class="text-end">{{ $order->currency->symbol ?? '$' }}{{ number_format($order->sub_total, 2) }}</td>
                                                                    </tr>
                                                                    @if($order->tax > 0)
                                                                    <tr>
                                                                        <td colspan="3" class="text-end"><strong>Tax:</strong></td>
                                                                        <td class="text-end">{{ $order->currency->symbol ?? '$' }}{{ number_format($order->tax, 2) }}</td>
                                                                    </tr>
                                                                    @endif
                                                                    <tr>
                                                                        <td colspan="3" class="text-end"><strong>Total:</strong></td>
                                                                        <td class="text-end"><strong>{{ $order->currency->symbol ?? '$' }}{{ number_format($order->total, 2) }}</strong></td>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="text-center py-5">
                                        <i class="fas fa-shopping-bag" style="font-size: 60px; color: #ddd;"></i>
                                        <h5 class="mt-3">No Orders Yet</h5>
                                        <p class="text-muted">You haven't placed any orders yet.</p>
                                        <a href="{{ route('products') }}" class="btn btn-primary mt-2">Start Shopping</a>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    <!-- Account Details Tab -->
                    <div id="account-tab" class="profile-tab-content" style="display: none;">
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="mb-0">Account Details</h4>
                            </div>
                            <div class="card-body">
                                <form id="account-form" x-data="accountForm()">
                                    <template x-if="message">
                                        <div :class="success ? 'alert alert-success' : 'alert alert-danger'" class="mb-3" x-text="message"></div>
                                    </template>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="name" class="form-label">Full Name</label>
                                            <input type="text" class="form-control" id="name" x-model="form.name" value="{{ $user->name }}">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="email" class="form-label">Email Address</label>
                                            <input type="email" class="form-control" id="email" x-model="form.email" value="{{ $user->email }}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary" @click.prevent="updateProfile" :disabled="loading">
                                        <span x-show="!loading">Update Profile</span>
                                        <span x-show="loading">Saving...</span>
                                    </button>
                                </form>

                                <hr class="my-4">

                                <h5>Change Password</h5>
                                <form id="password-form" x-data="passwordForm()">
                                    <template x-if="message">
                                        <div :class="success ? 'alert alert-success' : 'alert alert-danger'" class="mb-3" x-text="message"></div>
                                    </template>

                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <label for="current_password" class="form-label">Current Password</label>
                                            <input type="password" class="form-control" id="current_password" x-model="form.current_password">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="password" class="form-label">New Password</label>
                                            <input type="password" class="form-control" id="password" x-model="form.password">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="password_confirmation" class="form-label">Confirm Password</label>
                                            <input type="password" class="form-control" id="password_confirmation" x-model="form.password_confirmation">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary" @click.prevent="updatePassword" :disabled="loading">
                                        <span x-show="!loading">Change Password</span>
                                        <span x-show="loading">Saving...</span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Profile Area End -->
@endsection

@push('scripts')
<script>
    // Tab switching
    document.querySelectorAll('[data-tab]').forEach(function(tabLink) {
        tabLink.addEventListener('click', function(e) {
            e.preventDefault();
            const tabName = this.getAttribute('data-tab');

            // Hide all tabs
            document.querySelectorAll('.profile-tab-content').forEach(function(tab) {
                tab.style.display = 'none';
            });

            // Remove active class from all links
            document.querySelectorAll('[data-tab]').forEach(function(link) {
                link.classList.remove('active-tab');
                link.style.backgroundColor = '#f8f9fa';
            });

            // Show selected tab
            document.getElementById(tabName + '-tab').style.display = 'block';

            // Add active class to clicked link
            this.classList.add('active-tab');
            this.style.backgroundColor = '#e9ecef';
        });
    });

    // Account form
    function accountForm() {
        return {
            form: {
                name: '{{ $user->name }}',
                email: '{{ $user->email }}'
            },
            loading: false,
            message: '',
            success: false,

            async updateProfile() {
                this.loading = true;
                this.message = '';

                try {
                    const response = await fetch('{{ route("customers.profile.update") }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify(this.form)
                    });

                    const data = await response.json();

                    if (response.ok) {
                        this.success = true;
                        this.message = 'Profile updated successfully!';
                    } else {
                        this.success = false;
                        this.message = data.message || 'Failed to update profile.';
                    }
                } catch (error) {
                    this.success = false;
                    this.message = 'An error occurred.';
                }

                this.loading = false;
            }
        }
    }

    // Password form
    function passwordForm() {
        return {
            form: {
                current_password: '',
                password: '',
                password_confirmation: ''
            },
            loading: false,
            message: '',
            success: false,

            async updatePassword() {
                this.loading = true;
                this.message = '';

                try {
                    const response = await fetch('{{ route("customers.password.update") }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify(this.form)
                    });

                    const data = await response.json();

                    if (response.ok) {
                        this.success = true;
                        this.message = 'Password changed successfully!';
                        this.form = { current_password: '', password: '', password_confirmation: '' };
                    } else {
                        this.success = false;
                        this.message = data.message || 'Failed to change password.';
                    }
                } catch (error) {
                    this.success = false;
                    this.message = 'An error occurred.';
                }

                this.loading = false;
            }
        }
    }
</script>

<style>
    .profile-menu a:hover,
    .profile-menu button:hover {
        background-color: #e9ecef !important;
    }
    .active-tab {
        background-color: #e9ecef !important;
        font-weight: 600;
    }
    .card {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .card-header {
        border-bottom: 1px solid #e0e0e0;
        padding: 1rem 1.25rem;
    }
    .table th {
        font-weight: 600;
        font-size: 14px;
    }
    .badge {
        padding: 6px 12px;
        font-weight: 500;
    }
</style>
@endpush
