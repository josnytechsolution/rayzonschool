<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateParentDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parent_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('slug')->unique();
            $table->string('parent_no')->unique();
            $table->string('primary_contact')->nullable();
            $table->string('secondary_contact')->nullable();
            $table->string('primary_email')->nullable();
            $table->string('fname')->nullable();
            $table->string('fcontact')->nullable()->unique();
            $table->string('femail')->nullable()->unique();
            $table->string('foccupation')->nullable();
            $table->string('mname')->nullable();
            $table->string('mcontact')->nullable()->unique();
            $table->string('memail')->nullable()->unique();
            $table->string('moccupation')->nullable();
            $table->string('gname')->nullable();
            $table->string('gcontact')->nullable()->unique();
            $table->string('gemail')->nullable()->unique();
            $table->string('grelation')->nullable();
            $table->string('credential_email')->unique();
            $table->string('credential_password');
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
        Schema::dropIfExists('parent_details');
    }
}
