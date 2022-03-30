<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSchoolProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('school_profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('motto')->nullable();
            $table->string('postal')->nullable();
            $table->string('physical')->nullable();
            $table->string('contact1');
            $table->string('contact2')->nullable();
            $table->string('contact3')->nullable();
            $table->string('contact4')->nullable();
            $table->string('email1');
            $table->string('email2')->nullable();
            $table->string('email3')->nullable();
            $table->string('email4')->nullable();
            $table->string('website')->nullable();
            $table->string('logo')->nullable();
            $table->integer('created_by');
            $table->timestamp('created_at');
            $table->integer('updated_by')->nullable();
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
        Schema::dropIfExists('school_profiles');
    }
}
