<?php

namespace App\Http\Controllers\ProfileA\Expenses;

use App\ExpenseDepartment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ExpenseDepartmentController extends Controller
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
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $departments = ExpenseDepartment::all();
        return view('profilea.expenses.expense_departments', compact('departments'));
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
            'name' => 'required|string|unique:expense_departments',
        ]);

        $data = new ExpenseDepartment();
        $data->name       = ucwords(strtolower($request->name));
        $data->created_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Expense Department has been added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ExpenseDepartment  $expenseDepartment
     * @return \Illuminate\Http\Response
     */
    public function show(ExpenseDepartment $expenseDepartment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ExpenseDepartment  $expenseDepartment
     * @return \Illuminate\Http\Response
     */
    public function edit(ExpenseDepartment $expenseDepartment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ExpenseDepartment  $expenseDepartment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ExpenseDepartment $expenseDepartment)
    {
        $request->validate([
            'name' => 'required|string|unique:expense_departments,name,'.$expenseDepartment->id,
        ]);

        $data = $expenseDepartment;
        $data->name       = ucwords(strtolower($request->name));
        $data->updated_by = Auth::user()->id;
        $data->save();

        return redirect()->back()->with('success', 'Expense Department has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param \App\ExpenseDepartment $expenseDepartment
     * @return void
     * @throws \Exception
     */
    public function destroy(Request $request, ExpenseDepartment $expenseDepartment)
    {
        $password = $request->input('password');

        if(Hash::check($password, Auth::user()->password))
        {
            $expenseDepartment->delete();

            return redirect()->back()->with('success', 'The expense department has been deleted successfully!');
        }
        else
        {
            return redirect()->back()->with('error', 'The password you entered is incorrect!');
        }
    }
}
