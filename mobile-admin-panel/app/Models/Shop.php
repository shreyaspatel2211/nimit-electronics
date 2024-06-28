<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class Shop extends Model
{
    use HasFactory;

    protected $fillable = [
        'shop_name',
        'shop_email',
        'shop_phone',
        'shop_address',
        'shop_website',
        'owner_name',
        'owner_email',
        'owner_phone',
        'owner_address',
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'shop_product');
    }

    public function users() {
       
        return $this->belongsToMany(User::class);
    }
}
