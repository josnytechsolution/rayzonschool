<?php

namespace App\Http\Controllers\ProfileA\Transport;

use App\AcademicTerm;
use App\CurrentSession;
use App\FinancialYear;
use App\TransportZone;
use App\TransportZoneFee;
use Exception;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class TransportZoneFeeController extends Controller
{
    /**
     * TransportZoneFeeController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function transport(Request $request)
    {
        $transportFee = TransportZoneFee::findOrFail($request->transport);
        $transportData = "";
        $transportData .= '<option>--Select Zone Fee--</option>';
        $transportData .= '<option value="1">ONE WAY - '.$transportFee->one_way.'</option>';
        $transportData .= '<option value="2">TWO WAY - '.$transportFee->two_way.'</option>';

        if(!empty($transportData))
        {
            return $transportData;
        }
        else
        {
            return '<option value="">No Data Found</option>';
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $zone_fees = TransportZoneFee::all();
        $transport_zones = TransportZone::all();
        $current_sessions = CurrentSession::where('status', '>', 1)->get();
        return view('profilea.transport.transport_zone_fees', compact('zone_fees', 'transport_zones', 'current_sessions'));
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
        $request->validate([
           'transport_zone_id'  => 'required|numeric',
           'one_way'            => 'required|integer',
           'two_way'            => 'required|integer',
           'current_session_id' => 'required|numeric',
        ]);

        $current = CurrentSession::findOrFail($request->current_session_id);

        $term = AcademicTerm::findOrFail($current->academic_term->id);
        $year = FinancialYear::findOrFail($current->financial_year->id);
        $zone = TransportZone::findOrFail($request->transport_zone_id);

        $slug = Str::slug($zone->name." ".$term->name." ".$year->name);

        $slu = TransportZoneFee::where('slug', $slug)->get();

        if($slu->count()>0)
        {
            return redirect()->back()->with('error', 'Transport Zone Fee already exist!');
        }
        else
        {
            $data = new TransportZoneFee();
            $data->slug                 = $slug;
            $data->transport_zone_id    = $request->transport_zone_id;
            $data->one_way              = $request->one_way;
            $data->two_way              = $request->two_way;
            $data->current_session_id   = $request->current_session_id;
            $data->created_by           = Auth::user()->id;
            $data->save();

            return redirect()->back()->with('success', 'Transport Zone Fee added successfully!');
        }


    }

    /**
     * Display the specified resource.
     *
     * @param TransportZoneFee $transportZoneFee
     * @return \Illuminate\Http\Response
     */
    public function show(TransportZoneFee $transportZoneFee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param TransportZoneFee $transportZoneFee
     * @return \Illuminate\Http\Response
     */
    public function edit(TransportZoneFee $transportZoneFee)
    {
        $zone_fees = TransportZoneFee::all();
        $transport_zones = TransportZone::all();
        $current_sessions = CurrentSession::where('status', 1)->orWhere('status', 2)->get();
        return view('profilea.transport.edit_transport_zone_fee', compact('zone_fees', 'transport_zones', 'current_sessions', 'transportZoneFee'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param TransportZoneFee $transportZoneFee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TransportZoneFee $transportZoneFee)
    {

        $request->validate([
            'transport_zone_id'  => 'required|numeric',
            'one_way'            => 'required|integer',
            'two_way'            => 'required|integer',
            'current_session_id' => 'required|numeric',
        ]);

        $current = CurrentSession::findOrFail($request->current_session_id);

        $term = AcademicTerm::findOrFail($current->academic_term->id);
        $year = FinancialYear::findOrFail($current->financial_year->id);
        $zone = TransportZone::findOrFail($request->transport_zone_id);

        $slug = Str::slug($zone->name." ".$term->name." ".$year->name);

        $slu = TransportZoneFee::where('slug', $slug)
                                    ->where('current_session_id', $request->current_session_id)
                                            ->where('one_way', $request->one_way)
                                                ->where('two_way', $request->two_way)
                                                    ->get();

        if($slu->count()>0)
        {
            return redirect()->back()->with('error', 'Transport Zone Fee already exist!');
        }
        else {
            $data = $transportZoneFee;
            $data->slug                 = $slug;
            $data->transport_zone_id    = $request->transport_zone_id;
            $data->one_way              = $request->one_way;
            $data->two_way              = $request->two_way;
            $data->current_session_id    = $request->current_session_id;
            $data->updated_by           = Auth::user()->id;
            $data->save();

            return redirect()->route('transport-zone-fees.index')->with('success', 'Transport Zone Fee updated successfully!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param TransportZoneFee $transportZoneFee
     * @return void
     * @throws Exception
     */
    public function destroy(Request $request, TransportZoneFee $transportZoneFee)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $transportZoneFee->delete();

            return redirect()->back()->with('success', 'The Transport Zone fee has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
