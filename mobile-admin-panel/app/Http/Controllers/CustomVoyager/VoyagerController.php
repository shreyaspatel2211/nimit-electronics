<?php

namespace App\Http\Controllers\CustomVoyager;

use TCG\Voyager\Http\Controllers\VoyagerController as BaseVoyagerController;

class VoyagerController extends BaseVoyagerController
{
    public function index()
    {
        return redirect()->url('/admin/booking-details');
    }
}
