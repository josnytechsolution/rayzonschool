<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePromotionHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promotion_histories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('class_from');
            $table->foreign('class_from')->references('id')->on('class_grades')->onUpdate('cascade')->onDelete('cascade');
            $table->unsignedBigInteger('class_to');
            $table->foreign('class_to')->references('id')->on('class_grades')->onUpdate('cascade')->onDelete('cascade');
            $table->unsignedBigInteger('from_session_id');
            $table->foreign('from_session_id')->references('id')->on('current_sessions')->onUpdate('cascade')->onDelete('cascade');
            $table->unsignedBigInteger('to_session_id');
            $table->foreign('to_session_id')->references('id')->on('current_sessions')->onUpdate('cascade')->onDelete('cascade');
            $table->bigInteger('created_by');
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
        Schema::dropIfExists('promotion_histories');
    }
}
