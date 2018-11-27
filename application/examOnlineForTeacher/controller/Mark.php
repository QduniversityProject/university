<?php
namespace app\examOnlineForTeacher\controller;
use think\Controller;
use think\Db;


class Mark extends Controller
{
    public function listMark()
    {
        $markTable=Db::table('unmark')
        ->alias('a')
        ->join('unstudent b','a.stu_id=b.stu_id ')
        ->join('untest c','a.test_id = c.test_id')
        ->join('unteacher d',' c.tea_id =d.tea_id')
        ->join('unmajor e','b.major_id =e.major_id')
        ->join('uncourse f','c.course_id =f.course_id')
        ->paginate()
        ;
        $this->assign('markTable', $markTable);
        return $this->fetch();

    }
}