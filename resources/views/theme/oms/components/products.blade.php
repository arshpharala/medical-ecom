 <div class="product-area pb-50">
      <div class="container">
        <div class="row mb-30">
          <div class="col-xl-7 col-lg-7 col-md-7">
            <div class="section-title mb-30">
              <h2>{{ $title ?? 'Products' }}</h2>
              @if ($tagline)
              <p>{{ $tagline  }}</p>
              @endif
            </div>
          </div>
          <div class="col-xl-5 col-lg-5 col-md-5">
            <div class="b-button shop-btn s-btn text-md-right mb-30">
              <a href="{{ route('products') }}">view all product <i class="fal fa-long-arrow-right"></i></a>
            </div>
          </div>
        </div>

        <div class="row">
          @foreach ($products as $variant)
            <div class="col-xl-4 cl-lg-4 col-md-6">
              <div class="product-wrapper text-center mb-45">
                <div class="product-img pos-rel">
                  <a href="{{ $variant->link }}">
                    <img src="{{ $variant->image }}" alt="{{ $variant->name }}">
                    {{-- <img class="secondary-img" src="theme/medibazaar/assets/img/products/02.jpg" alt=""> --}}
                  </a>
                  <div class="product-action">
                    <a class="action-btn {{ $variant->is_wishlisted ? 'is-active' : '' }}"
                      data-variant-id="{{ $variant->id }}" href="#">
                      <i class="far fa-heart"></i>
                    </a>
                    <a class="c-btn add-to-cart-btn" data-variant-id="{{ $variant->id }}" href="#">add
                      to cart <i class="far fa-plus"></i></a>
                    <a class="action-btn" href="{{ $variant->link }}"><i class="far fa-search"></i></a>
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

