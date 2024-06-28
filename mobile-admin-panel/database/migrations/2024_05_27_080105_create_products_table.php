<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->decimal('price', 8, 2);
            $table->integer('quantity')->unsigned()->default(0);
            $table->json('images')->nullable();
            $table->unsignedBigInteger('category_id');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->unsignedBigInteger('company_id');
            $table->foreign('company_id')->references('id')->on('companies')->onDelete('cascade');
            $table->boolean('enable')->default(true);
            $table->string('operating_system')->nullable();
            $table->string('ram_memory')->nullable();
            $table->string('model')->nullable();
            $table->string('product_dimensions')->nullable();
            $table->string('colour')->nullable();
            $table->decimal('weight', 8, 2)->nullable();
            $table->text('features')->nullable();
            $table->string('storage')->nullable();
            $table->text('technical_details')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
