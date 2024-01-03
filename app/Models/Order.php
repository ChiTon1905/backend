<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';

    protected $fillable = [
        'user_id',
        'date',
        'total',
        'order_code',
        'payment',
        'status',
        'has_received',
        'receiver',
        'email_receiver',
        'phone_receiver',
        'address_receiver'
    ];

    protected $hidden = [

        'created_at',
        'updated_at'
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($order) {
            do {
                $orderCode = Str::random(10);
            } while (self::where('order_code', $orderCode)->exists());

            $order->order_code = $orderCode;
        });
    }



    public function orderDetails()
    {
        return $this->hasMany(OrderDetails::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
