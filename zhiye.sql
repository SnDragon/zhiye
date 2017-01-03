drop database zhiye;
create database zhiye;
use zhiye;
#用户表
create table `user`(
	id int primary key auto_increment comment '用户id',
    email varchar(255) unique not null comment '用户邮箱',
    username varchar(20) not null comment '用户名',
    password varchar(255) not null comment '用户密码md5加密',
    sex int(1) not null default 1 comment '0表示女，1表示男',
    integral int not null default 0 comment '用户经验'
);
#问题表
create table `question`(
	id int primary key auto_increment,
    author_id int not null,
    author_name varchar(20) not null comment '提出者昵称',
    title varchar(255) not null comment '问题标题',
    summary varchar(255) not null comment '问题内容摘要',
    num_of_answer int not null default 0 comment '回答数',
    time datetime not null comment '提出时间',
    foreign key (author_id) references user(id) on delete cascade
    );

#提问内容
create table `question_content`(
	id int primary key auto_increment,
    question_id int not null,
    content text comment '提问内容',
    foreign key (question_id) references question(id) on delete cascade
    );

#回答表
create table `comment`(
	id int primary key auto_increment,
    parent_id int comment '回复的评论id(可为空)',
    question_id int not null comment '回答的问题id',
    author_id int not null comment '回答者id',
    author_name varchar(20) not null comment '回答者昵称(不变)',
    reply_id int comment '回复者id',
    reply_name varchar(20) comment '回复者昵称',
    thread varchar(255) not null default '/' comment '用于表示嵌套关系',
    summary varchar(255) not null comment '回答内容摘要',
    time datetime not null comment '回答时间',
    num_of_support int not null default 0 comment '点赞人数',
    num_of_answer int not null default 0 comment '评论人数',
    foreign key (parent_id) references comment(id) on delete cascade,
    foreign key (question_id) references question(id) on delete cascade,
    foreign key (author_id) references user(id) on delete cascade,
    foreign key (reply_id) references user(id) on delete cascade
	);
#回答内容表

create table `comment_content`(
	id int primary key auto_increment,
    comment_id int not null,
    content text comment '回答内容',
    foreign key (comment_id) references comment(id) on delete cascade
	);
    
#点赞表
create table `support`(
	id int primary key auto_increment,
    user_id int not null comment '点赞用户id',
    comment_id int not null comment '被点赞的评论id',
    foreign key (user_id) references user(id) on delete cascade,
    foreign key (comment_id) references comment(id) on delete cascade
	);
    
insert into user(email,username,password)
value('1803240383@qq.com','dragon','e10adc3949ba59abbe56e057f20f883e');

