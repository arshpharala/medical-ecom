    <div class="brand-area pb-40">
      <div class="container">
        <div class="row">
          @foreach ($brands as $brand)
            <div class="col-xl-2 col-lg-2 col-md-3 col-6">
              <div class="single-brand mb-60">
                <img src="{{ asset('storage/' . $brand->logo) }}" alt="{{ $brand->name }}">
              </div>
            </div>
          @endforeach

        </div>
      </div>
    </div>
