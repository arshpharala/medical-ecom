@extends('theme.oms-v2.layouts.app')
@section('content')
    <!-- banner-area-start -->
    <div class="banner-area banner-pb pt-10 pb-30 pl-55 pr-55">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-12">
                    <div class="banners-active">
                        <div class="banners-wrapper mb-30">
                            <div class="banner-img pos-rel">
                                <a href="product-details.html">
                                    <img src="{{ asset('assets/images/banner/b-01.png') }}" alt="Custom Pharmacy Bags">
                                </a>
                                <div class="banner-content">
                                    <span>Professional Branding</span>
                                    <h2>Bags</h2>
                                    <p>Elevate your pharmacy’s identity with premium, <br>
                                        custom-printed packaging designed for trust.</p>
                                    <div class="bannerss-button">
                                        <a class="c-btn" href="{{ route('products', ['category' => 'custom-print']) }}">
                                            View Products <i class="far fa-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="banners-wrapper mb-30">
                            <div class="banner-img pos-rel">
                                <a href="product-details.html">
                                    <img src="{{ asset('assets/images/banner/b-02.png') }}" alt="Medical Furniture">
                                </a>
                                <div class="banner-content">
                                    <span>Clinical Excellence</span>
                                    <h2>Furniture</h2>
                                    <p>Ergonomic and durable furniture solutions <br>
                                        engineered for modern healthcare clinics.</p>
                                    <div class="bannerss-button">
                                        <a class="c-btn" href="#">
                                            Buy Now <i class="far fa-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-12">
                    <div class="banner-wrapper mb-30">
                        <div class="banner-img pos-rel">
                            <a href="product-details.html"><img src="{{ asset('assets/images/banner/b-03.png') }}"
                                    alt="Medical Disposable"></a>
                            <div class="banner-text banner-03-text">
                                <span>Medical</span>
                                <h2>Disposable</h2>
                                <div class="b-button red-b-button">
                                    <a href="contact.html">shop now <i class="far fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="banner-wrapper mb-30">
                        <div class="banner-img pos-rel">
                            <a href="product-details.html"><img src="{{ asset('assets/images/banner/b-04.png') }}"
                                    alt="Lab Supplies"></a>
                            <div class="banner-text banner-03-text">
                                <span>Lab</span>
                                <h2>Supplies</h2>
                                <div class="b-button red-b-button">
                                    <a href="contact.html">shop now <i class="far fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner-area-end -->

    <!-- banner-area-start -->
    <div class="banner-area banner-pb pb-70 pl-55 pr-55">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="banner-wrapper text-center mb-30">
                        <div class="banner-img pos-rel">
                            <a href="product-details.html">
                                <img src="{{ asset('assets/images/banner/b-05.png') }}" alt="Medical Packaging">
                            </a>
                            <div class="banner-text banner-1-text">
                                <span>Premium Quality</span>
                                <h2>Medical Packaging</h2>
                                <div class="b-button red-b-button">
                                    <a href="{{ route('products', ['category' => 'packaging']) }}">shop now <i
                                            class="far fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="banner-wrapper text-center mb-30">
                        <div class="banner-img pos-rel">
                            <a href="product-details.html">
                                <img src="{{ asset('assets/images/banner/b-06.png') }}" alt="Medical Dispensers">
                            </a>
                            <div class="banner-text banner-1-text">
                                <span>Safety First</span>
                                <h2>Medical Dispensers</h2>
                                <div class="b-button red-b-button">
                                    <a href="{{ route('products', ['category' => 'dispensers']) }}">shop now <i
                                            class="far fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="banner-wrapper text-center mb-30">
                        <div class="banner-img pos-rel">
                            <a href="product-details.html">
                                <img src="{{ asset('assets/images/banner/b-07.png') }}" alt="Equipment & Consumables">
                            </a>
                            <div class="banner-text banner-1-text">
                                <span>Clinical Essentials</span>
                                <h2>Equipment & Consumables</h2>
                                <div class="b-button red-b-button">
                                    <a href="{{ route('products', ['category' => 'consumables']) }}">shop now <i
                                            class="far fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner-area-end -->

    <!-- features-products-area-start -->
    <div class="features-products-area fe-product pl-55 pr-55">
        <div class="container-fluid">
            <div class="fe-pro-border">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 offset-lg-3 offset-xl-3">
                        <div class="section-title text-center mb-65">
                            <h2>Features Products</h2>
                            <p>High-quality medical essentials curated for professional healthcare excellence.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-lg-3 mb-30">
                        <div class="category-sidebar">
                            <h3 class="cat-title">Category</h3>
                            <div class="category-item">
                                <ul>
                                    @foreach ($categories as $cat)
                                        <li><a
                                                href="{{ route('products', ['category' => $cat->slug]) }}">{{ $cat->name }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="banner-side">
                                <div class="banner-side-text">
                                    {{-- <span>Cosmetics</span>
                                        <h3>Body Lotion</h3> --}}
                                    {{-- <div class="b-button red-b-button">
                                            <a href="contact.html">shop now <i class="far fa-plus"></i></a>
                                        </div> --}}
                                    <div class="banner-side-img pos-rel">
                                        <a
                                            href="{{ route('products', ['category' => 'new-kinder-to-our-planet-collection']) }}"><img
                                                src="{{ asset('assets/images/banner/b-08.png') }}"
                                                alt="Kinder to Our Planet Collection"></a>
                                        {{-- <div class="b-02-tag b-03-tag">
                                                <h3>10% <br> <span>off</span> </h3>
                                            </div> --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="row">
                            @foreach ($featuredProducts as $variant)
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="badge-tag">
                                            <span class="product-tag pro-tag hot-1">Hot</span>
                                        </div>
                                        <div class="product-02-img pos-rel">
                                            <a href="{{ $variant->link }}">
                                                <img src="{{ $variant->image }}" alt="{{ $variant->name }}">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn {{ $variant->is_wishlisted ? 'is-active' : '' }}"
                                                    href="#" data-variant-id="{{ $variant->id }}"><i
                                                        class="far fa-heart"></i></a>
                                                <a class="action-btn add-to-cart-btn"
                                                    data-variant-id="{{ $variant->id }}" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="{{ $variant->link }}"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>{{ $variant->category_name }}</h5>
                                            <h4><a href="{{ $variant->link }}">{{ $variant->name }}</a></h4>
                                            <span>{{ $variant->price_with_currency }}</span>
                                        </div>
                                    </div>
                                </div>
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- features-products-area-end -->

    <!-- product-area-start -->
    <div class="product-area pt-100 pb-70">
        <div class="container">
            <div class="row mb-30">
                <div class="col-xl-7 col-lg-7 col-md-8">
                    <div class="section-title mb-30">
                        <h2>Latest Products</h2>
                        <p>Sed ut perspiciatis unde omnis iste natus error</p>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 col-md-4">
                    <div class="b-button shop-btn s-btn text-md-right mb-30">
                        <a href="{{ route('products') }}">view all product <i class="fal fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 mb-30">
                    <div class="banner-pro-img">
                        <a href="{{ route('products') }}"><img src="{{ asset('assets/images/banner/b-09.png') }}"
                                alt="promotional banner"></a>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9">
                    <div class="row">
                        @foreach ($newProducts as $variant)
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="{{ $variant->link }}">
                                            <img src="{{ $variant->image }}" alt="{{ $variant->name }}">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" {{ $variant->is_wishlisted ? 'is-active' : '' }}
                                                href="#" data-variant-id="{{ $variant->id }}"><i
                                                    class="far fa-heart"></i></a>
                                            <a class="action-btn add-to-cart-btn" data-variant-id="{{ $variant->id }}"
                                                href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="{{ $variant->link }}"><i
                                                    class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <span class="product-tag hot-2">New</span>
                                    <div class="product-text">
                                        <h5>{{ $variant->category_name }}</h5>
                                        <h4><a href="{{ $variant->link }}">{{ $variant->name }}</a></h4>
                                        <span>{{ $variant->price_with_currency }}</span>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- product-area-end -->

    <!-- deal-area-start -->
    <div class="deal-02-area mb-100">
        <div class="container">
            <div class="deal-bg" data-background="{{ asset('assets/img/bg/02.jpg') }}">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="deal-02-wrapper mb-30">
                            <div class="section-title mb-35">
                                <h2>Weekly Clinical Special</h2>
                                <p>Premium grade supplies for healthcare professionals at exclusive rates.</p>
                            </div>
                            <div class="deal-content mb-45">
                                <h2>Sterile Clinical <span>Consumables</span></h2>
                                {{-- <span>Starting at $49.99</span> --}}
                                <div class="deal-button">
                                    <a class="c-btn" href="{{ route('products') }}">Explore Products <i
                                            class="fal fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="deal-count">
                                <div class="deal-time" data-countdown="2026/01/01"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="deal-img mb-30 text-center">
                            <img src="{{ asset('assets/images/promo.png') }}" alt="Medical Supplies Promo">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- deal-area-end -->

    <!-- testimonial-area-start -->
    <div class="testimonial-area pos-rel grey-2-bg pt-100 pb-175">

        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-8 offset-lg-2 offset-xl-3">
                    <div class="section-title text-center mb-65">
                        <h2>What Our Clients Say</h2>
                        <p>Trusted by healthcare professionals for quality and reliable service.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-10 col-lg-10 offset-lg-1 offset-xl-1">
                    <div class="test-02-active">
                        <div class="client-wrapper pos-rel text-center">
                            <div class="client-img">
                                <img src="{{ asset('theme/oms/assets/img/testimonial/01.png') }}" alt="Client">
                            </div>
                            <div class="client-icon">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                            <div class="client-text">
                                <p>"Impressive turnaround time. Our clinic was running low on essential dispensers, and the
                                    order
                                    arrived two days earlier than expected. The tracking system kept us updated at every
                                    single stage of
                                    the transit."</p>
                                <h4>Sarah Jenkins, <span>Clinic Administrator</span></h4>
                            </div>
                        </div>

                        <div class="client-wrapper pos-rel text-center">
                            <div class="client-img">
                                <img src="{{ asset('theme/oms/assets/img/testimonial/02.png') }}" alt="Client">
                            </div>
                            <div class="client-icon">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                            <div class="client-text">
                                <p>"The medical packaging quality is outstanding. We’ve struggled with sterile seals failing
                                    from
                                    other vendors, but these are robust and reliable. It gives our medical team great peace
                                    of mind
                                    during daily operations."</p>
                                <h4>Dr. Michael Chen, <span>Surgeon</span></h4>
                            </div>
                        </div>

                        <div class="client-wrapper pos-rel text-center">
                            <div class="client-img">
                                <img src="{{ asset('theme/oms/assets/img/testimonial/03.png') }}" alt="Client">
                            </div>
                            <div class="client-icon">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                            <div class="client-text">
                                <p>"Superior clinical consumables that truly meet professional standards. The dispensers are
                                    durable
                                    and easy to maintain. We have switched our entire inventory procurement to this platform
                                    for the
                                    long term."</p>
                                <h4>James Harrison, <span>Facility Manager</span></h4>
                            </div>
                        </div>

                        <div class="client-wrapper pos-rel text-center">
                            <div class="client-img">
                                <img src="{{ asset('theme/oms/assets/img/testimonial/04.png') }}" alt="Client">
                            </div>
                            <div class="client-icon">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                            <div class="client-text">
                                <p>"Excellent customer support and high-grade products. They helped us customize our
                                    branding on the
                                    packaging efficiently. Highly recommend for any healthcare provider looking for a
                                    consistent and
                                    honest supplier."</p>
                                <h4>Elena Rodriguez, <span>Procurement Officer</span></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- testimonial-area-end -->

    <!-- brand-area-start -->
    <div class="brand-area pt-100 pb-40">
        <div class="container">
            <div class="row mb-30">
                <div class="col-xl-7 col-lg-7 col-md-8">
                    <div class="section-title mb-30">
                        <h2>Trusted Partners</h2>
                        <p>Collaborating with world-class manufacturers to deliver certified medical solutions.</p>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 col-md-4">
                    <div class="b-button shop-btn s-btn text-md-right mb-30">
                        <a href="{{ route('products') }}">view all products <i class="fal fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($brands as $brand)
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('storage/' . $brand->logo) }}" alt="{{ $brand->name }}"
                                style="filter: grayscale(100%); opacity: 0.7; transition: 0.3s;"
                                onmouseover="this.style.filter='grayscale(0%)'; this.style.opacity='1';">
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    <!-- brand-area-end -->

    <!-- features-area-start -->
    <div class="features-area pt-60 pb-30 grey-2-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="features-wrapper mb-30">
                        <div class="features-icon fe-1 f-left">
                            <i class="fal fa-truck"></i>
                        </div>
                        <div class="features-text">
                            <h3>Fast Delivery</h3>
                            <p>Reliable shipping for all of your essential medical consumables.</p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="features-wrapper mb-30">
                        <div class="features-icon fe-2 f-left">
                            <i class="fal fa-check-circle"></i>
                        </div>
                        <div class="features-text">
                            <h3>Quality Goods</h3>
                            <p>Certified products meeting the highest clinical safety standards.</p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="features-wrapper mb-30">
                        <div class="features-icon fe-3 f-left">
                            <i class="fal fa-shield-check"></i>
                        </div>
                        <div class="features-text">
                            <h3>Secure System</h3>
                            <p>Professional encryption protecting every single payment process.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- features-area-end -->
@endsection
