<?php

namespace App\Providers;

use App\AcademicSubject;
use App\AcademicTerm;
use App\Bank;
use App\ClassFee;
use App\ClassGrade;
use App\ClassManager;
use App\Classroom;
use App\ClassStream;
use App\ClassSubject;
use App\CurrentSession;
use App\DiscountLevel;
use App\Expense;
use App\ExpenseDepartment;
use App\ExpenseSection;
use App\FeeDiscount;
use App\FeeParameter;
use App\FeePayment;
use App\FinancialYear;
use App\MessageOutbox;
use App\MpesaPayment;
use App\OneTimeFee;
use App\OptionalFee;
use App\OriginalMessage;
use App\ParentDetail;
use App\PayrollParameter;
use App\SchoolProfile;
use App\StaffDepartment;
use App\StaffMember;
use App\StaffSection;
use App\Student;
use App\StudentFee;
use App\StudentTimeline;
use App\StudentTransport;
use App\SubjectTeacher;
use App\TransportFleet;
use App\TransportZone;
use App\TransportZoneFee;
use App\User;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * This namespace is applied to your controller routes.
     *
     * In addition, it is set as the URL generator's root namespace.
     *
     * @var string
     */
    protected $namespace = 'App\Http\Controllers';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        Route::bind('class_grade', function ($slug) {
            return ClassGrade::where('slug', $slug)->first();
        });

        Route::bind('class_stream', function ($slug) {
            return ClassStream::where('slug', $slug)->first();
        });

        Route::bind('classroom', function ($slug) {
            return Classroom::where('slug', $slug)->first();
        });

        Route::bind('academic_term', function ($slug) {
            return AcademicTerm::where('slug', $slug)->first();
        });

        Route::bind('financial_year', function ($slug) {
            return FinancialYear::where('slug', $slug)->first();
        });

        Route::bind('financial_session', function ($slug) {
            return CurrentSession::where('slug', $slug)->first();
        });

        Route::bind('fee_parameter', function ($slug) {
            return FeeParameter::where('slug', $slug)->first();
        });

        Route::bind('one_time_fee', function ($slug) {
            return OneTimeFee::where('slug', $slug)->first();
        });

        Route::bind('optional_fee', function ($slug) {
            return OptionalFee::where('slug', $slug)->first();
        });

        Route::bind('class_fee', function ($slug) {
            return ClassFee::where('slug', $slug)->first();
        });

        Route::bind('transport_zone', function ($slug) {
            return TransportZone::where('slug', $slug)->first();
        });

        Route::bind('transport_zone_fee', function ($slug) {
            return TransportZoneFee::where('slug', $slug)->first();
        });

        Route::bind('transport_fleet', function ($slug) {
            return TransportFleet::where('slug', $slug)->first();
        });

        Route::bind('student_detail', function ($slug) {
            return Student::where('slug', $slug)->first();
        });

        Route::bind('parent_detail', function ($slug) {
            return ParentDetail::where('slug', $slug)->first();
        });

        Route::bind('fee_payment', function ($id) {
            return FeePayment::where('id', $id)->first();
        });

        Route::bind('bank_account', function ($slug) {
            return Bank::where('slug', $slug)->first();
        });

        Route::bind('school_profile', function ($id) {
            return SchoolProfile::where('id', $id)->first();
        });

        Route::bind('discount_level', function ($id) {
            return DiscountLevel::where('id', $id)->first();
        });

        Route::bind('fee-discount', function ($id) {
            return FeeDiscount::where('id', $id)->first();
        });

        Route::bind('student_fee', function ($id) {
            return StudentFee::where('id', $id)->first();
        });

        Route::bind('student_transport', function ($id) {
            return StudentTransport::where('id', $id)->first();
        });

        Route::bind('mpesa_payment', function ($id) {
            return MpesaPayment::where('id', $id)->first();
        });

        Route::bind('user_management', function ($id) {
            return User::where('id', $id)->first();
        });

        Route::bind('expense_department', function ($id) {
            return ExpenseDepartment::where('id', $id)->first();
        });

        Route::bind('expense_section', function ($id) {
            return ExpenseSection::where('id', $id)->first();
        });

        Route::bind('expense', function ($slug) {
            return Expense::where('slug', $slug)->first();
        });

        Route::bind('staff_department', function ($id) {
            return StaffDepartment::findOrFail($id);
        });

        Route::bind('staff_section', function ($id) {
            return StaffSection::findOrFail($id);
        });

        Route::bind('staff_member', function ($slug) {
            return StaffMember::where('slug', $slug)->first();
        });

        Route::bind('class_manager', function ($id) {
            return ClassManager::findOrFail($id);
        });

        Route::bind('academic_subject', function ($id) {
            return AcademicSubject::findOrFail($id);
        });

        Route::bind('class_subject', function ($id) {
            return ClassSubject::findOrFail($id);
        });

        Route::bind('subject_teacher', function ($id) {
            return SubjectTeacher::findOrFail($id);
        });

        Route::bind('payroll_parameter', function ($id) {
           return PayrollParameter::findOrFail($id);
        });

        Route::bind('send_bulk_message', function ($slug) {
            return OriginalMessage::where('slug', $slug)->first();
        });

        Route::bind('outbox_message', function ($slug) {
            return MessageOutbox::where('code', $slug)->first();
        });

        Route::bind('student_timeline', function ($id) {
            return StudentTimeline::findOrFail($id);
        });
    }

    /**
     * Define the routes for the application.
     *
     * @return void
     */
    public function map()
    {
        $this->mapApiRoutes();

        $this->mapWebRoutes();

        //
    }

    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     *
     * @return void
     */
    protected function mapWebRoutes()
    {
        Route::middleware('web')
             ->namespace($this->namespace)
             ->group(base_path('routes/web.php'));
    }

    /**
     * Define the "api" routes for the application.
     *
     * These routes are typically stateless.
     *
     * @return void
     */
    protected function mapApiRoutes()
    {
        Route::prefix('v1')
             ->middleware('api')
             ->namespace($this->namespace)
             ->group(base_path('routes/api.php'));
    }
}
