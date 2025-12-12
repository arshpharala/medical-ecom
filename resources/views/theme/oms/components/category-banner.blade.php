    <div class="banner-area banner-pb pt-70 pb-70 pl-130 pr-130">
      <div class="container-fluid">
        <div class="row">
          @foreach ($categories as $cat)
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="banner-wrapper mb-30">
                <div class="banner-img pos-rel">
                  <a href="{{ route('products', ['category' => $cat->slug]) }}">
                    <img src="{{ asset('storage/'. $cat->image) }}" alt="{{ $cat->name }}">
                </a>
                  <div class="banner-text">
                    @if ($cat->parent_id)
                      <span>{{ $cat->parent->translation->name }}</span>
                    @endif
                    <h2>{{ $cat->name }}</h2>
                    <div class="b-button red-b-button">
                      <a href="{{ route('products', ['category' => $cat->slug]) }}">shop now <i class="far fa-plus"></i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          @endforeach
        </div>
      </div>
    </div>
