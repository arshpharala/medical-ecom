    <section class="hero-area">
      <div class="hero-slider">
        <div class="slider-active">
          @foreach ($banners as $banner)
            <div class="single-slider slider-height d-flex align-items-center"
              data-background="{{ $banner->background ? asset('storage/' . $banner->background) : 'theme/medibazaar/assets/img/slider/01.jpg' }}">
              <div class="container">
                <div class="row">
                  <div class="col-xl-5 col-lg-6">
                    <div class="hero-text mt-90">
                      <div class="hero-slider-caption "
                        @if ($banner->text_color) style="color: {{ $banner->text_color }}" @endif>
                        @if ($banner->translation?->subtitle)
                          <span data-animation="fadeInUp" data-delay=".2s">
                            {{ $banner->translation->subtitle }}
                          </span>
                        @endif
                        @if ($banner->translation?->title)
                          <h2 data-animation="fadeInUp" data-delay=".4s">
                            {{ $banner->translation->title }}
                          </h2>
                        @endif
                        @if ($banner->translation?->description)
                          <p data-animation="fadeInUp" data-delay=".6s">
                            {{ $banner->translation->description }}
                          </p>
                        @endif
                      </div>
                      <div class="hero-slider-btn">
                        @if ($banner->btn_link)
                          <a data-animation="fadeInUp" data-delay=".8s" href="{{ $banner->btn_link }}"
                            class="c-btn"
                            style="background: {{ $banner->btn_color }}">{{ $banner->btn_text ?? __('Shop Now') }}
                            <i class="far fa-plus"></i></a>
                        @endif
                        <div class="b-button" data-animation="fadeInUp" data-delay="1s"
                          style="animation-delay: 1s;">
                          <a href="{{ route('products') }}">explore collection <i class="far fa-plus"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-7 col-lg-6">
                    <div class="slider-img d-none d-lg-block" data-animation="fadeInRight" data-delay=".8s">
                      <img src="{{ asset('storage/' . $banner->image) }}" alt="banner image" style="height: 500px">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          @endforeach
        </div>
      </div>
    </section>
