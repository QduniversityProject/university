<?php
namespace app\gradeAnalysis\controller;

use think\Controller;
use think\request;
use think\Db;

class Analysis extends Controller
{
    public function gradeAnalysis ($course_id = '1', $class_id  = '1', $stu_id = '1')
    {
        $class = Db::table('unclass')->select();
        $course = Db::table('uncourse')->select();
        $student = Db::table('unstudent')->select();

        $amgrade = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->field('b.class_id, avg(a.mark) as avg, max(a.mark) as max')
        ->where('f.course_id', $course_id)
        ->group("b.class_id")
        ->select();

        // $max = Db::table('unmark')
        // ->alias('a')
        // ->join('unstudent b', 'a.stu_id=b.stu_id ')
        // ->join('untest c', 'a.test_id = c.test_id')
        // ->join('unteacher d', ' c.tea_id =d.tea_id')
        // ->join('unmajor e', 'b.major_id =e.major_id')
        // ->join('uncourse f', 'c.course_id =f.course_id')
        // ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        // ->join('unclass h', 'b.class_id =h.class_id')
        // ->field('b.class_id, max(a.mark) as max')
        // ->where('f.course_id', $course_id)
        // ->group("b.class_id")
        // ->select();
        
        foreach ($amgrade as $key => $val){
            $avg[$key] = $val['avg'];
            $max[$key] = $val['max'];
        }
        // $avg = array($amgrade[0]['avg'],$amgrade[1]['avg']);
        // halt($avg);

        $where['f.course_id'] = $course_id;
        $where['b.class_id'] = $class_id;
        $ccgrade1 = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->where($where)
        ->where('a.mark', '<', '60')
        ->count();

        $ccgrade2 = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->where($where)
        ->where('a.mark', 'between', [60, 70])
        ->count();

        $ccgrade3 = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->where($where)
        ->where('a.mark', '>', '70')
        ->where('a.mark', '<', '85')
        ->count();

        $ccgrade4 = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->where($where)
        ->where('a.mark', '>=', '85')
        ->count();
        // halt($ccgrade1);

        $stugrade = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->join('unclass h', 'b.class_id =h.class_id')
        ->field('h.class_name, b.stu_name, b.stu_rollno, f.course_name, a.mark')
        ->where('b.stu_id', $stu_id)
        ->select();


        $this->assign('class', $class);
        $this->assign('course', $course);
        $this->assign('student', $student);
        $this->assign('avg', $avg);
        $this->assign('max', $max);
        $this->assign('ccgrade1', $ccgrade1);
        $this->assign('ccgrade2', $ccgrade2);
        $this->assign('ccgrade3', $ccgrade3);
        $this->assign('ccgrade4', $ccgrade4);
        $this->assign('stugrade', $stugrade);
        return $this->fetch();
    }
}