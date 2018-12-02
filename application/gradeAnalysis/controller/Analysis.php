<?php
namespace app\gradeAnalysis\controller;

use think\Controller;
use think\request;
use think\Db;

class Analysis extends Controller
{
    public function gradeAnalysis ($course_id = '1', $class_id  = '')
    {
        $avg = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->field('b.class_id,avg(a.mark) as avg')
        ->where('f.course_id', $course_id)
        ->group("b.class_id")
        ->select();

        $max = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->field('b.class_id, max(a.mark) as max')
        ->where('f.course_id', $course_id)
        ->group("b.class_id")
        ->select();
        
        // halt($max);
        $this->assign('avg', $avg);
        $this->assign('max', $max);
        return $this->fetch();
    }
}