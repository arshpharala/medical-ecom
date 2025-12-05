@extends('theme.medibazaar.layouts.app')
@section('content')

        <!-- breadcrumb-area-start -->
        <div class="breadcrumb-area pt-125 pb-125" style="background-color: #f5f5f5;">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-wrapper">
                            <div class="breadcrumb-text">
                                <h2>Forgot Password</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb-area-end -->

        <!-- Forgot Password Area Start-->
        <section class="login-area pt-100 pb-100" x-data="forgotPasswordForm()">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="basic-login">
                            <h3 class="text-center mb-30">Reset Your Password</h3>
                            <p class="text-center mb-40">Enter your email address and we'll send you a link to reset your password.</p>

                            <!-- Alert Messages -->
                            <template x-if="message">
                                <div :class="success ? 'alert alert-success' : 'alert alert-danger'" class="mb-20" x-text="message"></div>
                            </template>

                            <form @submit.prevent="submitForm">
                                <label for="email">Email Address <span>**</span></label>
                                <input id="email" type="email" x-model="email" placeholder="Enter your email address..." required />
                                <template x-if="errors.email">
                                    <span class="text-danger" x-text="errors.email[0]"></span>
                                </template>

                                <button type="submit" class="c-btn theme-btn-2 w-100 mt-20" :disabled="loading">
                                    <span x-show="!loading">Send Reset Link</span>
                                    <span x-show="loading">Sending...</span>
                                </button>

                                <div class="text-center mt-20">
                                    <a href="{{ route('login') }}">Back to Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Forgot Password Area End-->

@endsection

@push('scripts')
<script>
    function forgotPasswordForm() {
        return {
            email: '',
            loading: false,
            message: '',
            success: false,
            errors: {},

            async submitForm() {
                this.loading = true;
                this.message = '';
                this.errors = {};

                try {
                    const response = await fetch('{{ route("password.email") }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify({ email: this.email })
                    });

                    const data = await response.json();

                    if (response.ok && data.success) {
                        this.success = true;
                        this.message = data.message || 'Password reset link sent!';
                        this.email = '';
                    } else {
                        this.success = false;
                        if (data.errors) {
                            this.errors = data.errors;
                        }
                        this.message = data.message || 'Failed to send reset link.';
                    }
                } catch (error) {
                    this.success = false;
                    this.message = 'An error occurred. Please try again.';
                    console.error('Error:', error);
                }

                this.loading = false;
            }
        }
    }
</script>
@endpush
