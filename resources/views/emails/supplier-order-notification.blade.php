<!DOCTYPE html>
<html>

<head>
  <title>New Order Notification</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      color: #333;
    }

    .header {
      background-color: #f8f9fa;
      padding: 20px;
      border-bottom: 2px solid #007bff;
    }

    .content {
      padding: 20px;
    }

    .customer-info,
    .address-info {
      background-color: #f8f9fa;
      padding: 15px;
      margin: 10px 0;
      border-radius: 5px;
    }

    .product-table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    .product-table th,
    .product-table td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: left;
    }

    .product-table th {
      background-color: #007bff;
      color: white;
    }

    .total-row {
      background-color: #f8f9fa;
      font-weight: bold;
    }

    .footer {
      background-color: #f8f9fa;
      padding: 15px;
      margin-top: 20px;
      border-top: 2px solid #007bff;
    }
  </style>
</head>

<body>
  <div class="header">
    <h1>New Order Notification</h1>
    <p>Dear {{ $supplier->name }},</p>
    <p>A new order has been placed containing products supplied by you.</p>
  </div>

  <div class="content">
    <div class="customer-info">
      <h3>Customer Information</h3>
      <p><strong>Name:</strong> {{ $order->user->name ?? 'N/A' }}</p>
      <p><strong>Email:</strong> {{ $order->user->email ?? 'N/A' }}</p>
      <p><strong>Phone:</strong> {{ $order->user->phone ?? 'N/A' }}</p>
    </div>

    <div class="address-info">
      <h3>Billing Address</h3>
      @if ($order->billingAddress)
        <p>{{ $order->billingAddress->first_name }} {{ $order->billingAddress->last_name }}</p>
        <p>{{ $order->billingAddress->address_line_1 }}</p>
        @if ($order->billingAddress->address_line_2)
          <p>{{ $order->billingAddress->address_line_2 }}</p>
        @endif
        <p>{{ $order->billingAddress->city }}, {{ $order->billingAddress->state }}
          {{ $order->billingAddress->zip_code }}</p>
        <p>{{ $order->billingAddress->country->name ?? 'N/A' }}</p>
        <p><strong>Phone:</strong> {{ $order->billingAddress->phone }}</p>
      @else
        <p>No billing address provided</p>
      @endif
    </div>

    <h3>Order Details</h3>
    <p><strong>Order ID:</strong> {{ $order->order_number ?? $order->id }}</p>
    <p><strong>Order Date:</strong> {{ $order->created_at->format('Y-m-d H:i:s') }}</p>
    <p><strong>Payment Method:</strong> {{ ucfirst($order->payment_method) }}</p>
    <p><strong>Payment Status:</strong> {{ ucfirst($order->payment_status) }}</p>

    <h3>Your Products in This Order</h3>
    <table class="product-table">
      <thead>
        <tr>
          <th>Product</th>
          <th>SKU</th>
          <th>Quantity</th>
          <th>Unit Price</th>
          <th>Subtotal</th>
        </tr>
      </thead>
      <tbody>
        @foreach ($supplierItems as $item)
          <tr>
            <td>{{ $item->productVariant->product->name }}</td>
            <td>{{ $item->productVariant->sku }}</td>
            <td>{{ $item->quantity }}</td>
            <td>${{ number_format($item->price, 2) }}</td>
            <td>${{ number_format($item->subtotal, 2) }}</td>
          </tr>
        @endforeach
        <tr class="total-row">
          <td colspan="4" style="text-align: right;"><strong>Total for Your Products:</strong></td>
          <td><strong>${{ number_format($supplierTotal, 2) }}</strong></td>
        </tr>
      </tbody>
    </table>

    <p><strong>Order Total:</strong> ${{ number_format($order->total, 2) }}</p>
    <p><strong>Currency:</strong> {{ $order->currency->code ?? 'USD' }}</p>
  </div>

  <div class="footer">
    <p>Please prepare the products listed above for shipment.</p>
    <p>If you have any questions about this order, please contact us.</p>
    <p>Thank you for your partnership!</p>
  </div>
</body>

</html>
