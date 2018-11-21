<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;

class JudgeTestGrade extends Controller
{
    //提交试卷并批改
    public function submitTest()

    {
        //单选答案获取
        // $value[]=$_GET['multi[]'];
        // for ($i = 1; $i <= 3; $i++) {
            
        //     $arr[] = $_GET["single{$i}"];
        // }
        // // dump($arr);
        // print_r($arr);

        // 分割，
 // $str =implode(',',$array);  


          // 多选答案获取
        // for ($i = 1; $i <= 5; $i++) {
      
            // $multi[] = $_GET["multi"];
        // }
        // foreach($_GET as $key=>$value){
        //     echo $key.'='.$vlaue;
        // } 


//      foreach ($_GET as $key => $value[]) 
// {
    
//          echo "Key: $key; Value: $value<br />\n";
    

// } 
        print_r($_GET);
        dump($_GET);
    // $multi= $_GET;
    // foreach ($_GET as $val) {
    //     $val = join(",",$val);
    //     $temp_array[] = $val;
    // }
    // $str =implode('',$temp_array);  
    // echo($str);

        // 方法借鉴
    // function multiToSingle($arr, $delimiter = '->',$key = ' ') {
    //     $resultAry = array();
    //     if (!(is_array($arr) && count($arr)>0)) {
    //         return false;
    //     }
    //     foreach ($_GET AS $k=>$val) {
    //         $newKey = trim($key . $k . $delimiter);
    //         if (is_array($val) && count($val)>0) {
    //             $resultAry = array_merge($resultAry, multiToSingle($val, $delimiter, $newKey));
    //         } else {
    //             $resultAry[] = $newKey . $val;
    //         }
    //     }
    //     return $resultAry;
    // }

        echo ("这是叉开的");
        foreach ($_GET as $val) {
            $multi;
            if (is_array($val)) {
                $multi = implode('', $val);
            // $val[] = join(",",$val);
                // $val = explode(",", $val);
                echo($multi);
                // dump($val);
                // $multi=$multi.",";   
                
            }
           
        }
        // dump($multi);
        echo($multi);
     
       





    }
}