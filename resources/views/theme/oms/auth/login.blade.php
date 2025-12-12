@extends('theme.medibazaar.layouts.app')
@section('content')


        <!-- breadcrumb-area-start -->
        <div class="breadcrumb-area pt-125 pb-125" style="background-image:url({{ asset('storage/' . ($page->banner ?? '')) }})">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-wrapper">
                            <div class="breadcrumb-text">
                                <h2 x-text="isLogin ? 'Login' : 'Register'">Login</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb-area-end -->

        <!-- login Area Strat-->
        <section class="login-area pt-100 pb-100" x-data="authForm()">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="basic-login">
                            <!-- Alert Messages -->
                            <template x-if="message">
                                <div :class="success ? 'alert alert-success' : 'alert alert-danger'" class="mb-20" x-text="message"></div>
                            </template>

                            <!-- Login Form -->
                            <div x-show="isLogin" x-transition>
                                <h3 class="text-center mb-60">Login From Here</h3>
                                <form @submit.prevent="login">
                                    <label for="login_email">Email Address <span>**</span></label>
                                    <input id="login_email" type="email" x-model="loginForm.email" placeholder="Enter Email address..." required />
                                    <template x-if="errors.email">
                                        <span class="text-danger" x-text="errors.email[0]"></span>
                                    </template>

                                    <label for="login_password">Password <span>**</span></label>
                                    <input id="login_password" type="password" x-model="loginForm.password" placeholder="Enter password..." required />
                                    <template x-if="errors.password">
                                        <span class="text-danger" x-text="errors.password[0]"></span>
                                    </template>

                                    <div class="login-action mb-20 fix">
                                        <span class="log-rem f-left">
                                            <input id="remember" type="checkbox" x-model="loginForm.remember" />
                                            <label for="remember">Remember me!</label>
                                        </span>
                                        <span class="forgot-login f-right">
                                            <a href="{{ route('password.request') }}">Lost your password?</a>
                                        </span>
                                    </div>
                                    <button type="submit" class="c-btn theme-btn-2 w-100" :disabled="loading">
                                        <span x-show="!loading">Login Now</span>
                                        <span x-show="loading">Please wait...</span>
                                    </button>
                                    <div class="or-divide"><span>or</span></div>
                                    <button type="button" @click="toggleForm" class="c-btn theme-btn w-100">Register Now</button>
                                </form>
                            </div>

                            <!-- Register Form -->
                            <div x-show="!isLogin" x-transition>
                                <h3 class="text-center mb-60">Create an Account</h3>
                                <form @submit.prevent="register">
                                    <label for="register_name">Full Name <span>**</span></label>
                                    <input id="register_name" type="text" x-model="registerForm.name" placeholder="Enter your full name..." required />
                                    <template x-if="errors.name">
                                        <span class="text-danger" x-text="errors.name[0]"></span>
                                    </template>

                                    <label for="register_email">Email Address <span>**</span></label>
                                    <input id="register_email" type="email" x-model="registerForm.email" placeholder="Enter Email address..." required />
                                    <template x-if="errors.email">
                                        <span class="text-danger" x-text="errors.email[0]"></span>
                                    </template>

                                    <label for="register_password">Password <span>**</span></label>
                                    <input id="register_password" type="password" x-model="registerForm.password" placeholder="Enter password (min 8 characters)..." required />
                                    <template x-if="errors.password">
                                        <span class="text-danger" x-text="errors.password[0]"></span>
                                    </template>

                                    <button type="submit" class="c-btn theme-btn-2 w-100 mt-20" :disabled="loading">
                                        <span x-show="!loading">Register Now</span>
                                        <span x-show="loading">Please wait...</span>
                                    </button>
                                    <div class="or-divide"><span>or</span></div>
                                    <button type="button" @click="toggleForm" class="c-btn theme-btn w-100">Back to Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- login Area End-->

@endsection

@push('scripts')
<script>
    function authForm() {
        return {
            isLogin: true,
            loading: false,
            message: '',
            success: false,
            errors: {},
            loginForm: {
                email: '',
                password: '',
                remember: false
            },
            registerForm: {
                name: '',
                email: '',
                password: ''
            },

            toggleForm() {
                this.isLogin = !this.isLogin;
                this.message = '';
                this.errors = {};
            },

            async login() {
                this.loading = true;
                this.message = '';
                this.errors = {};

                try {
                    const response = await fetch('{{ route("login") }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify(this.loginForm)
                    });

                    const data = await response.json();

                    if (response.ok && data.success) {
                        this.success = true;
                        this.message = data.message || 'Login successful!';
                        setTimeout(() => {
                            window.location.href = data.redirect || '{{ route("customers.profile") }}';
                        }, 500);
                    } else {
                        this.success = false;
                        if (data.errors) {
                            this.errors = data.errors;
                        }
                        this.message = data.message || 'Login failed. Please check your credentials.';
                    }
                } catch (error) {
                    this.success = false;
                    this.message = 'An error occurred. Please try again.';
                    console.error('Login error:', error);
                }

                this.loading = false;
            },

            async register() {
                this.loading = true;
                this.message = '';
                this.errors = {};

                try {
                    const response = await fetch('{{ route("register") }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify(this.registerForm)
                    });

                    const data = await response.json();

                    if (response.ok && data.success) {
                        this.success = true;
                        this.message = data.message || 'Registration successful!';
                        setTimeout(() => {
                            window.location.href = data.redirect || '{{ route("customers.profile") }}';
                        }, 500);
                    } else {
                        this.success = false;
                        if (data.errors) {
                            this.errors = data.errors;
                        }
                        this.message = data.message || 'Registration failed. Please check your input.';
                    }
                } catch (error) {
                    this.success = false;
                    this.message = 'An error occurred. Please try again.';
                    console.error('Registration error:', error);
                }

                this.loading = false;
            }
        }
    }
</script>
@endpush
