<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCoopOutboxesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coop_outboxes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('coop_payment_id');
            $table->foreign('coop_payment_id')->references('id')->on('coop_payments')->onDelete('cascade');
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
        Schema::dropIfExists('coop_outboxes');
    }
}
