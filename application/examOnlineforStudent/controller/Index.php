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
    public function listExam()
    {   
        $stuid=$_COOKIE['stu_id'];
        // // session 传stuid/找到专业id看有哪些考试
        $course_id = Db::query("select course_ids from unmajor a join unstudent b on a.major_id= b.major_id where b.stu_id =:id", ['id' => $stuid]);
        $course_id = $course_id[0];
        $c = implode(',', $course_id);
        $untest = Db::query("select * from untest where course_id in ($c) and test_type=1");
    
       
        $this->assign('untest', $untest);
    
        return $this->fetch();
    }
    public function listhomework(){
        $stuid=$_COOKIE['stu_id'];
        // // session 传stuid/找到专业id看有哪些考试
        $course_id = Db::query("select course_ids from unmajor a join unstudent b on a.major_id= b.major_id where b.stu_id =:id", ['id' => $stuid]);
        $course_id = $course_id[0];
        $c = implode(',', $course_id);
        $unhomework = Db::query("select * from untest where course_id in ($c) and test_type=3");
        $this->assign('unhomework', $unhomework);
        return $this->fetch();
    }
    public function listlianxi(){
        $stuid=$_COOKIE['stu_id'];
        // // session 传stuid/找到专业id看有哪些考试
        $course_id = Db::query("select course_ids from unmajor a join unstudent b on a.major_id= b.major_id where b.stu_id =:id", ['id' => $stuid]);
        $course_id = $course_id[0];
        $c = implode(',', $course_id);
        $unlianxi = Db::query("select * from untest where course_id in ($c) and test_type=2");       
        $this->assign('unlianxi', $unlianxi);
        return $this->fetch();
    }
     //出试卷
    public function startOwnExam()
    {

        // 做一个判断 当前表是否unpaper有该学生成绩为空的列 为考试未完成的 筛选出paperid直接进入
        // $stuid=$_GET($_SESSION['stuid']);
  
        $stuid=$_COOKIE['stu_id'];
        $testId = $_GET['test_id'];
    //创建自己题库
        //获得单选题题号数组 //并且带考试类型
        $singlecourse_id = singleAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('singleanswer_id');
        $multicourse_id = multiAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('multianswer_id');
        $judgmentcourse_id = judgmentAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('judgmentanswer_id');
        $blankcourse_id = blankAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('blankanswer_id');
        //随机n个
        $singleAnswerIdsArr = array_rand($singlecourse_id, $_GET['single_qus_num']);
        $multiAnswerIdsArr = array_rand($multicourse_id, $_GET['multi_qus_num']);
        $judgmentAnswerIdsArr = array_rand($judgmentcourse_id, $_GET['judgment_qus_num']);
        $blankAnswerIdsArr = array_rand($blankcourse_id, $_GET['blank_qus_num']);

        foreach ($singleAnswerIdsArr as $a => $v) {
            $singleIds[] = $singlecourse_id[$v];
        }
        foreach ($multiAnswerIdsArr as $a => $v) {
            $multiIds[] = $multicourse_id[$v];
        }
        foreach ($judgmentAnswerIdsArr as $a => $v) {
            $judgmentIds[] = $judgmentcourse_id[$v];
        }
        foreach ($blankAnswerIdsArr as $a => $v) {
            $blankIds[] = $blankcourse_id[$v];
        }
        

        //生成题目id字符串
        $singleAnswerIds = implode(",", $singleIds);
        $multiAnswerIds = implode(",", $multiIds);
        $judgmentAnswerIds = implode(",", $judgmentIds);
        $blankAnswerIds = implode(",", $blankIds);
        // dump($singleIds);
        // dump($multiIds);
        // dump($judgmentIds);
        // dump($blankIds);
        //保存考生题号
        Db::execute("insert into unpaper (stu_id ,test_id,singleanswer_id,multianswer_id,judgmentanswer_id,blankanswer_id) values ('$stuid','$testId','$singleAnswerIds','$multiAnswerIds','$judgmentAnswerIds','$blankAnswerIds')");
        
        //获取题目
        $singleData = Db::query("SELECT * FROM single_answer WHERE singleanswer_id  IN ($singleAnswerIds)");
        $multiData = multiAnswer::all($multiAnswerIds);
        $judgmentData = judgmentAnswer::all($judgmentAnswerIds);
        $blankData = blankAnswer::all($blankAnswerIds);

        $this->assign('singleresult', $singleData);
        $this->assign('multiresult', $multiData);
        $this->assign('judgmentresult', $judgmentData);
        $this->assign('blankresult', $blankData);
        $this->assign('testId', $testId);
        return $this->fetch();

    }


    public function startOwnPractice()
    {

        // 做一个判断 当前表是否unpaper有该学生成绩为空的列 为考试未完成的 筛选出paperid直接进入
        // $stuid=$_GET($_SESSION['stuid']);
  
        $stuid=$_COOKIE['stu_id'];
        $testId = $_GET['test_id'];
    //创建自己题库
        //获得单选题题号数组 //并且带考试类型
        $singlecourse_id = singleAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('singleanswer_id');
        $multicourse_id = multiAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('multianswer_id');
        $judgmentcourse_id = judgmentAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('judgmentanswer_id');
        $blankcourse_id = blankAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('blankanswer_id');
        //随机n个
        $singleAnswerIdsArr = array_rand($singlecourse_id, $_GET['single_qus_num']);
        $multiAnswerIdsArr = array_rand($multicourse_id, $_GET['multi_qus_num']);
        $judgmentAnswerIdsArr = array_rand($judgmentcourse_id, $_GET['judgment_qus_num']);
        $blankAnswerIdsArr = array_rand($blankcourse_id, $_GET['blank_qus_num']);

        foreach ($singleAnswerIdsArr as $a => $v) {
            $singleIds[] = $singlecourse_id[$v];
        }
        foreach ($multiAnswerIdsArr as $a => $v) {
            $multiIds[] = $multicourse_id[$v];
        }
        foreach ($judgmentAnswerIdsArr as $a => $v) {
            $judgmentIds[] = $judgmentcourse_id[$v];
        }
        foreach ($blankAnswerIdsArr as $a => $v) {
            $blankIds[] = $blankcourse_id[$v];
        }
        

        //生成题目id字符串
        $singleAnswerIds = implode(",", $singleIds);
        $multiAnswerIds = implode(",", $multiIds);
        $judgmentAnswerIds = implode(",", $judgmentIds);
        $blankAnswerIds = implode(",", $blankIds);
        // dump($singleIds);
        // dump($multiIds);
        // dump($judgmentIds);
        // dump($blankIds);
        //保存考生题号
        // Db::execute("insert into unpaper (stu_id ,test_id,singleanswer_id,multianswer_id,judgmentanswer_id,blankanswer_id) values ('$stuid','$testId','$singleAnswerIds','$multiAnswerIds','$judgmentAnswerIds','$blankAnswerIds')");
        
        //获取题目
        $singleData = Db::query("SELECT * FROM single_answer WHERE singleanswer_id  IN ($singleAnswerIds)");
        $multiData = multiAnswer::all($multiAnswerIds);
        $judgmentData = judgmentAnswer::all($judgmentAnswerIds);
        $blankData = blankAnswer::all($blankAnswerIds);

        $this->assign('singleresult', $singleData);
        $this->assign('multiresult', $multiData);
        $this->assign('judgmentresult', $judgmentData);
        $this->assign('blankresult', $blankData);
        $this->assign('testId', $testId);
        return $this->fetch();

    }


    public function startOwnHomework()
    {

        // 做一个判断 当前表是否unpaper有该学生成绩为空的列 为考试未完成的 筛选出paperid直接进入
        // $stuid=$_GET($_SESSION['stuid']);
  
        $stuid=$_COOKIE['stu_id'];
        $testId = $_GET['test_id'];
    //创建自己题库
        //获得单选题题号数组 //并且带考试类型
        $_GET['qbank_no']=2;
        $singlecourse_id = singleAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('singleanswer_id');
        $multicourse_id = multiAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('multianswer_id');
        $judgmentcourse_id = judgmentAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('judgmentanswer_id');
        $blankcourse_id = blankAnswer::where('course_id', $_GET['courseId'])->where('qbank_no', $_GET['qbank_no'])->column('blankanswer_id');
        //随机n个
        $singleAnswerIdsArr = array_rand($singlecourse_id, $_GET['single_qus_num']);
        $multiAnswerIdsArr = array_rand($multicourse_id, $_GET['multi_qus_num']);
        $judgmentAnswerIdsArr = array_rand($judgmentcourse_id, $_GET['judgment_qus_num']);
        $blankAnswerIdsArr = array_rand($blankcourse_id, $_GET['blank_qus_num']);

        foreach ($singleAnswerIdsArr as $a => $v) {
            $singleIds[] = $singlecourse_id[$v];
        }
        foreach ($multiAnswerIdsArr as $a => $v) {
            $multiIds[] = $multicourse_id[$v];
        }
        foreach ($judgmentAnswerIdsArr as $a => $v) {
            $judgmentIds[] = $judgmentcourse_id[$v];
        }
        foreach ($blankAnswerIdsArr as $a => $v) {
            $blankIds[] = $blankcourse_id[$v];
        }
        

        //生成题目id字符串
        $singleAnswerIds = implode(",", $singleIds);
        $multiAnswerIds = implode(",", $multiIds);
        $judgmentAnswerIds = implode(",", $judgmentIds);
        $blankAnswerIds = implode(",", $blankIds);
        // dump($singleIds);
        // dump($multiIds);
        // dump($judgmentIds);
        // dump($blankIds);
        //保存考生题号
        Db::execute("insert into unpaper (stu_id ,test_id,singleanswer_id,multianswer_id,judgmentanswer_id,blankanswer_id) values ('$stuid','$testId','$singleAnswerIds','$multiAnswerIds','$judgmentAnswerIds','$blankAnswerIds')");
        
        //获取题目
        $singleData = Db::query("SELECT * FROM single_answer WHERE singleanswer_id  IN ($singleAnswerIds)");
        $multiData = multiAnswer::all($multiAnswerIds);
        $judgmentData = judgmentAnswer::all($judgmentAnswerIds);
        $blankData = blankAnswer::all($blankAnswerIds);

        $this->assign('singleresult', $singleData);
        $this->assign('multiresult', $multiData);
        $this->assign('judgmentresult', $judgmentData);
        $this->assign('blankresult', $blankData);
        $this->assign('testId', $testId);
        return $this->fetch();

    }


}
