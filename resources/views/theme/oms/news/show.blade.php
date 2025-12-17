@extends('theme.oms.layouts.app')
@section('content')
  <!-- blog-area-start -->
  <div class="blog-area pt-105 pb-70">
    <div class="container">
      <div class="row">
        <div class="col-xl-4 col-lg-4 mb-30">
          <div class="widget widget-2 mb-30">
            <form class="search-form">
              <input type="text" placeholder="Search...">
              <button type="submit"><i class="fas fa-search"></i></button>
            </form>
          </div>
          <div class="widget mb-30">
            <h3 class="widget-title">Categories</h3>
            <ul class="blog-side-list">
              @foreach ($categories as $category)
                <li>
                  <a href="{{ route('news.index', ['category' => $category->slug]) }}">{{ $category->name }}
                    <span>({{ $category->news_count }})</span> </a>
                </li>
              @endforeach
            </ul>
          </div>
          <div class="widget mb-30">
            <h3 class="widget-title">Recent News</h3>
            <ul class="recent-posts">
              @foreach ($recentNews as $r)
                <li>
                  <div class="widget-posts-image">
                    <a href="blog-details.html"><img
                        src="{{ $r->thumbnail ? asset('storage/' . $r->thumbnail) : asset('assets/img/blog/001.jpg') }}"
                        alt="{{ $r->translation->title }}"></a>
                  </div>
                  <div class="widget-posts-body">
                    <h6 class="widget-posts-title"><a href="blog-details.html">{{ $r->translation->title }}</a></h6>
                    <div class="widget-posts-meta">
                      {{ $r->published_at ? $r->published_at->format('d M Y') : $r->created_at->format('d M Y') }}</div>
                  </div>
                </li>
              @endforeach

            </ul>
          </div>
          {{-- <div class="widget widget-2 mb-30">
                                <div class="blog-banner-img">
                                    <a href="blog-details.html"><img src="assets/img/blog/banner.jpg" alt=""></a>
                                </div>
                            </div> --}}
          {{-- <div class="widget">
                                <h3 class="widget-title">Popular Tags</h3>
                                <div class="tag">
                                    <a href="blog-details.html">Cleaning</a>
                                    <a href="blog-details.html">Business</a>
                                    <a href="blog-details.html">Car</a>
                                    <a href="blog-details.html">html</a>
                                    <a href="blog-details.html">House</a>
                                    <a href="blog-details.html">Apartment</a>
                                    <a href="blog-details.html">Washing</a>
                                    <a href="blog-details.html">Agency</a>
                                </div>
                            </div> --}}
        </div>
        <div class="col-xl-8 col-lg-8 mb-30">
          <div class="blog-details blog-standard">
            <div class="blog-wrapper">
              <div class="blog-img pos-rel">
                <img src="{{ $news->image ? asset('storage/' . $news->image) : asset('assets/img/blog/default.jpg') }}"
                  alt="">
              </div>
              <div class="blog-text">
                <div class="blog-meta">
                  <span><i
                      class="far fa-calendar-alt"></i>{{ $news->published_at ? $news->published_at->format('d M Y') : $news->created_at->format('d M Y') }}</span>
                </div>
                <h4>{{ $news->translation->title }}</h4>
                <p>{!! $news->translation->intro !!}</p>
              </div>
              <div class="post-text  mb-20">

                {!! $news->translation->description !!}
              </div>
              <div class="row mt-50">
                {{-- <div class="col-xl-8 col-lg-8 col-md-8 mb-15">
                                            <div class="blog-post-tag">
                                                <span>Releted Tags</span>
                                                <a href="#">organic</a>
                                                <a href="#">Foods</a>
                                                <a href="#">tasty</a>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-4 mb-15">
                                            <div class="blog-share-icon text-left text-md-right">
                                                <span>Share: </span>
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                                <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                                <a href="#"><i class="fab fa-vimeo-v"></i></a>
                                            </div>
                                        </div> --}}
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="navigation-border pt-50 mt-40"></div>
                </div>

                {{-- PREVIOUS POST --}}
                @if (!empty($previousNews))
                  <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="bakix-navigation b-next-post text-left mb-30">
                      <span>
                        <a href="{{ route('news.show', $previousNews->slug) }}">Prev Post</a>
                      </span>
                      <h4>
                        <a href="{{ route('news.show', $previousNews->slug) }}">
                          {{ $previousNews->translation->title ?? 'Previous Post' }}
                        </a>
                      </h4>
                    </div>
                  </div>
                @endif

                {{-- NEXT POST --}}
                @if (!empty($nextNews))
                  <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="bakix-navigation b-next-post text-left text-md-right mb-30">
                      <span>
                        <a href="{{ route('news.show', $nextNews->slug) }}">Next Post</a>
                      </span>
                      <h4>
                        <a href="{{ route('news.show', $nextNews->slug) }}">
                          {{ $nextNews->translation->title ?? 'Next Post' }}
                        </a>
                      </h4>
                    </div>
                  </div>
                @endif

              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- blog-area-end -->
@endsection
