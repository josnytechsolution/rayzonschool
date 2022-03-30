<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransactionStatusesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaction_statuses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('result_code')->nullable();
            $table->string('result_desc')->nullable();
            $table->string('originator_conversation_id')->nullable();
            $table->string('conversation_id')->nullable();
            $table->string('transaction_id')->nullable();
            $table->string('receipt_no')->nullable();
            $table->string('conversationid')->nullable();
            $table->string('finalised_time')->nullable();
            $table->string('amount')->nullable();
            $table->string('transaction_status')->nullable();
            $table->string('reason_type')->nullable();
            $table->string('transaction_reason')->nullable();
            $table->string('debit_party_charges')->nullable();
            $table->string('debit_account_type')->nullable();
            $table->string('initiated_time')->nullable();
            $table->string('originator_conversationid')->nullable();
            $table->string('credit_party_name')->nullable();
            $table->string('debit_party_name')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaction_statuses');
    }
}
