    <div class="blog-area pt-105 pb-75">
      <div class="container">
        <div class="row">
          <div class="col-xl-6 col-lg-6 offset-lg-3 offset-xl-3">
            <div class="section-title text-center mb-65">
              <h2>Latest News & Blog</h2>
              <p>Sed ut perspiciatis unde omnis iste natus error</p>
            </div>
          </div>
        </div>
        <div class="row">
          @foreach ($news as $n)
            <div class="col-xl-4 col-lg-4 col-md-6">
              <div class="blog-wrapper mb-30">
                <div class="blog-img pos-rel">
                  <a href="{{ route('news.show', ['news' => $n->slug]) }}"><img src="{{ $n->thumbnail ? asset('storage/' . $n->thumbnail) : asset('assets/img/blog/001.jpg') }}" alt=""></a>
                  <span class="blog-tag color-1">{{ $n->category->translation->name }}</span>
                </div>
                <div class="blog-text">
                  <div class="blog-meta">
                    <span><i class="far fa-calendar-alt"></i> <a href="{{ route('news.show', ['news' => $n->slug]) }}">{{ $n->published_at ? $n->published_at->format('d M Y') : $n->created_at->format('d M Y') }}</a></span>
                  </div>
                  <h4><a href="{{ route('news.show', ['news' => $n->slug]) }}">{{ $n->translation->title }}</a></h4>
                  <p>{!! $n->translation->intro !!} </p>
                  <div class="b-button gray-b-button">
                    <a href="{{ route('news.show', ['news' => $n->slug]) }}">read more <i class="far fa-plus"></i></a>
                  </div>
                </div>
              </div>
            </div>
          @endforeach
        </div>
      </div>
    </div>
