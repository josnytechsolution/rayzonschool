<?php

namespace App\Http\Controllers\Api\V1;

use App\MessageOutbox;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MessageCallbackConfirmation extends Controller
{
    public static function messageCallbackConfirmation(){
        $callbackJSONData = file_get_contents('php://input');
        $callbackData = json_decode($callbackJSONData);

        $logFile = "EmalifySentMessageResponse.json";
        $log = fopen($logFile, "a");
        fwrite($log, $callbackJSONData);
        fclose($log);

        $externalMessageId  = $callbackData->externalMessageId;
        $messageId          = $callbackData->messageId;
        $senderName         = $callbackData->senderName;
        $recipient          = $callbackData->recipient;
        $statusCode         = $callbackData->statusCode;
        $status             = $callbackData->status;
        $delivered_at       = $callbackData->delivered_at;

        $mess = MessageOutbox::where('messageId', $messageId)->first();

        if ($mess)
        {
            $data = $mess;
            $data->externalMessageId = $externalMessageId;
            $data->statusCode       = $statusCode;
            $data->status           = $status;
            $data->delivered_at     = $delivered_at;
            $data->save();
        }
    }
}
