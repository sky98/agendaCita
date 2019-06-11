<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTurnosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('turnos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name',20);
            $table->time('inicio');
            $table->time('fin');
            $table->timestamps();
        });
        /*
        //Para crear la tabla pivote en una relacion muchos a muchos los nombres de la 2 tablas debene estar escrito en singular. Ejemplo: Articles & Tags => article & tag => article_tag
        Schema::create('profesional_turno', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('profesional_id')->unsigned();
            $table->integer('turno_id')->unsigned();
            $table->date('dia');
            $table->time('bloque');
            $table->foreign('profesional_id')->references('id')->on('profesionales')->onDelete('cascade');
            $table->foreign('turno_id')->references('id')->on('turnos')->onDelete('cascade');
            $table->timestamps();
        });


        */
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('turnos');
    }
}
