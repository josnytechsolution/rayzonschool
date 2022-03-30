<?php

namespace App\Http\Controllers\ProfileA\Communication;

use App\GenerateToken;
use App\GetBalance;
use App\MessageOutbox;
use App\OriginalMessage;
use App\SchoolProfile;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OriginalMessageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $balance = GetBalance::getBalance();
        $messages = OriginalMessage::orderByDesc('created_at')->get();

        return view('profilea.communication.bulk_messages_dashboard', compact('messages', 'balance'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $access_token = GenerateToken::generateClientToken();

        $queued = MessageOutbox::where('code', $request->slug)->get();

        $prof = SchoolProfile::findOrFail(1);

        $myArray = [];

        foreach ($queued as $que)
        {
            $messageId = $que->messageId;
            $message   = $que->message;
            $phone     = $que->phoneno;

            $myArray[] = ['recipient' => $phone, 'message' => $message, 'messageId' => $messageId, 'callback' => $prof->redirect, 'projectId' => $prof->projectId];
        }

        $data = json_encode($myArray);

        DB::table('original_messages')->where('slug', $request->slug)->update(['status' => 'isSent', 'updated_by' => Auth::user()->id]);


        $ch = curl_init();

        curl_setopt_array($ch, array(
            CURLOPT_URL => 'https://account.josnytechsolution.net/v1/projects/sms/bulk/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                    "data" : '.$data.'
            }',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/json',
                'Content-Type: application/json',
                'Authorization:Bearer '.$access_token
            ),
        ));

        curl_exec($ch);

        curl_close($ch);

        return redirect()->route('send-bulk-messages.index')->with('success', 'Message has been sent!');
    }

    /**
     * Display the specified resource.
     *
     * @param OriginalMessage $originalMessage
     * @return Response
     */
    public function show(OriginalMessage $originalMessage)
    {
        $outboxes = MessageOutbox::where('code', $originalMessage->slug)->get();
        $cost = $outboxes->sum('sms_cost');
        $balance = GetBalance::getBalance();

        if ($cost > $balance)
        {
            $msg = "Your sms balance of KES {$balance} is not enough to send this message. Kindly TopUp!";
            $status = "Insufficient";
        }
        else
        {
            $msg = "Your sms balance of KES {$balance} is enough to send this message. Click the button below to send the messages!";
            $status = "Sufficient";
        }

        return view('profilea.communication.send_bulk_messages', compact('cost', 'balance', 'msg', 'status', 'originalMessage', 'outboxes'));
    }
}
