@extends('voyager::master')

@section('css')

@endsection
<style>
.fixed-size-div {
    width: 300px; /* Set your desired width */
    height: 350px; /* Set your desired height */
    overflow: auto; /* Adds scrollbars if content overflows */
}
.image-container {
    width: 100%;
    max-width: 425px; /* Set max width for larger screens */
    height: 400px;
    position: relative;
    overflow: hidden; /* Ensure image doesn't overflow */
    display: flex;
    justify-content: center;
    align-items: center;
}

.full-cover {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Ensures the image covers the entire container */
    position: absolute;
    top: 0;
    left: 0;
}
</style>
@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')

    <div class="row mb-3">
        <div class="col-md-6">
            <input type="text" id="search" class="form-control" placeholder="Search products..." value="{{ request()->get('search') }}">
        </div>
        <div class="col-md-3">
            <select id="items-per-page" class="form-control">
                <option value="10" {{ request()->get('per_page') == 10 ? 'selected' : '' }}>10</option>
                <option value="25" {{ request()->get('per_page') == 25 ? 'selected' : '' }}>25</option>
                <option value="50" {{ request()->get('per_page') == 50 ? 'selected' : '' }}>50</option>
                <option value="100" {{ request()->get('per_page') == 100 ? 'selected' : '' }}>100</option>
                <option value="500" {{ request()->get('per_page') == 500 ? 'selected' : '' }}>500</option>
                <option value="{{ $totalProducts }}" {{ request()->get('per_page') == 'all' ? 'selected' : '' }}>All</option>
            </select>
        </div>
        <div class="col-md-3 text-right">
        @if($user_data->role_id !=3)
            <a href="{{ route('voyager.products.create') }}" class="btn btn-success">Add Product</a>
        @endif
        </div>
    </div>
    @if(count($dataTypeContent) == 0)
    <div class="text-center font-weight-bold">
         <p>Products not Found</p>
        </div>
    @endif
    <div class="row" id="product-list">
        @if(count($dataTypeContent) > 0)
        @foreach($dataTypeContent as $product)
        <div class="col-md-3">
            <div class="card product-card">
                @php
                $images = json_decode($product->images, true);
                @endphp

                <div class="d-flex justify-content-center align-items-center image-container">
                    @if(is_array($images) && count($images) > 0)
                    <img src="{{ Storage::url($images[0]) }}" class="card-img-top full-cover" alt="{{ $product->name }}">
                    @endif
                </div>

                <div class="card-body fixed-size-div">
                    <h3 class="card-title">{{ $product->name }}</h3>
                    {{-- <p><strong>Code</strong> : {{$product->code }}</p> --}}
                    <p><strong>Model</strong> : {{$product->model }}</p>
                    <p><strong>Price(MOP)</strong> : {{$product->price }}</p>
                    <p><strong>Net Landing Cost</strong> : {{$product->net_landing_cost }}</p>
                    <p><strong>Company</strong> : {{$product->company->name }}</p>
                    {{-- <p><strong>RAM</strong> : {{$product->ram_memory }}</p> --}}
                    {{-- <p><strong>OS</strong> : {{$product->operating_system }}</p> --}}
                    {{-- <p><strong>Colour</strong> : {{$product->colour }}</p> --}}
                    {{-- <p><strong>Storage</strong> : {{$product->storage }}</p> --}}
                    {{-- <p><strong>Weight</strong> : {{$product->weight }}</p> --}}
                    {{-- <p><strong>Category</strong> : {{$product->category->name }}</p> --}}
                    {{-- <p><strong>Dimension</strong> : {{$product->product_dimensions }}</p> --}}
                    {{-- <p class="card-text"><strong>Description</strong>{!! $product->description !!}</p> --}}

                    @if(count($product->offers) > 0)
                    <p><strong>Offers</strong>
                    <ul>
                        @foreach($product->offers as $offer)
                        <li><a href="#" data-toggle="modal" data-target="#offerModal" data-title="{{ $offer->title }}" data-price="{{ $product->price }}" data-discount="{{ $offer->discount }}" data-type="{{ $offer->discount_type }}">{{ $offer->title}}</a></li>
                        @endforeach
                    </ul>
                    </p>
                    @endif


                    <a href="{{ route('voyager.products.show', $product->id) }}" class="btn btn-primary">View</a>
                    @if($user_data->role_id !=3)
                    <a href="{{ route('voyager.products.edit', $product->id) }}" class="btn btn-warning">Edit</a>
                    <form action="{{ route('voyager.products.destroy', $product->id) }}" method="POST" style="display:inline">
                        {{ csrf_field() }}
                        {{ method_field('DELETE') }}
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                    @endif
                </div>
            </div>
        </div>
        @endforeach
        @else
        <h2>No such product</h2>
        @endif
        
    </div> 
      
    @if($dataTypeContent->hasPages())
    <div class="row">
        <div class="col-md-12 text-right">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    @if ($dataTypeContent->onFirstPage())
                    <li class="page-item disabled">
                        <span class="page-link">Previous</span>
                    </li>
                    @else
                    <li class="page-item">
                        <a class="page-link" href="{{ $dataTypeContent->previousPageUrl() }}" aria-label="Previous">Previous</a>
                    </li>
                    @endif

                    @for ($i = 1; $i <= $dataTypeContent->lastPage(); $i++)
                        <li class="page-item {{ $i === $dataTypeContent->currentPage() ? 'active' : '' }}">
                            <a class="page-link" href="{{ $dataTypeContent->url($i) }}">{{ $i }}</a>
                        </li>
                        @endfor

                        @if ($dataTypeContent->hasMorePages())
                        <li class="page-item">
                            <a class="page-link" href="{{ $dataTypeContent->nextPageUrl() }}" aria-label="Next">Next</a>
                        </li>
                        @else
                        <li class="page-item disabled">
                            <span class="page-link">Next</span>
                        </li>
                        @endif
                </ul>
            </nav>
        </div>
    </div>
    @endif

    <div class="modal fade" id="offerModal" tabindex="-1" role="dialog" aria-labelledby="offerModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="offerModalLabel">Offer Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>Offer Title:</strong> <span id="offerTitle"></span></p>
                    <p><strong>Offer Type:</strong> <span id="offerType"></span></p>
                    <p><strong>Discount:</strong> <span id="discount"></span></p>
                    <p><strong>Discounted Price:</strong><span id="discountedPrice"></span></p>
                </div>
            </div>
        </div>
    </div>

