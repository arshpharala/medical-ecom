    <div class="testimonial-area pt-100 pb-175" data-background="{{ asset('theme/medibazaar/assets/img/bg/test.jpg') }}">
      <div class="container">
        <div class="row">
          <div class="col-xl-6 col-lg-6 offset-lg-3 offset-xl-3">
            <div class="section-title text-center mb-65">
              <h2>What Our Client’s Say</h2>
              <p>Sed ut perspiciatis unde omnis iste natus error</p>
            </div>
          </div>
        </div>
        <div class="row test-active">
          @foreach ($testimonials as $testimonial)
            <div class="col-xl-6">
              <div class="testimonial-wrapper">
                <div class="inner-test d-flex justify-content-between align-items-center">
                  <div class="test-img">
                    <img src="{{ asset('storage/' . $testimonial->image) }}" alt="">
                  </div>
                  <div class="test-rating">
                    @for ($i = 0; $i < $testimonial->rating; $i++)
                      <i class="fas fa-star"></i>
                    @endfor
                  </div>
                </div>
                <div class="test-text">
                  <p>{{ $testimonial->translation->description }}</p>
                  <h4>{{ $testimonial->translation->name }}</h4>
                                <span>{{ $testimonial->designation }}</span>
                </div>
              </div>
            </div>
          @endforeach
          @foreach ($testimonials as $testimonial)
            <div class="col-xl-6">
              <div class="testimonial-wrapper">
                <div class="inner-test d-flex justify-content-between align-items-center">
                  <div class="test-img">
                    <img src="{{ asset('storage/' . $testimonial->image) }}" alt="">
                  </div>
                  <div class="test-rating">
                    @for ($i = 0; $i < $testimonial->rating; $i++)
                      <i class="fas fa-star"></i>
                    @endfor
                  </div>
                </div>
                <div class="test-text">
                  <p>{{ $testimonial->translation->description }}</p>
                  <h4>{{ $testimonial->translation->name }}</h4>
                                <span>{{ $testimonial->designation }}</span>
                </div>
              </div>
            </div>
          @endforeach

        </div>
      </div>
    </div>
