<?php
namespace app\examOnlineForTeacher\controller;
use think\Controller;
use think\Db;


class Mark extends Controller
{
    public function listMark($orderby = 'mark', $orderway = 'desc', $major_id = '',$course_id = '', $tea_id = '', $stu_id = '')
    {
        $course = Db::table('uncourse')->select();
        $major = Db::table('unmajor')->select();
        $teacher = Db::table('unteacher')->select();
        $student = Db::table('unstudent')->select();

        $where = array();
        if($major_id){
            //$where['major_id'] = array('eq', $major_id); 
            $where['e.major_id'] = $major_id; 
        }
        if($course_id){
            $where['f.course_id'] = $course_id; 
        }
        if($tea_id){
            $where['d.tea_id'] = $tea_id; 
        }
        if($stu_id){
            $where['b.stu_id'] = $stu_id; 
        }

        
        $markTable=Db::table('unmark')
        ->alias('a')
        ->join('unstudent b','a.stu_id=b.stu_id ')
        ->join('untest c','a.test_id = c.test_id')
        ->join('unteacher d',' c.tea_id =d.tea_id')
        ->join('unmajor e','b.major_id =e.major_id')
        ->join('uncourse f','c.course_id =f.course_id')
<<<<<<< HEAD
        ->where($where)
        ->order("$orderby $orderway")
        ->paginate();
=======
        ->paginate()
        ;
>>>>>>> 9e98d23a3371a05c30d2bee21de9cf581f9a66ab
        $this->assign('markTable', $markTable);
        $this->assign('orderby', $orderby);
        $this->assign('orderway', $orderway);
        $this->assign('course', $course);
        $this->assign('major', $major);
        $this->assign('teacher', $teacher);
        $this->assign('student', $student);
        return $this->fetch();

    }
}