<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function generateRandomNumber()
    {
        // Số đã được sử dụng
        $usedNumbers = array();

        // Tạo số ngẫu nhiên
        $randomNumber = mt_rand(1000000, 9999999);

        // Kiểm tra xem số đã được sử dụng chưa
        while (in_array($randomNumber, $usedNumbers)) {
            $randomNumber = mt_rand(1000000, 9999999);
        }

        // Thêm số vào danh sách đã sử dụng
        $usedNumbers[] = $randomNumber;

        return $randomNumber;
    }


    public function process_payment(Request $request)
    {

        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = "http://localhost:3000/cart";
        $vnp_TmnCode = "JZ2XACYZ"; // Mã website tại VNPAY
        $vnp_HashSecret = "VXTYGTNDBGGDTAGZNTBLGUMXXEMPXETS"; // Chuỗi bí mật

        $vnp_TxnRef = $this->generateRandomNumber(); //Mã đơn hàng khác nhau nếu không sẽ xảy ra lỗi 01
        $vnp_OrderInfo = 'Thanh toán đơn hàng test'; // không quan trọng chỉ là thông tin đơn hàng
        $vnp_OrderType = 'billpayment'; // không quan trọng nốt là phương thức đơn hàng
        $vnp_Amount = $request->input('amount') * 100; // thành tiền của đơn hàng (quan trọng)
        $vnp_Locale = 'vn'; // việt nam
        $vnp_BankCode = 'NCB';
        $vnp_IpAddr = $request->ip();

        $inputData = [
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => now()->format('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        ];

        if ($request->has('vnp_BankCode') && $request->input('vnp_BankCode') !== "") {
            $inputData['vnp_BankCode'] = $request->input('vnp_BankCode');
        }
        if ($request->has('vnp_Bill_State') && $request->input('vnp_Bill_State') !== "") {
            $inputData['vnp_Bill_State'] = $request->input('vnp_Bill_State');
        }

        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }

        if ($request->input('redirect')) {
            $returnData = [
                'code' => '00',
                'message' => 'success',
                'data' => ['redirectUrl' => $vnp_Url],
            ];
            return response()->json($returnData);
        } else {
            $returnData = [
                'code' => '00',
                'message' => 'success',
                'data' => $vnp_Url,
            ];
            return response()->json($returnData);
        }
    }
}
