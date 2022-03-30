<?php

namespace App\Http\Controllers\ProfileA\Expenses;

use App\Bank;
use App\Expense;
use App\ExpenseDepartment;
use App\ExpenseSection;
use App\TransportFleet;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class ExpenseController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
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
        $expenses = Expense::whereYear('expense_date', date('Y'))->orderBy('expense_date')->get();
        return view('profilea.expenses.expenses', compact('expenses'));
    }

    public function filterExpenses()
    {
        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();
        $expenses = Expense::whereYear('expense_date', date('Y'))->orderBy('expense_date')->get();
        return view('profilea.reports.expense_report', compact('expenses', 'departments', 'sections', 'banks', 'fleets'));
    }

    public function filterByDate(Request $request)
    {
        $request->validate([
            'from_date'  => 'required|date',
            'to_date'  => 'required|date',
        ]);

        $from = date('Y-m-d', strtotime("+1 day", strtotime($request->from_date)));
        $to = date('Y-m-d', strtotime("-1 day", strtotime($request->to_date)));

        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();

        $expenses = Expense::whereBetween('expense_date', [$from, $to])->orderBy('expense_date')->get();
        return view('profilea.reports.expense_report', compact('expenses', 'departments', 'sections', 'banks', 'fleets'));
    }


    public function filterByDepartment(Request $request)
    {
        $request->validate([
            'expense_department_id' => 'required|numeric',
            'expense_section_id' => 'nullable|numeric',
            'from_date'  => 'required|date',
            'to_date'  => 'required|date',
        ]);

        $from = date('Y-m-d', strtotime("+1 day", strtotime($request->from_date)));
        $to = date('Y-m-d', strtotime("-1 day", strtotime($request->to_date)));

        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();

        if ($request->expense_section_id != NULL)
        {
            $expenses = Expense::whereBetween('expense_date', [$from, $to])->where('expense_department_id', $request->expense_department_id)->where('expense_section_id', $request->expense_section_id)->orderBy('expense_date')->get();
        }
        else
        {
            $expenses = Expense::whereBetween('expense_date', [$from, $to])->where('expense_department_id', $request->expense_department_id)->orderBy('expense_date')->get();
        }

        return view('profilea.reports.expense_report', compact('expenses', 'departments', 'sections', 'banks', 'fleets'));
    }


    public function filterByBank(Request $request)
    {
        $request->validate([
            'bank_id' => 'required|numeric',
            'from_date'  => 'required|date',
            'to_date'  => 'required|date',
        ]);

        $from = date('Y-m-d', strtotime("+1 day", strtotime($request->from_date)));
        $to = date('Y-m-d', strtotime("-1 day", strtotime($request->to_date)));

        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();

        $expenses = Expense::whereBetween('expense_date', [$from, $to])->where('bank_id', $request->bank_id)->orderBy('expense_date')->get();

        return view('profilea.reports.expense_report', compact('expenses', 'departments', 'sections', 'banks', 'fleets'));
    }


    public function filterByVehicle(Request $request)
    {
        $request->validate([
            'transport_fleet_id' => 'required|numeric',
            'from_date'  => 'required|date',
            'to_date'  => 'required|date',
        ]);

        $from = date('Y-m-d', strtotime("+1 day", strtotime($request->from_date)));
        $to = date('Y-m-d', strtotime("-1 day", strtotime($request->to_date)));

        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();

        $expenses = Expense::whereBetween('expense_date', [$from, $to])->where('transport_fleet_id', $request->transport_fleet_id)->orderBy('expense_date')->get();

        return view('profilea.reports.expense_report', compact('expenses', 'departments', 'sections', 'banks', 'fleets'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();

        return view('profilea.expenses.add_expense', compact('departments','sections', 'banks', 'fleets'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'expense_department_id' => 'required|numeric',
            'expense_section_id'    => 'required|numeric',
            'transport_fleet_id'    => 'nullable|numeric',
            'description'           => 'required|string',
            'expense_date'          => 'required|date',
            'amount'                => 'required|numeric',
            'payment_type'          => 'required|numeric',
            'bank_id'               => 'required|numeric',
            'account_no'            => 'nullable|string',
            'ref_no'                => 'nullable|string',
        ]);

        $uni = strtolower(substr(chunk_split(str_random(20), 5, '-'), 0, 24));
        $slug = $uni."".date('Y-m-d-H-i-s');

        $data = new Expense();
        $data->slug                     =  $slug;
        $data->expense_department_id    = $request->expense_department_id;
        $data->expense_section_id       = $request->expense_section_id;
        $data->transport_fleet_id       = $request->transport_fleet_id;
        $data->description              = $request->description;
        $data->expense_date             = $request->expense_date;
        $data->amount                   = $request->amount;
        $data->payment_type             = $request->payment_type;
        $data->bank_id                  = $request->bank_id;
        $data->account_no               = $request->account_no;
        $data->ref_no                   = $request->ref_no;
        $data->created_by               = Auth::user()->id;
        $data->save();

        return redirect()->route('expenses.index')->with('success', 'The Expense has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param Expense $expense
     * @return Response
     */
    public function show(Expense $expense)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Expense $expense
     * @return Response
     */
    public function edit(Expense $expense)
    {
        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        $banks = Bank::all();
        $fleets = TransportFleet::all();

        return view('profilea.expenses.edit_expense', compact('departments','sections', 'banks', 'fleets', 'expense'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Expense $expense
     * @return Response
     */
    public function update(Request $request, Expense $expense)
    {
        $request->validate([
            'expense_department_id' => 'required|numeric',
            'expense_section_id'    => 'required|numeric',
            'transport_fleet_id'    => 'nullable|numeric',
            'description'           => 'required|string',
            'expense_date'          => 'required|date',
            'amount'                => 'required|numeric',
            'payment_type'          => 'required|numeric',
            'bank_id'               => 'required|numeric',
            'account_no'            => 'nullable|string',
            'ref_no'                => 'nullable|string',
        ]);

        $data = $expense;
        $data->expense_department_id    = $request->expense_department_id;
        $data->expense_section_id       = $request->expense_section_id;
        $data->transport_fleet_id       = $request->transport_fleet_id;
        $data->description              = $request->description;
        $data->expense_date             = $request->expense_date;
        $data->amount                   = $request->amount;
        $data->payment_type             = $request->payment_type;
        $data->bank_id                  = $request->bank_id;
        $data->account_no               = $request->account_no;
        $data->ref_no                   = $request->ref_no;
        $data->updated_by               = Auth::user()->id;
        $data->save();

        return redirect()->route('expenses.index')->with('success', 'The Expense has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Expense $expense
     * @return Response
     */
    public function destroy(Expense $expense)
    {
        //
    }
}