</div>
@stop

@section('javascript')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('search');
        const itemsPerPage = document.getElementById('items-per-page');
        const productContainer = document.getElementById('product-list');

        searchInput.addEventListener('input', function() {
            // Check if the length of the search query meets the minimum requirement (e.g., 3 characters)
            if (searchInput.value.length >= 3) {
                fetchProducts();
            }
        });

        itemsPerPage.addEventListener('change', function() {
            fetchProducts();
        });

        function fetchProducts() {
            const searchQuery = searchInput.value;
            const perPage = itemsPerPage.value;
            fetch(`{{ route('voyager.products.index') }}?search=${searchQuery}&per_page=${perPage}`)
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const newContent = doc.getElementById('product-list').innerHTML;
                    productContainer.innerHTML = newContent;

                    const newPagination = doc.querySelector('.pagination');
                    const paginationContainer = document.querySelector('.pagination');
                    if (newPagination) {
                        paginationContainer.innerHTML = newPagination.innerHTML;
                    } else {
                        paginationContainer.innerHTML = '';
                    }
                })
                .catch(error => console.error('Error fetching products:', error));
        }

        const offerLink = document.querySelectorAll('[data-toggle="modal"][data-target="#offerModal"]');

        offerLink.forEach(function(link) {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                const title = this.getAttribute('data-title');
                const price = parseFloat(this.getAttribute('data-price'));
                const type = this.getAttribute('data-type');
                const discount = this.getAttribute('data-discount');
                let discountedPrice = price;

                if (type === 'percentage') {
                    const discountPercentage = discount; // Change this to your actual percentage
                    discountedPrice = price - (price * (discountPercentage / 100));
                } else if (type === 'flat') {
                    const flatDiscount = discount; // Change this to your actual flat discount
                    discountedPrice = price - flatDiscount;
                }

                // Update modal content
                document.getElementById('offerTitle').innerText = title;
                document.getElementById('offerType').innerText = type.charAt(0).toUpperCase() + type.slice(1); // Capitalize first letter
                document.getElementById('discount').innerText = (type === 'percentage') ? Math.round(discount) + '%' : discount; // Capitalize first letter
                document.getElementById('discountedPrice').innerText = discountedPrice.toFixed(2); // Show price with 2 decimal places
            });
        });
    });
</script>
@endsection