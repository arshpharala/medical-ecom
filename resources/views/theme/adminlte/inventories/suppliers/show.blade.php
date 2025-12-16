@extends('theme.adminlte.layouts.app')

@section('title', 'Supplier Details')

@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Supplier Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="{{ route('admin.inventory.suppliers.index') }}">Suppliers</a></li>
              <li class="breadcrumb-item active">Details</li>
            </ol>
          </div>
        </div>
      </div>
    </div>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Supplier Information</h3>
                <div class="card-tools">
                  <a href="{{ route('admin.inventory.suppliers.edit', $supplier) }}" class="btn btn-warning btn-sm">
                    <i class="fas fa-edit"></i> Edit
                  </a>
                  <form action="{{ route('admin.inventory.suppliers.destroy', $supplier) }}" method="POST"
                    class="d-inline">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger btn-sm"
                      onclick="return confirm('Are you sure you want to delete this supplier?')">
                      <i class="fas fa-trash"></i> Delete
                    </button>
                  </form>
                </div>
              </div>

              <div class="card-body">
                <dl class="row">
                  <dt class="col-sm-3">Name:</dt>
                  <dd class="col-sm-9">{{ $supplier->name }}</dd>

                  <dt class="col-sm-3">Email:</dt>
                  <dd class="col-sm-9">{{ $supplier->email }}</dd>

                  <dt class="col-sm-3">Phone:</dt>
                  <dd class="col-sm-9">{{ $supplier->phone ?: 'Not provided' }}</dd>

                  <dt class="col-sm-3">Contact Person:</dt>
                  <dd class="col-sm-9">{{ $supplier->contact_person ?: 'Not provided' }}</dd>

                  <dt class="col-sm-3">Address:</dt>
                  <dd class="col-sm-9">{{ $supplier->address ?: 'Not provided' }}</dd>

                  <dt class="col-sm-3">Created At:</dt>
                  <dd class="col-sm-9">{{ $supplier->created_at->format('M d, Y H:i') }}</dd>

                  <dt class="col-sm-3">Updated At:</dt>
                  <dd class="col-sm-9">{{ $supplier->updated_at->format('M d, Y H:i') }}</dd>
                </dl>
              </div>

              <div class="card-footer">
                <a href="{{ route('admin.inventory.suppliers.index') }}" class="btn btn-secondary">
                  <i class="fas fa-arrow-left"></i> Back to Suppliers
                </a>
              </div>
            </div>
          </div>

          <div class="col-md-4">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Products ({{ $supplier->products->count() }})</h3>
              </div>

              <div class="card-body p-0">
                @if ($supplier->products->count() > 0)
                  <ul class="list-group list-group-flush">
                    @foreach ($supplier->products->take(10) as $product)
                      <li class="list-group-item">
                        <strong>{{ $product->name }}</strong>
                        <br>
                        <small class="text-muted">SKU: {{ $product->sku }}</small>
                      </li>
                    @endforeach
                    @if ($supplier->products->count() > 10)
                      <li class="list-group-item text-center">
                        <small class="text-muted">And {{ $supplier->products->count() - 10 }} more products...</small>
                      </li>
                    @endif
                  </ul>
                @else
                  <div class="card-body text-center">
                    <p class="text-muted">No products associated with this supplier.</p>
                  </div>
                @endif
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection
