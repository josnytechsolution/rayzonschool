<?php

namespace App\Http\Controllers\ProfileA\Expenses;

use App\ExpenseDepartment;
use App\ExpenseSection;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ExpenseSectionController extends Controller
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
     * @param Request $request
     */
    public function getSection(Request $request)
    {
        $sections = ExpenseSection::where('expense_department_id', $request->department)->get();

        $data = "";
        $data .= '<option value="">--Select Section--</option>';
        foreach($sections as $section)
        {
            $data .= '<option value="'.$section->id.'">'.$section->name.'</option>';
        }
        return $data;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $departments = ExpenseDepartment::all();
        $sections = ExpenseSection::all();
        return view('profilea.expenses.expense_sections', compact('departments', 'sections'));
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
            'expense_department_id'  => 'required|numeric',
            'name' => 'required|string',
        ]);

        $check = ExpenseSection::where('expense_department_id', $request->expense_department_id)->where('name', $request->name)->get();
        if($check->count() > 0){  return redirect()->back()->with('error', 'This Section already exists!');  }

        $data = new ExpenseSection();
        $data->expense_department_id = $request->expense_department_id;
        $data->name       = ucwords(strtolower($request->name));
        $data->created_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Expense Department has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ExpenseSection  $expenseSection
     * @return \Illuminate\Http\Response
     */
    public function show(ExpenseSection $expenseSection)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ExpenseSection  $expenseSection
     * @return \Illuminate\Http\Response
     */
    public function edit(ExpenseSection $expenseSection)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ExpenseSection  $expenseSection
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ExpenseSection $expenseSection)
    {
        $request->validate([
            'expense_department_id'  => 'required|numeric',
            'name' => 'required|string',
        ]);

        $check = ExpenseSection::where('expense_department_id', $request->expense_department_id)->where('name', $request->name)->where('id', '!=', $expenseSection->id)->get();
        if($check->count() > 0){  return redirect()->back()->with('error', 'This Expense Section already exists!');  }

        $data = $expenseSection;
        $data->expense_department_id = $request->expense_department_id;
        $data->name       = ucwords(strtolower($request->name));
        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Expense Department has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\ExpenseSection $expenseSection
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(Request $request, ExpenseSection $expenseSection)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $expenseSection->delete();

            return redirect()->back()->with('success', 'The expense section has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
