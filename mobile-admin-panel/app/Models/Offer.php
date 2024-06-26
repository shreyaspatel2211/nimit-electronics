<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    protected $table = 'offers';
    use HasFactory;
    protected $fillable = ['title', 'description', 'discount', 'discount_type','valid_from', 'valid_until'];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'products_offers');
    }
}