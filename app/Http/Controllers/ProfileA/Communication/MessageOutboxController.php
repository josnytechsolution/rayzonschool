<?php

namespace App\Http\Controllers\ProfileA\Communication;

use App\GenerateToken;
use App\MessageOutbox;
use App\SchoolProfile;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MessageOutboxController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function studentsOutbox()
    {
        $studentMessages = MessageOutbox::where('target', 'students')->whereYear('created_at', date('Y'))->get();
        return view('profilea.reports.students_messages', compact('studentMessages'));
    }

    public function staffOutbox()
    {
        $staffMessages = MessageOutbox::where('target', 'staffs')->whereYear('created_at', date('Y'))->get();
        return view('profilea.reports.staff_messages', compact('staffMessages'));
    }

    public function showMessages($id)
    {
        $messages = MessageOutbox::where('code', $id)->get();

        return view('profilea.communication.outbox_messages', compact('messages', 'id'));
    }

    public function outboxSync()
    {
        $queued = MessageOutbox::where('target', 'students')->where('status', NULL)->get();

        if (!empty($queued))
        {
            $profile = SchoolProfile::findOrFail(1);

            $access_token = GenerateToken::accessToken();

            foreach ($queued as $que)
            {
                $curl = curl_init();

                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://api.emalify.com/v1/projects/op0a7xry8649qkjv/sms/delivery-report?messageId='.$que->messageId,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'GET',
                    CURLOPT_HTTPHEADER => array(
                        'Accept: application/json',
                        'Content-Type: application/json',
                        'Authorization:Bearer '.$access_token
                    ),
                ));

                $response = curl_exec($curl);

                curl_close($curl);
                echo $response;
            }
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\MessageOutbox  $messageOutbox
     * @return \Illuminate\Http\Response
     */
    public function show(MessageOutbox $messageOutbox)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MessageOutbox  $messageOutbox
     * @return \Illuminate\Http\Response
     */
    public function edit(MessageOutbox $messageOutbox)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MessageOutbox  $messageOutbox
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MessageOutbox $messageOutbox)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MessageOutbox  $messageOutbox
     * @return \Illuminate\Http\Response
     */
    public function destroy(MessageOutbox $messageOutbox)
    {
        //
    }
}
