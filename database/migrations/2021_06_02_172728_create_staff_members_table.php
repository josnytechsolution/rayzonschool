<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffMembersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('staff_members', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('slug')->unique();
            $table->string('member_no')->unique();
            $table->string('name');
            $table->string('idno')->unique();
            $table->integer('gender');
            $table->integer('marital')->nullable();
            $table->date('dob')->nullable();
            $table->date('reg_date')->nullable();
            $table->string('phoneno1');
            $table->string('phoneno2')->nullable();
            $table->string('email')->nullable();
            $table->unsignedBigInteger('staff_department_id');
            $table->foreign('staff_department_id')->references('id')->on('staff_departments')->onUpdate('cascade');
            $table->unsignedBigInteger('staff_section_id');
            $table->foreign('staff_section_id')->references('id')->on('staff_sections')->onUpdate('cascade');
            $table->integer('emp_type')->default(1);
            $table->string('tsc_no')->nullable();
            $table->string('pin')->nullable();
            $table->string('nssf')->nullable();
            $table->string('nhif')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('bank_branch')->nullable();
            $table->string('account_name')->nullable();
            $table->string('account_no')->nullable();
            $table->string('photo');
            $table->integer('status')->default(1);
            $table->bigInteger('created_by');
            $table->timestamp('created_at')->useCurrent();
            $table->bigInteger('updated_by')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('staff_members');
    }
}
