  <header>
    <div class="header-top-area pl-165 pr-165">
      <div class="container-fluid">
        <div class="row">
          <div class="col-xl-8 col-lg-6 col-md-6">
            <div class="header-top-wrapper">
              <div class="header-top-info d-none d-xl-block f-left">
                <span>Busy Schedule ? Order Online, Anytime, 24/7 <a href="{{ route('products') }}"> View
                    Catalog</a></span>
              </div>
              <div class="header-link f-left">
                <span><a href="tel:{!! setting('contact_phone') !!}"><i class="far fa-phone"></i>
                    {!! setting('contact_phone') !!}</a></span>
              </div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-6 col-md-6">
            <div class="header-top-right text-md-right">
              <div class="shop-menu">
                <ul>
                  <li><a href="{{ route('customers.profile') }}"><i class="fal fa-user-circle"></i> My Account</a></li>
                  <li>
                    <a href="{{ route('cart.index') }}">
                      <i class="far fa-cart-plus"></i>
                      Cart
                      @php
                        $cartItems = session('cart', []);
                        $headerCartCount = is_array($cartItems) ? count($cartItems) : 0;
                      @endphp
                      <span class="cart-count" id="cart-count-top"
                        style="background: #ff6f61; color: #fff; font-size: 10px; padding: 2px 6px; border-radius: 50%; position: absolute; top: -8px; right: -10px; {{ $headerCartCount > 0 ? '' : 'display: none;' }}">{{ $headerCartCount }}</span>
                    </a>
                  </li>
                  <li><a href="{{ route('customers.profile') }}#wishlist"><i class="far fa-heart"></i> Wishlist</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="sticky-header" class="main-menu-area menu-01 pl-165 pr-165">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-xl-3 col-lg-3">
            <div class="logo">
              <a href="{{ route('home') }}">
                <img src="{{ asset(setting('site_logo')) }}" alt="{{ setting('site_name') }}" height="80px" />
              </a>
            </div>
          </div>
          <div class="col-xl-9 col-lg-9 d-none d-lg-block">
            <div class="header-right f-right">
              {{-- <div class="header-lang f-right pos-rel d-none d-md-none d-lg-block">
                <div class="lang-icon">
                  <img src="{{ asset('theme/oms/assets/img/icon/flag.png') }}" alt="">
                  <a href="#"><i class="far fa-angle-down"></i></a>
                </div>
                <ul class="header-lang-list">
                  <li><a href="#">UK</a></li>
                </ul>
              </div> --}}
              <div class="menu-bar info-bar f-right d-none d-md-none d-lg-block">
                <a href="#"><i class="fal fa-bars"></i></a>
              </div>
              <div class="header-search f-right d-none d-xl-block">
                <form class="header-search-form">
                  <input placeholder="Search" value="{{ request()->search }}" class="search-input" name="search"
                    type="text">
                  <button type="submit"><i class="far fa-search"></i></button>
                </form>
              </div>
            </div>
            <div class="main-menu">
              <nav id="mobile-menu">
                <ul>
                  <li class="active"><a href="{{ route('home') }}">Home</a></li>
                  <li><a href="{{ route('products') }}">Products</a></li>
                  <li><a href="{{ route('news.index') }}">News</a></li>
                  <li><a href="{{ route('about-us') }}">About Us</a></li>
                  <li><a href="{{ route('contact-us') }}">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>
          <div class="col-12">
            <div class="mobile-menu"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="extra-info">
      <div class="close-icon">
        <button>
          <i class="far fa-window-close"></i>
        </button>
      </div>
      <div class="logo-side mb-30">
        <a href="{{ route('home') }}">
          <img src="{{ asset(setting('site_logo')) }}" alt="{{ setting('site_name') }}">
        </a>
      </div>
      <div class="side-info mb-30">
        <div class="contact-list mb-30">
          <h4>Address</h4>
          <p>{!! setting('address') !!}</p>
        </div>
        <div class="contact-list mb-30">
          <h4>Phone Number</h4>
          <p>{!! setting('contact_phone') !!}</p>
        </div>
        <div class="contact-list mb-30">
          <h4>Email Address</h4>
          <p>{!! setting('contact_email') !!}</p>
        </div>
      </div>

      <div class="social-icon-right mt-20">
        @if (setting('facebook'))
        <a href="{{ setting('facebook') }}">
          <i class="fab fa-facebook-f"></i>
        </a>
        @endif
        @if (setting('twitter'))
        <a href="{{ setting('twitter') }}">
          <i class="fab fa-twitter"></i>
        </a>
        @endif
        @if (setting('instagram'))
        <a href="{{ setting('instagram') }}">
          <i class="fab fa-instagram"></i>
        </a>
        @endif
      </div>
    </div>
  </header>
