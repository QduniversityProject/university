<?php
namespace app\examOnlineForTeacher\controller;

use think\Controller;
use think\Db;
use PHPExcel_IOFactory;
use PHPExcel;


class Mark extends Controller
{
   
    public function excelPrint()
    {

        $markTable = Db::table('unmark')
        ->alias('a')
        ->join('unstudent b', 'a.stu_id=b.stu_id ')
        ->join('untest c', 'a.test_id = c.test_id')
        ->join('unteacher d', ' c.tea_id =d.tea_id')
        ->join('unmajor e', 'b.major_id =e.major_id')
        ->join('uncourse f', 'c.course_id =f.course_id')
        ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        ->select();
    
        $path = dirname(__FILE__); //找到当前脚本所在路径
        vendor("PHPExcel"); //方法一
        $PHPExcel = new \PHPExcel();
        $PHPSheet = $PHPExcel->getActiveSheet();
        $PHPSheet->setTitle("demo"); //给当前活动sheet设置名称
        $PHPSheet->setCellValue("A1", "学生学号")
            ->setCellValue("B1", "学生姓名")
            ->setCellValue("C1", "教师姓名")
            ->setCellValue("D1", "专业名称")
            ->setCellValue("E1", "课程名称")
            ->setCellValue("F1", "测试名称")
            ->setCellValue("G1", "成绩")
            ->setCellValue("H1", "类型");
        $i = 2;
        foreach ($markTable as $data) {
            $PHPSheet->setCellValue("A" . $i, $data['stu_rollno'])
                ->setCellValue("B" . $i, $data['stu_name'])
                ->setCellValue("C" . $i, $data['tea_name'])
                ->setCellValue("D" . $i, $data['major_name'])
                ->setCellValue("E" . $i, $data['course_name'])
                ->setCellValue("F" . $i, $data['test_desc'])
                ->setCellValue("G" . $i, $data['mark'])
                ->setCellValue("H" . $i, $data['qbank_type'])
                ;
            $i++;
        }

        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel2007");
        header('Content-Disposition: attachment;filename="成绩表.xlsx"');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        $PHPWriter->save("php://output"); //表示在$path路径下面生成demo.xlsx文件
    }



    
    public function listMark($orderby = 'mark', $orderway = 'desc', $major_id = '', $course_id = '', $tea_id = '', $stu_id = '')
    {
        $course = Db::table('uncourse')->select();
        $major = Db::table('unmajor')->select();
        $teacher = Db::table('unteacher')->select();
        $student = Db::table('unstudent')->select();

        $where = array();
        if ($major_id) {
            //$where['major_id'] = array('eq', $major_id); 
            $where['e.major_id'] = $major_id;
        }
        if ($course_id) {
            $where['f.course_id'] = $course_id;
        }
        if ($tea_id) {
            $where['d.tea_id'] = $tea_id;
        }
        if ($stu_id) {
            $where['b.stu_id'] = $stu_id;
        }


        $markTable = Db::table('unmark')
            ->alias('a')
            ->join('unstudent b', 'a.stu_id=b.stu_id ')
            ->join('untest c', 'a.test_id = c.test_id')
            ->join('unteacher d', ' c.tea_id =d.tea_id')
            ->join('unmajor e', 'b.major_id =e.major_id')
            ->join('uncourse f', 'c.course_id =f.course_id')
            ->join('unqbank_type g', 'c.test_type =g.qbank_no')
            ->where($where)
            ->order("$orderby $orderway")
            ->paginate();
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