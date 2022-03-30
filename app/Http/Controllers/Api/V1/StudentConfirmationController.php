<?php

namespace App\Http\Controllers\Api\V1;

use App\ClientConnection;
use App\Student;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StudentConfirmationController extends Controller
{
    public function confirmAdmissionNumber(Request $request)
    {
        $serviceName        = $request->header('serviceName');
        $messageID          = $request->header('messageID');
        $connectionID       = $request->header('connectionID');
        $connectionPassword = $request->header('connectionPassword');

        $client = ClientConnection::where('connectionID', $connectionID)->where('connectionPassword', $connectionPassword)->first();

        if ($client != NULL) {
            $transactionReferenceCode   = $request->TransactionReferenceCode;
            $transactionDate            = $request->TransactionDate;
            $institutionCode            = $request->InstitutionCode;

            $student = Student::where('admno', $transactionReferenceCode)->first();

            if ($student)
            {
                $content = [
                        'TransactionReferenceCode'  => $transactionReferenceCode,
                        'TransactionDate'           => date('Y-m-d\TH:i:s.vP'),
                        'TotalAmount'               => 0.0,
                        'Currency'                  => '',
                        'AdditionalInfo'            => $student->name,
                        'AccountNumber'             => $transactionReferenceCode,
                        'AccountName'               => $student->name,
                        'InstitutionCode'           => $institutionCode,
                        'InstitutionName'           => 'Schoolbest Academy'
                    ];

                return response($content)
                    ->withHeaders([
                        'messageID' => $messageID,
                        'statusCode' => '200',
                        'statusDescription' => 'Successfully validated student'
                    ]);
            }
            else
            {
                return response(['statusCode' => 400, 'statusDescription' => 'The parameters are not valid or they are missing.'])->withHeaders(['statusCode' => 400, 'statusDescription' => 'The parameters are not valid or they are missing.']);
            }

        } else {
            return response(['statusCode' => 401, 'statusDescription' => 'The caller is not authorized for this request.'])->withHeaders(['statusCode' => 401, 'statusDescription' => 'The caller is not authorized for this request.']);
        }

    }
}
