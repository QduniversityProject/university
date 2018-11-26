<?php
namespace app\academy\controller;

use app\academy\model\Academy as AcademyModel;


class Academy 
{
    public function form()
    {
        $list = AcademyModel::all();
        return view('form',['list'=>$list]);
    } 
}