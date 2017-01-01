drop database zhiye;
create database zhiye;
use zhiye;
drop table `user`;
#用户表
create table `user`(
	id int primary key auto_increment comment '用户id',
    email varchar(255) unique not null comment '用户邮箱',
    username varchar(20) not null comment '用户名',
    password varchar(255) not null comment '用户密码',
    sex int(1) not null default 1 comment '0表示女，1表示男'
);
#问题表
create table `question`(
	id int primary key auto_increment,
    author_id int not null,
    author_name varchar(20) not null comment '提出者昵称',
    title varchar(255) not null comment '问题标题',
    content varchar(500) not null comment '问题内容',
    num_of_answer int not null default 0 comment '回答数',
    time datetime not null comment '提出时间',
    foreign key (author_id) references user(id)
    );
#回答表
create table `answer`(
	id int primary key auto_increment,
    question_id int not null comment '回答的问题id',
    author_id int not null comment '回答者id',
    content varchar(255) not null comment '回答内容',
    time datetime not null comment '回答时间',
    foreign key (question_id) references question(id),
    foreign key (author_id) references user(id)
	);
#点赞表

    