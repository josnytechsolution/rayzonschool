<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCoopPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coop_payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('student_id');
            $table->foreign('student_id')->references('id')->on('students')->onUpdate('cascade')->onDelete('cascade');
            $table->unsignedBigInteger('current_session_id');
            $table->foreign('current_session_id')->references('id')->on('current_sessions');
            $table->string('transactionReferenceCode')->nullable();
            $table->string('transactionDate')->nullable();
            $table->string('totalAmount')->nullable();
            $table->string('currency')->nullable();
            $table->string('documentReferenceNumber')->nullable();
            $table->string('bankCode')->nullable();
            $table->string('branchCode')->nullable();
            $table->string('paymentDate')->nullable();
            $table->string('paymentReferenceCode')->nullable();
            $table->string('paymentCode')->nullable();
            $table->string('paymentMode')->nullable();
            $table->string('paymentAmount')->nullable();
            $table->string('additionalInfo')->nullable();
            $table->string('accountNumber')->nullable();
            $table->string('accountName')->nullable();
            $table->string('institutionCode')->nullable();
            $table->string('institutionName')->nullable();
            $table->timestamp('created_at')->useCurrent();
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
        Schema::dropIfExists('coop_payments');
    }
}
