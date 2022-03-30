<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExpensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('expenses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('slug')->unique();
            $table->unsignedBigInteger('expense_department_id');
            $table->foreign('expense_department_id')->references('id')->on('expense_departments')->onDelete('cascade');
            $table->unsignedBigInteger('expense_section_id');
            $table->foreign('expense_section_id')->references('id')->on('expense_sections')->onDelete('cascade');
            $table->unsignedBigInteger('transport_fleet_id')->nullable();
            $table->foreign('transport_fleet_id')->references('id')->on('transport_fleets')->onDelete('cascade');
            $table->string('description');
            $table->date('expense_date');
            $table->bigInteger('amount');
            $table->integer('payment_type');
            $table->unsignedBigInteger('bank_id')->nullable();
            $table->foreign('bank_id')->references('id')->on('banks')->onDelete('cascade');
            $table->string('account_no')->nullable();
            $table->string('ref_no')->nullable();
            $table->bigInteger('created_by');
            $table->timestamp('created_at')->useCurrent();
            $table->bigInteger('updated_by')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('expenses');
    }
}
