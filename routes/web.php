<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\CurrentSession;
use App\Exports\ExpenseExport;
use App\Student;
use App\StudentTransport;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;

Route::get('/', function () {
    return redirect()->route('login');
});

Auth::routes();
Auth::routes(['register' => false]);

Route::get('/home', 'HomeController@index')->name('home');

Route::get('sync-transport', function() {
    $trans = StudentTransport::where('current_session_id', 2)->get();

    foreach ($trans as $tran)
    {
        $student = Student::findOrFail($tran->student_id);

        $data = $student;
        $data->on_transport      = "YES";
        $data->transport_zone_id = $tran->transport_zone_fee_id;
        $data->way               = $tran->getOriginal('way');
        $data->updated_by        = Auth::user()->id;
        $data->save();
    }
});

//Route::get('profilea/sync-parents', function () {
//    $parents = App\ParentDetail::orderBy('id', 'asc')->get();
//
//    $admno = "SBP0001";
//    foreach ($parents as $parent)
//    {
//        $parent->parent_no   = $admno;
//        $parent->save();
//
//        $admno++;
//    }
//});

//Route::get('/do-it', function () {
//    $students = App\Student::orderBy('id', 'asc')->get();
//
//    $admno = "SBT0001";
//    foreach ($students as $student)
//    {
//        $student->admno   = $admno;
//        $student->save();
//
//        $admno++;
//    }
//});

//Route::get('/admission', function () {
//    $students = App\Student::all();
//
//    foreach ($students as $student)
//    {
//        $admno = str_replace("-", "",$student->admno);
//
//        $student->admno   = $admno;
//        $student->save();
//    }
//});

Route::group(['middleware' => ['web', 'auth']], function () {
    Route::post('session/ajaxCheck', ['uses' => 'SessionController@ajaxCheck', 'as' => 'session.ajax.check']);
});

