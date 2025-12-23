@extends('theme.oms.layouts.app')
@section('content')
<!-- ============================= -->
<!-- HOME-2 HERO BANNER (FIXED) -->
<!-- ============================= -->

<style>
/* ===== HOME-2 HERO BANNERS ===== */

.home2-banner-area .banner-img {
    position: relative;
    width: 100%;
    overflow: hidden;
    border-radius: 6px;
    background-size: cover;
    background-position: center;
}

.home2-banner-area .banner-img > a {
    position: absolute;
    inset: 0;
    z-index: 1;
}

/* LEFT MAIN BANNER */
.home2-banner-area .banner-main {
    min-height: 520px;
    display: flex;
    align-items: center;
    padding: 60px;
}

/* RIGHT SIDE BANNERS */
.home2-banner-area .banner-side {
    min-height: 240px;
    display: flex;
    align-items: center;
    padding: 28px;
}

/* CONTENT */
.home2-banner-area .banner-content,
.home2-banner-area .banner-text {
    position: relative;
    z-index: 2;
}

/* LEFT OVERLAY (BALANCED) */
.home2-banner-area .banner-main::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(
        to right,
        rgba(255,255,255,0.94) 0%,
        rgba(255,255,255,0.75) 42%,
        rgba(255,255,255,0.35) 65%,
        rgba(255,255,255,0.08) 100%
    );
    z-index: 0;
}

/* RIGHT OVERLAY (STRONG CONTRAST) */
.home2-banner-area .banner-side::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(
        to right,
        rgba(0,0,0,0.6),
        rgba(0,0,0,0.25)
    );
    z-index: 0;
}

/* TYPOGRAPHY CONTROL */
.home2-banner-area .banner-content h2 {
    max-width: 520px;
    line-height: 1.1;
}

.home2-banner-area .banner-side h2,
.home2-banner-area .banner-side span,
.home2-banner-area .banner-side a {
    color: #ffffff;
}

/* SPACING FIX */
.home2-banner-area .col-xl-4 .mb-30 {
    margin-bottom: 20px;
}

/* RESPONSIVE */
@media (max-width: 1199px) {
    .home2-banner-area .banner-main { min-height: 460px; }
}

@media (max-width: 991px) {
    .home2-banner-area .banner-main { min-height: 420px; }
    .home2-banner-area .banner-side { min-height: 220px; }
}

@media (max-width: 767px) {
    .home2-banner-area .banner-main {
        min-height: 380px;
        padding: 30px;
    }
    .home2-banner-area .banner-side {
        min-height: 200px;
        padding: 20px;
    }
}
</style>

<div class="banner-area home2-banner-area pt-10 pb-30 pl-55 pr-55">
    <div class="container-fluid">
        <div class="row">

            {{-- LEFT MAIN BANNER --}}
            @php $mainBanner = $banners->first(); @endphp
            @if ($mainBanner)
                <div class="col-xl-8 col-lg-8 col-md-12 mb-30">
                    <div class="banner-img banner-main"
                         style="background-image:url('{{ asset('storage/' . $mainBanner->background) }}');">

                        <a href="{{ $mainBanner->btn_link ?? '#' }}"></a>

                        <div class="banner-content">
                            <span>{{ $mainBanner->translation?->subtitle }}</span>
                            <h2>{{ $mainBanner->translation?->title }}</h2>
                            <p>{{ $mainBanner->translation?->description }}</p>

                            <a class="c-btn mt-20" href="{{ $mainBanner->btn_link }}">
                                {{ $mainBanner->btn_text ?? 'Shop Now' }}
                                <i class="far fa-plus"></i>
                            </a>
                        </div>
                    </div>
                </div>
            @endif

            {{-- RIGHT CATEGORY BANNERS --}}
            <div class="col-xl-4 col-lg-4 col-md-12">
                @foreach ($categories->take(2) as $category)
                    <div class="mb-30">
                        <div class="banner-img banner-side"
                             style="background-image:url('{{ asset('storage/' . $category->image) }}');">

                            <a href="{{ route('products', ['category' => $category->slug]) }}"></a>

                            <div class="banner-text">
                                <span>{{ $category->parent?->translation?->name }}</span>
                                <h2>{{ $category->translation->name }}</h2>

                                <a href="{{ route('products', ['category' => $category->slug]) }}">
                                    Shop Now <i class="far fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

        </div>
    </div>
</div>

<!-- ============================= -->
<!-- END HERO BANNER -->
<!-- ============================= -->



  @include('theme.oms.components.category-banner', ['categories' => $categories])


  @include('theme.oms.components.products', [
      'products' => $newProducts,
      'title' => 'New Products',
      'tagline' => 'Explore our new products',
  ])

  @if (!empty($deal))

    <!-- deal-area-start -->
    <div class="deal-02-area mb-100">
      <div class="container">
        <div class="deal-bg" data-background="{{ !empty($deal->banner_image) ? asset($deal->banner_image) : asset('theme/oms/assets/img/bg/02.jpg') }}">
          <div class="row">
            <div class="col-xl-12 col-lg-12">
              <div class="deal-02-wrapper mb-30">
                <div class="section-title mb-35">
                  <h2>{{ $deal->translation->title }}</h2>
                  <p>{{ $deal->translation->description }}</p>
                </div>
                <div class="deal-content mb-45">
                  <h2>{{ $deal->category_name }}</h2>
                  <span>{{ $deal->price_with_currency }}</span>
                  <div class="deal-button">
                    <a class="c-btn" href="{{ $deal->link_url }}">View Deal <i class="far fa-arrow-right"></i></a>
                  </div>
                </div>
                <div class="deal-count">
                  <div class="deal-time" data-countdown="{{ $deal->ends_at }}"></div>
                </div>
              </div>
            </div>
            {{-- <div class="col-lg-6 col-lg-6">
              <div class="deal-img mb-30">
                <img src="{{ $deal->image }}" alt="deal-img">
              </div>
            </div> --}}
          </div>
        </div>
      </div>
    </div>
    <!-- deal-area-end -->
  @endif

  @include('theme.oms.components.testimonials', ['testimonials' => $testimonials])


  @include('theme.oms.components.brands', ['brands' => $brands])
@endsection
