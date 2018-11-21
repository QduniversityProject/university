<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;
use app\examOnlineforStudent\model\untest as untstModel;
use app\examOnlineforStudent\model\unpaper;
use app\examOnlineforStudent\model\singleAnswer;
use app\examOnlineforStudent\model\multiAnswer;
use app\examOnlineforStudent\model\blankAnswer;
use app\examOnlineforStudent\model\judgmentAnswer;

class Index extends Controller
{   
    //test
    // 创建新文件夹语句
    // php think build --module examOnlineForTeacher

    //查看当前考试
    public function listExam($stuid = 1)
    {   
        // id=$_GET($_SESSION[]);

        $test = new untstModel;
        $test->test_id = "33";

        $Data = Db::query('SELECT * FROM single_answer WHERE singleanswer_id  IN (1,2,3)');
        $data = Db::query('select*from unstudent  where stu_id =:id', ['id' => $stuid]);
        $this->assign('result', $Data);
        return $this->fetch();
        // dump($examDate);
    }
     //出试卷
    public function startOwnExam()
    {
        $stuid = 1;
        //FIXME session 传stuid/找到专业id看有哪些考试

        //时间限制
        $currtTime = date("Y-m-d H:i:s");
        // $tsetStartTime=Db::name();
       
    //创建自己题库
        //分别获取所有题库的数目
        $singlesize = singleAnswer::count();
        $multisize = multiAnswer::count();
        $judgmentsize = judgmentAnswer::count();
        $blanksize = blankAnswer::count();
        //随机生成10个数
        $singleAnswerIdsArr = array_rand(range(1, $singlesize), 10);
        $multiAnswerIdsArr = array_rand(range(1, $multisize), 10);
        $judgmentAnswerIdsArr = array_rand(range(1, $judgmentsize), 10);
        $blankAnswerIdsArr = array_rand(range(1, $blanksize), 10);
    //生成题目id字符串
        $singleAnswerIds = implode(",", $singleAnswerIdsArr);
        $multiAnswerIds = implode(",", $multiAnswerIdsArr);
        $judgmentAnswerIds = implode(",", $judgmentAnswerIdsArr);
        $blankAnswerIds = implode(",", $blankAnswerIdsArr);

        //保存考生题号
        $saveSingleIds = Db::execute("insert into unpaper (stu_id ,singleanswer_id,multianswer_id,judgmentanswer_id,blankanswer_id) values (5,'$singleAnswerIds','$multiAnswerIds','$judgmentAnswerIds','$blankAnswerIds')");
        // 'select * from data where id=:id',['id'=>[4,\PDO::PARAM_INT]]
        $singleData = Db::query("SELECT * FROM single_answer WHERE singleanswer_id  IN ($singleAnswerIds)");
        $multiData = multiAnswer::all($multiAnswerIds);
        // $date=Db::query('select * from ');
        $this->assign('singleresult', $singleData);
        $this->assign('multiresult', $multiData);
        return $this->fetch();

    }


}
