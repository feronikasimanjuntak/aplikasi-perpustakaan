<?php

namespace App\Http\Controllers\Office;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Mail\ResetMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest:office')->except('do_logout');
    }

    public function index()
    {
        return view('pages.office.auth.main');
    }

    public function forgot()
    {
        return view('pages.office.auth.forgot');
    }

   public function do_login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|max:255',
            'password' => 'required|min:8',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            if ($errors->has('email')) {
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('email'),
                ]);
            }else{
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('password'),
                ]);
            }
        }
        $check = User::where("email", $request->email)->where('role', '!=','member')->first();
        $user = $request->all();
        if ($check) {
            if (Auth::guard('office')->attempt($user)) {
                return response()->json([
                    'alert' => 'success',
                    'message' => 'Selamat Datang Kembali ' . Auth::guard('office')->user()->name,
                ]);
            }
            else {
                return response()->json([
                    'alert' => 'error',
                    'message' => 'Password salah!',
                ]);
            }
        }else{
            return response()->json([
                'alert' => 'error',
                'message' => 'email tidak ditemukan!',
            ]);
        }
    }

    public function do_forgot(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            if ($errors->has('email')) {
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('email'),
                ]);
            }
        }
        $user = User::where('email',$request->email)->first();
        if(!$user){
            return response()->json([
                'alert' => 'error',
                'message' => 'Email tidak ditemukan',
            ]);
        }else{
            Mail::to($request->email)->send(new ResetMail($user));
            return response()->json([
                'alert' => 'success',
                'message' => 'Kami telah mengirimkan link reset password, mohon cek email anda',
                'route' => route('office.auth.index'),
            ]);
        }
    }

    public function reset($user)
    {
        return view('pages.user.auth.reset', compact('user'));
    }

    public function do_reset(Request $request, $user)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:6|confirmed',
            'password_confirmation' => 'required'
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            if ($errors->has('password')) {
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('password'),
                ]);
            } elseif ($errors->has('password_confirmation')) {
                return response()->json([
                    'alert' => 'error',
                    'message' => $errors->first('password_confirmation'),
                ]);
            }
        }

        $akun = User::where('id', $user)->first();
        $akun->password = Hash::make($request->password);
        $akun->update();
        return response()->json([
            'alert' => 'success',
            'message' => 'Password anda berhasil diganti!',
            'route' => route('office.auth.index'),
        ]);
    }

    public function do_logout()
    {
        $employee = Auth::guard('office')->user();
        Auth::logout($employee);
        return redirect()->route('office.auth.index');
    }
}
