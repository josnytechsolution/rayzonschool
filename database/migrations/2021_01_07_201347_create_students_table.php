<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('parent_detail_id');
            $table->foreign('parent_detail_id')->references('id')->on('parent_details')->onDelete('cascade');
            $table->string('slug')->unique();
            $table->string('admno')->unique();
            $table->string('name');
            $table->unsignedBigInteger('classroom_id');
            $table->foreign('classroom_id')->references('id')->on('classrooms');
            $table->unsignedBigInteger('class_grade_id');
            $table->foreign('class_grade_id')->references('id')->on('class_grades');
            $table->unsignedBigInteger('class_stream_id');
            $table->foreign('class_stream_id')->references('id')->on('class_streams');
            $table->integer('expected')->default(0);
            $table->integer('arrears')->default(0);
            $table->integer('current')->default(0);
            $table->integer('paid')->default(0);
            $table->integer('balance')->default(0);
            $table->string('birth_cert')->nullable();
            $table->string('nemis_upi')->nullable();
            $table->integer('gender');
            $table->date('dob');
            $table->date('doa');
            $table->year('yoc')->nullable();
            $table->string('residence')->nullable();
            $table->integer('adm_type')->default(1);
            $table->boolean('on_transport')->default(false);
            $table->unsignedBigInteger('transport_zone_id')->nullable();
            $table->foreign('transport_zone_id')->references('id')->on('transport_zones');
            $table->integer('way')->nullable();
            $table->unsignedBigInteger('transport_fleet_id')->nullable();
            $table->foreign('transport_fleet_id')->references('id')->on('transport_fleets');
            $table->unsignedBigInteger('discount_level_id');
            $table->foreign('discount_level_id')->references('id')->on('discount_levels');
            $table->unsignedBigInteger('current_session_id');
            $table->foreign('current_session_id')->references('id')->on('current_sessions');
            $table->string('send_to');
            $table->string('photo');
            $table->integer('status')->default(1);
            $table->bigInteger('created_by');
            $table->timestamp('created_at');
            $table->bigInteger('updated_by')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->bigInteger('deleted_by')->nullable();
            $table->timestamp('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
