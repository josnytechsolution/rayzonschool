<?php


namespace App;


use phpDocumentor\Reflection\Types\False_;

class GenerateToken
{
    public static function generateLiveToken(){

        $consumer_key = "qIwJLmGGR0cFbN1C5JocaGOhAazAFpAj";
        $consumer_secret = "Bkac4jXtd1ZzWccM";

        if(!isset($consumer_key)||!isset($consumer_secret)){
            die("please declare the consumer key and consumer secret as defined in the documentation");
        }
        $url = 'https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        $credentials = base64_encode($consumer_key.':'.$consumer_secret);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Authorization: Basic '.$credentials)); //setting a custom header
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);

        $curl_response = curl_exec($curl);

        return json_decode($curl_response)->access_token;
    }

    public static function generateClientToken()
    {
        $prof = SchoolProfile::findOrFail(1);

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://account.josnytechsolution.net/oauth/token',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
               "client_id" : "'.$prof->clientId.'",
               "client_secret" : "'.$prof->clientSecret.'",
               "grant_type" : "client_credentials"
               }',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/json',
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        $status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $result = json_decode($response, true);

        curl_close($curl);

        $access_token = $result['access_token'];

        return $access_token;
    }


}