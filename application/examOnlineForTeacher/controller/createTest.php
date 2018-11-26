<?php
namespace app\examOnlineForTeacher\controller;

class createTest
{
    public function createTest()
    {
        $markTable=Db::query("
        INSERT INTO `university`.`untest` (`test_id`, `test_desc`, `test_type`, `course_id`, `tea_id`, `single_qus_num`, `multi_qus_num`, `judgment_qus_num`, `blank_qus_num`, `single_score`, `multi_score`, `judgment_score`, `blank_score`, `start_time`, `end_time`) 
VALUES ('4', '日常练习', '2', '4', '2', '1', '1', '1', '1', '1', '1', '1', '1', '2018-11-23 13:30:00', '2018-11-23 14:00:00');"
);
        $this->assign('markTable', $markTable);
        return $this->fetch();

    }
}

//gggggoddddd

// tertertretreterterte
// /这是github库
// /
//再次提交到git库

// develop fenzhi、