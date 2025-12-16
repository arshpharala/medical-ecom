@extends('theme.adminlte.layouts.app')
@section('content-header')
  <div class="row mb-2">
    <div class="col-sm-6">
      <h1>@lang('crud.list_title', ['name' => 'Suppliers'])</h1>
    </div>
    <div class="col-sm-6 d-flex flex-row justify-content-end gap-2">
      <button data-url="{{ route('admin.inventory.suppliers.create') }}" type="button" class="btn btn-secondary"
        onclick="getAside()"><i class="fa fa-plus"></i> @lang('crud.create')</button>
    </div>
  </div>
@endsection
@section('content')
  <div class="card">
    <div class="card-body">
      <table class="table table-bordered data-table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Contact Person</th>
            <th>Products</th>
            <th>Created At</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
@endsection
@push('scripts')
  <script>
    $(function() {
      $('.data-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '{{ route('admin.inventory.suppliers.index') }}',
        columns: [
          //     {
          //     data: 'id',
          //     name: 'id'
          //   },
          {
            data: 'name',
            name: 'name'
          },
          {
            data: 'email',
            name: 'email',
          },
          {
            data: 'phone',
            name: 'phone'
          },
          {
            data: 'contact_person',
            name: 'contact_person'
          },
          {
            data: 'products_count',
            name: 'products_count',
            searchable: false
          },
          {
            data: 'created_at',
            name: 'created_at'
          },
          {
            data: 'action',
            name: 'action',
            orderable: false,
            searchable: false
          }
        ]
      });
    });
  </script>
@endpush
