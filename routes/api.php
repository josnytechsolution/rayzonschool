<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/confirm-student-admission/account', 'Api\V1\StudentConfirmationController@confirmAdmissionNumber');
Route::post('/fees-payment/advise/collection-url', 'Api\V1\CoopCallbackController@processB2BAdviseConfirmation');

Route::post('/payment-callback-confirmation-url', 'Api\V1\TransactionCallbacksController@processC2BRequestConfirmation');
Route::post('/validation-url', 'Api\V1\TransactionCallbacksController@processC2BRequestValidation');
Route::post('/transaction-confirmation-url', 'Api\V1\TransactionCallbacksController@processTransactionStatusRequestCallback');

//Bulk message delivery report url
Route::post('/message-callback-confirmation-url', 'Api\V1\MessageCallbackConfirmation@messageCallbackConfirmation');
