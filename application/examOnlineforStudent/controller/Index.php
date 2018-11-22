<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;
use app\examOnlineforStudent\model\untest as untestModel;
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
    public function listExam($stuid=1)
    {   
        // $stuid=$_GET($_SESSION['stuid']);
        // // session 传stuid/找到专业id看有哪些考试

        $course_id=Db::query("SELECT course_id from uncourse a join unstudent b on a.major_id =b.major_id  where b.stu_id =:id",['id'=>$stuid]);  
        $course_id=$course_id[0];  
        $c=implode('',$course_id);
        $untest=Db::query("select * from untest where course_id=:id",['id'=>$c]);
        // $untest=Db::table('untest')->where('id',)->find();
        dump($untest);

        // $Data = Db::query('SELECT * FROM single_answer WHERE singleanswer_id  IN (1,2,3)');
        // $data = Db::query('select*from unstudent  where stu_id =:id', ['id' => $c]);
        // $this->assign('result', $Data);
        // return $this->fetch();
        // dump($examDate);
    }
     //出试卷
    public function startOwnExam()
    {
        //时间限制
        $currtTime = date("Y-m-d H:i:s");
        // $tsetStartTime=Db::name();
       //rwerwer
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
        $judgmentData = judgmentAnswer::all($judgmentAnswerIds);
        $blankData = blankAnswer::all($blankAnswerIds);

        // $date=Db::query('select * from ');
        $this->assign('singleresult', $singleData);
        $this->assign('multiresult', $multiData);
        $this->assign('judgmentresult', $judgmentData);
        $this->assign('blankresult', $blankData);
        return $this->fetch();

    }

}
