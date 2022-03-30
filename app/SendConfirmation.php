<?php


namespace App;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class SendConfirmation
{
    /**
     * @param $messageId
     * @param $message
     * @param $phone
     */
    public static function PaymentConfirmation($messageId, $message, $phone)
    {
        $prof = SchoolProfile::findOrFail(1);

        $access_token = GenerateToken::generateClientToken();

        $ch = curl_init();

        curl_setopt_array($ch, array(
            CURLOPT_URL => 'https://account.josnytechsolution.net/v1/projects/sms/simple/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                "recipient": "'.$phone.'",
                "message": "'.$message.'",
                "messageId": "'.$messageId.'",
                "callback": "'.$prof->redirect.'",
                "projectId": "'.$prof->projectId.'"
            }',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/json',
                'Content-Type: application/json',
                'Authorization:Bearer '.$access_token
            ),
        ));

        curl_exec($ch);

        curl_close($ch);
    }

    public static function CoopConfirmation($messageId, $message, $phone)
    {
        $prof = SchoolProfile::findOrFail(1);

        $access_token = GenerateToken::generateClientToken();

        $ch = curl_init();

        curl_setopt_array($ch, array(
            CURLOPT_URL => 'https://account.josnytechsolution.net/v1/projects/sms/simple/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                "recipient" : "'.$phone.'", 
                "message"   : "'.$message.'", 
                "messageId" : "'.$messageId.'", 
                "callback"  : "'.$prof->redirect.'",
                "projectId" : "'.$prof->projectId.'" 
             }',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/json',
                'Content-Type: application/json',
                'Authorization:Bearer '.$access_token
            ),
        ));

        curl_exec($ch);

        curl_close($ch);
    }
}