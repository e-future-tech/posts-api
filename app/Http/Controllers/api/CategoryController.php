<?php

namespace App\Http\Controllers\api;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Category::paginate(15);

        return response()->json([
            "data" => $data
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required'
        ]);

        Category::create($validated);

        return response()->json([
            "message" => "category created"
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $category)
    {
        $find = Category::where("name", $category)->first();

        return response()->json([
            "category" => $find
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $category)
    {
        $finder = Category::where("name", $category);

        $validated = $request->validate([
            'name' => 'required'
        ]);

        $finder->update($validated);

        return response()->json([
            "Message" => "Category updated"
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $category)
    {
        $finder = Category::where("name", $category);

        $finder->delete();

        return response()->json([
            "Message" => "Category deleted"
        ]);
    }
}
