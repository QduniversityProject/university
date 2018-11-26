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
<<<<<<< HEAD
=======
    // nnn
>>>>>>> 132d67dade4aeeff7d2b53e6f282abf200366fcb
}