<?php

namespace App\Jobs;

use App\SchoolProfile;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class SendMessage implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $tries = 3;

    private $messageId;
    private $message;
    private $phone;
    private $access_token;

    /**
     * Create a new job instance.
     * @param $messageId
     * @param $message
     * @param $phone
     * @param $access_token
     */

    public function __construct($messageId, $message, $phone, $access_token)
    {
        $this->messageId  = $messageId;
        $this->message    = $message;
        $this->phone      = $phone;
        $this->access_token = $access_token;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {

        $prof = SchoolProfile::findOrFail(1);

        $ch = curl_init();

        curl_setopt_array($ch, array(
            CURLOPT_URL => 'https://account.josnytechsolution.com/v1/projects/sms/simple/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                "recipient": "'.$this->phone.'",
                "message": "'.$this->message.'",
                "messageId": "'.$this->messageId.'",
                "callback": "'.$prof->redirect.'",
                "projectId": "'.$prof->projectId.'"
            }',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/json',
                'Content-Type: application/json',
                'Authorization:Bearer '.$this->access_token
            ),
        ));

        curl_exec($ch);

        curl_close($ch);
    }
}
