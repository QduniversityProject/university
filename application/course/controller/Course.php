<?php
namespace app\course\controller;

use app\course\model\Course as CourseModel;


class Course 
{
    public function form()
    {
        $list = CourseModel::all();
        return view('form',['list'=>$list]);
    }
}