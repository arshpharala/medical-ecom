<?php

namespace App\Models\Inventory;

use App\Models\Catalog\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Supplier extends Model
{
    use SoftDeletes;

    protected $fillable = ['name', 'email', 'phone', 'address', 'contact_person'];

    public function products()
    {
        return $this->hasMany(Product::class, 'supplier_id');
    }
}
