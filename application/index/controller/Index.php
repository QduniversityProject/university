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
    	$has = db('unuser')->where('user_name', $param['userid'])->find();
    	if(empty($has)){
    		
    		$this->error('用户名不存在');
    	}
		
		// if(!session('?count')){
		// 	session('count',3);//可输入次数
		// }
		
		//验证帐号状态
		if($has['user_status'] == 1){
			$etime = ceil(30-((time() - $has['time_last_error'])/60));
			if((time() - $has['time_last_error']) > 10){
				$now['user_status'] = 0;  //若超过锁定时间，帐号恢复正常  （status-0)
				Db::table('unuser')->where('user_id', $has['user_id'])->update($now);
			}
			else{
				$this->error('您的帐号已锁定,请'.$etime.'分钟之后登录！');
			}
		}

    	// 验证密码
    	//if($has['user_password'] != md5($param['password'])){
		if($has['user_password'] !== $param['password']){
			if($has['user_count'] > 1){
				$now['user_count'] = $has['user_count'] - 1;
				Db::table('unuser')->where('user_id', $has['user_id'])->update($now);
				$this->error('密码输入错误,您还能输入'.$now['user_count'].'次');
			}
			else{
				$now['user_status'] = 1;
				$now['time_last_error'] = time();
				$now['user_count'] = 3;
				Db::table('unuser')->where('user_id', $has['user_id'])->update($now);
				$this->error('密码错误超过3次,帐号已锁定，请30分钟之后登录！');
			}
			
			//session('error_time',time());
			//dump(session('count'));
    		
    	}
		
		function GetBrowser()
		{
			$browser = "其他";

			//判断是否是myie
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"myie")){
				$browser = "myie";
			}
			
			//判断是否是Netscape
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"netscape"))
			{
				$browser = "netscape";
			}

			//判断是否是Opera
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"opera")){
				$browser = "opera";
			}

			//判断是否是netcaptor
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"netcaptor")) {
				$browser = "netCaptor";
			}

			//判断是否是TencentTraveler
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"tencenttraveler")) {
				$browser = "TencentTraveler";
			}

			//判断是否是Firefox
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"firefox")) {
				$browser = "Firefox";
			}

			//判断是否是ie
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"msie")) {
				$browser = "ie";
			}
			
			//判断是否是chrome内核浏览器
			if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),"chrome")) {
				$browser = "google";
			}

		return $browser;
		}

    	// // 记录用户登录信息
		// cookie('user_name', $has['user_name'], 3600);
		// cookie('rec_time', $has['rec_time'], 3600);
		// cookie('rec_address', $has['rec_address'], 3600);
		//重置账户状态
		$now['user_status'] = 0;
		$now['user_count'] = 3;
		$now['rec_address'] = $this->request->ip();//获取ip地址
		$now['rec_time'] = date("Y-m-d H:i:s");//获取系统时间
		$now['rec_useraent'] = GetBrowser();//获取浏览器信息
		Db::table('unuser')->where('user_id', $has['user_id'])->update($now);

	
    	if($has['role_id'] == 1){
            $this->redirect(url('index/administrator'));
        }
        else if($has['role_id'] == 2){
            $this->redirect(url('teacher/index'));
        }
        else{
			$userinfo = db('unuser,unstudent')->where('unuser.user_name' , 'unstudent.stu_rollno')->find();
			cookie('stu_id', $userinfo['stu_id'], 3600);// 一个小时有效期
			cookie('stu_name', $userinfo['stu_name'], 3600);
            $this->redirect(url('examOnlineforStudent/index/listExam'));
        }
        
    }
     
    // 退出登录
    public function loginOut()
    {
    	cookie('user_id', null);
    	cookie('user_name', null);
    	
    	$this->redirect(url('index/login'));
	}
	
	public function administrator()
    {
		echo "您好： " . cookie('user_name') . ', <a href="' . url('index/loginout') . '">退出</a> , 
		您上次登录时间为：'.cookie('rec_time')."您上次登录的地址为： ".cookie('rec_address');
    }

}
