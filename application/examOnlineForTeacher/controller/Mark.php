<?php
namespace app\examOnlineForTeacher\controller;

use think\Controller;
use think\request;
use think\Db;
use PHPExcel_IOFactory;
use PHPExcel;

class Mark extends Controller
{
    // require_once(APPPATH . '/tecnickcom/tcppdf/config/pdf_config.php');
    // $this->load->library('/tcpdf/tcpdf');


    public function Pdf(){
       

// $pdf->writeHTML($html, true, 0, true, 0);

// $pdf->writeHTML($html);

// pdf($html);die;

        // 如果是把数据库数据转PDF格式执行以下代码
        // 数据格式只能是字符串
        // $markTable = Db::table('unmark')
        // ->alias('a')
        // ->join('unstudent b', 'a.stu_id=b.stu_id ')
        // ->join('untest c', 'a.test_id = c.test_id')
        // ->join('unteacher d', ' c.tea_id =d.tea_id')
        // ->join('unmajor e', 'b.major_id =e.major_id')
        // ->join('uncourse f', 'c.course_id =f.course_id')
        // ->join('unqbank_type g', 'c.test_type =g.qbank_no')
        // ->select();
        // foreach ($markTable as $data) {
        //     $PHPSheet->setCellValue("A" . $i, $data['stu_rollno'])
        //         ->setCellValue("B" . $i, $data['stu_name'])
        //         ->setCellValue("C" . $i, $data['tea_name'])
        //         ->setCellValue("D" . $i, $data['major_name'])
        //         ->setCellValue("E" . $i, $data['course_name'])
        //         ->setCellValue("F" . $i, $data['test_desc'])
        //         ->setCellValue("G" . $i, $data['mark'])
        //         ->setCellValue("H" . $i, $data['qbank_type'])
        //         ;
        //  }


    //      <table class="table table-striped table-hover">
	// 	<thead>
	// 		<tr>
	// 			<th>\</th>
	// 			<th id="stu_rollno">学号<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="stu_name">学生姓名<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="major_name">专业名称<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="course_name">课程名称<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="tea_name">教师姓名<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="mark">测试名称<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="mark">成绩<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 			<th id="type">类型<i class="fa fa-fw fa-sort-amount-desc"></i><i class="fa fa-fw fa-sort-amount-asc"></i></th>
	// 		</tr>
	// 	</thead>

	// 	{volist name="markTable" id="mark" }
	// 	<tr>
	// 		<td>6666</td>
	// 	</tr>
	// 	{/volist}
	// </table>
$html = <<<EOD
<h1>该功能正在维护--敬请期待</h1>

EOD;

    pdf($html);die;
     
        // //如果是把HTML页面转PDF格式执行以下代码
        //   $html = "http://localhost:8888/tp5/public/examOnlineForteacher/mark/listmark";
        //   $data = file($html);//获取html页面的url
        //   pdf($data);die;
       
       }


   
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



    
    public function listMark($orderby = 'mark', $orderway = 'desc', $major_id = '0', $course_id = '0', $tea_id = '0', $stu_id = '0')
    {
        $course = Db::table('uncourse')->select();
        $major = Db::table('unmajor')->select();
        $teacher = Db::table('unteacher')->select();
        $student = Db::table('unstudent')->select();
        $this->assign('major_id', $major_id);
        $this->assign('course_id', $course_id);
        $this->assign('tea_id', $tea_id);
        $this->assign('stu_id', $stu_id);
        $where = array();
        if ($major_id !== '0') {
            //$where['major_id'] = array('eq', $major_id); 
            $where['e.major_id'] = $major_id;
        
        }
        if ($course_id !== '0') {
            $where['f.course_id'] = $course_id;
        }
        if ($tea_id !== '0') {
            $where['d.tea_id'] = $tea_id;
        }
        if ($stu_id !== '0') {
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
            ->paginate(10);
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