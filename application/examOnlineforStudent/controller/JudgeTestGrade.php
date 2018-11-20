<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;

class JudgeTestGrade extends Controller
{
    //提交试卷并批改
    public function submitTest()
    
    {
        // $value[]=$_GET['multi1'];
        // // for($i=1;$i<=3;$i++){
        // // $arr[$i]= $_POST["single{$i}"];
        // // }
        // // dump($arr);
        // print_r ($value);

        
    $array = $this->request->
    getParameter("multi[]");   
    $str =implode(',',$array);   
    echo $str; 


    }

}
