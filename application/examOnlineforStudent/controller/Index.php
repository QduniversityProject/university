<?php
namespace app\examOnlineforStudent\controller;

use think\Controller;
use think\Db;
use app\examOnlineforStudent\model\untest as untstModel ;
class Index  extends Controller
{
    // 创建新文件夹语句
    // php think build --module examOnlineForTeacher

    //查看当前考试
    public function listExam($stuid=1)
    {   
        // id=$_GET($_SESSION[]);
        
        $test = new untstModel;
        $test->test_id="33";

        $Data=Db::query('SELECT * FROM single_answer WHERE singleanswer_id  IN (1,2,3)');
        $data=Db::query('select*from unstudent  where stu_id =:id', ['id' => $stuid]);
        $this->assign('result', $Data);
        return $this->fetch();
        // dump($examDate);
     }
     //出试卷
     public function startOwnExam()
    {
        $stuid=1;
        //FIXME session 传stuid/找到专业id看有哪些考试

        //时间限制
        $currtTime=date("Y-m-d H:i:s");
        // $tsetStartTime=Db::name();
       
        //创建自己题库
        //分别获取所有题库的数目
        $untest1size = Db::name('single_answer')->count();
        $untest2size = Db::name('multi_answer')->count();
        $untest3size = Db::name('judgment_answer')->count();
        $untest4size = Db::name('blank_answer')->count();
        $singleAnswerIds=array_rand(range(1,$untest1size),10);

       
        // $multiAnswerIds=array_rand(range(1,$untest2size),10);
        // $judgmentAnswerIds=array_rand(range(1,$untest3size),10);
        // $blankAnswerIds=array_rand(range(1,$untest4size),10);
        $comma_separated = implode(",", $singleAnswerIds );//生成题目id字符串

        //保存考生题号
        $saveSingleIds=Db::execute("insert into unpaper (stu_id ,singleanswer_id) values (5,'$comma_separated')");

        $singleData=Db::query("SELECT * FROM single_answer WHERE singleanswer_id  IN ($comma_separated)");
        
        // $date=Db::query('select * from ');
        $this->assign('singleresult', $singleData);
        return $this->fetch();
       
        // dsfsdfsdfsd
        // finfo_buffer

     }
    

}
