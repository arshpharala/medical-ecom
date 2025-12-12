@extends('theme.medibazaar.layouts.app')
@section('content')

        <!-- breadcrumb-area-start -->
        <div class="breadcrumb-area pt-125 pb-125" style="background-color: #f5f5f5;">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-wrapper">
                            <div class="breadcrumb-text">
                                <h2>Reset Password</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb-area-end -->

        <!-- Reset Password Area Start-->
        <section class="login-area pt-100 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="basic-login">
                            <h3 class="text-center mb-30">Set New Password</h3>

                            @if ($errors->any())
                                <div class="alert alert-danger mb-20">
                                    <ul class="mb-0">
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <form action="{{ route('password.update') }}" method="POST">
                                @csrf
                                <input type="hidden" name="token" value="{{ $token }}">

                                <label for="email">Email Address <span>**</span></label>
                                <input id="email" type="email" name="email" value="{{ old('email', $email) }}" placeholder="Enter your email address..." required />

                                <label for="password">New Password <span>**</span></label>
                                <input id="password" type="password" name="password" placeholder="Enter new password (min 8 characters)..." required />

                                <label for="password_confirmation">Confirm Password <span>**</span></label>
                                <input id="password_confirmation" type="password" name="password_confirmation" placeholder="Confirm your new password..." required />

                                <button type="submit" class="c-btn theme-btn-2 w-100 mt-20">Reset Password</button>

                                <div class="text-center mt-20">
                                    <a href="{{ route('login') }}">Back to Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Reset Password Area End-->

@endsection
