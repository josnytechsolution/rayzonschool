<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClassroomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('classrooms', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->unique();
            $table->string('long_name')->unique();
            $table->string('slug')->unique();
            $table->unsignedBigInteger('class_grade_id');
            $table->foreign('class_grade_id')->references('id')->on('class_grades')->onDelete('cascade');
            $table->unsignedBigInteger('class_stream_id');
            $table->foreign('class_stream_id')->references('id')->on('class_streams')->onDelete('cascade');
            $table->integer('status')->default(1);
            $table->bigInteger('created_by');
            $table->timestamp('created_at');
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
        Schema::dropIfExists('classrooms');
    }
}
