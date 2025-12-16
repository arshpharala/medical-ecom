<form action="{{ route('admin.inventory.suppliers.update', $supplier) }}" method="post" class="ajax-form"
  enctype="multipart/form-data" onsubmit="handleFormSubmission(this)">
  @csrf
  @method('PUT')
  @include('theme.adminlte.components._aside-header', [
      'moduleName' => __('crud.edit_title', ['name' => 'Brand']),
  ])

  <!-- Scrollable Content -->
  <div class="flex-fill" style="overflow-y:auto; min-height:0; max-height:calc(100vh - 132px);">
    <div class="p-3" id="aside-inner-content">

      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <label>Supplier Name</label>
            <input type="text" name="name" class="form-control" value="{{ $supplier->name }}" required>
          </div>
          <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" value="{{ $supplier->email }}" required>
          </div>
          <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phone" class="form-control" value="{{ $supplier->phone }}" required>
          </div>
          <div class="form-group">
            <label>Contact Person</label>
            <input type="text" name="contact_person" class="form-control" value="{{ $supplier->contact_person }}">
          </div>


          <div class="form-group">
            <label>Address</label>
            <textarea name="address" id="" class="form-control" rows="4">{{ $supplier->address }}</textarea>
          </div>

        </div>
      </div>

    </div>
  </div>

  <!-- Fixed Buttons -->
  @include('theme.adminlte.components._aside-footer')

</form>
<script>
  $(document).ready(function() {
    $("form.ajax-form").each(function() {
      handleFormSubmission(this);
    });
  });
</script>
