<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class SupplierOrderNotification extends Mailable
{
    use Queueable, SerializesModels;

    public $order;
    public $supplier;

    /**
     * Create a new message instance.
     */
    public function __construct($order, $supplier)
    {
        $this->order = $order;
        $this->supplier = $supplier;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'New Order Notification - ' . $this->order->id,
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        // Get line items for this specific supplier
        $supplierItems = $this->order->lineItems->filter(function ($item) {
            return $item->productVariant->product->supplier_id === $this->supplier->id;
        });

        // Calculate total for this supplier's items
        $supplierTotal = $supplierItems->sum('subtotal');

        return new Content(
            view: 'emails.supplier-order-notification',
            with: [
                'order' => $this->order,
                'supplier' => $this->supplier,
                'supplierItems' => $supplierItems,
                'supplierTotal' => $supplierTotal,
            ],
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
