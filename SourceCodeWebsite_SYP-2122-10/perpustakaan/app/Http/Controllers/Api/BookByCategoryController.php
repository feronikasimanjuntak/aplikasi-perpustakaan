<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookByCategoryResource;
use App\Http\Resources\BooksResource;
use App\Models\BookCategory;
use Illuminate\Http\Request;
use App\Models\Book;

class BookByCategoryController extends Controller
{
    

     public function index(BookCategory $booksCategory)
    {
        return BookByCategoryResource::collection(
            Book::with('category')->where('kategori_id', $booksCategory->id)->paginate(5)
        );
    }

}
