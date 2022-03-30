<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMpesaOutboxesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mpesa_outboxes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('mpesa_payment_id');
            $table->foreign('mpesa_payment_id')->references('id')->on('mpesa_payments')->onDelete('cascade');
            $table->string('messageId');
            $table->text('message');
            $table->string('phone');
            $table->string('status');
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
        Schema::dropIfExists('mpesa_outboxes');
    }
}
