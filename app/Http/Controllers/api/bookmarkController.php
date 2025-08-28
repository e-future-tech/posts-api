<?php

namespace App\Http\Controllers\api;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\bookmark;
use Exception;

class bookmarkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user = $request->user();

        $data = $user->bookmarkedPosts; // Ambil semua post yang dibookmark user:


        return response()->json([
            'data' => $data
        ]);
    }

    public function show(Request $request) {}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, string $post)
    {
        $user = $request->user();

        $checking = bookmark::where('post_id', $post)->first();

        if (!$checking) {

            $user->bookmarkedPosts()->attach($post);

            return response()->json([
                'name' => $user->name,
                'message' => "Added to bookmark"
            ]);
        } else if ($checking) {

            return response()->json([
                'username' => $user->name,
                'message' => "Already Added to bookmark"
            ]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function bookmarkByUser(string $post)
    {
        $post = Post::find($post);

        $data = $post->bookmarkedByUsers; // Ambil semua post yang dibookmark user:


        return response()->json([
            'data' => $data
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {

        $post = bookmark::where("post_id", $id)->first();

        if ($post) {
            $user = $request->user();

            $user->bookmarkedPosts()->detach($id);

            return response()->json([
                'message' => 'Remove from ' . $user->name . ' bookmark'
            ]);
        } else {
            return response()->json([
                'message' => 'not found or already deleted'
            ]);
        }
    }
}
