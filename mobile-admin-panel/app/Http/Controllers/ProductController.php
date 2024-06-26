<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Shop;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use TCG\Voyager\Models\Role;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::query();
        $products = Product::pluck('all_shops')->toArray();
        // dd($products);
        $allshops = Shop::pluck('id')->toArray();
        /** @var $user User */

        $user = Auth::user(); // Get the authenticated user
        $role = Role::findOrFail($user->role_id);
        $roles = $user->roles()->pluck('id')->toArray();
        $user_data = $user;
        // if (!in_array('Administrator', $roles) && !in_array('Deluxe Mobile Admin', $roles)) {
            if (in_array(3, $roles) || $user->role_id == 3) {
                $shopIds = $user->shops->pluck('id')->toArray();

                // Adjust the query to fetch products associated with the user's shops
                $query->where(function ($q) use ($shopIds) {
                    $q->whereHas('shops', function ($subQuery) use ($shopIds) {
                        $subQuery->whereIn('shops.id', $shopIds);
                    })->orWhere('all_shops', true);
                });
            }
        // }

        if ($request->has('search') && $request->search != '') {
            $search = $request->search;
            $query->where('name', 'LIKE', "%{$search}%")
                // ->orWhere('code', 'LIKE', "%{$search}%")
                ->orWhereHas('company', function ($query) use ($search) {
                    $query->where('name', 'LIKE', "%{$search}%");
                });
        }
        $totalProducts = $query->count();

        $perPage = $request->get('per_page', 10); // Default to 12 if not provided
        if ($perPage == 'all') {
            $dataTypeContent = $query->get();
        } else {
            $dataTypeContent = $query->paginate($perPage);
        }
        
        return view('voyager::products.browse', compact('dataTypeContent', 'totalProducts', 'roles','user_data'));
    }
}
