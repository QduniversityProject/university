<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;
use app\examOnlineforStudent\model\unpaper;
use app\examOnlineforStudent\model\untest;
use app\examOnlineforStudent\model\singleAnswer;
use app\examOnlineforStudent\model\multiAnswer;
use app\examOnlineforStudent\model\blankAnswer;
use app\examOnlineforStudent\model\judgmentAnswer;

class JudgePractice extends Controller
{
   
    //提交试卷并批改
    public function submitPractice()

    {
        $stuid=$_COOKIE['stu_id'];
        //试卷编号 iid
        $testId = $_GET['test_id'];
        $paperid3 = Db::query('select paper_id from unpaper where stu_id =:stuid and test_id =:testid', ['stuid' => $stuid, 'testid' => $testId]);
        $id = $paperid3[0];
        $id3 = array_values($id);
        $iid = $id3[0];
        //有点乱但是就是类型转换
        //分别获取各题型题号
        $unpaper = unpaper::get($iid);
        $singleanswer_id = $unpaper->singleanswer_id;
        $multianswer_id = $unpaper->multianswer_id;
        $judgmentanswer_id = $unpaper->judgmentanswer_id;
        $blankanswer_id = $unpaper->blankanswer_id;
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
        //所有正确答案数组分成4个
        $singlesize = count($singleSheet);
        $multisize = count($multiSheet);
        $judgmentsize = count($judgmentSheet);
        $blanksize = count($blankSheet);
        $singleanswer=null;
        $multianswer=null;
        $judgmentanswer=null;
        $blankanswer=null;
        foreach ($_GET as $val) {
            //判断是否为数组是为多选答案
            if (is_array($val)) {
                $multi = implode('', $val);
                $multianswer[] = $multi;
            } else {
                $single[] = $val;
            }
        }
        for ($x = 0; $x < count($single); $x++) {
            if ($x < $singlesize) {
                $singleanswer[] = $single[$x];
            } else if ($x < $multisize + $singlesize) {
                $judgmentanswer[] = $single[$x];
            } else if ($x < $multisize + $singlesize + $judgmentsize) {
                $blankanswer[] = $single[$x];
            }
        }
        $singlecurrt = 0;
        $singleWrongNum = [];
        for ($i = 0; $i < $singlesize; $i++) {

            if ($singleSheet[$i] == $singleanswer[$i]) {
                $singlecurrt++;
            } else
            //错题的题号第几位
            $singleWrongNum[] = $i;

        }
        $multicurrt = 0;
        for ($i = 0; $i < $multisize; $i++) {

            if ($multiSheet[$i] == $multianswer[$i]) {
                $multicurrt++;
            } else
            //错题的题号第几位
            $multiWrongNum[] = $i;

        }
        
        $judgmentcurrt = 0;
        for ($i = 0; $i < $singlesize; $i++) {
         
            if ($judgmentanswer[$i]!=null and $judgmentSheet[$i] == $judgmentanswer[$i]   )  {
                $judgmentcurrt++;
            } else
            //错题的题号第几位
            $judgmentWrongNum[] = $i;

        }
        $blankcurrt = 0;
        for ($i = 0; $i < $blanksize; $i++) {

            if ($blankSheet[$i] == $blankanswer[$i]) {
                $blankcurrt++;
            } else
            //错题的题号第几位
            $blankWrongNum[] = $i;

        }

        // dump($singlecurrt);

        //打分时刻

        $testQues = untest::get($_GET['test_id']);
        $singleValue = $testQues->single_qus_num;
        $mValue = $testQues->multi_qus_num;
        $jValue = $testQues->judgment_qus_num;
        $bValue = $testQues->blank_qus_num;
        $score = $singlecurrt * $singleValue + $multicurrt * $mValue + $judgmentcurrt * $jValue + $blankcurrt * $bValue;
        $singleanswer_id = explode(',', $singleanswer_id);
        foreach ($singleWrongNum as $key => $value) {
            $singlewrongQuesNum[] = $singleanswer_id[$singleWrongNum[$key]];
        }
        $multianswer_id = explode(',', $multianswer_id);
        foreach ($multiWrongNum as $key => $value) {
            $multiwrongQuesNum[] = $multianswer_id[$multiWrongNum[$key]];
        }


        $judgmentanswer_id = explode(',', $judgmentanswer_id);
        foreach ($judgmentWrongNum as $key => $value) {
            $judgmentwrongQuesNum[] = $judgmentanswer_id[$judgmentWrongNum[$key]];
        }

        $blankanswer_id = explode(',', $blankanswer_id);
        foreach ($blankWrongNum as $key => $value) {
            $blankwrongQuesNum[] = $blankanswer_id[$blankWrongNum[$key]];
        }

        $sids = implode(",", $singlewrongQuesNum);
        $mids = implode(",", $multiwrongQuesNum);
        $jids = implode(",", $judgmentwrongQuesNum);
        $bids = implode(",", $blankwrongQuesNum);

        $sWrong = singleAnswer::all($sids);
        $mWrong = multiAnswer::all($mids);
        $jWrong = judgmentAnswer::all($jids);
        $bWrong = blankAnswer::all($bids);
        // Db::execute("insert into unmark (stu_id ,test_id,mark) values ('$stuid','$testId','$score')");

        $this->assign('singleresult', $sWrong);
        $this->assign('multiresult', $mWrong);
        $this->assign('judgmentresult', $jWrong);
        $this->assign('blankresult', $bWrong);
        // $this->assign('score', $score);
        return $this->fetch();





    }
}