<?php
namespace app\student\controller;

use app\student\model\Student as StudentModel;
use think\Controller;

class Student 
{

    public function form()
    {
        $list = StudentModel::all();
        return view('form',['list'=>$list]);
    }



}