<?php

use App\Models\User;
use App\Models\bookmark;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use App\Http\Controllers\api\AuthController;
use App\Http\Controllers\api\PostController;
use App\Http\Controllers\api\bookmarkController;
use App\Http\Controllers\api\CategoryController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::resource('/category', CategoryController::class);

Route::post('/post/update/{id}', [PostController::class, 'updateByUser'])->middleware('auth:sanctum');
Route::get('/post/{group}/{name}', [PostController::class, 'showByGroup']);

Route::resource('/post', PostController::class)->only([
    'index',
]);

Route::resource('/post', PostController::class)->only([
    'store',
    'update',
    'destroy'
])->middleware('auth:sanctum');

Route::resource('/bookmark', bookmarkController::class)->only([
    'index',
    'destroy'
])->middleware('auth:sanctum');

Route::get('/bookmark/{post}', [bookmarkController::class, "store"])->middleware('auth:sanctum');



// Notice (kalau email belum diverifikasi)
Route::get('/email/verify', function () {
    return response()->json([
        'message' => 'Please verify your email before continuing.'
    ], 403);
})->middleware('auth:sanctum')->name('verification.notice');

// Verifikasi (klik link dari email)
Route::get('/email/verify/{id}/{hash}', function ($id, $hash) {
    $user = User::findOrFail($id);

    // Cocokkan hash email
    if (! hash_equals(sha1($user->getEmailForVerification()), $hash)) {
        return response()->json(['message' => 'Invalid verification link.'], 403);
    }

    // Tandai sebagai verified kalau belum
    if (! $user->hasVerifiedEmail()) {
        $user->markEmailAsVerified();
    }

    return response()->json(['message' => 'Email verified successfully!']);
})->middleware(['signed'])->name('verification.verify');

// Resend verification email
Route::post('/email/verification-notification', function (Illuminate\Http\Request $request) {
    if ($request->user()->hasVerifiedEmail()) {
        return response()->json(['message' => 'Already verified']);
    }

    $request->user()->sendEmailVerificationNotification();

    return response()->json(['message' => 'Verification link sent']);
})->middleware(['auth:sanctum', 'throttle:6,1'])->name('verification.send');


// 1. Request link reset password (kirim email)
Route::post('/forgot-password', function (Request $request) {
    $request->validate(['email' => 'required|email']);

    $status = Password::sendResetLink(
        $request->only('email')
    );

    return $status === Password::RESET_LINK_SENT
        ? response()->json(['message' => __($status)], 200)
        : response()->json(['message' => __($status)], 400);
});

// 2. Reset password dengan token dari email
Route::post('/reset-password', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'token' => 'required',
        'password' => 'required|min:8|confirmed',
    ]);

    $status = Password::reset(
        $request->only('email', 'password', 'password_confirmation', 'token'),
        function ($user, $password) {
            $user->forceFill([
                'password' => Hash::make($password),
                'remember_token' => Str::random(60),
            ])->save();

            event(new PasswordReset($user));
        }
    );

    return $status === Password::PASSWORD_RESET
        ? response()->json(['message' => __($status)], 200)
        : response()->json(['message' => __($status)], 400);
});
