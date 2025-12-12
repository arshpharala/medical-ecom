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

</head>

<body>

  @include('theme.oms.layouts.header')
  <main>
    @yield('content')
  </main>
  @include('theme.oms.layouts.footer')


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
</body>

</html>
