<?php
namespace app\examOnlineForTeacher\controller;
use think\Controller;
use think\Db;


class Mark extends Controller
{
    public function listMark()
    {
        $markTable=Db::query("
        select b.stu_rollno ,b.stu_name,e.major_name,f.course_name,d.tea_name,a.mark  from unmark a join unstudent b on a.stu_id=b.stu_id join untest c on a.test_id = c.test_id
        join unteacher d on c.tea_id =d.tea_id join unmajor e on b.major_id =e.major_id join uncourse f on c.course_id =f.course_id
        ");
        $this->assign('markTable', $markTable);
        return $this->fetch();

    }
}