// Routes for controllers
Route::group(['prefix' => 'profilea', 'middleware' => ['auth', 'resetLastActive']], function(){
    Route::post('/ajax-reset', 'SessionController@ajaxReset')->name('sessionReset');
    Route::resource('/dashboard-a', 'ProfileA\DashboardController');

    //Settings
    Route::resource('bank-accounts', 'ProfileA\Settings\BankController');
    Route::resource('/user-management', 'ProfileA\Settings\UserController');

    //SchoolSetup
    Route::resource('/class-grades', 'ProfileA\SchoolSetup\ClassGradeController');
    Route::resource('/class-streams', 'ProfileA\SchoolSetup\ClassStreamController');
    Route::resource('/classrooms', 'ProfileA\SchoolSetup\ClassroomController');
    Route::resource('/academic-terms', 'ProfileA\SchoolSetup\AcademicTermController');
    Route::resource('student-promotion', 'ProfileA\SchoolSetup\StudentPromotionController');
    Route::get('database-backup', 'ProfileA\SchoolSetup\StudentPromotionController@backupDatabase')->name('backupDatabase');
    Route::resource('/school-profile', 'ProfileA\SchoolSetup\SchoolProfileController');

    //FeeSetup
    Route::resource('/financial-years', 'ProfileA\FeeSetup\FinancialYearController');
    Route::resource('/financial-sessions', 'ProfileA\FeeSetup\CurrentSessionController');
    Route::resource('/fee-parameters', 'ProfileA\FeeSetup\FeeParameterController');
    Route::resource('/one-time-fees', 'ProfileA\FeeSetup\OneTimeFeeController');
    Route::resource('/class-fees', 'ProfileA\FeeSetup\ClassFeeController');
    Route::get('/class-fee-structure/{id}', 'ProfileA\FeeSetup\ClassFeeController@feeStructure')->name('feeStructure');
    Route::post('/new-class-fee', 'ProfileA\FeeSetup\ClassFeeController@getFees')->name('getFees');
    Route::get('/multiple-class-fee', 'ProfileA\FeeSetup\ClassFeeController@multipleClassFees')->name('multipleClassFees');
    Route::resource('/optional-fees', 'ProfileA\FeeSetup\OptionalFeeController');
    Route::resource('/student-fees', 'ProfileA\FeeSetup\StudentFeeController');
    Route::post('/switch-classes/{id}', 'ProfileA\FeeSetup\StudentFeeController@switchClass')->name('switchClass');
    Route::get('/student-fee/{id}', 'ProfileA\FeeSetup\StudentFeeController@studentFees')->name('studentFees');
    Route::get('/student-invoice/{id}', 'ProfileA\FeeSetup\StudentFeeController@invoicePDF')->name('invoicePDF');
    Route::get('/students-invoices/{id}', 'ProfileA\FeeSetup\StudentFeeController@invoicesPDF')->name('invoicesPDF');
    Route::get('/students-timeline-invoices/{id}', 'ProfileA\FeeSetup\StudentFeeController@invoiceTimelinePDF')->name('invoiceTimelinePDF');

    Route::resource('/student-timelines', 'ProfileA\Students\StudentTimelineController');

    Route::post('/get-student', 'ProfileA\FeeSetup\StudentFeeController@getStudent')->name('getStudent');
    Route::post('/activate-student/{id}', 'ProfileA\FeeSetup\StudentFeeController@activateStudent')->name('activate-student');
    Route::resource('/discount-levels', 'ProfileA\FeeSetup\DiscountLevelController');
    Route::resource('/fee-discounts', 'ProfileA\FeeSetup\FeeDiscountController');
    Route::get('/class-fee-discounts/{id}', 'ProfileA\FeeSetup\FeeDiscountController@classFeeDiscount')->name('classFeeDiscount');
    Route::get('/fee-discounts-pdf/{id}', 'ProfileA\FeeSetup\FeeDiscountController@feeDiscountPDF')->name('feeDiscountPDF');
    Route::get('/fee-discounts-excel/{id}', 'ProfileA\FeeSetup\FeeDiscountController@feeDiscountExcel')->name('feeDiscountExcel');
    Route::resource('/class-managers', 'ProfileA\SchoolSetup\ClassManagerController');
    Route::resource('/academic-subjects', 'ProfileA\SchoolSetup\AcademicSubjectController');
    Route::resource('/class-subjects', 'ProfileA\SchoolSetup\ClassSubjectController');
    Route::post('/get-class-subject', 'ProfileA\SchoolSetup\ClassSubjectController@getSubject')->name('getSubject');
    Route::resource('/subject-teachers', 'ProfileA\SchoolSetup\SubjectTeacherController');


    //Transport
    Route::resource('/transport-zones', 'ProfileA\Transport\TransportZoneController');
    Route::resource('/transport-zone-fees', 'ProfileA\Transport\TransportZoneFeeController');
    Route::resource('/transport-fleets', 'ProfileA\Transport\TransportFleetController');
    Route::post('/student-transport-zone', 'ProfileA\Transport\TransportZoneFeeController@transport')->name('transport');
    Route::resource('/student-transports', 'ProfileA\Transport\StudentTransportController');
    Route::get('/student-transports-sync', 'ProfileA\Transport\StudentTransportController@sync')->name('sync');

    //Students
    Route::resource('/student-details', 'ProfileA\Students\StudentController');
    Route::get('/alumni-students-details', 'ProfileA\Students\StudentController@Alumni')->name('Alumni');
    Route::get('/class-student-details/{id}', 'ProfileA\Students\StudentController@thisClass')->name('thisClass');
    Route::get('/export-students-to-pdf/{id}', 'ProfileA\Students\StudentController@exportAllPDF')->name('exportAllPDF');
    Route::get('/export-students-to-excel/{id}', 'ProfileA\Students\StudentController@exportAllExcel')->name('exportAllExcel');
    Route::post('/export-students-to-pdf/{id}', 'ProfileA\Students\StudentController@exportGradeStudentPDF')->name('exportGradeStudentPDF');
    Route::post('/export-students-to-excel/{id}', 'ProfileA\Students\StudentController@exportGradeStudentExcel')->name('exportGradeStudentExcel');
    Route::get('/students-statistics', 'ProfileA\Students\StudentController@studentsStatistics')->name('studentsStatistics');
    Route::get('/inactive-students', 'ProfileA\Students\StudentController@inactive')->name('inactive');
    Route::resource('/parent-details', 'ProfileA\Students\ParentDetailController');
    Route::post('/parent-detail', 'ProfileA\Students\ParentDetailController@parent')->name('get-parent');
    Route::get('/parent-user', 'ProfileA\Students\ParentDetailController@makeUser')->name('makeUser');
    Route::get('/parent-detail-pdf', 'ProfileA\Students\ParentDetailController@parentDetailPDF')->name('parentDetailPDF');
    Route::get('/parent-detail-excel', 'ProfileA\Students\ParentDetailController@parentDetailExcel')->name('parentDetailExcel');
    Route::post('/check-parent', 'ProfileA\Students\ParentDetailController@checkParent')->name('checkParent');
    Route::post('/upload-student-photo/{id}', 'ProfileA\Students\StudentController@uploadPhoto')->name('uploadPhoto');
    Route::get('/remove-student-photo/{id}', 'ProfileA\Students\StudentController@removePhoto')->name('removePhoto');


    //Staff
    Route::resource('staff-departments', 'ProfileA\Staff\StaffDepartmentController');
    Route::resource('staff-sections', 'ProfileA\Staff\StaffSectionController');
    Route::post('get-staff-sections', 'ProfileA\Staff\StaffSectionController@staffSection')->name('staffSection');
    Route::resource('staff-members', 'ProfileA\Staff\StaffMemberController');
    Route::resource('/payroll-parameters', 'ProfileA\Payroll\PayrollParameterController');

    //Students Fees Balances
    Route::get('/student-fee-balances', 'ProfileA\Students\StudentController@balances')->name('balances');
    Route::get('/class-fee-balances/{id}', 'ProfileA\Students\StudentController@filterByClass')->name('filterByClass');
    Route::get('/export-balances-to-pdf/{id}', 'ProfileA\Students\StudentController@exportBalPDF')->name('exportBalPDF');
    Route::get('/export-balances-to-excel/{id}', 'ProfileA\Students\StudentController@exportBalExcel')->name('exportBalExcel');
    Route::get('/student-fee-arrears', 'ProfileA\Students\StudentController@arrears')->name('arrears');
    Route::get('/class-fee-arrears/{id}', 'ProfileA\Students\StudentController@arrearsByClass')->name('arrearsByClass');
    Route::get('/export-arrears-pdf/{id}', 'ProfileA\Students\StudentController@exportArrPDF')->name('exportArrPDF');
    Route::get('/export-arrears-excel/{id}', 'ProfileA\Students\StudentController@exportArrExcel')->name('exportArrExcel');
    Route::get('/student-fee-overpayment', 'ProfileA\Students\StudentController@overpays')->name('overpays');
    Route::get('/class-fee-overpay/{id}', 'ProfileA\Students\StudentController@overpayByClass')->name('overpayByClass');
    Route::get('/export-overpay-pdf/{id}', 'ProfileA\Students\StudentController@exportOvPDF')->name('exportOvPDF');
    Route::get('/export-overpay-excel/{id}', 'ProfileA\Students\StudentController@exportOvExcel')->name('exportOvExcel');
    Route::get('/overall-fees-summary/', 'ProfileA\Students\StudentController@feeSummary')->name('feeSummary');
    Route::get('/class-fees-summary/{id}', 'ProfileA\Students\StudentController@thisSummaryClass')->name('thisSummaryClass');
    Route::get('/overall-fees-summary-pdf/{id}', 'ProfileA\Students\StudentController@exportFeeSummaryPDF')->name('exportFeeSummaryPDF');

    //FeePayment
    Route::resource('/fee-payment', 'ProfileA\FeePayment\FeePaymentController');
    Route::get('/export-fee-payments-pdf/{id}', 'ProfileA\FeePayment\FeePaymentController@exportFeePDF')->name('exportFeePDF');
    Route::get('/export-fee-payments-excel/{id}', 'ProfileA\FeePayment\FeePaymentController@exportFeeExcel')->name('exportFeeExcel');
    Route::get('/print-receipt/{id}', 'ProfileA\FeePayment\FeePaymentController@printReceipt')->name('printReceipt');
    Route::get('/class-fee-payment/{id}', 'ProfileA\FeePayment\FeePaymentController@paymentByClass')->name('paymentByClass');
    Route::post('/check-bank', 'ProfileA\FeePayment\FeePaymentController@checkBank')->name('checkBank');
    Route::post('/check-ebank', 'ProfileA\FeePayment\FeePaymentController@checkeBank')->name('checkeBank');
    Route::post('/collect-fees', 'ProfileA\FeePayment\FeePaymentController@collectFees')->name('collectFees');
    Route::get('/collect-fee/{id}', 'ProfileA\FeePayment\FeePaymentController@collectFee')->name('collectFee');
    Route::resource('/mpesa-payments', 'ProfileA\FeePayment\MpesaPaymentController');
    Route::post('/collected-fee-report', 'ProfileA\FeePayment\FeePaymentController@collectedFeeReport')->name('collectedFeeReport');
    Route::post('/bank-report', 'ProfileA\FeePayment\FeePaymentController@bankReport')->name('bankReport');
    Route::resource('/coop-payments', 'ProfileA\FeePayment\CoopPaymentController');

    //Communication
    Route::resource('/fee-messages', 'ProfileA\Communication\FeeMessageController');
    Route::get('/fee-messages-to-students', 'ProfileA\Communication\FeeMessageController@sendToStudents')->name('sendToStudents');
    Route::post('/save-students', 'ProfileA\Communication\FeeMessageController@addStudent')->name('addStudent');
    Route::get('/delete-temp-student/{id}', 'ProfileA\Communication\FeeMessageController@deleteTemp')->name('deleteTemp');
    Route::resource('/general-messages', 'ProfileA\Communication\GeneralMessageController');
    Route::get('/messages-to-students', 'ProfileA\Communication\GeneralMessageController@sendToGenStudents')->name('sendToGenStudents');
    Route::get('/to-transport-students', 'ProfileA\Communication\GeneralMessageController@sendToTranStudents')->name('sendToTranStudents');
    Route::post('/save-general-students', 'ProfileA\Communication\GeneralMessageController@addGenStudent')->name('addGenStudent');
    Route::get('/delete-gen-student/{id}', 'ProfileA\Communication\GeneralMessageController@deleteGen')->name('deleteGen');
    Route::resource('/queued-messages', 'ProfileA\Communication\MessageQueueController');
    Route::resource('/staff-messages', 'ProfileA\Communication\StaffMessageController');
    Route::get('/send-to-selected-department', 'ProfileA\Communication\StaffMessageController@selectedDepartment')->name('selectedDepartment');
    Route::get('/send-to-selected-members', 'ProfileA\Communication\StaffMessageController@selectedMembers')->name('selectedMembers');
    Route::post('/save-members', 'ProfileA\Communication\StaffMessageController@addMember')->name('addMember');
    Route::get('/delete-staff-member/{id}', 'ProfileA\Communication\StaffMessageController@deleteMember')->name('deleteMember');
    Route::resource('/outbox-messages', 'ProfileA\Communication\MessageOutboxController');
    Route::get('/show-outbox-messages/{id}', 'ProfileA\Communication\MessageOutboxController@showMessages')->name('showMessages');
    Route::get('/students-messages-outbox', 'ProfileA\Communication\MessageOutboxController@studentsOutbox')->name('studentsOutbox');
    Route::get('/students-messages-sync', 'ProfileA\Communication\MessageOutboxController@outboxSync')->name('outboxSync');
    Route::get('/staff-messages-outbox', 'ProfileA\Communication\MessageOutboxController@staffOutbox')->name('staffOutbox');
    Route::resource('send-bulk-messages', 'ProfileA\Communication\OriginalMessageController');
    Route::get('/sync-parent-contact', 'ProfileA\Students\ParentDetailController@syncContact');
    Route::post('/all-with-arrears', 'ProfileA\Communication\FeeMessageController@sendToAllWithFigures')->name('sendToAllWithFigures');
    Route::post('/selected-classes-with-arrears', 'ProfileA\Communication\FeeMessageController@sendToSelectedClassWithFigures')->name('sendToSelectedClassWithFigures');
    Route::post('/selected-students-with-arrears', 'ProfileA\Communication\FeeMessageController@sendToSelectedStudentWithFigures')->name('sendToSelectedStudentWithFigures');
    Route::post('/general-messages-to-all-students', 'ProfileA\Communication\GeneralMessageController@sendToAllStudents')->name('sendToAllStudents');
    Route::post('/general-messages-to-selected-students', 'ProfileA\Communication\GeneralMessageController@sendToSelectedStudents')->name('sendToSelectedStudents');
    Route::post('/general-messages-to-selected-classes', 'ProfileA\Communication\GeneralMessageController@sendToSelectedClasses')->name('sendToSelectedClasses');
    Route::post('/general-messages-to-transport-students', 'ProfileA\Communication\GeneralMessageController@sendToTransportStudents')->name('sendToTransportStudents');
    Route::post('/general-messages-to-all-staff-members', 'ProfileA\Communication\StaffMessageController@sendToAllStaffs')->name('sendToAllStaffs');
    Route::post('/general-messages-to-staff-departments', 'ProfileA\Communication\StaffMessageController@sendToStaffDepartments')->name('sendToStaffDepartments');
    Route::post('/general-messages-to-selected-staff-members', 'ProfileA\Communication\StaffMessageController@sendToSelectedStaffMembers')->name('sendToSelectedStaffMembers');

    //Expenses
    Route::resource('/expense-departments', 'ProfileA\Expenses\ExpenseDepartmentController');
    Route::resource('/expense-sections', 'ProfileA\Expenses\ExpenseSectionController');
    Route::post('/get-sections', 'ProfileA\Expenses\ExpenseSectionController@getSection')->name('getSection');
    Route::resource('/expenses', 'ProfileA\Expenses\ExpenseController');
    Route::get('/filter-expenses', 'ProfileA\Expenses\ExpenseController@filterExpenses')->name('filterExpenses');
    Route::post('/filter-expenses/date', 'ProfileA\Expenses\ExpenseController@filterByDate')->name('filterByDate');
    Route::post('/filter-expenses/department-section', 'ProfileA\Expenses\ExpenseController@filterByDepartment')->name('filterByDepartment');
    Route::post('/filter-expenses/bank', 'ProfileA\Expenses\ExpenseController@filterByBank')->name('filterByBank');
    Route::post('/filter-expenses/vehicle', 'ProfileA\Expenses\ExpenseController@filterByVehicle')->name('filterByVehicle');

    Route::get('/export-expenses', function () {
        return Excel::download(new App\Exports\ExpenseExport(), 'General Expenses '.date('YmdHis').'.xlsx');
    })->name('exportExpense');

    Route::get('/export-expenses-summary/{id}', function ($id) {
        return Excel::download(new App\Exports\ExpenseSummaryExport($id), 'General Expenses Summary '.date('YmdHis').'.xlsx');
    })->name('exportExpenseSummary');

    Route::get('/export-student-statement/{id}', function ($id) {
        $stud = Student::findOrFail($id);
        return Excel::download(new App\Exports\StudentStatementExport($id), $stud->name.' Fee Statement '.date('YmHis').'.xlsx');
    })->name('exportStudentStatement');

    Route::get('/export-overall-fee-summary/{id}', function ($id) {
        $current_session = CurrentSession::Current()->first();
        return Excel::download(new App\Exports\FeeSummary($id), $current_session->name.' Overall Fee Summary '.date('YmHis').'.xlsx');
    })->name('exportFeeSummaryExcel');

    Route::post('confirm-transaction', 'ProfileA\FeePayment\MpesaPaymentController@confirmTransaction')->name('confirmTransaction');

});