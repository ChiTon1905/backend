<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class BookRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => ['required', Rule::unique('books')->ignore($this->book)],
            'description' => 'nullable|string',
            'publication_day' => 'nullable|date',
            'quantity' => 'required|integer',
            'price' => 'required|numeric',
            'categories_id' => 'required|exists:categories,id',
            'promotion_id' => 'nullable|exists:promotions,id',
            'booklayout_id' => 'required|exists:booklayouts,id',
            'publisher_id' => 'required|exists:publishers,id',
            'language_id' => 'required|exists:languages,id',
        ];
    }
}
