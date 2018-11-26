<?php
namespace app\admin\controller;
use think\Controller;

class Admin extends Controller
{
    public function form()
    {
        return $this->fetch();
    } 
}