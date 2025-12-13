<!doctype html>
<html class="no-js" lang="{{ locale()->code }}" style="direction:{{ locale()->direction ?? 'ltr' }}">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  {!! render_meta_tags($meta ?? null) !!}
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="shortcut icon" type="image/x-icon" href="{{ asset('theme/oms/assets/img/favicon.ico') }}">


  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/bootstrap.min.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/owl.carousel.min.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/animate.min.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/magnific-popup.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/fontawesome-all.min.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/themify-icons.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/meanmenu.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/slick.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/main.css') }}">
  <link rel="stylesheet" href="{{ asset('theme/oms/assets/css/responsive.css') }}">

  <style>
    /* =========================================================
   FINAL PRODUCT CARD FIX – SPACING, SHADOW, SIZE BALANCE
   ========================================================= */


    /* CARD BASE */
    .product-wrapper,
    .product-02-wrapper,
    .product-03-wrapper {
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      background: #ffffff;
      border: 1px solid #eeeeee;
      border-radius: 8px;

      /* 🔹 spacing */
      margin-bottom: 30px;

      /* 🔹 soft default shadow */
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.04);

      transition:
        border-color 0.3s ease,
        box-shadow 0.3s ease,
        transform 0.2s ease;
    }

    /* HOVER */
    .product-wrapper:hover,
    .product-02-wrapper:hover,
    .product-03-wrapper:hover {
      border-color: #e0e0e0;
      box-shadow: 0 14px 38px rgba(0, 0, 0, 0.08);
    }

    /* IMAGE CONTAINER (TALLER CARD FEEL) */
    .product-img,
    .product-02-img {
      position: relative;
      height: 300px;
      /* 🔺 increased height */
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;

      padding: 10px;
      /* 🔻 visually reduces width */
    }

    /* IMAGE */
    .product-img img,
    .product-02-img img {
      max-width: 100%;
      max-height: 100%;
      width: auto;
      height: auto;
      object-fit: contain;
    }

    /* TEXT AREA */
    .product-text {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;

      padding: 22px 18px 14px;
      /* narrower width feel */
    }

    /* PRICE */
    .product-text span {
      margin-top: 10px;
    }

    /* =========================================================
   ACTION BUTTON FIX (ROW LAYOUT)
   ========================================================= */

    .product-action {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;

      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;

      opacity: 0;
      transition: all 0.3s ease;
      z-index: 9;
    }

    /* SHOW ON HOVER */
    .product-wrapper:hover .product-action,
    .product-02-wrapper:hover .product-action,
    .product-03-wrapper:hover .product-action {
      bottom: 40px;
      opacity: 1;
    }

    /* ICON BUTTONS */
    .product-action .action-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;

      height: 45px;
      width: 45px;
      min-width: 45px;

      border-radius: 50%;
      padding: 0;
      line-height: 45px;
      flex-shrink: 0;
    }

    /* ADD TO CART BUTTON */
    .product-action .c-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;

      height: 45px;
      padding: 0 22px;
      border-radius: 30px;
      line-height: 45px;

      white-space: nowrap;
    }

    /* ICON ALIGNMENT */
    .product-action i {
      line-height: 1;
    }

    /* =========================================================
   MOBILE SAFETY
   ========================================================= */

    @media (max-width: 767px) {

      .product-img,
      .product-02-img {
        height: 240px;
      }
    }
  </style>
</head>

<body>

  @include('theme.oms.layouts.header')
  <main>
    @yield('content')
  </main>
  @include('theme.oms.layouts.footer')

  <script>
    var appUrl = "{{ url('/') }}";
  </script>
  <script src="{{ asset('theme/oms/assets/js/vendor/modernizr-3.5.0.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/vendor/jquery-1.12.4.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/popper.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/bootstrap.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/owl.carousel.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/isotope.pkgd.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/slick.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.meanmenu.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/ajax-form.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/wow.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/waypoints.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.appear.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.countdown.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.knob.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.counterup.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.scrollUp.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/imagesloaded.pkgd.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/jquery.magnific-popup.min.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/plugins.js') }}"></script>
  <script src="{{ asset('theme/oms/assets/js/main.js') }}"></script>

  @stack('scripts')
</body>

</html>
