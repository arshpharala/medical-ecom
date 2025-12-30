<!doctype html>
<html class="no-js" lang="{{ locale()->code }}" style="direction:{{ locale()->direction ?? 'ltr' }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    {!! render_meta_tags($meta ?? null) !!}
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="manifest" href="site.webmanifest">

    @if (!empty(setting('site_favicon')))
        <link rel="shortcut icon" type="image/x-icon" href="{{ setting('site_favicon') }}">
    @else
        <link rel="shortcut icon" type="image/x-icon" href="{{ asset('theme/oms/assets/img/favicon.ico') }}">
    @endif
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/animate.min.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/fontawesome-all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/themify-icons.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/meanmenu.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/slick.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/main.css') }}">
    <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/responsive.css') }}">

</head>

<body>

    <!-- header-start -->
    <header>
        <div class="header-area grey-3-bg pl-55 pr-55">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-8 col-lg-9 col-md-8">
                        <div class="header-top-wrapper">
                            <div class="header-info">
                                <span><i class="far fa-phone"></i> Call Us {!! setting('contact_phone') !!}</span>
                                <span class="envelopes-header-icon"><i class="far fa-envelope-open"></i>
                                    {!! setting('contact_email') !!}</span>
                                <span class="mails-header-icon"><i
                                        class="far fa-map-marked"></i>{!! setting('address') !!}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-3 col-md-4">
                        <div class="header-icon f-right">
                            @if (setting('facebook'))
                                <a href="{{ setting('facebook') }}"><i class="fab fa-facebook-f"></i></a>
                            @endif
                            @if (setting('twitter'))
                                <a href="{{ setting('twitter') }}"><i class="fab fa-twitter"></i></a>
                            @endif
                            @if (setting('instagram'))
                                <a href="{{ setting('instagram') }}"><i class="fab fa-instagram"></i></a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="sticky-header" class="main-menu-area menu-02 pl-55 pr-55">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-xl-3 col-lg-3 col-md-3">
                        <a href="{{ route('home') }}">
                            <img src="{{ asset(setting('site_logo')) }}" alt="{{ setting('site_name') }}"
                                height="80px" />
                        </a>
                    </div>
                    <div class="col-xl-5 col-lg-6">
                        <div class="main-menu">
                            <nav id="mobile-menu">
                                <ul>

                                    <li class="active"><a href="{{ route('home') }}">Home </a></li>
                                    <li><a href="{{ route('products') }}">Products</a></li>
                                    <li><a href="{{ route('news.index') }}">News</a></li>
                                    <li><a href="{{ route('about-us') }}">About Us</a></li>
                                    <li><a href="{{ route('contact-us') }}">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-3">
                        <div class="header-top-right text-md-right d-none d-lg-block">
                            <div class="shop-menu">
                                <ul>
                                    <li><a class="my-icon" href="{{ route('customers.profile') }}"><i
                                                class="fal fa-user-circle"></i> My
                                            Account</a></li>
                                    <li><a href="{{ route('cart.index') }}"><i class="far fa-cart-plus"></i> Cart</a>
                                    </li>
                                    <li><a href="{{ route('customers.profile') }}#wishlist"><i
                                                class="far fa-heart"></i> Wishlist</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mobile-menu"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-search-area pt-15 pb-15 pl-55 pr-55">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-6">
                        <div class="menu-bar menu-bar-2">
                            <a class="cat-toggle" href="#"><i class="fal fa-bars"></i></a>
                            <span>Categories</span>
                        </div>
                        <div class="category-menu">
                            <!-- <h4>Category</h4> -->
                            <ul>
                                @foreach ($categories as $cat)
                                    <li><a
                                            href="{{ route('products', ['category' => $cat->slug]) }}">{{ $cat->name }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7 col-md-6 d-none d-lg-block">
                        <div class="header-search header-02-search ">
                            <form action="{{ route('search') }}" class="header-search-form">
                                <input placeholder="Search" name="q" type="text">
                                <button type="submit"><i class="far fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    {{-- <div class="col-xl-3 col-lg-2 col-md-6 col-6">
                        <div class="header-02-right">
                            <div class="menu-bar menu-bar-2 menu-bar-3 f-right">
                                <a class="info-bar" href="#"><i class="fas fa-th-large"></i></a>
                            </div>
                            <div class="header-lang f-right pos-rel">
                                <div class="lang-icon">
                                    <img src="{{ asset('theme/oms/assets/img/icon/flag.png') }}" alt="">
                                    <a href="#"><i class="far fa-angle-down"></i></a>
                                </div>
                                <ul class="header-lang-list">
                                    <li><a href="#">USA</a></li>
                                    <li><a href="#">UK</a></li>
                                    <li><a href="#">CA</a></li>
                                    <li><a href="#">AU</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> --}}
                </div>
            </div>
        </div>
        {{-- <div class="extra-info">
            <div class="close-icon">
                <button>
                    <i class="far fa-window-close"></i>
                </button>
            </div>
            <div class="logo-side mb-30">
                <a href="index.html">
                    <img src="{{ asset('theme/oms/assets/img/logo/white-logo.png') }}" alt="" />
                </a>
            </div>
            <div class="side-info mb-30">
                <div class="contact-list mb-30">
                    <h4>Office Address</h4>
                    <p>123/A, Miranda City Likaoli
                        Prikano, Dope</p>
                </div>
                <div class="contact-list mb-30">
                    <h4>Phone Number</h4>
                    <p>+0989 7876 9865 9</p>
                    <p>+(090) 8765 86543 85</p>
                </div>
                <div class="contact-list mb-30">
                    <h4>Email Address</h4>
                    <p>info@example.com</p>
                    <p>example.mail@hum.com</p>
                </div>
            </div>
            <div class="instagram">
                <a href="#">
                    <img src="{{ asset('theme/oms/assets/img/portfolio/p1.jpg') }}" alt="">
                </a>
                <a href="#">
                    <img src="{{ asset('theme/oms/assets/img/portfolio/p2.jpg') }}" alt="">
                </a>
                <a href="#">
                    <img src="{{ asset('theme/oms/assets/img/portfolio/p3.jpg') }}" alt="">
                </a>
                <a href="#">
                    <img src="{{ asset('theme/oms/assets/img/portfolio/p4.jpg') }}" alt="">
                </a>
                <a href="#">
                    <img src="{{ asset('theme/oms/assets/img/portfolio/p5.jpg') }}" alt="">
                </a>
                <a href="#">
                    <img src="{{ asset('theme/oms/assets/img/portfolio/p6.jpg') }}" alt="">
                </a>
            </div>
            <div class="social-icon-right mt-20">
                <a href="#">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#">
                    <i class="fab fa-google-plus-g"></i>
                </a>
                <a href="#">
                    <i class="fab fa-instagram"></i>
                </a>
            </div>
        </div> --}}
    </header>
    <!-- header-start -->

    <main>

        <!-- banner-area-start -->
        <div class="banner-area banner-pb pt-10 pb-30 pl-55 pr-55">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-8 col-lg-8 col-md-12">
                        <div class="banners-active">
                            <div class="banners-wrapper mb-30">
                                <div class="banner-img pos-rel">
                                    <a href="product-details.html">
                                        <img src="{{ asset('assets/images/banner/b-01.png') }}"
                                            alt="Custom Pharmacy Bags">
                                    </a>
                                    <div class="banner-content">
                                        <span>Professional Branding</span>
                                        <h2>Bags</h2>
                                        <p>Elevate your pharmacy’s identity with premium, <br>
                                            custom-printed packaging designed for trust.</p>
                                        <div class="bannerss-button">
                                            <a class="c-btn"
                                                href="{{ route('products', ['category' => 'custom-print']) }}">
                                                View Products <i class="far fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="banners-wrapper mb-30">
                                <div class="banner-img pos-rel">
                                    <a href="product-details.html">
                                        <img src="{{ asset('assets/images/banner/b-02.png') }}"
                                            alt="Medical Furniture">
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
                                <a href="product-details.html"><img
                                        src="{{ asset('assets/images/banner/b-03.png') }}"
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
                                <a href="product-details.html"><img
                                        src="{{ asset('assets/images/banner/b-04.png') }}" alt="Lab Supplies"></a>
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
                                    <img src="{{ asset('assets/images/banner/b-07.png') }}"
                                        alt="Equipment & Consumables">
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
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="badge-tag">
                                            <span class="product-tag pro-tag hot-1">Hot</span>
                                        </div>
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-01.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>disable chair</h5>
                                            <h4><a href="#">Wheelchair-Disabled</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-02.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>personal</h5>
                                            <h4><a href="#">Digital Thermometer</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-03.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>hand gloves</h5>
                                            <h4><a href="#">WLab Hand Gloves</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="badge-tag">
                                            <span class="product-tag pro-tag hot-1 hot-2">new</span>
                                        </div>
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-04.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>medical meter</h5>
                                            <h4><a href="#">Health & Medicine</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-05.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>surgery mask</h5>
                                            <h4><a href="#">Lab N98 Face Mask</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="badge-tag">
                                            <span class="product-tag pro-tag hot-1">hot</span>
                                        </div>
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-06.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>sanitizer</h5>
                                            <h4><a href="#">Hand Sanitizer</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-07.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>home accessories</h5>
                                            <h4><a href="#">Inhaler Pressure Drop</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 cl-lg-3 col-md-6">
                                    <div class="product-03-wrapper grey-2-bg pos-rel text-center mb-30">
                                        <div class="badge-tag">
                                            <span class="product-tag pro-tag hot-1 hot-2">new</span>
                                        </div>
                                        <div class="product-02-img pos-rel">
                                            <a href="#">
                                                <img src="{{ asset('theme/oms/assets/img/products/f-08.png') }}"
                                                    alt="">
                                            </a>
                                            <div class="product-action">
                                                <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-cart-plus"></i></a>
                                                <a class="action-btn" href="#"><i
                                                        class="far fa-search"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-text">
                                            <h5>medical meter</h5>
                                            <h4><a href="#">Temperature Gun</a></h4>
                                            <span>$250.99</span>
                                        </div>
                                    </div>
                                </div>
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
                            <h2>Features Products</h2>
                            <p>Sed ut perspiciatis unde omnis iste natus error</p>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-5 col-md-4">
                        <div class="b-button shop-btn s-btn text-md-right mb-30">
                            <a href="contact.html">view all product <i class="fal fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-lg-3 mb-30">
                        <div class="banner-pro-img">
                            <a href="product-details.html"><img
                                    src="{{ asset('theme/oms/assets/img/products/banner.jpg') }}" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="row">
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="product-details.html">
                                            <img src="{{ asset('theme/oms/assets/img/products/p-09.png') }}"
                                                alt="">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <span class="product-tag hot-1">Hot</span>
                                    <div class="product-text">
                                        <h5>face mask</h5>
                                        <h4><a href="product-details.html">Lab N98 Face Mask</a></h4>
                                        <span>$250.99</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="product-details.html">
                                            <img src="{{ asset('theme/oms/assets/img/products/p-10.png') }}"
                                                alt="">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-text">
                                        <h5>sanitizer</h5>
                                        <h4><a href="product-details.html">Hand Sanitizer</a></h4>
                                        <span>$250.99</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="product-details.html">
                                            <img src="{{ asset('theme/oms/assets/img/products/p-11.png') }}"
                                                alt="">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <span class="product-tag hot-1 hot-2">new</span>
                                    <div class="product-text">
                                        <h5>home accessories</h5>
                                        <h4><a href="product-details.html">Inhaler Pressure Drop</a></h4>
                                        <span>$250.99</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="product-details.html">
                                            <img src="{{ asset('theme/oms/assets/img/products/p-12.png') }}"
                                                alt="">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <span class="product-tag hot-2">new</span>
                                    <div class="product-text">
                                        <h5>medical meter</h5>
                                        <h4><a href="product-details.html">Temperature Gun</a></h4>
                                        <span>$250.99</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="product-details.html">
                                            <img src="{{ asset('theme/oms/assets/img/products/p-13.png') }}"
                                                alt="">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-text">
                                        <h5>hand gloves</h5>
                                        <h4><a href="product-details.html">Lab Hand Gloves</a></h4>
                                        <span>$250.99</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 cl-lg-4 col-md-6">
                                <div class="product-02-wrapper product-single pos-rel text-center mb-30">
                                    <div class="product-02-img pos-rel">
                                        <a href="product-details.html">
                                            <img src="{{ asset('theme/oms/assets/img/products/p-14.png') }}"
                                                alt="">
                                        </a>
                                        <div class="product-action">
                                            <a class="action-btn" href="#"><i class="far fa-heart"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-cart-plus"></i></a>
                                            <a class="action-btn" href="#"><i class="far fa-search"></i></a>
                                        </div>
                                    </div>
                                    <span class="product-tag hot-1">hot</span>
                                    <div class="product-text">
                                        <h5>medical meter</h5>
                                        <h4><a href="product-details.html">Digital Thermometer</a></h4>
                                        <span>$250.99</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- product-area-end -->

        <!-- deal-area-start -->
        <div class="deal-02-area mb-100">
            <div class="container">
                <div class="deal-bg" data-background="assets/img/bg/02.jpg') }}">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6">
                            <div class="deal-02-wrapper mb-30">
                                <div class="section-title mb-35">
                                    <h2>Deal Of This Week</h2>
                                    <p>Sed ut perspiciatis unde omnis iste natus error</p>
                                </div>
                                <div class="deal-content mb-45">
                                    <h2>Covid -19 <span>Vaccine</span></h2>
                                    <span>$ 205.99</span>
                                    <div class="deal-button">
                                        <a class="c-btn" href="#">buy now <i class="far fa-plus"></i></a>
                                    </div>
                                </div>
                                <div class="deal-count">
                                    <div class="deal-time" data-countdown="2020/10/01"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-lg-6">
                            <div class="deal-img mb-30">
                                <img src="{{ asset('theme/oms/assets/img/bg/01.png') }}" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- deal-area-end -->

        <!-- testimonial-area-start -->
        <div class="testimonial-area pos-rel grey-2-bg pt-100 pb-175">
            <div class="shape d-none d-xl-block">
                <div class="shape-item test-01 bounce-animate"><img
                        src="{{ asset('theme/oms/assets/img/testimonial/t-1.png') }}" alt=""></div>
                <div class="shape-item test-02"><img src="{{ asset('theme/oms/assets/img/testimonial/shape.png') }}"
                        alt=""></div>
                <div class="shape-item test-03 bounce-animate"><img
                        src="{{ asset('theme/oms/assets/img/testimonial/t-02.png') }}" alt=""></div>
                <div class="shape-item test-04 bounce-animate"><img
                        src="{{ asset('theme/oms/assets/img/testimonial/001.png') }}" alt=""></div>
                <div class="shape-item test-05 bounce-animate"><img
                        src="{{ asset('theme/oms/assets/img/testimonial/002.png') }}" alt=""></div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-8 offset-lg-2 offset-xl-3">
                        <div class="section-title text-center mb-65">
                            <h2>What Our Client’s Say</h2>
                            <p>Trusted by healthcare professionals for quality and reliable service.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-10 col-lg-10 offset-lg-1 offset-xl-1">
                        <div class="test-02-active">
                            <div class="client-wrapper pos-rel text-center">
                                <div class="client-img">
                                    <img src="{{ asset('theme/oms/assets/img/testimonial/03.png') }}" alt="">
                                </div>
                                <div class="client-icon">
                                    <i class="fal fa-star"></i>
                                </div>
                                <div class="client-text">
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
                                        doloremque laudantium, totam rem
                                        aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                                        vitae dicta sunt explicabo.
                                        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed
                                        quia consequuntur magni
                                        dolores eos ratione voluptatem</p>
                                    <h4>Sebastian Barry, <span>Business Manager</span></h4>
                                </div>
                            </div>
                            <div class="client-wrapper pos-rel text-center">
                                <div class="client-img">
                                    <img src="{{ asset('theme/oms/assets/img/testimonial/03.png') }}" alt="">
                                </div>
                                <div class="client-icon">
                                    <i class="fal fa-star"></i>
                                </div>
                                <div class="client-text">
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
                                        doloremque laudantium, totam rem
                                        aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                                        vitae dicta sunt explicabo.
                                        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed
                                        quia consequuntur magni
                                        dolores eos ratione voluptatem</p>
                                    <h4>Sebastian Barry, <span>Business Manager</span></h4>
                                </div>
                            </div>
                            <div class="client-wrapper pos-rel text-center">
                                <div class="client-img">
                                    <img src="{{ asset('theme/oms/assets/img/testimonial/03.png') }}" alt="">
                                </div>
                                <div class="client-icon">
                                    <i class="fal fa-star"></i>
                                </div>
                                <div class="client-text">
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
                                        doloremque laudantium, totam rem
                                        aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                                        vitae dicta sunt explicabo.
                                        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed
                                        quia consequuntur magni
                                        dolores eos ratione voluptatem</p>
                                    <h4>Sebastian Barry, <span>Business Manager</span></h4>
                                </div>
                            </div>
                            <div class="client-wrapper pos-rel text-center">
                                <div class="client-img">
                                    <img src="{{ asset('theme/oms/assets/img/testimonial/03.png') }}" alt="">
                                </div>
                                <div class="client-icon">
                                    <i class="fal fa-star"></i>
                                </div>
                                <div class="client-text">
                                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
                                        doloremque laudantium, totam rem
                                        aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                                        vitae dicta sunt explicabo.
                                        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed
                                        quia consequuntur magni
                                        dolores eos ratione voluptatem</p>
                                    <h4>Sebastian Barry, <span>Business Manager</span></h4>
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
                            <h2>Features Products</h2>
                            <p>Sed ut perspiciatis unde omnis iste natus error</p>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-5 col-md-4">
                        <div class="b-button shop-btn s-btn text-md-right mb-30">
                            <a href="contact.html">view all product <i class="fal fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/01.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/02.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/03.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/04.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/05.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/06.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/07.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/08.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/09.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/10.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/11.png') }}" alt="">
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="single-brand mb-60">
                            <img src="{{ asset('theme/oms/assets/img/brand/12.png') }}" alt="">
                        </div>
                    </div>
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

    </main>

    <!-- footer-area-start -->
    <footer>
        <div class="footer-area pt-80 pb-45">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-wrapper mb-30">
                            <h3 class="footer-title">About Company</h3>
                            <div class="footer-text">
                                <p>But must explain to you how all this mistaken idea of denouncing pleasure and
                                    praising pain was born </p>
                            </div>
                            <div class="footer-icon">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-google-plus-g"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-wrapper ml-80 mb-30">
                            <h3 class="footer-title">Useful Links</h3>
                            <div class="footer-link">
                                <ul>
                                    <li><a href="about.html">Shipping Options</a></li>
                                    <li><a href="our-history.html">My Wishlist</a></li>
                                    <li><a href="about.html">My Account</a></li>
                                    <li><a href="team.html">Return Policy</a></li>
                                    <li><a href="about.html">Shopping FAQs</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-wrapper ml-80 mb-30">
                            <h3 class="footer-title">Product</h3>
                            <div class="footer-link">
                                <ul>
                                    <li><a href="about.html">Thermometer</a></li>
                                    <li><a href="our-history.html">Vitamins & Supplements</a></li>
                                    <li><a href="about.html">Temperature Gun</a></li>
                                    <li><a href="team.html">Oxygen Mmeter & Mask</a></li>
                                    <li><a href="about.html">Shipping & Returns</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-wrapper ml-130 mb-30">
                            <h3 class="footer-title">Payment</h3>
                            <div class="footer-img">
                                <img src="{{ asset('theme/oms/assets/img/footer/footer.png') }}" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area pt-25 pb-25">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="copyright">
                            <p>Copyright <i class="far fa-copyright"></i> 2020 <a href="#">Medibazar</a>. All
                                Rights Reserved</p>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="footer-bottom-link f-right">
                            <ul>
                                <li><a href="#">Home </a></li>
                                <li><a href="#"> About Us</a></li>
                                <li><a href="#">Our Product</a></li>
                                <li><a href="#">Service </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer-area-end -->



    <!-- JS here -->
    <script src="{{ asset('theme/oms/assets/js/vendor/modernizr-3.5.0.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/vendor/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/owl.carousel.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/slick.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.meanmenu.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/ajax-form.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/wow.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/waypoints.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.appear.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.countdown.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.knob.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.counterup.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.scrollUp.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/plugins.js') }}"></script>
    <script src="{{ asset('theme/oms/assets/js/main.js') }}"></script>
</body>

</html>
