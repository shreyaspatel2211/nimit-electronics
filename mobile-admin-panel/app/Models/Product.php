<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    use HasFactory;

    protected $fillable = ['name', 'description', 'price', 'quantity','image', 'category_id', 'company_id', 'code'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function shops()
    {
        return $this->belongsToMany(Shop::class, 'shop_product');
    }

    public function offers()
    {
        return $this->belongsToMany(Offer::class, 'products_offers');
    }
}
