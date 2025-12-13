@extends('theme.oms.layouts.app')
@section('content')
  <style>
    .category-item ul li a.active {
      color: #ff6f61;
      font-weight: 600;
    }

    /* ===== Sidebar ===== */
    .category-sidebar {
      background: #fff;
      border-radius: 6px;
    }

    /* ===== Title ===== */
    .cat-title {
      font-size: 17px;
      font-weight: 600;
      color: #111;
      margin-bottom: 12px;
    }

    /* ===== Reset ===== */
    .category-list,
    .sub-category-group {
      padding: 0;
      margin: 0;
    }

    /* ===== Base Row ===== */
    .category-row {
      position: relative;
      display: flex;
      align-items: center;
      height: 44px;
      cursor: pointer;
      transition: background-color 0.2s ease, color 0.2s ease;
    }

    .category-row:hover {
      background-color: #f6f8fb;
    }

    /* ===== Arrow ===== */
    .parent-category::before {
      content: "\f105";
      font-family: "Font Awesome 5 Pro";
      font-weight: 400;
      font-size: 13px;
      color: #9aa0a6;
      position: absolute;
      left: 12px;
      top: 50%;
      transform: translateY(-50%);
      transition: transform 0.25s ease;
    }

    /* Expanded arrow */
    .parent-category.is-open::before {
      transform: translateY(-50%) rotate(90deg);
    }

    /* ===== Icon ===== */
    .category-row img {
      width: 20px;
      height: 20px;
      object-fit: contain;
      margin-right: 10px;
      flex-shrink: 0;
    }

    /* ===== Text ===== */
    .category-name {
      font-size: 14.5px;
      line-height: 1;
      white-space: nowrap;
    }

    /* ===== Parent ===== */
    .parent-category {
      padding-left: 32px;
      font-weight: 600;
      color: #1a1a1a;
    }

    /* ===== Children ===== */
    .child-category {
      padding-left: 52px;
      color: #555;
    }

    /* ===== Active Child ===== */
    .child-category.active {
      color: #d60000;
      font-weight: 600;
    }

    /* ===== Parent highlight when child active ===== */
    .parent-category.has-active-child {
      color: #d60000;
    }

    /* ===== Collapsible Wrapper ===== */
    .sub-category-group {
      overflow: hidden;
      max-height: 0;
      transition: max-height 0.3s ease;
    }

    /* Expanded children */
    .parent-category.is-open+.sub-category-group {
      max-height: 500px;
    }
  </style>

  <!-- breadcrumb-area-start -->
  <div class="breadcrumb-area pt-125 pb-125" style="background-image:url({{ asset('storage/' . $page->banner) }})">
    <div class="container">
      <div class="row">
        <div class="col-xl-12">
          <div class="breadcrumb-wrapper">
            <div class="breadcrumb-text">
              <h2>{{ $page->translation?->title ?? 'Product' }}</h2>
            </div>
            {{-- <ul class="breadcrumb-menu">
                            <li><a href="index.html">home</a></li>
                            <li><span>shop</span></li>
                        </ul> --}}
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- breadcrumb-area-end -->


  <!-- shop-full-area-start -->
  <div class="shhop-full-area pt-100 pb-100 pr-60 pl-60 catalog-filters">
    <div class="container-fluid">
      <div class="row">
        <div class="col-xl-3 custom-col-2">

          <div class="category-sidebar cat-side mb-30">
            <h3 class="cat-title">Category</h3>

            <ul class="category-list list-unstyled">

              @foreach (menu_categories(20) as $category)
                <!-- Parent -->
                <li
                  class="category-row parent-category {{ $category->id == ($activeCategory->id ?? null) ? 'active' : '' }}"
                  data-category="{{ $category->id }}" data-category-slug="{{ $category->slug }}">
                  <img src="{{ asset('storage/' . $category->icon) }}" alt="">
                  <span class="category-name">{{ $category->name }}</span>
                </li>
                @if ($category->children->isNotEmpty())
                  <ul class="sub-category-group list-unstyled">
                    @foreach ($category->children as $child)
                      <li
                        class="category-row child-category {{ $child->id == ($activeCategory->id ?? null) ? 'active' : '' }}"
                        data-category="{{ $child->id }}" data-category-slug="{{ $child->slug }}">
                        <img src="{{ asset('storage/' . $child->icon) }}" alt="">
                        <span class="category-name">{{ $child->translation->name }}</span>
                      </li>
                    @endforeach
                  </ul>
                @endif

                <ul class="sub-category-group list-unstyled"></ul>
              @endforeach

              <!-- Parent -->
              {{-- <li class="category-row parent-category">
                <img src="https://via.placeholder.com/40" alt="">
                <span class="category-name">Garments</span>
              </li>

              <ul class="sub-category-group list-unstyled"></ul>

              <!-- Parent -->
              <li class="category-row parent-category">
                <img src="https://via.placeholder.com/40" alt="">
                <span class="category-name">Stationery</span>
              </li>

              <ul class="sub-category-group list-unstyled">
                <li class="category-row child-category">
                  <img src="https://via.placeholder.com/40" alt="">
                  <span class="category-name">Notebook</span>
                </li>
              </ul> --}}

            </ul>
          </div>

          <div id="dynamic-attribute-filters" class="category-sidebar cat-side mb-30 dynamic-attribute-filters">

          </div>

          {{-- <div class="category-sidebar cat-side mb-30">
            <h3 class="cat-title">Filter By Color</h3>
            <div class="cat-widget">
              <div class="cat-widget-color">
                <span class="c-1"></span>
                <span class="c-2"></span>
                <span class="c-3"></span>
                <span class="c-4"></span>
                <span class="c-5"></span>
                <span class="c-6"></span>
                <span class="c-7"></span>
                <span class="c-8"></span>
                <span class="c-9"></span>
              </div>
            </div>
          </div> --}}
        </div>
        <div class="col-xl-9 col-lg-9">
          <div class="pro-ful-tab">
            <div class="row mb-20">
              <div class="col-xl-4 col-lg-3 col-md-3">
                <div class="product-02-tab mb-20">
                  <ul class="nav justify-content-start product-nav" id="myTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                        aria-controls="home" aria-selected="true">
                        <i class="fas fa-th-large"></i>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                        aria-controls="profile" aria-selected="false">
                        <i class="fas fa-bars"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-xl-4 col-lg-5 col-md-5">
                <div class="pro-tab1-content pt-15 mb-20 text-md-center">
                  <h4>Showing 20 Results Of 50 Products</h4>
                </div>
              </div>
              <div class="col-xl-4 col-lg-4 col-md-4">
                <div class="pro-filter mb-20 f-right">
                  <form action="#">
                    <select name="pro-filter" id="pro-filter" class="sort-select">
                      <option value="">Featured</option>
                      <option value="price_asc">Price: Low to High</option>
                      <option value="price_desc">Price: High to Low</option>
                      <option value="newest">Newest</option>
                    </select>
                  </form>
                </div>
              </div>
            </div>
            <div class="product-tab-content">
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                  <div class="row" id="products"><!-- AJAX products injected here --></div>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  <div class="row d-flex" id="products-list"><!-- AJAX list view injected here --></div>
                </div>
              </div>
            </div>

            <div class="basic-pagination mt-20 basic-pagination-2 text-center">
              <ul class="pagination">
                <li><a href="#"><i class="far fa-angle-left"></i></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="far fa-angle-right"></i></a></li>
              </ul>
            </div>

          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- shop-full-area-area -->
@endsection
@push('scripts')
  <script>
    // Laravel route passed to JS
    window.ajaxProductURL = "{{ route('ajax.get-products') }}";
    window.activeCategoryId = "{{ $activeCategory->id ?? '' }}";
  </script>

  <script></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.js"></script>
  <script src="{{ asset('theme/oms/assets/js/filters.js') }}"></script>
@endpush
