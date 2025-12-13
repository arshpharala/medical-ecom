@extends('theme.oms.layouts.app')
@section('content')

  @include('theme.oms.components.hero', ['banners' => $banners])


  @include('theme.oms.components.features')

  @include('theme.oms.components.category-banner', ['categories' => $categories])

  @include('theme.oms.components.products', [
      'products' => $newProducts,
      'title' => 'New Products',
      'tagline' => 'Explore our new products',
  ])


  @if (!empty($deal))
    <!-- deal-area-start -->
    <div class="deal-area pb-50 pt-95">
      <div class="container">
        <div class="row">
          <div class="col-xl-6 col-lg-6 offset-lg-3 offset-xl-3">
            <div class="section-title text-center mb-65">
              <h2>{{ $deal->translation->title }}</h2>
              <p>{{ $deal->translation->description }}</p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xl-6 col-lg-8 offset-lg-2 offset-xl-3">
            <div class="deal-wrapper text-center">
              <div class="deal-count">
                <div class="deal-time" data-countdown="{{ $deal->ends_at }}"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- deal-area-end -->
  @endif

  @if ($dealProducts->isNotEmpty())
    <!-- banner-area-start -->
    <div class="banner-02-area pb-70 pl-165 pr-165">
      <div class="container-fluid">
        <div class="row">
          @foreach ($dealProducts as $variant)
            <div class="col-xl-4 col-lg-4 col-md-6">
              <div class="banner-02-wrapper text-center mb-30" data-bg-color="#edf7fb">
                <div class="banner-02-text">
                  <span>{{ $variant->category_name }}</span>
                  <h2>{{ $variant->name }}</h2>
                </div>
                <div class="banner-02-img pos-rel">
                  <a href="{{ $variant->link }}"><img src="{{ $variant->image }}" alt="{{ $variant->name }}"></a>
                  <span class="banner-tag">hot</span>
                </div>
                <div class="banner-price">
                  <span class="old-price">{{ $variant->price_with_currency }}</span>
                  <span class="new-price">{{ $variant->offer_data['discounted_price_with_currency'] }}</span>
                </div>
                <div class="banner-button">
                  <a class="c-btn" href="{{ $variant->link }}">buy now <i class="far fa-plus"></i></a>
                </div>
              </div>
            </div>
          @endforeach
        </div>
      </div>
    </div>
    <!-- banner-area-end -->
  @endif

  @include('theme.oms.components.products', [
      'products' => $featuredProducts,
      'title' => 'Featured Products',
      'tagline' => 'Explore our featured products',
  ])

  @include('theme.oms.components.testimonials', ['testimonials' => $testimonials])


  @include('theme.oms.components.news', ['news' => $news])


  @include('theme.oms.components.brands', ['brands' => $brands])

@endsection
