  <!-- header-start -->
  <header>
    <div class="header-area grey-3-bg pl-55 pr-55 d-none d-lg-block">
      <div class="container-fluid">
        <div class="row">
          <div class="col-xl-8 col-lg-9 col-md-8">
            <div class="header-top-wrapper">
              <div class="header-info">
                <span><i class="far fa-phone"></i> Call Us {!! setting('contact_phone') !!}</span>
                <span class="envelopes-header-icon"><i class="far fa-envelope-open"></i>
                  {!! setting('contact_email') !!}</span>
                <span class="mails-header-icon"><i class="far fa-map-marked"></i>{!! setting('address') !!}</span>
              </div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-3 col-md-4 ">
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
              <img src="{{ asset(setting('site_logo')) }}" alt="{{ setting('site_name') }}" height="80px" />
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
                  <li><a class="my-icon" href="{{ route('customers.profile') }}"><i class="fal fa-user-circle"></i> My
                      Account</a></li>
                  <li><a href="{{ route('cart.index') }}"><i class="far fa-cart-plus"></i> Cart</a>
                  </li>
                  <li><a href="{{ route('customers.profile') }}#wishlist"><i class="far fa-heart"></i> Wishlist</a>
                  </li>
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
    <div class="header-search-area pt-15 pb-15 pl-55 pr-55 d-none d-lg-block">
      <div class="container-fluid">
        <div class="row">
          <div class="col-xl-3 col-lg-3 col-md-6 col-6">
            <div class="menu-bar menu-bar-2">
              <a class="cat-toggle" href="#"><i class="fal fa-bars"></i></a>
              <span>Categories</span>
            </div>
            <div class="category-menu">
              <ul>
                @foreach (header_categories() as $cat)
                  <li><a href="{{ route('products', ['category' => $cat->slug]) }}">{{ $cat->name }}</a>
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
        </div>
      </div>
    </div>

  </header>
  <!-- header-start -->
