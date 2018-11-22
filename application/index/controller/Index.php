<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
    public function login()
    {
        
        return $this->fetch();
    }

    // 处理登录逻辑
    public function doLogin()
    {
    	$param = input('post.');
    	if(empty($param['userid'])){
    		
    		$this->error('用户名不能为空');
    	}
    	
    	if(empty($param['password'])){
    		
    		$this->error('密码不能为空');
    	}
    	
    	// 验证用户名
    	$has = db('unuser')->where('userid', $param['userid'])->find();
    	if(empty($has)){
    		
    		$this->error('用户名密码错误');
    	}
    	
    	// 验证密码
    	if($has['user_password'] != md5($param['password'])){
    		
    		$this->error('用户名密码错误');
    	}
    	
    	// 记录用户登录信息
    	cookie('user_id', $has['user_id'], 3600);  // 一个小时有效期
    	cookie('user_name', $has['user_name'], 3600);
    	if($has['role_id'] == 1){
            $this->redirect(url('index/login'));
        }
        else if($has['role_id'] == 2){
            $this->redirect(url('teacher/index'));
        }
        else{
            $this->redirect(url('student/index'));
        }
        
    }
     
    // 退出登录
    public function loginOut()
    {
    	cookie('user_id', null);
    	cookie('user_name', null);
    	
    	$this->redirect(url('index/login'));
    }

}
