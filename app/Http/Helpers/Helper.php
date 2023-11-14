<?php
namespace App\Http\Helpers;

use Illuminate\Http\Exceptions\HttpResponseException;

class Helper{
    public static function sendError($message, $errors= [], $code=401){
        $respone = ['success'=>false, 'message'=>$message];

        if(!empty($errors)){
            $respone['data'] = $errors;
        }

        throw new HttpResponseException(response()->json($respone,$code));
    }
}
