<?php


namespace App;


class GetBalance
{
     public static function getBalance()
     {
         $access_token = GenerateToken::generateClientToken();

         $prof = SchoolProfile::findOrFail(1);

         $curl = curl_init();

         curl_setopt_array($curl, array(
             CURLOPT_URL => 'https://account.josnytechsolution.net/v1/projects/'.$prof->projectId.'/billing/query',
             CURLOPT_RETURNTRANSFER => true,
             CURLOPT_ENCODING => '',
             CURLOPT_MAXREDIRS => 10,
             CURLOPT_TIMEOUT => 0,
             CURLOPT_FOLLOWLOCATION => true,
             CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
             CURLOPT_CUSTOMREQUEST => 'POST',
             CURLOPT_HTTPHEADER => array('Accept: application/json', 'Content-Type: application/json', 'Authorization:Bearer '.$access_token),
         ));

         $response = curl_exec($curl);

         curl_close($curl);

         $balance = $response;

         return $balance;
     }
}