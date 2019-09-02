<?php

use Illuminate\Database\Seeder;
use App\Imovel;

class ImovelSeeds extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */

    public function run()
    {
        if(!Imovel::where('nome','=','imovel_listar')->count()){
        	Imovel::create([
        			'nome'=>'imovel_listar',
        			'descricao'=>'Listar Imóveis'
        		]);
        }else{
        	$imovel = Imovel::where('nome','=','imovel_listar')->first();
        	$Imovel->update([
        			'nome'=>'imovel_listar',
        			'descricao'=>'Listar Imóveis'
        		]);
        }

        if(!Imovel::where('nome','=','imovel_adicionar')->count()){
        	Imovel::create([
        			'nome'=>'imovel_adicionar',
        			'descricao'=>'Adicionar Imóveis'
        		]);
        }else{
        	$imovel = Imovel::where('nome','=','imovel_adicionar')->first();
        	$imovel->update([
        			'nome'=>'imovel_adicionar',
        			'descricao'=>'Adicionar Imóveis'
        		]);
        }

        if(!Imovel::where('nome','=','imovel_editar')->count()){
        	Imovel::create([
        			'nome'=>'imovel_editar',
        			'descricao'=>'Editar Imóveis'
        		]);
        }else{
        	$imovel = Imovel::where('nome','=','imovel_editar')->first();
        	$imovel->update([
        			'nome'=>'imovel_editar',
        			'descricao'=>'Editar Imóveis'
        		]);
        }

        if(!Imovel::where('nome','=','imovel_deletar')->count()){
        	Imovel::create([
        			'nome'=>'imovel_deletar',
        			'descricao'=>'Deletar Imóveis'
        		]);
        }else{
        	$imovel = Imovel::where('nome','=','imovel_deletar')->first();
        	$imovel->update([
        			'nome'=>'imovel_deletar',
        			'descricao'=>'Deletar Imóveis'
        		]);
        }
        
    }
}
