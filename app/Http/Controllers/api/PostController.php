<?php

namespace App\Http\Controllers\api;

use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::with(['user', 'category'])->paginate(15);

        $posts_data = $posts->map(function ($post) {
            return [
                'id' => $post->id,
                'title' => $post->title,
                'user' => $post->name,
                'user' => $post->category,
                'slug' => $post->slug,
                'body' => $post->body,
                'user' => [
                    'id' => $post->user->id,
                    'name' => $post->user->name,
                ],
                'category' => [
                    'id' => $post->category->id,
                    'name' => $post->category->name,
                ],
                'cover_image' => $post->getFirstMediaUrl('articles'), // cover image
                'created_at' => $post->created_at,
                'updated_at' => $post->updated_at,
            ];
        });

        return response()->json([
            'current_page' => $posts->currentPage(),
            'page' => $posts_data,
            'first_item' => $posts->firstItem(),
            'last_item' => $posts->lastItem(),
            'per_page' => $posts->perPage(),
            'total' => $posts->total(),
            'lastPage' => $posts->lastPage(),
            'nextPageUrl' => $posts->nextPageUrl(),
            'prevPageUrl' => $posts->previousPageUrl()
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'required|string',
            'body' => 'required|string',
            'category_id' => 'required|exists:categories,id',
        ]);



        $user = $request->user(); // ambil user yang login

        $post = $user->posts()->create($validated); // simpan post, user_id otomatis

        if ($request->hasFile('cover')) {
            $post->addMedia($request->file('cover'))
                ->toMediaCollection('articles');
        }

        return response()->json([
            'message' => 'Post created',
            'post' => $post
        ], 201);
    }

    /**
     * Display the specified resource.
     */


    public function showByGroup(string $group, $name)
    {

        if ($group == "category") {
            $categories = Category::where('name', $name)->first();

            if ($categories) {
                $post = $categories->posts()->with('user')->paginate(10);

                return response()->json([
                    'message' => 'Post berhasil di terima',
                    'post' => $post
                ], 200);
            }

            return response()->json([
                'message' => 'Not found or Name is wrong',
            ], 200);
        } else if ($group == "user") {
            $user = User::where('name', $name)->first();

            $post = $user->posts()->with('category')->paginate(10);

            return response()->json([
                'message' => 'Post berhasil di terima',
                'post' => $post
            ], 200);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateByUser(Request $request, string $id)
    {

        $user = $request->user();

        $post = $user->posts()->where('id', $id)->first();

        if (!$post) {
            return response()->json([
                'message' => 'Post tidak ditemukan atau bukan milik user'
            ], 404);
        }

        // Validasi request
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'required|string|max:255|unique:posts,slug,' . $post->id, // pengecualian
            'body' => 'required|string',
            'category_id' => 'required|exists:categories,id',
        ]);

        $post->update($validated);

        if ($request->hasFile('cover_image')) {
            // Hapus cover lama
            $post->clearMediaCollection('cover');

            // Simpan cover baru
            $post->addMedia($request->file('cover_image'))
                ->toMediaCollection('cover');
        }

        return response()->json([
            'message' => 'Post berhasil diperbarui',
            'post' => [
                'id' => $post->id,
                'title' => $post->title,
                'slug' => $post->slug,
                'body' => $post->body,
                'category_id' => $post->category_id,
                'cover_image' => $post->getFirstMediaUrl('cover'),
                'updated_at' => $post->updated_at,
            ]
        ]);
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {

        $user = $request->user();

        $post = $user->posts()->where('id', $id)->first();

        if (!$post) {
            return response()->json(['message' => 'Post tidak ditemukan atau bukan milik user'], 404);
        }

        $post->Delete();

        return response()->json(['message' => 'Post berhasil dihapus']);
    }
}
