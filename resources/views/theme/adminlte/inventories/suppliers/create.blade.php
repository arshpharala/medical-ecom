
<form action="{{ route('admin.inventory.suppliers.store') }}" method="post" class="ajax-form" enctype="multipart/form-data"
  onsubmit="handleFormSubmission(this)">
  @csrf
  @include('theme.adminlte.components._aside-header', [
      'moduleName' => __('crud.create_title', ['name' => 'Supplier']),
  ])

  <!-- Scrollable Content -->
  <div class="flex-fill" style="overflow-y:auto; min-height:0; max-height:calc(100vh - 132px);">
    <div class="p-3" id="aside-inner-content">

      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <label>Supplier Name</label>
            <input type="text" name="name" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phone" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Contact Person</label>
            <input type="text" name="contact_person" class="form-control"">
          </div>
          <div class="form-group">
            <label>Address</label>
            <textarea name="address" id="" class="form-control" rows="4"></textarea>
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
