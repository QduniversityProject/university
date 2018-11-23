<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;
use app\examOnlineforStudent\model\singleAnswer;
use app\examOnlineforStudent\model\multiAnswer;
use app\examOnlineforStudent\model\blankAnswer;
use app\examOnlineforStudent\model\judgmentAnswer;
use app\examOnlineforStudent\model\unpaper;

class JudgeTestGrade extends Controller
{
   
    //提交试卷并批改
    public function submitTest()

    {
        session_start();
        //试卷编号
        $paperid = $_SESSION['id'] = 2;

        //分别获取各题型题号
        $unpaper = unpaper::get($paperid);
        $singleanswer_id = $unpaper->singleanswer_id;
        $multianswer_id = $unpaper->multianswer_id;
        $judgmentanswer_id = $unpaper->judgmentanswer_id;
        $blankanswer_id = $unpaper->blankanswer_id;
        //题号组合 这里多选单独拿出来

        // $quenum = implode("", $quenum1[0]);

        //获得单选的正确答案数组
        $singleSheet = Db::query("SELECT single_answer FROM `single_answer` WHERE `singleanswer_id` IN ($singleanswer_id) ;");
        $singleSheet = array_column($singleSheet, 'single_answer');
        //获得多选的正确答案数组
        $multiSheet = Db::query("SELECT multi_answer FROM `multi_answer` WHERE `multianswer_id` IN ($multianswer_id) ;");
        $multiSheet = array_column($multiSheet, 'multi_answer');
        //获得判断的正确答案数组
        $judgmentSheet = Db::query("SELECT judgment_answer FROM `judgment_answer` WHERE `judgmentanswer_id` IN ($judgmentanswer_id) ;");
        $judgmentSheet = array_column($judgmentSheet, 'judgment_answer');
        //获得填空的正确答案数组
        $blankSheet = Db::query("SELECT blank_answer FROM `blank_answer` WHERE `blankanswer_id` IN ($blankanswer_id) ;");
        $blankSheet = array_column($blankSheet, 'blank_answer');
        
        //所有正确答案数组（除了多选题单独一组）
        $ansersheet = array_merge($singleSheet, $judgmentSheet, $blankSheet);
    

        dump($ansersheet);


        //获取学生的试卷答案
        //单选答案获取
       
       
        // 分割，
        // $str =implode(',',$array);  


        echo ("这是叉开的");
        foreach ($_GET as $val) {
            // $multi;
            //判断是否为数组是为多选答案
            if (is_array($val)) {

                $multi = implode('', $val);
                $multiArr[]=$multi;
            } else {
                $arr[] = $val;
            }
        }

        dump($arr);
        dump($multiArr);






    }
}