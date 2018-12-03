<?php
namespace app\examOnlineForTeacher\controller;
use think\Controller;
use think\Db;
class CreateTest extends Controller
{
    public function createTest()
    {
       
        $courseInfo=Db::table('unteacher')
        ->alias('a')
        ->join('uncourse b', 'a.course_id =b.course_id')
        ->where('a.tea_id',$_COOKIE['tea_id'])
        ->select();
        
        ;
         $this->assign('course', $courseInfo);
      
        return $this->fetch();

    }

    public function insertTest()
    {
        $tset_desc=$_GET['tset_desc'];
        $test_type=$_GET['test_type'];
        $course_id=$_GET['course_id'];
        $tea_id=$_COOKIE['tea_id'];
        $single_qus_num=$_GET['single_qus_num'];
        $multi_qus_num=$_GET['multi_qus_num'];
        $judgment_qus_num=$_GET['judgment_qus_num'];
        $blank_qus_num=$_GET['blank_qus_num'];
        $single_score=$_GET['single_score'];
        $multi_score=$_GET['multi_score'];
        $judgment_score=$_GET['judgment_score'];
        $blank_score=$_GET['blank_score'];
        $start_time=$_GET['start_date']." ".$_GET['start_time'];
        $end_time=$_GET['end_date']." ".$_GET['end_time'];
        $testInsert=Db::execute("INSERT INTO untest (test_desc, test_type, course_id, tea_id, single_qus_num, multi_qus_num, judgment_qus_num, blank_qus_num, single_score, multi_score, judgment_score, blank_score, start_time, end_time) 
        VALUES ( '$tset_desc',$test_type, $course_id, $tea_id,$single_qus_num, $multi_qus_num,   $judgment_qus_num, $blank_qus_num, $single_score, 
        $multi_score, $judgment_score, $blank_score, '$start_time',  '$end_time');");
        if($testInsert){
            return "添加成功";
        }else
        return "添加失败";
    }
}

//gggggoddddd

// tertertretreterterte
// /这是github库
// /
//再次提交到git库

// develop fenzhi、
