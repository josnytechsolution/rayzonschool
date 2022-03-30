<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMessageOutboxesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('message_outboxes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code');
            $table->bigInteger('recipient_id');
            $table->string('externalMessageId')->nullable();
            $table->uuid('messageId');
            $table->text('message');
            $table->string('phoneno');
            $table->integer('characters');
            $table->integer('sms_units');
            $table->double('sms_cost',6, 2);
            $table->string('target');
            $table->string('sender_id')->nullable();
            $table->integer('statusCode')->nullable();
            $table->string('status')->nullable();
            $table->dateTime('delivered_at')->nullable();
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
        Schema::dropIfExists('message_outboxes');
    }
}
