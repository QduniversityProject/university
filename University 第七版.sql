CREATE DATABASE IF NOT EXISTS University DEFAULT CHARACTER SET utf8;

USE University;

/*学院表*/ /*学院ID(主键) 学院名称 学院描述 学院主管*/
CREATE TABLE unacademy
(
academy_id int NOT NULL AUTO_INCREMENT,
academy_name varchar(50) NOT NULL,
academy_desc varchar(200),
academy_director varchar(50),
PRIMARY KEY(academy_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unacademy;

insert into unacademy values(1,'经济学院','学院科研体系完善 师资力量雄厚','Tony Stark');
insert into unacademy values(2,'国防学院','学院学术交流广泛 服务社会深入','Steve Rogers');
insert into unacademy values(3,'软件技术学院','学院办学层次齐全 发展历史悠久','Bruce Banner');
insert into unacademy values(4,'体育学院','学院文化底蕴深厚 教学示范中心','Thor Odinson');
insert into unacademy values(5,'艺术学院','学院重视学生 培养综合素质','Natasha Romanoff');

/*专业表*/ /*专业ID(主键) 专业名称 专业描述 学院ID(外键)*/
CREATE TABLE unmajor
(
major_id int NOT NULL AUTO_INCREMENT,
major_name varchar(50) NOT NULL,
major_desc varchar(200),
academy_id int NOT NULL,
PRIMARY KEY (major_id),
FOREIGN KEY (academy_id) REFERENCES unacademy (academy_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unmajor;

insert into unmajor values(1,'国际贸易','',1);
insert into unmajor values(2,'保险精算','',1);

insert into unmajor values(3,'马克思主义','',2);
insert into unmajor values(4,'近代史','',2);

insert into unmajor values(5,'软件工程','',3);
insert into unmajor values(6,'网络维护','',3);

insert into unmajor values(7,'自行车','',4);
insert into unmajor values(8,'排球','',4);

insert into unmajor values(9,'素描','',5);
insert into unmajor values(10,'声乐','',5);

/*课程表*/ /*课程ID(主键) 课程名称 专业描述 是否必修课 是否公选课 学分 课时 专业ID(外键) 教材封面*/
CREATE TABLE uncourse
(
course_id int auto_increment,
course_name varchar(50) NOT NULL,
course_desc varchar(50),
course_required varchar(50) NOT NULL,
course_public varchar(50) NOT NULL,
course_score varchar(50) NOT NULL,
course_hour varchar(50) NOT NULL,
major_id int NOT NULL,
course_cover varchar(200),
primary key(course_id),
FOREIGN KEY (major_id) REFERENCES unmajor (major_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from uncourse;

insert into uncourse values(1,'商务经济','','是','是','6','40',1,'');
insert into uncourse values(2,'经济学','','是','是','8','32',2,'');

insert into uncourse values(3,'马克思主义哲学','','是','否','8','36',3,'');
insert into uncourse values(4,'基本哲学','','是','是','10','60',4,'');

insert into uncourse values(5,'软件构造','','否','否','8','36',5,'');
insert into uncourse values(6,'数据库','','是','是','3','20',6,'');

insert into uncourse values(7,'有氧运动','','是','是','2','15',7,'');
insert into uncourse values(8,'长跑II','','是','是','1','10',8,'');
insert into uncourse values(9,'素描II','','是','是','6','40',9,'');
insert into uncourse values(10,'美声','','是','是','3','30',10,'');

/*教师表*/ /*教师ID(主键) 教师名称 教师职称 专业ID(外键)，课程ID(教授课程 外键) 教师介绍 教师照片*/
CREATE TABLE unteacher
(
tea_id int auto_increment,
tea_name varchar(50) NOT NULL,
tea_title varchar(50) NOT NULL,
academy_id int NOT NULL,
course_id int NOT NULL,
tea_desc varchar(50),
tea_photo varchar(200),
primary key(tea_id),
FOREIGN KEY (academy_id) REFERENCES unacademy (academy_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unteacher;

insert into unteacher values(1,'Riri Williams','讲师',1,1,'','');
insert into unteacher values(2,'Pepper','教授',1,2,'','');

insert into unteacher values(3,'Bucky Barnes','讲师',2,3,'','');
insert into unteacher values(4,'Sam Wilson','讲师',2,4,'','');

insert into unteacher values(5,'Hulk','教授',3,5,'','');
insert into unteacher values(6,'Red Hulk','副教授',3,6,'','');


insert into unteacher values(7,'Loki','讲师',4,7,'','');
insert into unteacher values(8,'Hela','讲师',4,8,'','');
insert into unteacher values(9,'Barton','副教授',5,9,'','');
insert into unteacher values(10,'Wanda','副教授',5,10,'','');

/*班级表*/ /*班级ID(主键) 班级名称 专业ID(外键)*/
CREATE TABLE unclass
(
class_id int auto_increment,
class_name varchar(50) NOT NULL,
major_id int NOT NULL,
primary key(class_id),
FOREIGN KEY (major_id) REFERENCES unmajor (major_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unclass;

insert into unclass values(1,'经济学院1班',1);
insert into unclass values(2,'经济学院2班',2);

insert into unclass values(3,'国防学院1班',3);
insert into unclass values(4,'国防学院2班',4);

insert into unclass values(5,'软件技术学院1班',5);
insert into unclass values(6,'软件技术学院2班',6);

insert into unclass values(7,'体育学院1班',7);
insert into unclass values(8,'体育学院2班',8);

insert into unclass values(9,'艺术学院1班',9);
insert into unclass values(10,'艺术学院2班',10);

/*学生表*/ /*学生ID(主键) 学生学号 学生姓名 班级ID(外键) 学生生日 学生住址*/
CREATE TABLE unstudent
(
stu_id int auto_increment primary key,
stu_rollno varchar(50) NOT NULL,
stu_name varchar(50) NOT NULL,
stu_sex varchar(50) NOT NULL,
class_id int NOT NULL,
stu_birth date,
stu_address varchar(200),
academy_id int NOT NULL,
major_ids varchar(50) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unstudent;

insert into unstudent values(1,'201540704101','Wolverine','Male',1,'1996-1-1','北京',1,1);
insert into unstudent values(2,'201540704102','Phoenix','Fmale',1,'1997-2-18','上海',1,1);

insert into unstudent values(3,'201540704201','Cyclops','Male',2,'1995-12-30','青岛',1,2);
insert into unstudent values(4,'201540704202','White Queen','Fmale',2,'1998-3-11','重庆',1,2);

insert into unstudent values(5,'201540704301','Shadowcat','Fmale',3,'1995-11-11','广州',2,3);
insert into unstudent values(6,'201540704302','Colossus','Male',3,'1996-10-9','北京',2,3);

insert into unstudent values(7,'201540704401','Magneto','Male',4,'1996-12-12','厦门',2,4);
insert into unstudent values(8,'201540704402','Polaris','Fmale',4,'1996-8-7','青岛',2,4);

insert into unstudent values(9,'201540704501','Professor X','Male',5,'1996-7-9','海南',3,5);
insert into unstudent values(10,'201540704502','Mystique','Fmale',5,'1996-5-15','浙江',3,5);

insert into unstudent values(11,'201540704601','Azazel','Male',6,'1997-4-16','青岛',3,6);
insert into unstudent values(12,'201540704602','NightCrawler','Male',6,'1996-6-29','北京',3,6);

insert into unstudent values(13,'201540704701','Storm','Fmale',7,'1997-1-12','青岛',4,7);
insert into unstudent values(14,'201540704701','Angel','Male',7,'1996-7-5','成都',4,7);

insert into unstudent values(15,'201540704801','Deadpool','Male',8,'1998-3-2','上海',4,8);
insert into unstudent values(16,'201540704801','Cable','Male',8,'1998-10-10','上海',4,8);

insert into unstudent values(17,'201540704901','Rogue','Fmale',9,'1996-5-26','北京',5,9);
insert into unstudent values(18,'201540704901','Iceman','Male',9,'1996-2-29','北京',5,9);

insert into unstudent values(19,'201540704001','Beast','Male',10,'1997-6-1','青岛',5,10);
insert into unstudent values(20,'201540704002','Quicksilver','Male',10,'1998-11-19','上海',5,10);

/*角色表*/ /*角色ID(主键) 角色名称 角色介绍*/
CREATE TABLE unrole
(
role_id int auto_increment,
role_name varchar(50) NOT NULL,
role_desc varchar(50),
primary key(role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unrole;

insert into unrole values(1,'管理员','管理一切后台信息');
insert into unrole values(2,'教师','发布作业和考试并可以查看学生成绩');
insert into unrole values(3,'学生','考试写作业查看成绩');

/*用户表*/ /*用户ID(主键) 用户姓名 用户密码 用户头像 角色ID(外键) 最近登录时间 最近登录地址 所用的浏览器UserAent*/
CREATE TABLE unuser
(
user_id int auto_increment,
user_name varchar(50) NOT NULL,
user_password varchar(50) NOT NULL,
user_photo varchar(200),
role_id int NOT NULL,
rec_time varchar(200),
rec_address varchar(200),
rec_useraent varchar(200),
primary key(user_id),
FOREIGN KEY (role_id) REFERENCES unrole (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unuser;

/*题库类型表*/ /*题库编号(主键) 题库类型*/
CREATE TABLE unqbank_type
(
qbank_no int NOT NULL,
qbank_type varchar(50) NOT NULL,
primary key(qbank_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unqbank_type;

insert into unqbank_type values(1,'练习题库');
insert into unqbank_type values(2,'考试题库');


/*题目类型表*/ /*题目编号(主键) 题目类型*/
CREATE TABLE unquestion_type
(
questiontype_no int NOT NULL,
question_type varchar(50) NOT NULL,
primary key(questiontype_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from unquestion_type;

insert into unquestion_type values(1,'单项选择题');
insert into unquestion_type values(2,'多项选择题');
insert into unquestion_type values(3,'判断题');
insert into unquestion_type values(4,'填空题');

/*单项选择题表*/ /*题目编号(主键) 题库编号(外键) 题目编号(外键) 题目 选项A 选项B 选项C 选项D 答案 课程ID(外键)*/
CREATE TABLE single_answer 
(
singleanswer_id int auto_increment,
qbank_no int NOT NULL,
questiontype_no int NOT NULL,
single_title varchar(200) NOT NULL,
single_A varchar(200) NOT NULL,
single_B varchar(200) NOT NULL,
single_C varchar(200) NOT NULL,
single_D varchar(200) NOT NULL,
single_answer varchar(50) NOT NULL,
course_id int NOT NULL,	
primary key(singleanswer_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id),
FOREIGN KEY (qbank_no) REFERENCES unqbank_type (qbank_no),
FOREIGN KEY (questiontype_no) REFERENCES unquestion_type (questiontype_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from single_answer;

/*商务经济练习题库*/
insert into single_answer values(1,1,1,'微观经济学的对消费者基本假设是()','A.完全信息的假设','B.完全竞争的假设','C.合乎理性的人的假设','D.边际效用递减的假设','C',1);
insert into single_answer values(2,1,1,'西方经济学研究并解决的问题是()','A.货币的分配','B.涉及垄断问题','C.产量的确定','D.稀缺资源的合理配置','D',1);
insert into single_answer values(3,1,1,'下列几组商品属于替代品的有()','A.面粉和肉','B.汽油和汽车','C.羊肉和牛肉','D.光录音机和磁带','D',1);
insert into single_answer values(4,1,1,'粮食市场的需求是缺乏弹性的,当粮食产量因灾害而减少时()','A.粮食生产者的收入减少,因粮食产量下降','B.粮食生产者的收入增加,因粮食价格会更大幅度上升','C.粮食生产者的收入减少,因粮食需求量会大幅度减少','D.粮食生产者的收入不变,因粮食价格上升与需求量减少的比率相同','B',1);
insert into single_answer values(5,1,1,'需求量的变动是指()','A.由于价格变动引起的需求的变动','B.非价格因素引起的需求量的变动','C.同一条需求曲线上点的移动','D.需求曲线的移动','C',1);
insert into single_answer values(6,1,1,'下列几组商品的交叉价格弹性为正向(大于0)的有()','A.汽油和汽车','B.大豆和大米','C.苹果和自行车','D.猪肉和牛肉','D',1);
insert into single_answer values(7,1,1,'当某消费者的收入上升20%,其对某商品的需求量上升5%,则商品的需求收入弹性()','A.大于1','B.小于1','C.等于1','D.等于0','B',1);
insert into single_answer values(8,1,1,'若供给曲线上每一点的点弹性都等于1 ,则供给曲线只能是一条()','A.过原点的45线','B.过原点的直线','C.平行于横轴的直线','D.垂直于横轴的直线','B',1);
insert into single_answer values(9,1,1,'一般情况下,商品的需求量与其价格呈反方向变动,这是因为()','A.收入效应的作用','B.替代效应的作用','C.收入效应与替代效应同时发生作用','D.上述答案均不正确','C',1);
insert into single_answer values(10,1,1,'在两种互补品之间,其中一种商品价格上升,会使另一种商品价格()','A.上升','B.下降','C.不变','D.不确定','B',1);
insert into single_answer values(11,1,1,'在一般情况下,供给曲线()','A.向左上方倾斜','B.向右下方倾斜','C.斜率为正','D.斜率为负','C',1);
insert into single_answer values(12,1,1,'MRSxy 递减,意味着当X商品的消费量不断增加时,能代替的Y商品的数量()','A.越来越多','B.越来越少','C.保持不变','D.以上均不正确','B',1);
insert into single_answer values(13,1,1,'当消费者对商品X 的消费达到饱和点时,则边际效用MUx为()','A.正值','B.负值','C.零','D.不确定','C',1);
insert into single_answer values(14,1,1,'在同一条无差异曲线上,若增加1 个单位X商品的购买,需要减少2 个单位的Y商品的消费,则有()','A.MRSxy = 1/2','B. MRSxy = 2','C.MUx/MUy = 2','D.MUx/MUy = 1/2','B',1);
insert into single_answer values(15,1,1,'当只有商品价格变化时,连接消费者各均衡点的轨迹称作()','A.价格—消费曲线','B.需求曲线','C.恩格尔曲线','D.收入—消费曲线','A',1);
insert into single_answer values(16,1,1,'序数效用论对消费者偏好的假设不包括()','A.边际效用递减','B.不可加总','C.传递性','D.不饱和性','A',1);
insert into single_answer values(17,1,1,'商品的边际替代率递减规律决定了无差异曲线()','A.凸向原点','B.凹向原点','C.垂直于横轴','D.平行于横轴','A',1);
insert into single_answer values(18,1,1,'同一条等产量曲线上任意两点的产量肯定是()','A.相等','B.不等','C.无关','D.以上情况都存在','A',1);
insert into single_answer values(19,1,1,'某厂商每年从企业的总收入中取出一部分作为自己管理企业的报酬,这部分报酬属于()','A.显成本','B.隐成本','C.经济利润','D.毛利润','B',1);
insert into single_answer values(20,1,1,'收益是指()','A.成本','B.利润','C.成本减利润','D.厂商销售收入','D',1);


/*商务经济考试题库*/
insert into single_answer values(21,2,1,'以下不是直接影响需求的因素或条件是()','A.价格','B.偏好','C.收入','D.成本','D',1);
insert into single_answer values(22,2,1,'当出租车租金上涨后,对公共汽车服务的()','A.需求下降','B.需求增加','C.需求量下降','D.需求量增加','B',1);
insert into single_answer values(23,2,1,'若需求曲线富有弹性,其确切的含义是价格上升会引起()','A.购买者购买量的下降','B.购买者购买量的增加','C.购买者总支出的增加','D.购买者总支出的减少','A',1);
insert into single_answer values(24,2,1,'已知商品X的价格10元,商品Y的价格是3元,假定消费者有收入100元,他打算购买7单位的X,10单位的Y,这时商品X和Y的边际效用是50和18,如果要获得最大效用,他应该()','A.停止购买','B.增加Y,减少X','C.同进增加购买X,Y','D.减少Y,增加X','D',1);
insert into single_answer values(25,2,1,'如果商品A和商品B是互补的,则A的价格下降将造成()','A.商品B的需求曲线向右移动','B.商品B的需求曲线向左移动','C.商品A需求曲线向右移动','D.商品A需求曲线向左移动','A',1);
insert into single_answer values(26,2,1,'假如一个完全竞争厂商接到的订单价格小于平均成本但大于平均可变成本,它应该是()','A.停止生产','B.生产且有利润','C.亏损但继续生产','D.生产且利润为零','C',1);
insert into single_answer values(27,2,1,'如果价格下降10%能使买者总支出增加10%,则这种商品的需求量对价格()','A.富有弹性','B.具有单位弹性','C.缺乏弹性','D.其弹性不能确定','A',1);
insert into single_answer values(28,2,1,'己知XY两种商品的交叉弹性-0.4,则这两种商品是()','A.独立品','B.替代品','C.补充品','D.不能确定','C',1);
insert into single_answer values(29,2,1,'在完全竞争市场中,厂商短期均衡条件是()','A.P=AR','B.P=MR','C.P=MC','D.P=AC','C',1);
insert into single_answer values(30,2,1,'市场均衡意味着()','A.在某一价格水平上供给数量等于需求数量','B.在均衡价格水平上,每一个买者都可以买到想买的数量,每一个卖者都可以卖出想卖的数量','C.价格没有变动的趋势','D.上述答案均正确','A',1);
insert into single_answer values(31,2,1,'市场失灵是指()','A.市场不能有效配置稀缺资源','B.市场完全不好','C.收入分配不均','D.资源在私人部门和公共部门配置不均','D',1);
insert into single_answer values(32,2,1,'如果上游工厂污染了下游居民的饮水,按科斯定理(),问题就可以妥善解决','A.不管产权是否明确,只要交易成本为零','B.只要产权明确,且交易成本为零','C.只要产权明确,不管交易成本多大','D.不论产权是否明确,交易成本是否为零','B',1);
insert into single_answer values(33,2,1,'市场不能提供纯粹公共产品是由于()','A.公共产品不具有竞用性','B.公共产品不具有排他性','C.消费者都想免费搭车','D.以上三种情况都是','D',1);
insert into single_answer values(34,2,1,'吉芬商品表现为()','A.需求收入弹性和需求价格弹性都是正值','B. 需求收入弹性为负,需求价格弹性为正','C.需求收入弹性为负,需求价格弹性为正','D.需求收入弹性和需求价格弹性都是负值','B',1);
insert into single_answer values(35,2,1,'若一种商品的消费量随着消费者收入的增加而减少,一般来说,该商品是()','A.正常品','B.奢侈品','C.必需品','D.劣质品','D',1);
insert into single_answer values(36,2,1,'经济学研究的基本问题是()','A.怎样生产','B.生产什么,生产多少','C.为谁生产','D.以上都是','B',1);
insert into single_answer values(37,2,1,'下列各项哪一项会导致一国生产可能性曲线向外移动()','A.失业','B.有用性资源增加或技术进步','C.通货膨胀','D.经济能力增长惟一决定于劳动力数量','A',1);
insert into single_answer values(38,2,1,'保持所有其它因素不变,某种商品的价格下降将导致()','A.失业','B.有用性资源增加或技术进步','C.通货膨胀','D.经济能力增长惟一决定于劳动力数量','D',1);
insert into single_answer values(39,2,1,'若某行业中许多生产者生产一种标准化产品,我们可以估计到其中任何一个生产者的需求将是()','A.毫无弹性','B.有单元弹性','C.缺乏弹性','D.富有弹性','C',1);
insert into single_answer values(40,2,1,'如果人们收入水平提高,食物在总支出中的比重将()','A.大大增加','B.稍有增加','C.下降','D.不变','D',1);

/*经济学练习题库*/
insert into single_answer values(41,1,1,'微观经济学的对消费者基本假设是()','A.完全信息的假设','B.完全竞争的假设','C.合乎理性的人的假设','D.边际效用递减的假设','C',2);
insert into single_answer values(42,1,1,'西方经济学研究并解决的问题是()','A.货币的分配','B.涉及垄断问题','C.产量的确定','D.稀缺资源的合理配置','D',2);
insert into single_answer values(43,1,1,'下列几组商品属于替代品的有()','A.面粉和肉','B.汽油和汽车','C.羊肉和牛肉','D.光录音机和磁带','D',2);
insert into single_answer values(44,1,1,'粮食市场的需求是缺乏弹性的,当粮食产量因灾害而减少时()','A.粮食生产者的收入减少,因粮食产量下降','B.粮食生产者的收入增加,因粮食价格会更大幅度上升','C.粮食生产者的收入减少,因粮食需求量会大幅度减少','D.粮食生产者的收入不变,因粮食价格上升与需求量减少的比率相同','B',2);
insert into single_answer values(45,1,1,'需求量的变动是指()','A.由于价格变动引起的需求的变动','B.非价格因素引起的需求量的变动','C.同一条需求曲线上点的移动','D.需求曲线的移动','C',2);
insert into single_answer values(46,1,1,'下列几组商品的交叉价格弹性为正向(大于0)的有()','A.汽油和汽车','B.大豆和大米','C.苹果和自行车','D.猪肉和牛肉','D',2);
insert into single_answer values(47,1,1,'当某消费者的收入上升20%,其对某商品的需求量上升5%,则商品的需求收入弹性()','A.大于1','B.小于1','C.等于1','D.等于0','B',2);
insert into single_answer values(48,1,1,'若供给曲线上每一点的点弹性都等于1 ,则供给曲线只能是一条()','A.过原点的45线','B.过原点的直线','C.平行于横轴的直线','D.垂直于横轴的直线','B',2);
insert into single_answer values(49,1,1,'一般情况下,商品的需求量与其价格呈反方向变动,这是因为()','A.收入效应的作用','B.替代效应的作用','C.收入效应与替代效应同时发生作用','D.上述答案均不正确','C',2);
insert into single_answer values(50,1,1,'在两种互补品之间,其中一种商品价格上升,会使另一种商品价格()','A.上升','B.下降','C.不变','D.不确定','B',2);
insert into single_answer values(51,1,1,'在一般情况下,供给曲线()','A.向左上方倾斜','B.向右下方倾斜','C.斜率为正','D.斜率为负','C',2);
insert into single_answer values(52,1,1,'MRSxy 递减,意味着当X商品的消费量不断增加时,能代替的Y商品的数量()','A.越来越多','B.越来越少','C.保持不变','D.以上均不正确','B',2);
insert into single_answer values(53,1,1,'当消费者对商品X 的消费达到饱和点时,则边际效用MUx为()','A.正值','B.负值','C.零','D.不确定','C',2);
insert into single_answer values(54,1,1,'在同一条无差异曲线上,若增加1 个单位X商品的购买,需要减少2 个单位的Y商品的消费,则有()','A.MRSxy = 1/2','B. MRSxy = 2','C.MUx/MUy = 2','D.MUx/MUy = 1/2','B',2);
insert into single_answer values(55,1,1,'当只有商品价格变化时,连接消费者各均衡点的轨迹称作()','A.价格—消费曲线','B.需求曲线','C.恩格尔曲线','D.收入—消费曲线','A',2);
insert into single_answer values(56,1,1,'序数效用论对消费者偏好的假设不包括()','A.边际效用递减','B.不可加总','C.传递性','D.不饱和性','A',2);
insert into single_answer values(57,1,1,'商品的边际替代率递减规律决定了无差异曲线()','A.凸向原点','B.凹向原点','C.垂直于横轴','D.平行于横轴','A',2);
insert into single_answer values(58,1,1,'同一条等产量曲线上任意两点的产量肯定是()','A.相等','B.不等','C.无关','D.以上情况都存在','A',2);
insert into single_answer values(59,1,1,'某厂商每年从企业的总收入中取出一部分作为自己管理企业的报酬,这部分报酬属于()','A.显成本','B.隐成本','C.经济利润','D.毛利润','B',2);
insert into single_answer values(60,1,1,'收益是指()','A.成本','B.利润','C.成本减利润','D.厂商销售收入','D',2);

/*经济学考试题库*/
insert into single_answer values(61,2,1,'以下不是直接影响需求的因素或条件是()','A.价格','B.偏好','C.收入','D.成本','D',2);
insert into single_answer values(62,2,1,'当出租车租金上涨后,对公共汽车服务的()','A.需求下降','B.需求增加','C.需求量下降','D.需求量增加','B',2);
insert into single_answer values(63,2,1,'若需求曲线富有弹性,其确切的含义是价格上升会引起()','A.购买者购买量的下降','B.购买者购买量的增加','C.购买者总支出的增加','D.购买者总支出的减少','A',2);
insert into single_answer values(64,2,1,'已知商品X的价格10元,商品Y的价格是3元,假定消费者有收入100元,他打算购买7单位的X,10单位的Y,这时商品X和Y的边际效用是50和18,如果要获得最大效用,他应该()','A.停止购买','B.增加Y,减少X','C.同进增加购买X,Y','D.减少Y,增加X','D',2);
insert into single_answer values(65,2,1,'如果商品A和商品B是互补的,则A的价格下降将造成()','A.商品B的需求曲线向右移动','B.商品B的需求曲线向左移动','C.商品A需求曲线向右移动','D.商品A需求曲线向左移动','A',2);
insert into single_answer values(66,2,1,'假如一个完全竞争厂商接到的订单价格小于平均成本但大于平均可变成本,它应该是()','A.停止生产','B.生产且有利润','C.亏损但继续生产','D.生产且利润为零','C',2);
insert into single_answer values(67,2,1,'如果价格下降10%能使买者总支出增加10%,则这种商品的需求量对价格()','A.富有弹性','B.具有单位弹性','C.缺乏弹性','D.其弹性不能确定','A',2);
insert into single_answer values(68,2,1,'己知XY两种商品的交叉弹性-0.4,则这两种商品是()','A.独立品','B.替代品','C.补充品','D.不能确定','C',2);
insert into single_answer values(69,2,1,'在完全竞争市场中,厂商短期均衡条件是()','A.P=AR','B.P=MR','C.P=MC','D.P=AC','C',2);
insert into single_answer values(70,2,1,'市场均衡意味着()','A.在某一价格水平上供给数量等于需求数量','B.在均衡价格水平上,每一个买者都可以买到想买的数量,每一个卖者都可以卖出想卖的数量','C.价格没有变动的趋势','D.上述答案均正确','A',2);
insert into single_answer values(71,2,1,'市场失灵是指()','A.市场不能有效配置稀缺资源','B.市场完全不好','C.收入分配不均','D.资源在私人部门和公共部门配置不均','D',2);
insert into single_answer values(72,2,1,'如果上游工厂污染了下游居民的饮水,按科斯定理(),问题就可以妥善解决','A.不管产权是否明确,只要交易成本为零','B.只要产权明确,且交易成本为零','C.只要产权明确,不管交易成本多大','D.不论产权是否明确,交易成本是否为零','B',2);
insert into single_answer values(73,2,1,'市场不能提供纯粹公共产品是由于()','A.公共产品不具有竞用性','B.公共产品不具有排他性','C.消费者都想免费搭车','D.以上三种情况都是','D',2);
insert into single_answer values(74,2,1,'吉芬商品表现为()','A.需求收入弹性和需求价格弹性都是正值','B. 需求收入弹性为负,需求价格弹性为正','C.需求收入弹性为负,需求价格弹性为正','D.需求收入弹性和需求价格弹性都是负值','B',2);
insert into single_answer values(75,2,1,'若一种商品的消费量随着消费者收入的增加而减少,一般来说,该商品是()','A.正常品','B.奢侈品','C.必需品','D.劣质品','D',2);
insert into single_answer values(76,2,1,'经济学研究的基本问题是()','A.怎样生产','B.生产什么,生产多少','C.为谁生产','D.以上都是','B',2);
insert into single_answer values(77,2,1,'下列各项哪一项会导致一国生产可能性曲线向外移动()','A.失业','B.有用性资源增加或技术进步','C.通货膨胀','D.经济能力增长惟一决定于劳动力数量','A',2);
insert into single_answer values(78,2,1,'保持所有其它因素不变,某种商品的价格下降将导致()','A.失业','B.有用性资源增加或技术进步','C.通货膨胀','D.经济能力增长惟一决定于劳动力数量','D',2);
insert into single_answer values(79,2,1,'若某行业中许多生产者生产一种标准化产品,我们可以估计到其中任何一个生产者的需求将是()','A.毫无弹性','B.有单元弹性','C.缺乏弹性','D.富有弹性','C',2);
insert into single_answer values(80,2,1,'如果人们收入水平提高,食物在总支出中的比重将()','A.大大增加','B.稍有增加','C.下降','D.不变','D',2);

/*马克思主义哲学练习题库*/
insert into single_answer values(81,1,1,'思维与存在的关系问题是()','A.唯心主义哲学的基本问题','B.唯物主义哲学的基本问题','C.全部哲学的基本问题','D.一部分哲学的基本问题','C',3);
insert into single_answer values(82,1,1,'列宁的物质定义揭示物质的唯一特性是()','A.运动 ','B.物质可以认识','C.物质能为感官感知','D.客观实在性','D',3);
insert into single_answer values(83,1,1,'就意识的能动性而言，“人的意识不仅反映客观世界，而且创造客观世界"，这种观点?()','A.夸大了意识的作用','B.是唯意志主义的一种表现','C.是对意识能动作用的一种正确的揭示','D.是唯心主义哲学的一种表现','C',3);
insert into single_answer values(84,1,1,'人不能两次踏进同一条河流 和 人一次也不能踏进同一条河流 这两种观点是()','A.前者是辩证法，后者诡辨论','B.前者是形而上学，后者是辩证法','C.是相同的，只是强调的方面不同','D.二者都是辩证法，后者是对前者的发展','A',3);
insert into single_answer values(85,1,1,'否定之否定规律揭示的事物发展的辩证形式是()','A.事物自我发展自我完善过程','B.新事物战胜旧事物的过程','C.事物螺旋式上升或波浪式前进的过程','D.事物不断周而复始循环的过程','C',3);
insert into single_answer values(86,1,1,'否定之否定规律揭示的事物发展的辩证内容是()','A.自我发展、自我完善','B.事物发展的周期性、曲折性','C.既肯定又否定','D.既前进又倒退','D',3);
insert into single_answer values(87,1,1,'没有革命的理论，就没有革命的行动"这句话说明的哲学道理是()','A.理论高于实践活动','B.科学理论对实践有指导作用','C.理论是革命工作的出发点','D.理论对实践起决定作用','A',3);
insert into single_answer values(88,1,1,'唯物辩证法的根本方法是()','A.观察实验方法','B.逻辑推理方法','C.矛盾分析法 ','D.归纳演绎方法','B',3);
insert into single_answer values(89,1,1,'沉舟侧畔千帆过，病树前头万木春；芳林新叶催陈叶，流水前波让后波。这两句诗句含的哲学道理是()','A.矛盾是事物发展的动力','B.事物是本质和现象的统一','C.事物的发展是量变和质量的统一 ','D.新事物代替旧事物是事物发展的总趋势','C',3);
insert into single_answer values(90,1,1,'人们先设计图纸，然后根据图纸施工建成大楼，这说明()','A.意识决定物质','B.意识创造物质','C.意识对物质有能动作用','D.意识依赖于物质','D',3);
insert into single_answer values(91,1,1,'中国古代庄子说：方生方死，方死方生，方可方不可，方不可方可。这是一种()','A.抹煞事物质的稳定性的相对主义观点','B.折衷主义观点','C.形而上学观点','D.绝对主义的观点','C',3);
insert into single_answer values(92,1,1,'马克思主义的最本质的东西，马克思主义的活的灵魂：具体地分析具体情况()这就是要人们在实践中学会运用','A.矛盾普遍性原理','B.运动、发展的原理','C.普遍联系的原理','D.矛盾特殊性原理','A',3);
insert into single_answer values(93,1,1,'如果偶然性不起作用的话，那么世界历史就会带有非常神秘的性质。这是一种()','A.历史宿命论的观点 ','B.形而上学机械决定论的观点','C.唯心主义、神秘主义的观点','D.辩证唯物主义决定论的观点','D',3);
insert into single_answer values(94,1,1,'一个志在有大成就的人，他必须如歌德所说，知道限制自己。反之，那些什么事都想做的人，其实什么事都不能做，而终归于失败。这段话告诉我们()','A.要学会分清事物矛盾的性质','B. 要懂得对事物进行矛盾分析','C.要学会解决不同矛盾用不同的方法','D.要抓住要矛盾，不要平均使用力量','D',3);
insert into single_answer values(95,1,1,'荀子说“不积跬步无以至千里，不积细流无以成江河”这说明()','A.量变是质变的准备 ','B.质变是量变的必然结果','C.量变和质变相互包含','D.量变和质变相互渗透','C',3);
insert into single_answer values(96,1,1,'一把钥匙开一把锁，这句话在哲学上讲()','A.矛盾的普遍性','B.矛盾的斗争性','C.矛盾的特殊性','D.矛盾的同一性','D',3);
insert into single_answer values(97,1,1,'发展的实质是()','A.前进性和曲折性的统一','B.量变和质变的相互转化','C.运动和静止的相对统一','D.新事物的产生和旧事物的灭亡','C',3);
insert into single_answer values(98,1,1,'拔苗助长的事例是 ()','A.重视可能性的表现','B.忽视可能性的表现','C.违反事物发展规律的表现','D.发挥主观能动性的表现 ','A',3);
insert into single_answer values(99,1,1,'是亦彼也，彼亦是也。这个命题的哲学思想是()','A.辩证法的','B.承认事物的内在联系的','C.否认事物差别的相对主义观点','D.将事物差别绝对化的形而上学观点','A',3);
insert into single_answer values(100,1,1,'黑格尔说,割下来的手就不是真正的人手了。这句话表达的哲学道理是()','A.承认世界的统一性','B.承认世界的本原是物质的','C. 否认联系的形而上学观点','D.承认普遍联系的辩证法观点','D',3);

/*马克思主义哲学考试题库*/
insert into single_answer values(101,2,1,'在社会生活中，上层建筑对于社会发展的性质取决于()','A.国家政权的阶级属性','B.社会意识形态的性质','C.它所服务的经济基础的性质','D.它所服务的经济基础的性质','C',3);
insert into single_answer values(102,2,1,'社会历史观的基本问题()','A.生产力和生产关系的问题 ','B.社会规律和主观意识的关系问题','C.社会存在和社会意识的关系问题','D.自然和社会的关系问题','C',3);
insert into single_answer values(103,2,1,'划分生产关系类型的基本标志是()','A.产品的分配形式','B.生产资料的所有制形式','C.人们在生产中的地位','D.生产关系与生产力的矛盾性质','B',3);
insert into single_answer values(104,2,1,'杰出人物的产生是()','A.纯粹是必然的','B.纯粹是偶然的','C.既是必然的，又是偶然的','D.有些人是必然的，有些人是偶然的','C',3);
insert into single_answer values(105,2,1,'谋事在人，成事在天()','A.唯物主义的历史观','B.宿命论的历史观','C.唯意志论的历史观','D.循环论的历史观','B',3);
insert into single_answer values(106,2,1,'生产关系范畴反映的是()','A.人与自然之间的关系','B.人与人之间的政治关系','C.人与人之间的经济关系','D.人与人之间的思想关系','D',3);
insert into single_answer values(107,2,1,'先进生产力的集中体现和主要标志是()','A.科学技术','B.劳动对象','C.劳动者','D.管理方式','C',3);
insert into single_answer values(108,2,1,'上层建筑的核心是()','A.社会意识形态','B.政治法律思想','C.国家政权 ','D.政体','A',3);
insert into single_answer values(109,2,1,'我国社会主义初级阶段实行以公有制为主体、多种所有制经济共同发展的基本经济制度，促进了生产力的发展，说明实行这种制度遵循了()','A.生产力决定生产关系的原理','B.经济基础决定上层建筑的原理','C.社会存在决定社会意识的原理 ','D.经济制度决定生产力状况的原理','C',3);
insert into single_answer values(110,2,1,'人们先设计图纸，然后根据图纸施工建成大楼，这说明()','A.意识决定物质','B.意识创造物质','C.意识对物质有能动作用','D.意识依赖于物质','A',3);
insert into single_answer values(111,2,1,'商品是()','A.用于满足人们需要的劳动产品','B.为市场交换而生产的有用的劳动产品','C.一切物品','D.一切有用的物品','A',3);
insert into single_answer values(112,2,1,'商品的本质因素是','A.使用价值','B.交换价值','C.价值','D.价格','C',3);
insert into single_answer values(113,2,1,'价值的本质是()','A.一般人类劳动 ','B.抽象劳动','C.具体劳动','D.社会生产关系','D',3);
insert into single_answer values(114,2,1,'一定社会财富的物质内容由()','A.使用价值构成','B.交换价值构成','C.价值构成','D.货币构成','A',3);
insert into single_answer values(115,2,1,'价值或交换价值的物质承担者是()','A.商品 ','B.货币','C.价格','使用价值','D',3);
insert into single_answer values(116,2,1,'具体劳动和抽象劳动是()','A.两种劳动','B.两次劳动','C.两个过程的劳动','D.同一劳动过程的两个方面','D',3);
insert into single_answer values(117,2,1,'商品的二因素是由()','A.劳动生产率决定的','B.劳动时间的二重性决定的','C.生产商品的劳动二重性决定的','D.劳动的复杂程度决定的','C',3);
insert into single_answer values(118,2,1,'简单商品经济的基本矛盾是()','A.使用价值和价值的矛盾','B.具体劳动和抽象劳动的矛盾','C.私人劳动和社会劳动的矛盾','D.个别劳动时间和社会必要劳动时间的矛盾 ','C',3);
insert into single_answer values(119,2,1,'商品是使用价值和价值的统一体，因此()','A.没有使用价值的东西就不会有价值','B.没有价值的东西就不会有使用价值','C.具有使用价值的东西就一定有价值','D.产品中只要有劳动就一定有使用价值','A',3);
insert into single_answer values(120,2,1,'商品的价值量取决于()','A.必要劳动时间','B.剩余劳动时间','C. 个别劳动时间','D.社会必要劳动','D',3);

/*基本哲学练习题库*/
insert into single_answer values(121,1,1,'思维与存在的关系问题是()','A.唯心主义哲学的基本问题','B.唯物主义哲学的基本问题','C.全部哲学的基本问题','D.一部分哲学的基本问题','C',4);
insert into single_answer values(122,1,1,'列宁的物质定义揭示物质的唯一特性是()','A.运动 ','B.物质可以认识','C.物质能为感官感知','D.客观实在性','D',4);
insert into single_answer values(123,1,1,'就意识的能动性而言，“人的意识不仅反映客观世界，而且创造客观世界"，这种观点?()','A.夸大了意识的作用','B.是唯意志主义的一种表现','C.是对意识能动作用的一种正确的揭示','D.是唯心主义哲学的一种表现','C',4);
insert into single_answer values(124,1,1,'人不能两次踏进同一条河流 和 人一次也不能踏进同一条河流 这两种观点是()','A.前者是辩证法，后者诡辨论','B.前者是形而上学，后者是辩证法','C.是相同的，只是强调的方面不同','D.二者都是辩证法，后者是对前者的发展','A',4);
insert into single_answer values(125,1,1,'否定之否定规律揭示的事物发展的辩证形式是()','A.事物自我发展自我完善过程','B.新事物战胜旧事物的过程','C.事物螺旋式上升或波浪式前进的过程','D.事物不断周而复始循环的过程','C',4);
insert into single_answer values(126,1,1,'否定之否定规律揭示的事物发展的辩证内容是()','A.自我发展、自我完善','B.事物发展的周期性、曲折性','C.既肯定又否定','D.既前进又倒退','D',4);
insert into single_answer values(127,1,1,'没有革命的理论，就没有革命的行动"这句话说明的哲学道理是()','A.理论高于实践活动','B.科学理论对实践有指导作用','C.理论是革命工作的出发点','D.理论对实践起决定作用','A',3);
insert into single_answer values(128,1,1,'唯物辩证法的根本方法是()','A.观察实验方法','B.逻辑推理方法','C.矛盾分析法 ','D.归纳演绎方法','B',4);
insert into single_answer values(129,1,1,'沉舟侧畔千帆过，病树前头万木春；芳林新叶催陈叶，流水前波让后波。这两句诗句含的哲学道理是()','A.矛盾是事物发展的动力','B.事物是本质和现象的统一','C.事物的发展是量变和质量的统一 ','D.新事物代替旧事物是事物发展的总趋势','C',4);
insert into single_answer values(130,1,1,'人们先设计图纸，然后根据图纸施工建成大楼，这说明()','A.意识决定物质','B.意识创造物质','C.意识对物质有能动作用','D.意识依赖于物质','D',4);
insert into single_answer values(131,1,1,'中国古代庄子说：方生方死，方死方生，方可方不可，方不可方可。这是一种()','A.抹煞事物质的稳定性的相对主义观点','B.折衷主义观点','C.形而上学观点','D.绝对主义的观点','C',4);
insert into single_answer values(132,1,1,'马克思主义的最本质的东西，马克思主义的活的灵魂：具体地分析具体情况()这就是要人们在实践中学会运用','A.矛盾普遍性原理','B.运动、发展的原理','C.普遍联系的原理','D.矛盾特殊性原理','A',4);
insert into single_answer values(133,1,1,'如果偶然性不起作用的话，那么世界历史就会带有非常神秘的性质。这是一种()','A.历史宿命论的观点 ','B.形而上学机械决定论的观点','C.唯心主义、神秘主义的观点','D.辩证唯物主义决定论的观点','D',4);
insert into single_answer values(134,1,1,'一个志在有大成就的人，他必须如歌德所说，知道限制自己。反之，那些什么事都想做的人，其实什么事都不能做，而终归于失败。这段话告诉我们()','A.要学会分清事物矛盾的性质','B. 要懂得对事物进行矛盾分析','C.要学会解决不同矛盾用不同的方法','D.要抓住要矛盾，不要平均使用力量','D',4);
insert into single_answer values(135,1,1,'荀子说“不积跬步无以至千里，不积细流无以成江河”这说明()','A.量变是质变的准备 ','B.质变是量变的必然结果','C.量变和质变相互包含','D.量变和质变相互渗透','C',4);
insert into single_answer values(136,1,1,'一把钥匙开一把锁，这句话在哲学上讲()','A.矛盾的普遍性','B.矛盾的斗争性','C.矛盾的特殊性','D.矛盾的同一性','D',4);
insert into single_answer values(137,1,1,'发展的实质是()','A.前进性和曲折性的统一','B.量变和质变的相互转化','C.运动和静止的相对统一','D.新事物的产生和旧事物的灭亡','C',4);
insert into single_answer values(138,1,1,'拔苗助长的事例是 ()','A.重视可能性的表现','B.忽视可能性的表现','C.违反事物发展规律的表现','D.发挥主观能动性的表现 ','A',4);
insert into single_answer values(139,1,1,'是亦彼也，彼亦是也。这个命题的哲学思想是()','A.辩证法的','B.承认事物的内在联系的','C.否认事物差别的相对主义观点','D.将事物差别绝对化的形而上学观点','A',4);
insert into single_answer values(140,1,1,'黑格尔说,割下来的手就不是真正的人手了。这句话表达的哲学道理是()','A.承认世界的统一性','B.承认世界的本原是物质的','C. 否认联系的形而上学观点','D.承认普遍联系的辩证法观点','D',4);

/*基本哲学考试题库*/
insert into single_answer values(141,2,1,'在社会生活中，上层建筑对于社会发展的性质取决于()','A.国家政权的阶级属性','B.社会意识形态的性质','C.它所服务的经济基础的性质','D.它所服务的经济基础的性质','C',4);
insert into single_answer values(142,2,1,'社会历史观的基本问题()','A.生产力和生产关系的问题 ','B.社会规律和主观意识的关系问题','C.社会存在和社会意识的关系问题','D.自然和社会的关系问题','C',4);
insert into single_answer values(143,2,1,'划分生产关系类型的基本标志是()','A.产品的分配形式','B.生产资料的所有制形式','C.人们在生产中的地位','D.生产关系与生产力的矛盾性质','B',4);
insert into single_answer values(144,2,1,'杰出人物的产生是()','A.纯粹是必然的','B.纯粹是偶然的','C.既是必然的，又是偶然的','D.有些人是必然的，有些人是偶然的','C',4);
insert into single_answer values(145,2,1,'谋事在人，成事在天()','A.唯物主义的历史观','B.宿命论的历史观','C.唯意志论的历史观','D.循环论的历史观','B',4);
insert into single_answer values(146,2,1,'生产关系范畴反映的是()','A.人与自然之间的关系','B.人与人之间的政治关系','C.人与人之间的经济关系','D.人与人之间的思想关系','D',4);
insert into single_answer values(147,2,1,'先进生产力的集中体现和主要标志是()','A.科学技术','B.劳动对象','C.劳动者','D.管理方式','C',4);
insert into single_answer values(148,2,1,'上层建筑的核心是()','A.社会意识形态','B.政治法律思想','C.国家政权 ','D.政体','A',4);
insert into single_answer values(149,2,1,'我国社会主义初级阶段实行以公有制为主体、多种所有制经济共同发展的基本经济制度，促进了生产力的发展，说明实行这种制度遵循了()','A.生产力决定生产关系的原理','B.经济基础决定上层建筑的原理','C.社会存在决定社会意识的原理 ','D.经济制度决定生产力状况的原理','C',4);
insert into single_answer values(150,2,1,'人们先设计图纸，然后根据图纸施工建成大楼，这说明()','A.意识决定物质','B.意识创造物质','C.意识对物质有能动作用','D.意识依赖于物质','A',4);
insert into single_answer values(151,2,1,'商品是()','A.用于满足人们需要的劳动产品','B.为市场交换而生产的有用的劳动产品','C.一切物品','D.一切有用的物品','A',4);
insert into single_answer values(152,2,1,'商品的本质因素是','A.使用价值','B.交换价值','C.价值','D.价格','C',4);
insert into single_answer values(153,2,1,'价值的本质是()','A.一般人类劳动 ','B.抽象劳动','C.具体劳动','D.社会生产关系','D',4);
insert into single_answer values(154,2,1,'一定社会财富的物质内容由()','A.使用价值构成','B.交换价值构成','C.价值构成','D.货币构成','A',4);
insert into single_answer values(155,2,1,'价值或交换价值的物质承担者是()','A.商品 ','B.货币','C.价格','使用价值','D',4);
insert into single_answer values(156,2,1,'具体劳动和抽象劳动是()','A.两种劳动','B.两次劳动','C.两个过程的劳动','D.同一劳动过程的两个方面','D',4);
insert into single_answer values(157,2,1,'商品的二因素是由()','A.劳动生产率决定的','B.劳动时间的二重性决定的','C.生产商品的劳动二重性决定的','D.劳动的复杂程度决定的','C',4);
insert into single_answer values(158,2,1,'简单商品经济的基本矛盾是()','A.使用价值和价值的矛盾','B.具体劳动和抽象劳动的矛盾','C.私人劳动和社会劳动的矛盾','D.个别劳动时间和社会必要劳动时间的矛盾 ','C',4);
insert into single_answer values(159,2,1,'商品是使用价值和价值的统一体，因此()','A.没有使用价值的东西就不会有价值','B.没有价值的东西就不会有使用价值','C.具有使用价值的东西就一定有价值','D.产品中只要有劳动就一定有使用价值','A',4);
insert into single_answer values(160,2,1,'商品的价值量取决于()','A.必要劳动时间','B.剩余劳动时间','C. 个别劳动时间','D.社会必要劳动','D',4);

/*软件构造练习题库*/
insert into single_answer values(161,1,1,'软件的发展经历了()个发展阶段','A.一','B.二','C.三','D.四','D',5);
insert into single_answer values(162,1,1,'需求分析的任务不包括()','A.问题分析 ','B.系统设计','C.需求描述','D.需求评审','B',5);
insert into single_answer values(163,1,1,'一个软件的宽度是指其控制的()','A.模块数','B.层数','C.跨度','D.厚度','C',5);
insert into single_answer values(164,1,1,'当模块中包含复杂的条件组合，只有()能够清晰地表达出各种动作之间的对应关系','A.判定表和判定树','B.盒图','C.流程图','D.关系图','A',5);
insert into single_answer values(165,1,1,'以下不属于逻辑覆盖的是()','A.语句覆盖','B.判定覆盖 ','C.条件覆盖 ','D.基本路径','D',5);
insert into single_answer values(166,1,1,'为适应软件运行环境的变化而修改软件的活动称为()','A.纠错性维护','B.适应性维护','C.改善性维护','D.预防性维护','B',5);
insert into single_answer values(167,1,1,'对在数据流图中每一个命令的图形元素均给以定义是()','A.条目定义','B.数据字典','C.数据定义','D.数据说明','B',5);
insert into single_answer values(168,1,1,'软件的可行性研究中不包括()','A.法律可行性','B.技术可行性','C.经济可行性 ','D.政治可行性','D',5);
insert into single_answer values(169,1,1,'根据用户在软件使用过程中提出的建设性意见而进行的维护活动称为()','A.纠错性维护','B.适应性维护','C.改善性维护 ','D.预防性维护','C',5);
insert into single_answer values(170,1,1,'人机界面的风格大致经过了()代的演变','A.三','B.四','C.五','D.六','B',5);
insert into single_answer values(171,1,1,'以下不属于白盒测试技术的是()','A.逻辑覆盖','B.基本路径测试','C.循环覆盖测试','D.等价类划分','D',5);
insert into single_answer values(172,1,1,'为改正软件系统中潜藏的错误而进行的维护活动称为()','A.纠错性维护','B.适应性维护','C.改善性维护','D.预防性维护','A',5);
insert into single_answer values(173,1,1,'在设计测试用例时，应当包括()','A.合理的输入条件 ','B.不合理的输入条件','C.合理的和不合理的输入条件','D.部分条件','C',5);
insert into single_answer values(174,1,1,'下列各项中不属于逻辑覆盖的是()','A.语句覆盖','B. 判定覆盖','C.判定——条件覆盖','D.全部覆盖','D',5);
insert into single_answer values(175,1,1,'高级语言通常被分成三类，其中不包括()','A.通用高级语言 ','B.面向对象的语言','C.专用语言','D.自然语言','D',5);
insert into single_answer values(176,1,1,'Jackson方法在需求分析阶段的主要步骤不包括()','A.了解实体行为','B.标识实体与行为','C.生成实体结构图','D.创建软件系统模型','A',5);
insert into single_answer values(177,1,1,'实践表明，确定发生错误的位置和内在原因所需的工作量几乎占整个调试工作量的()%','A.30','B.50','C.70','D.90','D',5);
insert into single_answer values(178,1,1,'为了进一步改善软件系统的可维护性和可靠性，并为以后的改进奠定基础的软件维护称为()','A.纠错性维护','B.适应性维护','C.改善性维护','D.预防性维护 ','D',5);
insert into single_answer values(179,1,1,'从事物的组成部件及每个部件的属性、功能来认识事物。这种方法被称为()的方法','A.面向对象','B.面向数据','C.面向过程','D.面向属性','A',5);
insert into single_answer values(180,1,1,'判定表由四部分组成：左上部列出()','A.条件组合与动作之间的对应关系','B.所有条件','C. 所有可能的动作','D.可能的条件组合','B',5);

/*软件构造考试题库*/
insert into single_answer values(181,2,1,'面向对象的分析和设计(OOA&OOD)方法出现在20世纪()年代中期','A.50','B.60','C.70','D.80','C',5);
insert into single_answer values(182,2,1,'耦合度也可以分为七级：其中最松散的耦合是()','A.非直接耦合 ','B.数据耦合','C.特征耦合','D.控制耦合','A',5);
insert into single_answer values(183,2,1,'面向对象方法是将现实世界的事物以对象的方式()到计算机世界的方法','A.对应','B.映射','C.反映','D.反射','B',5);
insert into single_answer values(184,2,1,'盒图也称为()或Chapin图。这种表达方式取消了流程线，它强迫程序员以结构化方式思考和解决问题','A.流程图','B.框图','C.判定表','D.N-S图','D',5);
insert into single_answer values(185,2,1,'描述静态数据结构的概念模式是()','A.E-R图','B.DFD ','C.结构图 ','D.框图','A',5);
insert into single_answer values(186,2,1,'结构化程序设计理论认为，实现良好的程序结构要应用()的分析方法','A.自顶向下','B.自底向上','C.面向对象','D.基于组件','A',5);
insert into single_answer values(187,2,1,'在结构化程序设计当中，不建议使用()','A.分支语句','B.循环语句','C.子程序调用语句','D.转向语句','D',5);
insert into single_answer values(188,2,1,'软件生产过程中，需求信息由()给出','A.程序员','B.项目管理者','C.软件分析设计人员 ','D.软件用户','D',5);
insert into single_answer values(189,2,1,'在下列的基本成分中，哪个不是数据流程图的基本成分()','A.信息处理','B.信息存储','C.外部实体 ','D.系统状态','D',5);
insert into single_answer values(190,2,1,'与设计测试数据无关的文档是()','A.需求说明书','B.设计说明书','C.源程序','D.项目开发设计','D',5);
insert into single_answer values(191,2,1,'“软件危机”是指()','A.计算机病毒的出现','B.利用计算机进行经济犯罪活动','C.软件开发和维护中出现的一系列问题','D.人们过分迷恋计算机系统','C',5);
insert into single_answer values(192,2,1,'DFD中的每个加工至少需要()','A.一个输入流','B.一个输出流','C.一个输入或输出流','D.一个输入流和一个输出流','D',5);
insert into single_answer values(193,2,1,' 为了提高模块的独立性，模块之间最好是()','A.控制耦合 ','B.公共耦合','C.内容耦合','D.数据耦合','D',5);
insert into single_answer values(194,2,1,'下面关于PDL语言不正确的说法是()','A. PDL是描述处理过程怎么做','B. PDL是只描述加工做什么','C.PDL也称为伪码','D. PDL的外层语法应符合一般程序设计语言常用的语法规则','B',5);
insert into single_answer values(195,2,1,'详细设计与概要设计衔接的图形工具是()','A.DFD图 ','B.程序图','C.PAD图','D.SC图','D',5);
insert into single_answer values(196,2,1,'不适合作为数据处理与数据库应用的语言是()','A.SQL ','B.Cobol ','C.4GL ','D.Lisp','D',5);
insert into single_answer values(197,2,1,'下列关于功能性注释不正确的说法是()','A.功能性注释嵌在源程序中，用于说明程序段或语句的功能以及数据的状态','B.注释用来说明程序段，需要在每一行都要加注释','C.可使用空行或缩进，以便很容易区分注释和程序','D.修改程序也应修改注释','B',5);
insert into single_answer values(198,2,1,'下列关于效率的说法不正确的是()','A.效率是一个性能要求，其目标应该在需求分析时给出','B.提高程序效率的根本途径在于选择良好的设计方法，数据结构与算法','C.效率主要指处理机时间和存储器容量两个方面','D.程序的效率与程序的简单性无关 ','D',5);
insert into single_answer values(199,2,1,'测试的关键问题是()','A.如何组织对软件的评审','B.如何验证程序的正确性','C.如何采用综合策略','D.如何选择测试用例','D',5);
insert into single_answer values(200,2,1,'结构化维护与非结构化维护的主要区别在于()','A.软件是否结构化','B.软件配置是否完整','C. 程序的完整性','D.文档的完整性','D',5);

/*数据库练习题库*/
insert into single_answer values(201,1,1,'软件的发展经历了()个发展阶段','A.一','B.二','C.三','D.四','D',6);
insert into single_answer values(202,1,1,'需求分析的任务不包括()','A.问题分析 ','B.系统设计','C.需求描述','D.需求评审','B',6);
insert into single_answer values(203,1,1,'一个软件的宽度是指其控制的()','A.模块数','B.层数','C.跨度','D.厚度','C',6);
insert into single_answer values(204,1,1,'当模块中包含复杂的条件组合，只有()能够清晰地表达出各种动作之间的对应关系','A.判定表和判定树','B.盒图','C.流程图','D.关系图','A',6);
insert into single_answer values(205,1,1,'以下不属于逻辑覆盖的是()','A.语句覆盖','B.判定覆盖 ','C.条件覆盖 ','D.基本路径','D',6);
insert into single_answer values(206,1,1,'为适应软件运行环境的变化而修改软件的活动称为()','A.纠错性维护','B.适应性维护','C.改善性维护','D.预防性维护','B',6);
insert into single_answer values(207,1,1,'对在数据流图中每一个命令的图形元素均给以定义是()','A.条目定义','B.数据字典','C.数据定义','D.数据说明','B',6);
insert into single_answer values(208,1,1,'软件的可行性研究中不包括()','A.法律可行性','B.技术可行性','C.经济可行性 ','D.政治可行性','D',6);
insert into single_answer values(209,1,1,'根据用户在软件使用过程中提出的建设性意见而进行的维护活动称为()','A.纠错性维护','B.适应性维护','C.改善性维护 ','D.预防性维护','C',6);
insert into single_answer values(210,1,1,'人机界面的风格大致经过了()代的演变','A.三','B.四','C.五','D.六','B',6);
insert into single_answer values(211,1,1,'以下不属于白盒测试技术的是()','A.逻辑覆盖','B.基本路径测试','C.循环覆盖测试','D.等价类划分','D',6);
insert into single_answer values(212,1,1,'为改正软件系统中潜藏的错误而进行的维护活动称为()','A.纠错性维护','B.适应性维护','C.改善性维护','D.预防性维护','A',6);
insert into single_answer values(213,1,1,'在设计测试用例时，应当包括()','A.合理的输入条件 ','B.不合理的输入条件','C.合理的和不合理的输入条件','D.部分条件','C',6);
insert into single_answer values(214,1,1,'下列各项中不属于逻辑覆盖的是()','A.语句覆盖','B. 判定覆盖','C.判定——条件覆盖','D.全部覆盖','D',6);
insert into single_answer values(215,1,1,'高级语言通常被分成三类，其中不包括()','A.通用高级语言 ','B.面向对象的语言','C.专用语言','D.自然语言','D',6);
insert into single_answer values(216,1,1,'Jackson方法在需求分析阶段的主要步骤不包括()','A.了解实体行为','B.标识实体与行为','C.生成实体结构图','D.创建软件系统模型','A',6);
insert into single_answer values(217,1,1,'实践表明，确定发生错误的位置和内在原因所需的工作量几乎占整个调试工作量的()%','A.30','B.50','C.70','D.90','D',6);
insert into single_answer values(218,1,1,'为了进一步改善软件系统的可维护性和可靠性，并为以后的改进奠定基础的软件维护称为()','A.纠错性维护','B.适应性维护','C.改善性维护','D.预防性维护 ','D',6);
insert into single_answer values(219,1,1,'从事物的组成部件及每个部件的属性、功能来认识事物。这种方法被称为()的方法','A.面向对象','B.面向数据','C.面向过程','D.面向属性','A',6);
insert into single_answer values(220,1,1,'判定表由四部分组成：左上部列出()','A.条件组合与动作之间的对应关系','B.所有条件','C. 所有可能的动作','D.可能的条件组合','B',6);

/*数据库考试题库*/
insert into single_answer values(221,2,1,'面向对象的分析和设计(OOA&OOD)方法出现在20世纪()年代中期','A.50','B.60','C.70','D.80','C',6);
insert into single_answer values(222,2,1,'耦合度也可以分为七级：其中最松散的耦合是()','A.非直接耦合 ','B.数据耦合','C.特征耦合','D.控制耦合','A',6);
insert into single_answer values(223,2,1,'面向对象方法是将现实世界的事物以对象的方式()到计算机世界的方法','A.对应','B.映射','C.反映','D.反射','B',6);
insert into single_answer values(224,2,1,'盒图也称为()或Chapin图。这种表达方式取消了流程线，它强迫程序员以结构化方式思考和解决问题','A.流程图','B.框图','C.判定表','D.N-S图','D',6);
insert into single_answer values(225,2,1,'描述静态数据结构的概念模式是()','A.E-R图','B.DFD ','C.结构图 ','D.框图','A',6);
insert into single_answer values(226,2,1,'结构化程序设计理论认为，实现良好的程序结构要应用()的分析方法','A.自顶向下','B.自底向上','C.面向对象','D.基于组件','A',6);
insert into single_answer values(227,2,1,'在结构化程序设计当中，不建议使用()','A.分支语句','B.循环语句','C.子程序调用语句','D.转向语句','D',6);
insert into single_answer values(228,2,1,'软件生产过程中，需求信息由()给出','A.程序员','B.项目管理者','C.软件分析设计人员 ','D.软件用户','D',6);
insert into single_answer values(229,2,1,'在下列的基本成分中，哪个不是数据流程图的基本成分()','A.信息处理','B.信息存储','C.外部实体 ','D.系统状态','D',6);
insert into single_answer values(230,2,1,'与设计测试数据无关的文档是()','A.需求说明书','B.设计说明书','C.源程序','D.项目开发设计','D',6);
insert into single_answer values(231,2,1,'“软件危机”是指()','A.计算机病毒的出现','B.利用计算机进行经济犯罪活动','C.软件开发和维护中出现的一系列问题','D.人们过分迷恋计算机系统','C',6);
insert into single_answer values(232,2,1,'DFD中的每个加工至少需要()','A.一个输入流','B.一个输出流','C.一个输入或输出流','D.一个输入流和一个输出流','D',6);
insert into single_answer values(233,2,1,' 为了提高模块的独立性，模块之间最好是()','A.控制耦合 ','B.公共耦合','C.内容耦合','D.数据耦合','D',6);
insert into single_answer values(234,2,1,'下面关于PDL语言不正确的说法是()','A. PDL是描述处理过程怎么做','B. PDL是只描述加工做什么','C.PDL也称为伪码','D. PDL的外层语法应符合一般程序设计语言常用的语法规则','B',6);
insert into single_answer values(235,2,1,'详细设计与概要设计衔接的图形工具是()','A.DFD图 ','B.程序图','C.PAD图','D.SC图','D',6);
insert into single_answer values(236,2,1,'不适合作为数据处理与数据库应用的语言是()','A.SQL ','B.Cobol ','C.4GL ','D.Lisp','D',6);
insert into single_answer values(237,2,1,'下列关于功能性注释不正确的说法是()','A.功能性注释嵌在源程序中，用于说明程序段或语句的功能以及数据的状态','B.注释用来说明程序段，需要在每一行都要加注释','C.可使用空行或缩进，以便很容易区分注释和程序','D.修改程序也应修改注释','B',6);
insert into single_answer values(238,2,1,'下列关于效率的说法不正确的是()','A.效率是一个性能要求，其目标应该在需求分析时给出','B.提高程序效率的根本途径在于选择良好的设计方法，数据结构与算法','C.效率主要指处理机时间和存储器容量两个方面','D.程序的效率与程序的简单性无关 ','D',6);
insert into single_answer values(239,2,1,'测试的关键问题是()','A.如何组织对软件的评审','B.如何验证程序的正确性','C.如何采用综合策略','D.如何选择测试用例','D',6);
insert into single_answer values(240,2,1,'结构化维护与非结构化维护的主要区别在于()','A.软件是否结构化','B.软件配置是否完整','C. 程序的完整性','D.文档的完整性','D',6);

/*体育学院与艺术学院无书面考题*/

/*多项选择题表*/ /*题目编号(主键) 题库编号(外键) 题目编号(外键) 题目 选项A 选项B 选项C 选项D 答案 课程ID(外键)*/
CREATE TABLE multi_answer 
(
multianswer_id int auto_increment,
qbank_no int NOT NULL,
questiontype_no int NOT NULL,
multi_title varchar(200) NOT NULL,
multi_A varchar(200) NOT NULL,
multi_B varchar(200) NOT NULL,
multi_C varchar(200) NOT NULL,
multi_D varchar(200) NOT NULL,
multi_answer varchar(50) NOT NULL,
course_id int NOT NULL,	
primary key(multianswer_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id),
FOREIGN KEY (qbank_no) REFERENCES unqbank_type (qbank_no),
FOREIGN KEY (questiontype_no) REFERENCES unquestion_type (questiontype_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from multi_answer;

/*商务经济练习题库*/
insert into multi_answer values(1,1,2,'商品的市场价格发生变化()','A.与货币的价值量变化无关','B.与商品的价值量变化有关','C.与商品的生产价格变化无关','D.与商品的供求变化有关','BD',1);
insert into multi_answer values(2,1,2,'利润率表示全部预付资本的增殖程度，提高利润率的途径有()','A.提高剩余价值率','B.提高资本有机构成','C.加快资本周转速度','D.节省不变资本','AD',1);
insert into multi_answer values(3,1,2,'同一劳动在同一时间内，当部门劳动生产率提高时会使()','A.单位商品的价值量降低','B.商品的使用价值量增加','C.单位商品的价值量不变','D.单位商品的价值量提高','AB',1);
insert into multi_answer values(4,1,2,'“信用制度加速了生产力的物质上的发展和世界市场的形成；使这二者作为新生产形式的物质基础发展到一定的高度，是资本主义生产方式的历史使命。同时信用制度加速了这种矛盾的爆发，即危机，因而加强了旧生产方式的解体的各种因素。”马克思的这一论述表明，资本主义信用制度()','A.已成为资本主义经济危机爆发的深层原因','B.促进了建立社会主义生产方式的物质基础的形成','C.加速了资本主义生产方式内部矛盾发展和解体要素的形成','D.推动商品经济的发展，又加深了商品经济运行中的矛盾','BCD',1);
insert into multi_answer values(5,1,2,'劳动力是任何社会生产的基本要素，在特定的社会发展阶段和特定的历史条件下，劳动力作为一种特殊商品，其价值的构成包括()','A.维持劳动者自身生存所必需的生活资料的价值','B.劳动者在必要时间内创造的价值','C.劳动者繁育后代所必须的生活资料的价值','D.培养和训练劳动者所需要的费用','ACD',1);
insert into multi_answer values(6,1,2,'有一则寓言讲到：狐狸把鱼汤盛在平底的盘子里，请仙鹤来和它一起“平等”的喝鱼汤，结果仙鹤一点也没喝到，全被狐狸喝去了。这个寓言给人们的启示是，尽管资产阶级宣布“法律面前人人平等”，但是()','A.法律名义上的平等掩盖着事实上的不平等','B.这种形式上的平等既是资本主义的本质','C.它的实质是将劳资之间经济利益的不平等合法化','D.这种平等的权利是建立在财产不平等基础之上的权利','ACD',1);
insert into multi_answer values(7,1,2,'2008年由美国次贷危机引发了全球性的经济危机，很多西方人感叹这一次经济危机从根本上仍未超出一百多年前马克思在《资本论》中对资本主义经济危机的理论判断和精辟分析。马克思对资本主义经济危机科学分析的深刻性主要表现为()','A. 指明经济危机的实质是生产过剩','B.揭示造成相对过剩的制度原因是生产资料的资本主义私有制','C. 指出经济危机的深层根源是人性的贪婪','D.强调政府对经济的干预是摆脱经济危机的根本出路','AB',1);
insert into multi_answer values(8,1,2,'人们往往将汉语中的“价”、“值”二字与金银财宝等联系起来，而这两字的偏旁却都是“人”，示意价值在“人”。马克思劳动价值论透过商品交换的物与物的关系，揭示了商品价值的科学内涵，其主要观点有()','A.劳动是社会财富的唯一源泉','B.具体劳动是商品价值的实体','C.价值是凝结在商品中的一般人类劳动','D.价值在本质上体现了生产者之间的社会关系','CD',1);
insert into multi_answer values(9,1,2,'美国导演迈克尔·穆尔在他的记录片《资本主义：一个爱情故事》问世以来，一直颇受关注。“资本主义”为何与“爱情故事”联系起来呢？穆尔解释说，这是一种“贪欲之爱”，喜爱财富的人不仅爱他们自己的钱，也爱你口袋中的钱……很多人不敢说出它的名字，真见鬼，就说出来吧。这就是“资本主义”。对金钱的“贪欲”与资本主义连为一体，是因为()','A.资本家就是人格化的资本','B.赚钱体现了人的天然本性','C.资本的生命在于不断运动和不断增值','D.追逐剩余价值是资本主义生产方式的绝对规律','ACD',1);
insert into multi_answer values(10,1,2,'伴随着生产力发展，科技进步及阶级关系调整，当代资本主义社会的劳资关系和分配关系发生了很大变化。其中资本家及其代理人为缓和劳资关系所采取的激励制度有()','A.职工参与决策制度','B.职工终身雇佣制度','C.职工选举管理制度','D.职工持股制度','ABD',1);

/*商务经济考试题库*/
insert into multi_answer values(11,2,2,'有个赶考的书生到旅店投宿，拿出十两银子，挑了该旅店标价十两银子的房间，店主立刻用它到隔壁的米店付了欠单，米店老板转身去屠夫处还了肉钱，屠夫马上去付清了赊帐的饲料款，饲料商赶紧到旅店还了房钱。就这样，十两银子又到了店主的手里。这时书生来说，房间不合适，要回银子就走了。你看，店主一文钱也没赚到，大家却把债务都还清了，所以，钱的流通越快越好，这就是经济月。”在这个故事中，货币所发挥的职能有()','A.支付手段','B.流通手段','C.价值尺度','D.贮藏手段','ABC',1);
insert into multi_answer values(12,2,2,'第二次世界大战结束以来，随着国家垄断资本主义的形成和发展 ，资产阶级国家对经济进行的干预明显加强，从而使得资本主义社会的经济调剂机制发生了显著变化。与这种变化相适应，经济危机形态 也发生了很大变化，其主要表现是()','A.经济危机通常由国家间的贸易失衡直接引发','B.经济危机各阶段的交替过程已不十分明显','C.经济危机更多的表现为金融危机的频繁发生','D.经济危机的破坏作用只局限于发达资本主义国家','BC',1);
insert into multi_answer values(13,2,2,'马克思指出：“资本主义积累不断地并且同它的能力和规模化成比例地生产出相对的，即超过资本增殖的平均需要的，因而是过剩的或追加的工人人口。”“过剩的工人人口是积累或资本主义基础上的财富发展的必然产物，但是这种过剩人口反过来又成为资本主义积累的杠杆，甚至成为资本主义生产方式存在的一个条件。”上述论断表明()','A.资本主义生产周期性特征需要有相对过剩的人口规律与之相适应','B.资本主义社会过剩人口之所以是相对的，是因为它不为资本价值增殖所需要','C.资本主义积累必然导致工人人口的供给相对于资本的需要而过剩','D.资本主义积累使得资本主义社会的人口失业规模呈现越来越大的趋势','ABC',1);
insert into multi_answer values(14,2,2,'国家垄断资本主义是国家政权和私人垄断资本融合在一起的垄断资本主义。第二次世界大战结束以来，在国家垄断资本主义获得充分发展的同时，资本主义国家通过宏观调节和微观规制对生产、流通、分配和消费各个环节的干预也更加深入。其中，微观规制的类型主要有()','A.公众生活规制','B.公共事业规制','C.社会经济规制','D.反托拉斯法','BCD',1);
insert into multi_answer values(15,2,2,'马克思说：“一切现实的危机的最终原因始终是：群众贫穷和群众的消费受到限制，而与此相对立，资本主义生产却竭力发展生产力，好像只有社会的绝对的消费能力才是生产力发展的界限。”这段论述表明()','A.经济危机的发生与群众的贫穷及其消费能力受到限制有关','B.经济危机的发生根本上在于资本主义的基本矛盾','C.资本积累与无限扩大生产也是经济危机发生的原因','D.社会的绝对的消费能力导致了经济危机的发生','ABC',1);
insert into multi_answer values(16,2,2,'20世纪80年代，随着冷战的结束，分割的世界经济体系也随之被打破，技术、资产、商品信息真正完成了全球范围的活动，各国之间的经济联系日益密切，相互合作和依存大大加强，世界进入到经济全球化迅猛发展的新时代。促进经济全球化迅猛发展的因素有()','A.各国经济体制变革供给出的有利制度条件','B.出现了适宜于全球化的企业组织形式','C.企业不断进行的技术创新与管理创新','D.科学技术的进步和生产力的快速发展','ABD',1);
insert into multi_answer values(17,2,2,'下列对产品市场均衡描述正确的是()','A.均衡产出又叫均衡收入，指和总需求相等的产出','B.产品市场均衡条件是总支出等于总收入','C.在两部门经济中，产品市场均衡实现时，投资等于消费，即I=S','D.在产品市场实现均衡时，货币市场也一定同时实现均衡','AB',1);
insert into multi_answer values(18,2,2,'抑制通货膨胀的政策有()','A.工资与物价的控制','B.道德劝说','C.改变预期','D.收入再分配','ABC',1);
insert into multi_answer values(19,2,2,'在一个三部门经济中，如果税收增加500，收入会减少1500，那么()','A.税收乘数是-4','B.边际消费倾向是0.75','C.边际储蓄倾向是0.25','D.如果税收减少150，收入会增加450','BCD',1);
insert into multi_answer values(20,2,2,'失业对经济的影响主要反映为()','A.浪费劳动力资源','B.减少国内生产总值','C.影响社会安定团结','D.影响社会福利','ABCD',1);

/*经济学练习题库*/
insert into multi_answer values(21,1,2,'商品的市场价格发生变化()','A.与货币的价值量变化无关','B.与商品的价值量变化有关','C.与商品的生产价格变化无关','D.与商品的供求变化有关','BD',2);
insert into multi_answer values(22,1,2,'利润率表示全部预付资本的增殖程度，提高利润率的途径有()','A.提高剩余价值率','B.提高资本有机构成','C.加快资本周转速度','D.节省不变资本','AD',2);
insert into multi_answer values(23,1,2,'同一劳动在同一时间内，当部门劳动生产率提高时会使()','A.单位商品的价值量降低','B.商品的使用价值量增加','C.单位商品的价值量不变','D.单位商品的价值量提高','AB',2);
insert into multi_answer values(24,1,2,'“信用制度加速了生产力的物质上的发展和世界市场的形成；使这二者作为新生产形式的物质基础发展到一定的高度，是资本主义生产方式的历史使命。同时信用制度加速了这种矛盾的爆发，即危机，因而加强了旧生产方式的解体的各种因素。”马克思的这一论述表明，资本主义信用制度()','A.已成为资本主义经济危机爆发的深层原因','B.促进了建立社会主义生产方式的物质基础的形成','C.加速了资本主义生产方式内部矛盾发展和解体要素的形成','D.推动商品经济的发展，又加深了商品经济运行中的矛盾','BCD',2);
insert into multi_answer values(25,1,2,'劳动力是任何社会生产的基本要素，在特定的社会发展阶段和特定的历史条件下，劳动力作为一种特殊商品，其价值的构成包括()','A.维持劳动者自身生存所必需的生活资料的价值','B.劳动者在必要时间内创造的价值','C.劳动者繁育后代所必须的生活资料的价值','D.培养和训练劳动者所需要的费用','ACD',2);
insert into multi_answer values(26,1,2,'有一则寓言讲到：狐狸把鱼汤盛在平底的盘子里，请仙鹤来和它一起“平等”的喝鱼汤，结果仙鹤一点也没喝到，全被狐狸喝去了。这个寓言给人们的启示是，尽管资产阶级宣布“法律面前人人平等”，但是()','A.法律名义上的平等掩盖着事实上的不平等','B.这种形式上的平等既是资本主义的本质','C.它的实质是将劳资之间经济利益的不平等合法化','D.这种平等的权利是建立在财产不平等基础之上的权利','ACD',2);
insert into multi_answer values(27,1,2,'2008年由美国次贷危机引发了全球性的经济危机，很多西方人感叹这一次经济危机从根本上仍未超出一百多年前马克思在《资本论》中对资本主义经济危机的理论判断和精辟分析。马克思对资本主义经济危机科学分析的深刻性主要表现为()','A. 指明经济危机的实质是生产过剩','B.揭示造成相对过剩的制度原因是生产资料的资本主义私有制','C. 指出经济危机的深层根源是人性的贪婪','D.强调政府对经济的干预是摆脱经济危机的根本出路','AB',2);
insert into multi_answer values(28,1,2,'人们往往将汉语中的“价”、“值”二字与金银财宝等联系起来，而这两字的偏旁却都是“人”，示意价值在“人”。马克思劳动价值论透过商品交换的物与物的关系，揭示了商品价值的科学内涵，其主要观点有()','A.劳动是社会财富的唯一源泉','B.具体劳动是商品价值的实体','C.价值是凝结在商品中的一般人类劳动','D.价值在本质上体现了生产者之间的社会关系','CD',2);
insert into multi_answer values(29,1,2,'美国导演迈克尔·穆尔在他的记录片《资本主义：一个爱情故事》问世以来，一直颇受关注。“资本主义”为何与“爱情故事”联系起来呢？穆尔解释说，这是一种“贪欲之爱”，喜爱财富的人不仅爱他们自己的钱，也爱你口袋中的钱……很多人不敢说出它的名字，真见鬼，就说出来吧。这就是“资本主义”。对金钱的“贪欲”与资本主义连为一体，是因为()','A.资本家就是人格化的资本','B.赚钱体现了人的天然本性','C.资本的生命在于不断运动和不断增值','D.追逐剩余价值是资本主义生产方式的绝对规律','ACD',2);
insert into multi_answer values(30,1,2,'伴随着生产力发展，科技进步及阶级关系调整，当代资本主义社会的劳资关系和分配关系发生了很大变化。其中资本家及其代理人为缓和劳资关系所采取的激励制度有()','A.职工参与决策制度','B.职工终身雇佣制度','C.职工选举管理制度','D.职工持股制度','ABD',2);


/*经济学考试题库*/
insert into multi_answer values(31,2,2,'有个赶考的书生到旅店投宿，拿出十两银子，挑了该旅店标价十两银子的房间，店主立刻用它到隔壁的米店付了欠单，米店老板转身去屠夫处还了肉钱，屠夫马上去付清了赊帐的饲料款，饲料商赶紧到旅店还了房钱。就这样，十两银子又到了店主的手里。这时书生来说，房间不合适，要回银子就走了。你看，店主一文钱也没赚到，大家却把债务都还清了，所以，钱的流通越快越好，这就是经济月。”在这个故事中，货币所发挥的职能有()','A.支付手段','B.流通手段','C.价值尺度','D.贮藏手段','ABC',2);
insert into multi_answer values(32,2,2,'第二次世界大战结束以来，随着国家垄断资本主义的形成和发展 ，资产阶级国家对经济进行的干预明显加强，从而使得资本主义社会的经济调剂机制发生了显著变化。与这种变化相适应，经济危机形态 也发生了很大变化，其主要表现是()','A.经济危机通常由国家间的贸易失衡直接引发','B.经济危机各阶段的交替过程已不十分明显','C.经济危机更多的表现为金融危机的频繁发生','D.经济危机的破坏作用只局限于发达资本主义国家','BC',2);
insert into multi_answer values(33,2,2,'马克思指出：“资本主义积累不断地并且同它的能力和规模化成比例地生产出相对的，即超过资本增殖的平均需要的，因而是过剩的或追加的工人人口。”“过剩的工人人口是积累或资本主义基础上的财富发展的必然产物，但是这种过剩人口反过来又成为资本主义积累的杠杆，甚至成为资本主义生产方式存在的一个条件。”上述论断表明()','A.资本主义生产周期性特征需要有相对过剩的人口规律与之相适应','B.资本主义社会过剩人口之所以是相对的，是因为它不为资本价值增殖所需要','C.资本主义积累必然导致工人人口的供给相对于资本的需要而过剩','D.资本主义积累使得资本主义社会的人口失业规模呈现越来越大的趋势','ABC',2);
insert into multi_answer values(34,2,2,'国家垄断资本主义是国家政权和私人垄断资本融合在一起的垄断资本主义。第二次世界大战结束以来，在国家垄断资本主义获得充分发展的同时，资本主义国家通过宏观调节和微观规制对生产、流通、分配和消费各个环节的干预也更加深入。其中，微观规制的类型主要有()','A.公众生活规制','B.公共事业规制','C.社会经济规制','D.反托拉斯法','BCD',2);
insert into multi_answer values(35,2,2,'马克思说：“一切现实的危机的最终原因始终是：群众贫穷和群众的消费受到限制，而与此相对立，资本主义生产却竭力发展生产力，好像只有社会的绝对的消费能力才是生产力发展的界限。”这段论述表明()','A.经济危机的发生与群众的贫穷及其消费能力受到限制有关','B.经济危机的发生根本上在于资本主义的基本矛盾','C.资本积累与无限扩大生产也是经济危机发生的原因','D.社会的绝对的消费能力导致了经济危机的发生','ABC',2);
insert into multi_answer values(36,2,2,'20世纪80年代，随着冷战的结束，分割的世界经济体系也随之被打破，技术、资产、商品信息真正完成了全球范围的活动，各国之间的经济联系日益密切，相互合作和依存大大加强，世界进入到经济全球化迅猛发展的新时代。促进经济全球化迅猛发展的因素有()','A.各国经济体制变革供给出的有利制度条件','B.出现了适宜于全球化的企业组织形式','C.企业不断进行的技术创新与管理创新','D.科学技术的进步和生产力的快速发展','ABD',2);
insert into multi_answer values(37,2,2,'下列对产品市场均衡描述正确的是()','A.均衡产出又叫均衡收入，指和总需求相等的产出','B.产品市场均衡条件是总支出等于总收入','C.在两部门经济中，产品市场均衡实现时，投资等于消费，即I=S','D.在产品市场实现均衡时，货币市场也一定同时实现均衡','AB',2);
insert into multi_answer values(38,2,2,'抑制通货膨胀的政策有()','A.工资与物价的控制','B.道德劝说','C.改变预期','D.收入再分配','ABC',2);
insert into multi_answer values(39,2,2,'在一个三部门经济中，如果税收增加500，收入会减少1500，那么()','A.税收乘数是-4','B.边际消费倾向是0.75','C.边际储蓄倾向是0.25','D.如果税收减少150，收入会增加450','BCD',2);
insert into multi_answer values(40,2,2,'失业对经济的影响主要反映为()','A.浪费劳动力资源','B.减少国内生产总值','C.影响社会安定团结','D.影响社会福利','ABCD',2);

/*马克思主义哲学练习题库*/
insert into multi_answer values(41,1,2,'产业资本循环的三种职能形式是()','A.货币资本','B.生产资本','C.流通资本','D.固定资本','ABC',3);
insert into multi_answer values(42,1,2,'考察产业资本循环的重点在于()','A.资本运动经历的阶段','B.资本运动速度对剩余价值生产的影响','C.在循环的各个阶段上资本的形态的变化','D.产业资本正常运动的条件','AB',3);
insert into multi_answer values(43,1,2,'产业资本循环是()','A.产业资本依次经过三个阶段，并采取三种职能形式，带着增殖回到出发点的运动过程','B.生产资本的运动','C.生产过程和流通过程的统一','D.三种循环形式的统一','ACD',3);
insert into multi_answer values(44,1,2,'资本周转速度与()','A.周转时间成正比','B.周转时间成反比','C.周转时间无关','D.周转次数成正比','BD',3);
insert into multi_answer values(45,1,2,'资本周转时间由两方面构成()','A.完全信息的假设','B.完全竞争的假设','C.合乎理性的人的假设','D.边际效用递减的假设','AB',3);
insert into multi_answer values(46,1,2,'影响资本周转速度的因素有()','A.固定资本和流动资本在生产资本中的比重','B.流通时间的长短','C.固定资本周转速度','D.流动资本的速度','BD',3);
insert into multi_answer values(47,1,2,'对于输出国来说，资本输出()','A.为过剩资本找到了出路，并带来巨额利润和利息','B.是输出国控制输入国的重要手段','C.是输出国扩大商品出口的主要手段','D.强化了金融资本在世界上的统治地位','AD',3);
insert into multi_answer values(48,1,2,'垄断价格形成的基础是()','A.垄断统治','B.垄断利润','C.自由竞争','D.资本主义私有制','B',3);
insert into multi_answer values(49,1,2,'垄断价格的形成和垄断利润的产生表明()','A.价值规律不再起作用了','B.价值规律的作用受到了限制','C.价值规律的作用形式发生了变化','D.价值规律的内容发生了变化','C',3);
insert into multi_answer values(50,1,2,'垄断资本主义国家全部经济生活的基础是()','A.垄断统治','B.资本输出','C.国际垄断同盟','D.占领殖民地','A',3);

/*马克思主义哲学考试题库*/
insert into multi_answer values(51,2,2,'商品的二因素是()','A.使用价值','B.交换价值','C.价值','D.价格','ABC',3);
insert into multi_answer values(52,2,2,'商品的使用价值是()','A.满足人的某种需要的属性','B.构成社会财富的物质内容','C.交换价值的物质承担者','D.价值的表现形式','ABCD',3);
insert into multi_answer values(53,2,2,'商品的价值是()','A.凝结在商品中的抽象劳动','B.商品的社会属性','C.交换价值的基础和内容','D.一定的社会生产关系的体现','AC',3);
insert into multi_answer values(54,2,2,'生产商品的劳动的二重性是()','A.具体劳动','B.社会劳动','C.抽象劳动','D.私人劳动','AC',3);
insert into multi_answer values(55,2,2,'作为商品的使用价值的特殊性在于()','A.是为了满足自己的需要','B.是为了满足他人的需要','C.是交换价值的物质承担者','D.是由不同具体劳动创造的','BCD',3);
insert into multi_answer values(56,2,2,'私人劳动和社会劳动矛盾产生的条件是()','A.社会分工','B.社会化大生产','C.自然经济','D.经济危机','AB',3);
insert into multi_answer values(57,2,2,'价值规律对私有制社会生产的调节作用是通过()','A.竞争实现的','B.信用实现的','C.场价格的波动实现的','D.成本价格的波动实现的','AC',3);
insert into multi_answer values(58,2,2,'劳动力的价值包括()','A.维护自身生存必需的生活资料的价值','B.劳动者家属必需的生活资料的价值','C.劳动者掌握一定技术必需的教育和训练费用','D.劳动者实际需要的生活资料的价值','AC',3);
insert into multi_answer values(59,2,2,'劳动时间的长短取决于()','A.产品的性质','B.生产技术水平','C.企业管理水平','D.劳动生产率高低','BD',3);
insert into multi_answer values(60,2,2,'产业资本循环包括两个进程()','A.购买过程','B.生产过程','C.消费过程','D.流通过程','BD',3);

/*基本哲学练习题库*/
insert into multi_answer values(61,1,2,'产业资本循环的三种职能形式是()','A.货币资本','B.生产资本','C.流通资本','D.固定资本','ABC',4);
insert into multi_answer values(62,1,2,'考察产业资本循环的重点在于()','A.资本运动经历的阶段','B.资本运动速度对剩余价值生产的影响','C.在循环的各个阶段上资本的形态的变化','D.产业资本正常运动的条件','AB',4);
insert into multi_answer values(63,1,2,'产业资本循环是()','A.产业资本依次经过三个阶段，并采取三种职能形式，带着增殖回到出发点的运动过程','B.生产资本的运动','C.生产过程和流通过程的统一','D.三种循环形式的统一','ACD',4);
insert into multi_answer values(64,1,2,'资本周转速度与()','A.周转时间成正比','B.周转时间成反比','C.周转时间无关','D.周转次数成正比','BD',4);
insert into multi_answer values(65,1,2,'资本周转时间由两方面构成()','A.完全信息的假设','B.完全竞争的假设','C.合乎理性的人的假设','D.边际效用递减的假设','AB',4);
insert into multi_answer values(66,1,2,'影响资本周转速度的因素有()','A.固定资本和流动资本在生产资本中的比重','B.流通时间的长短','C.固定资本周转速度','D.流动资本的速度','BD',4);
insert into multi_answer values(67,1,2,'对于输出国来说，资本输出()','A.为过剩资本找到了出路，并带来巨额利润和利息','B.是输出国控制输入国的重要手段','C.是输出国扩大商品出口的主要手段','D.强化了金融资本在世界上的统治地位','AD',4);
insert into multi_answer values(68,1,2,'垄断价格形成的基础是()','A.垄断统治','B.垄断利润','C.自由竞争','D.资本主义私有制','B',4);
insert into multi_answer values(69,1,2,'垄断价格的形成和垄断利润的产生表明()','A.价值规律不再起作用了','B.价值规律的作用受到了限制','C.价值规律的作用形式发生了变化','D.价值规律的内容发生了变化','C',4);
insert into multi_answer values(70,1,2,'垄断资本主义国家全部经济生活的基础是()','A.垄断统治','B.资本输出','C.国际垄断同盟','D.占领殖民地','A',4);

/*基本哲学考试题库*/
insert into multi_answer values(71,2,2,'商品的二因素是()','A.使用价值','B.交换价值','C.价值','D.价格','ABC',4);
insert into multi_answer values(72,2,2,'商品的使用价值是()','A.满足人的某种需要的属性','B.构成社会财富的物质内容','C.交换价值的物质承担者','D.价值的表现形式','ABCD',4);
insert into multi_answer values(73,2,2,'商品的价值是()','A.凝结在商品中的抽象劳动','B.商品的社会属性','C.交换价值的基础和内容','D.一定的社会生产关系的体现','AC',4);
insert into multi_answer values(74,2,2,'生产商品的劳动的二重性是()','A.具体劳动','B.社会劳动','C.抽象劳动','D.私人劳动','AC',4);
insert into multi_answer values(75,2,2,'作为商品的使用价值的特殊性在于()','A.是为了满足自己的需要','B.是为了满足他人的需要','C.是交换价值的物质承担者','D.是由不同具体劳动创造的','BCD',4);
insert into multi_answer values(76,2,2,'私人劳动和社会劳动矛盾产生的条件是()','A.社会分工','B.社会化大生产','C.自然经济','D.经济危机','AB',4);
insert into multi_answer values(77,2,2,'价值规律对私有制社会生产的调节作用是通过()','A.竞争实现的','B.信用实现的','C.场价格的波动实现的','D.成本价格的波动实现的','AC',4);
insert into multi_answer values(78,2,2,'劳动力的价值包括()','A.维护自身生存必需的生活资料的价值','B.劳动者家属必需的生活资料的价值','C.劳动者掌握一定技术必需的教育和训练费用','D.劳动者实际需要的生活资料的价值','AC',4);
insert into multi_answer values(79,2,2,'劳动时间的长短取决于()','A.产品的性质','B.生产技术水平','C.企业管理水平','D.劳动生产率高低','BD',4);
insert into multi_answer values(80,2,2,'产业资本循环包括两个进程()','A.购买过程','B.生产过程','C.消费过程','D.流通过程','BD',4);

/*软件构造练习题库*/
insert into multi_answer values(81,1,2,'在设计测试用例时，不包括()','A.合理的输入条件','B.不合理的输入条件','C.合理的和不合理的输入条件','D.部分条件','ABD',5);
insert into multi_answer values(82,1,2,'下列各项中属于逻辑覆盖的是()','A.语句覆盖','B.判定覆盖','C.判定——条件覆盖','D.全部覆盖','ABC',5);
insert into multi_answer values(83,1,2,'高级语言通常被分成三类，其中包括()','A.通用高级语言','B.面向对象的语言','C.专用语言','D.自然语言','ABC',5);
insert into multi_answer values(84,1,2,'不是描述静态数据结构的概念模式是()','A.E-R图','B.DFD','C.结构图','D.框图','BCD',5);
insert into multi_answer values(85,1,2,'软件维护困难的主要原因不是()','A.费用低','B.人员少','C.开发方法的缺陷','D.得不到用户支持','ABD',5);
insert into multi_answer values(86,1,2,'可维护性的特性中，相互不矛盾的是()','A.可理解性与可测试性','B.效率与可修改性','C.可修改性和可理解性','D.可理解性与可读性','ACD',5);
insert into multi_answer values(87,1,2,'快速原型是利用原型辅助软件开发的一种新思想，它不是在研究( )的方法和技术中产生的()','A.需求阶段','B.设计阶段','C.测试阶段','D.软件开发的各个阶段','ACD',5);
insert into multi_answer values(88,1,2,'从目前情况来看，增量模型存在的主要问题不是()','A.用户很难适应这种系统开发方法','B.该方法的成功率很低','C.缺乏丰富而强有力的软件工具和开发环境','D.缺乏对开发过程中的问题和错误具有应付变化的机制','BCD',5);
insert into multi_answer values(89,1,2,'下列有关软件工程的标准，不属于行业标准的是()','A.GB','B.DIN','C.ISO','D.IEEE','ABD',5);
insert into multi_answer values(90,1,2,'下列文档与维护人员无关的有()','A.软件需求说明书','B.项目开发计划','C.概要设计说明书','D.操作手册','ABD',5);

/*软件构造考试题库*/
insert into multi_answer values(91,2,2,' 瀑布模型存在的问题不是()','A.用户容易参与开发','B.缺乏灵活性','C.用户与开发者易沟通','D.适用可变需求','ACD',5);
insert into multi_answer values(92,2,2,'原型化方法是用户和设计者之间执行的一种交互构成，不适用于()','A.需求不确定性高的','B.需求确定的','C.管理信息','D.实时','BCD',5);
insert into multi_answer values(93,2,2,'数据流程图不是()方法中用于表示系统逻辑模型的一种图形工具','A.SA','B.SD','C.SP','D.SC','BCD',5);
insert into multi_answer values(94,2,2,'PDL(过程设计语言)不是描述处理过程()','A.做什么','B.为什么做','C.怎么做','D.对谁做','ABD',5);
insert into multi_answer values(95,2,2,'工具在软件详细设计过程中采用()','A.判定表','B.IPO图','C.PDL','D.DFD图','ABC',5);
insert into multi_answer values(96,2,2,'详细设计与概要设计衔接的图形工具不是()','A.DFD图','B.SC图','C.PAD图','D.程序流程图','ACD',5);
insert into multi_answer values(97,2,2,'软件结构使用的图形工具，一般不采用()','A.需求阶段','B.设计阶段','C.测试阶段','D.软件开发的各个阶段','ACD',5);
insert into multi_answer values(98,2,2,'从目前情况来看，增量模型存在的主要问题不是()','A.DFD','B.PAD','C.SC','D.ER','ABD',5);
insert into multi_answer values(99,2,2,'“软件危机”不是指()','A.计算机病毒的出现','B.利用计算机进行经济犯罪活动','C.软件开发和维护中出现的一系列问题','D.人们过分迷恋计算机系统','ABD',5);
insert into multi_answer values(100,2,2,'下列不属于数据字典组成部分的是()','A.数据项','B.数据流','C.数据文件','D.数据库','ABC',5);

/*数据库练习题库*/
insert into multi_answer values(101,1,2,'在设计测试用例时，不包括()','A.合理的输入条件','B.不合理的输入条件','C.合理的和不合理的输入条件','D.部分条件','ABD',6);
insert into multi_answer values(102,1,2,'下列各项中属于逻辑覆盖的是()','A.语句覆盖','B.判定覆盖','C.判定——条件覆盖','D.全部覆盖','ABC',6);
insert into multi_answer values(103,1,2,'高级语言通常被分成三类，其中包括()','A.通用高级语言','B.面向对象的语言','C.专用语言','D.自然语言','ABC',6);
insert into multi_answer values(104,1,2,'不是描述静态数据结构的概念模式是()','A.E-R图','B.DFD','C.结构图','D.框图','BCD',6);
insert into multi_answer values(105,1,2,'软件维护困难的主要原因不是()','A.费用低','B.人员少','C.开发方法的缺陷','D.得不到用户支持','ABD',6);
insert into multi_answer values(106,1,2,'可维护性的特性中，相互不矛盾的是()','A.可理解性与可测试性','B.效率与可修改性','C.可修改性和可理解性','D.可理解性与可读性','ACD',6);
insert into multi_answer values(107,1,2,'快速原型是利用原型辅助软件开发的一种新思想，它不是在研究( )的方法和技术中产生的()','A.需求阶段','B.设计阶段','C.测试阶段','D.软件开发的各个阶段','ACD',6);
insert into multi_answer values(108,1,2,'从目前情况来看，增量模型存在的主要问题不是()','A.用户很难适应这种系统开发方法','B.该方法的成功率很低','C.缺乏丰富而强有力的软件工具和开发环境','D.缺乏对开发过程中的问题和错误具有应付变化的机制','BCD',6);
insert into multi_answer values(109,1,2,'下列有关软件工程的标准，不属于行业标准的是()','A.GB','B.DIN','C.ISO','D.IEEE','ABD',6);
insert into multi_answer values(110,1,2,'下列文档与维护人员无关的有()','A.软件需求说明书','B.项目开发计划','C.概要设计说明书','D.操作手册','ABD',6);

/*数据库考试题库*/
insert into multi_answer values(111,2,2,' 瀑布模型存在的问题不是()','A.用户容易参与开发','B.缺乏灵活性','C.用户与开发者易沟通','D.适用可变需求','ACD',6);
insert into multi_answer values(112,2,2,'原型化方法是用户和设计者之间执行的一种交互构成，不适用于()','A.需求不确定性高的','B.需求确定的','C.管理信息','D.实时','BCD',6);
insert into multi_answer values(113,2,2,'数据流程图不是()方法中用于表示系统逻辑模型的一种图形工具','A.SA','B.SD','C.SP','D.SC','BCD',6);
insert into multi_answer values(114,2,2,'PDL(过程设计语言)不是描述处理过程()','A.做什么','B.为什么做','C.怎么做','D.对谁做','ABD',6);
insert into multi_answer values(115,2,2,'工具在软件详细设计过程中采用()','A.判定表','B.IPO图','C.PDL','D.DFD图','ABC',6);
insert into multi_answer values(116,2,2,'详细设计与概要设计衔接的图形工具不是()','A.DFD图','B.SC图','C.PAD图','D.程序流程图','ACD',6);
insert into multi_answer values(117,2,2,'软件结构使用的图形工具，一般不采用()','A.需求阶段','B.设计阶段','C.测试阶段','D.软件开发的各个阶段','ACD',6);
insert into multi_answer values(118,2,2,'从目前情况来看，增量模型存在的主要问题不是()','A.DFD','B.PAD','C.SC','D.ER','ABD',6);
insert into multi_answer values(119,2,2,'“软件危机”不是指()','A.计算机病毒的出现','B.利用计算机进行经济犯罪活动','C.软件开发和维护中出现的一系列问题','D.人们过分迷恋计算机系统','ABD',6);
insert into multi_answer values(120,2,2,'下列不属于数据字典组成部分的是()','A.数据项','B.数据流','C.数据文件','D.数据库','ABC',6);

/*体育学院与艺术学院无书面考题*/

/*判断题表*/ /*题目编号(主键) 题库编号(外键) 题目编号(外键) 题目 选项A 选项B 答案 课程ID(外键)*/
CREATE TABLE judgment_answer 
(
judgmentanswer_id int auto_increment,
qbank_no int NOT NULL,
questiontype_no int NOT NULL,
judgment_title varchar(200) NOT NULL,
judgment_A varchar(200) NOT NULL,
judgment_B varchar(200) NOT NULL,
judgment_answer varchar(50) NOT NULL,
course_id int NOT NULL,	
primary key(judgmentanswer_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id),
FOREIGN KEY (qbank_no) REFERENCES unqbank_type (qbank_no),
FOREIGN KEY (questiontype_no) REFERENCES unquestion_type (questiontype_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from judgment_answer;

/*商务经济练习题库*/
insert into judgment_answer values(1,1,3,'经济分析中一般假定消费者的目标是效用最大化()','A.对','B.错','A',1);
insert into judgment_answer values(2,1,3,'消费者均衡的实现条件是消费者花在每一元钱上的商品的边际效用都相等()','A.对','B.错','A',1);
insert into judgment_answer values(3,1,3,'需求规律的含义是,在其他条件不变的情况下,某商品的需求量与价格之间成反方向变动()','A.对','B.错','A',1);
insert into judgment_answer values(4,1,3,'基尼系数越大,收入分配越平均()','A.对','B.错','B',1);
insert into judgment_answer values(5,1,3,'在一个国家或家庭中,食物支出在收入中所占比例随着收入的增加而减少()','A.对','B.错','A',1);

/*商务经济考试题库*/
insert into judgment_answer values(6,2,3,'边际成本曲线总是交于平均成本曲线的最低点()','A.对','B.错','A',1);
insert into judgment_answer values(7,2,3,'微观经济学的中心理论是价格理论()','A.对','B.错','A',1);
insert into judgment_answer values(8,2,3,'需求价格弹性这一概念表示的是需求量变动对价格变动的反应程度()','A.对','B.错','B',1);
insert into judgment_answer values(9,2,3,'消费者均衡表示既定收入下效用最大化()','A.对','B.错','A',1);
insert into judgment_answer values(10,2,3,'平均产量曲线可以和边际产量曲线在任何一点上相交()','A.对','B.错','B',1);

/*经济学练习题库*/
insert into judgment_answer values(11,1,3,'经济分析中一般假定消费者的目标是效用最大化()','A.对','B.错','A',2);
insert into judgment_answer values(12,1,3,'消费者均衡的实现条件是消费者花在每一元钱上的商品的边际效用都相等()','A.对','B.错','A',2);
insert into judgment_answer values(13,1,3,'需求规律的含义是,在其他条件不变的情况下,某商品的需求量与价格之间成反方向变动()','A.对','B.错','A',2);
insert into judgment_answer values(14,1,3,'基尼系数越大,收入分配越平均()','A.对','B.错','B',2);
insert into judgment_answer values(15,1,3,'在一个国家或家庭中,食物支出在收入中所占比例随着收入的增加而减少()','A.对','B.错','A',2);

/*经济学考试题库*/
insert into judgment_answer values(16,2,3,'边际成本曲线总是交于平均成本曲线的最低点()','A.对','B.错','A',2);
insert into judgment_answer values(17,2,3,'微观经济学的中心理论是价格理论()','A.对','B.错','A',2);
insert into judgment_answer values(18,2,3,'需求价格弹性这一概念表示的是需求量变动对价格变动的反应程度()','A.对','B.错','B',2);
insert into judgment_answer values(19,2,3,'消费者均衡表示既定收入下效用最大化()','A.对','B.错','A',2);
insert into judgment_answer values(20,2,3,'平均产量曲线可以和边际产量曲线在任何一点上相交()','A.对','B.错','B',2);

/*马克思主义哲学练习题库*/
insert into judgment_answer values(21,1,3,'哲学是讲道理的学问，而对这些道理的论证主要是依靠逻辑()','A.对','B.错','A',3);
insert into judgment_answer values(22,1,3,'亚里士多德确定了哲学第一哲学的至高无上的地位()','A.对','B.错','A',3);
insert into judgment_answer values(23,1,3,'哲学在近代对社会有很大影响，因此现代哲学界的社会影响力也十分巨大()','A.对','B.错','B',3);
insert into judgment_answer values(24,1,3,'柏拉图的观点属于先验论()','A.对','B.错','A',3);
insert into judgment_answer values(25,1,3,'辩证法就是变戏法，哲学家的工作就是变黑为白，指鹿为马()','A.对','B.错','B',3);

/*马克思主义哲学考试题库*/
insert into judgment_answer values(26,2,3,'只有为了诚实而诚实才是道德，如果动机不在诚实而在别的原因，那么不能说诚实是道德的()','A.对','B.错','A',3);
insert into judgment_answer values(27,2,3,'人需要意义作为他生存的根基，人是之所以需要意义是出于对虚无的恐惧()','A.对','B.错','A',3);
insert into judgment_answer values(28,2,3,'中国现在有越来越多的大学展开了哲学学科的建设，因此哲学的影响越来越大，懂哲学的人越来越多了()','A.对','B.错','B',3);
insert into judgment_answer values(29,2,3,'柏拉图看到了理念论本身的缺陷，但是仍然坚持理念论，在晚年的时候探讨理念与理念之间的关系，提出了著名的通种论()','A.对','B.错','A',3);
insert into judgment_answer values(30,2,3,'奥托大帝是第一位被基督教会加冕的皇帝()','A.对','B.错','B',3);

/*基本哲学练习题库*/
insert into judgment_answer values(31,1,3,'哲学是讲道理的学问，而对这些道理的论证主要是依靠逻辑()','A.对','B.错','A',4);
insert into judgment_answer values(32,1,3,'亚里士多德确定了哲学第一哲学的至高无上的地位()','A.对','B.错','A',4);
insert into judgment_answer values(33,1,3,'哲学在近代对社会有很大影响，因此现代哲学界的社会影响力也十分巨大()','A.对','B.错','B',4);
insert into judgment_answer values(34,1,3,'柏拉图的观点属于先验论()','A.对','B.错','A',4);
insert into judgment_answer values(35,1,3,'辩证法就是变戏法，哲学家的工作就是变黑为白，指鹿为马()','A.对','B.错','B',4);

/*基本哲学考试题库*/
insert into judgment_answer values(36,2,3,'只有为了诚实而诚实才是道德，如果动机不在诚实而在别的原因，那么不能说诚实是道德的()','A.对','B.错','A',4);
insert into judgment_answer values(37,2,3,'人需要意义作为他生存的根基，人是之所以需要意义是出于对虚无的恐惧()','A.对','B.错','A',4);
insert into judgment_answer values(38,2,3,'中国现在有越来越多的大学展开了哲学学科的建设，因此哲学的影响越来越大，懂哲学的人越来越多了()','A.对','B.错','B',4);
insert into judgment_answer values(39,2,3,'柏拉图看到了理念论本身的缺陷，但是仍然坚持理念论，在晚年的时候探讨理念与理念之间的关系，提出了著名的通种论()','A.对','B.错','A',4);
insert into judgment_answer values(40,2,3,'奥托大帝是第一位被基督教会加冕的皇帝()','A.对','B.错','B',4);

/*软件构造练习题库*/
insert into judgment_answer values(41,1,3,'文档可用于专业人员和用户之间的通信和交流;软件开发过程的管理;运行阶段的维护()','A.对','B.错','A',5);
insert into judgment_answer values(42,1,3,'软件开发、设计几乎都是从头开始，成本和进度很难估计()','A.对','B.错','A',5);
insert into judgment_answer values(43,1,3,'适应性维护是改进软件未来的可维护性和可靠性()','A.对','B.错','B',5);
insert into judgment_answer values(44,1,3,'由于软件是逻辑产品，软件质量较容易直接度量()','A.对','B.错','B',5);
insert into judgment_answer values(45,1,3,'V（G）值越高的程序往往是越不复杂、越不容易出问题的程序()','A.对','B.错','B',5);

/*软件构造考试题库*/
insert into judgment_answer values(46,2,3,'由于软件是逻辑产品，软件质量较容易直接度量()','A.对','B.错','B',5);
insert into judgment_answer values(47,2,3,'目前我国还没有颁布软件开发标准()','A.对','B.错','A',5);
insert into judgment_answer values(48,2,3,'按照功能，软部件可划分为系统软件和应用软件两类()','A.对','B.错','A',5);
insert into judgment_answer values(49,2,3,'如果某子功能可以用一段简洁、精确的文字描述清楚，就无需进一步分解，是创建用户需求的数据流模型应遵循的规则()','A.对','B.错','B',5);
insert into judgment_answer values(50,2,3,'耦合度是对软件结构中模块间关联程度的一种度量。在设计软件时应追求尽可能紧密的耦合的系统()','A.对','B.错','A',5);

/*数据库练习题库*/
insert into judgment_answer values(51,1,3,'文档可用于专业人员和用户之间的通信和交流;软件开发过程的管理;运行阶段的维护()','A.对','B.错','A',6);
insert into judgment_answer values(52,1,3,'软件开发、设计几乎都是从头开始，成本和进度很难估计()','A.对','B.错','A',6);
insert into judgment_answer values(53,1,3,'适应性维护是改进软件未来的可维护性和可靠性()','A.对','B.错','B',6);
insert into judgment_answer values(54,1,3,'由于软件是逻辑产品，软件质量较容易直接度量()','A.对','B.错','B',6);
insert into judgment_answer values(55,1,3,'V（G）值越高的程序往往是越不复杂、越不容易出问题的程序()','A.对','B.错','B',6);

/*数据库考试题库*/
insert into judgment_answer values(56,2,3,'由于软件是逻辑产品，软件质量较容易直接度量()','A.对','B.错','B',6);
insert into judgment_answer values(57,2,3,'目前我国还没有颁布软件开发标准()','A.对','B.错','A',6);
insert into judgment_answer values(58,2,3,'按照功能，软部件可划分为系统软件和应用软件两类()','A.对','B.错','A',6);
insert into judgment_answer values(59,2,3,'如果某子功能可以用一段简洁、精确的文字描述清楚，就无需进一步分解，是创建用户需求的数据流模型应遵循的规则()','A.对','B.错','B',6);
insert into judgment_answer values(60,2,3,'耦合度是对软件结构中模块间关联程度的一种度量。在设计软件时应追求尽可能紧密的耦合的系统()','A.对','B.错','A',6);

/*体育学院与艺术学院无书面考题*/

/*填空题表*/ /*题目编号(主键) 题库编号(外键) 题目编号(外键) 题目 回答 答案 课程ID(外键)*/
CREATE TABLE blank_answer 
(
blankanswer_id int auto_increment,
qbank_no int NOT NULL,
questiontype_no int NOT NULL,
blank_title varchar(200) NOT NULL,
blank_A varchar(200) NOT NULL,
blank_answer varchar(50) NOT NULL,
course_id int NOT NULL,	
primary key(blankanswer_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id),
FOREIGN KEY (qbank_no) REFERENCES unqbank_type (qbank_no),
FOREIGN KEY (questiontype_no) REFERENCES unquestion_type (questiontype_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from blank_answer;

/*商务经济练习题库*/
insert into blank_answer values(1,1,4,'属于国际收支平衡表中资本项目的是()','','一国在别国发行债券的收入',1);
insert into blank_answer values(2,1,4,'边际进口倾向反映的是进口与()','','国内生产总值之间的关系',1);
insert into blank_answer values(3,1,4,'在开放经济中，出口的增加将引起()','','国内生产总值增加，贸易收支状况改善',1);
insert into blank_answer values(4,1,4,'净出口（出口减进口）有时被称为()','','贸易余额',1);
insert into blank_answer values(5,1,4,'汇率贬值将引起()','','国内生产总值增加，贸易收支状况改善',1);

/*商务经济考试题库*/
insert into blank_answer values(6,2,4,'人民币汇率升值是指()','','人民币与美元的比率由1：0．2变为1：0．25',1);
insert into blank_answer values(7,2,4,'清洁浮动是指()','','汇率完全由外汇市场自发地决定',1);
insert into blank_answer values(8,2,4,'实行浮动汇率','','不利于国内经济和国际经济关系的稳定，会加剧经济波动',1);
insert into blank_answer values(9,2,4,'紧缩性财政政策适用的情况是()','','国内通货膨胀和国际收支赤字',1);
insert into blank_answer values(10,2,4,'菲利普斯曲线的基本含义是()','','失业率上升，通货膨胀率下降',1);

/*经济学练习题库*/
insert into blank_answer values(11,1,4,'属于国际收支平衡表中资本项目的是()','','一国在别国发行债券的收入',2);
insert into blank_answer values(12,1,4,'边际进口倾向反映的是进口与()','','国内生产总值之间的关系',2);
insert into blank_answer values(13,1,4,'在开放经济中，出口的增加将引起()','','国内生产总值增加，贸易收支状况改善',2);
insert into blank_answer values(14,1,4,'净出口（出口减进口）有时被称为()','','贸易余额',2);
insert into blank_answer values(15,1,4,'汇率贬值将引起()','','国内生产总值增加，贸易收支状况改善',2);

/*经济学考试题库*/
insert into blank_answer values(16,2,4,'人民币汇率升值是指()','','人民币与美元的比率由1：0．2变为1：0．25',2);
insert into blank_answer values(17,2,4,'清洁浮动是指()','','汇率完全由外汇市场自发地决定',2);
insert into blank_answer values(18,2,4,'实行浮动汇率','','不利于国内经济和国际经济关系的稳定，会加剧经济波动',2);
insert into blank_answer values(19,2,4,'紧缩性财政政策适用的情况是()','','国内通货膨胀和国际收支赤字',2);
insert into blank_answer values(20,2,4,'菲利普斯曲线的基本含义是()','','失业率上升，通货膨胀率下降',2);

/*马克思主义哲学练习题库*/
insert into blank_answer values(21,1,4,'坚持四项基本原则的核心是()','','坚持党的领导',3);
insert into blank_answer values(22,1,4,'社会主义的根本任务是()','','解放生产力、发展生产力',3);
insert into blank_answer values(23,1,4,'社会主义的根本目的在于()','','灭剥削、消除两极分化，最终达到共同富裕',3);
insert into blank_answer values(24,1,4,'民主社会主义的实质是()','','改良的资本主义',3);
insert into blank_answer values(25,1,4,'无产阶级政党的组织原则是()','','民主集中制',3);

/*马克思主义哲学考试题库*/
insert into blank_answer values(26,2,4,'社会精神财富的源泉是()','','实践和理论的关系',3);
insert into blank_answer values(27,2,4,'任何科学理论都不能穷尽真理，而只能在实践中开辟认识真理的道路，这说明()','','真理具有相对性',3);
insert into blank_answer values(28,2,4,'区域经济集团的组织形式主要有()','','自由贸易区',3);
insert into blank_answer values(29,2,4,'人的认识是否具有真理性在于()','','是否符合客观实际',3);
insert into blank_answer values(30,2,4,'概念、判断、推理是()','','理性认识的三种形式',3);

/*基本哲学练习题库*/
insert into blank_answer values(31,1,4,'坚持四项基本原则的核心是()','','坚持党的领导',4);
insert into blank_answer values(32,1,4,'社会主义的根本任务是()','','解放生产力、发展生产力',4);
insert into blank_answer values(33,1,4,'社会主义的根本目的在于()','','灭剥削、消除两极分化，最终达到共同富裕',4);
insert into blank_answer values(34,1,4,'民主社会主义的实质是()','','改良的资本主义',4);
insert into blank_answer values(35,1,4,'无产阶级政党的组织原则是()','','民主集中制',4);

/*基本哲学考试题库*/
insert into blank_answer values(36,2,4,'社会精神财富的源泉是()','','实践和理论的关系',4);
insert into blank_answer values(37,2,4,'任何科学理论都不能穷尽真理，而只能在实践中开辟认识真理的道路，这说明()','','真理具有相对性',4);
insert into blank_answer values(38,2,4,'区域经济集团的组织形式主要有()','','自由贸易区',4);
insert into blank_answer values(39,2,4,'人的认识是否具有真理性在于()','','是否符合客观实际',4);
insert into blank_answer values(40,2,4,'概念、判断、推理是()','','理性认识的三种形式',4);

/*软件构造练习题库*/
insert into blank_answer values(41,1,4,'软件的可互操作性，是指多个软件元素相互()并协同完成任务的能力','','通信',5);
insert into blank_answer values(42,1,4,'第三代语言也称为()语言','','高级',5);
insert into blank_answer values(43,1,4,'软件测试是软件投入运行()，对软件需求分析、设计、实现的强有力的最终审查','','前',5);
insert into blank_answer values(44,1,4,'黑盒测试主要是测试软件是否满足()需求','','功能',5);
insert into blank_answer values(45,1,4,'()的目的是确定错误的位置和引起错误的原因，并加以改正。因此，又称为排错或纠错','','调试',5);

/*软件构造考试题库*/
insert into blank_answer values(46,2,4,'软件工程由方法、工具和()三部分组成，称软件工程的三要素','','过程',5);
insert into blank_answer values(47,2,4,'软件可追踪性（traceability），是指根据软件需求对软件设计、程序进行正向追踪，或根据程序、软件设计对软件需求进行()追踪的能力','','逆向',5);
insert into blank_answer values(48,2,4,'瀑布模型是由W. Royce于1970年提出来的。又称为软件()模型','','生存周期',5);
insert into blank_answer values(49,2,4,'程序设计语言的()性通常指这种语言编写的程序被理解，被修改及调整和改进的难易程度','','可维护',5);
insert into blank_answer values(50,2,4,'对发现错误较多的程序模块，应进行()测试','','重点',5);

/*数据库练习题库*/
insert into blank_answer values(51,1,4,'软件的可互操作性，是指多个软件元素相互()并协同完成任务的能力','','通信',6);
insert into blank_answer values(52,1,4,'第三代语言也称为()语言','','高级',6);
insert into blank_answer values(53,1,4,'软件测试是软件投入运行()，对软件需求分析、设计、实现的强有力的最终审查','','前',6);
insert into blank_answer values(54,1,4,'黑盒测试主要是测试软件是否满足()需求','','功能',6);
insert into blank_answer values(55,1,4,'()的目的是确定错误的位置和引起错误的原因，并加以改正。因此，又称为排错或纠错','','调试',6);

/*数据库考试题库*/
insert into blank_answer values(56,2,4,'软件工程由方法、工具和()三部分组成，称软件工程的三要素','','过程',6);
insert into blank_answer values(57,2,4,'软件可追踪性（traceability），是指根据软件需求对软件设计、程序进行正向追踪，或根据程序、软件设计对软件需求进行()追踪的能力','','逆向',6);
insert into blank_answer values(58,2,4,'瀑布模型是由W. Royce于1970年提出来的。又称为软件()模型','','生存周期',6);
insert into blank_answer values(59,2,4,'程序设计语言的()性通常指这种语言编写的程序被理解，被修改及调整和改进的难易程度','','可维护',6);
insert into blank_answer values(60,2,4,'对发现错误较多的程序模块，应进行()测试','','重点',6);

/*体育学院与艺术学院无书面考题*/

/*考试表*/ /*考试编号(主键) 所考课程编号(外键) 申请考试教师编号(外键) 开始时间 结束时间*/
CREATE TABLE untest
(
test_id int auto_increment,
test_desc varchar(50),
course_id int NOT NULL,
tea_id int NOT NULL,
single_qus_num int,
multi_qus_num int ,
judgment_qus_num int,
blank_qus_num int,
single_score int,
multi_score int,
judgment_score int,
blank_score int,
start_time varchar(50),
end_time varchar(50),
primary key(test_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*试卷表*/ /*试卷编号(主键) 考试学生编号(外键) 抽中单选题所有编号 抽中多选题所有编号 抽中判断题所有编号 抽中填空题所有编号  成绩*/
CREATE TABLE unpaper 
(
paper_id int auto_increment,
stu_id int NOT NULL,
singleanswer_id varchar(50),
multianswer_id varchar(50),
judgmentanswer_id varchar(50),
blankanswer_id varchar(50),
score varchar(50),
primary key(paper_id),
FOREIGN KEY (stu_id) REFERENCES unstudent (stu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*成绩表*/ /*成绩编号(主键) 考试学生编号(外键) 专业编号(外键) 课程编号(外键) 试卷编号(外键) 描述 成绩 单选题数量 多选题数量 判断题数量 填空题数量*/
CREATE TABLE ungrade 
(
grade_id int auto_increment,
stu_id int NOT NULL,
major_id int NOT NULL,	
course_id int NOT NULL,
paper_id int NOT NULL,
garde_desc varchar(50),
grade varchar(50) NOT NULL,
singleanswer_num varchar(50),
multianswer_num varchar(50),
judgmentanswer_num varchar(50),
blankanswer_num varchar(50),
primary key(grade_id),
FOREIGN KEY (stu_id) REFERENCES unstudent (stu_id),
FOREIGN KEY (major_id) REFERENCES unmajor (major_id),
FOREIGN KEY (course_id) REFERENCES uncourse (course_id),
FOREIGN KEY (paper_id) REFERENCES unpaper (paper_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


