-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-03-23 16:54:51
-- 服务器版本： 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.4-7ubuntu2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssm`
--

-- --------------------------------------------------------

--
-- 表的结构 `bulletin`
--

CREATE TABLE `bulletin` (
  `bulletin_id` varchar(35) NOT NULL,
  `title` varchar(50) NOT NULL,
  `user_id` varchar(35) NOT NULL,
  `updated_at` datetime NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bulletin`
--

INSERT INTO `bulletin` (`bulletin_id`, `title`, `user_id`, `updated_at`, `content`) VALUES
('85FC03283B8440CF933CC8786615C4C5', 'SSM 框架整合 项目简介', '475F46E9782A48D29E356D0FF6D91559', '2018-03-22 14:13:22', '&lt;p&gt;&lt;img&nbsp;src=&quot;http://img.baidu.com/hi/jx2/j_0007.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;基于&nbsp;SpringMVC&nbsp;+&nbsp;Spring&nbsp;+&nbsp;MyBatis&nbsp;整合的框架&lt;br/&gt;便于新手进行框架搭建的学习,也可以在此之上进行项目开发&lt;br/&gt;&lt;br/&gt;&lt;strong&gt;功能：&lt;/strong&gt;&lt;br/&gt;&lt;br/&gt;1、登录注册&lt;br/&gt;2、自搭建的简易API&nbsp;Token登录&lt;br/&gt;3、用户管理&lt;br/&gt;4、站内消息发布管理（集成Ueditor）&lt;span&nbsp;style=&quot;font-family:&nbsp;times&nbsp;new&nbsp;roman;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;strong&gt;进度：&lt;/strong&gt;&lt;br/&gt;权限管理cms&nbsp;功能开发中...&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `permission`
--

INSERT INTO `permission` (`permission_id`, `name`, `slug`, `type`) VALUES
(1, '发布公告', 'BulletinServiceImpl.create', 0),
(2, '编辑公告', 'BulletinServiceImpl.update', 0),
(3, '删除公告', 'BulletinServiceImpl.delete', 0),
(4, 'ID查找用户', 'UserServiceImpl.queryById', 0),
(5, '用户列表', 'UserServiceImpl.getList', 0),
(6, '创建用户', 'UserServiceImpl.create', 0),
(7, '修改用户信息', 'UserServiceImpl.update', 0),
(8, '修改用户密码', 'UserServiceImpl.updatePass', 0),
(9, '删除用户', 'UserServiceImpl.delete', 0),
(10, '权限列表', 'PermissionServiceImpl.getList', 0),
(11, 'ID查找权限', 'PermissionServiceImpl.queryById', 0),
(12, '公共权限列表', 'PermissionServiceImpl.queryPublicPermission', 0),
(13, '管理权限列表', 'PermissionServiceImpl.queryAdminPermission', 0),
(14, '创建权限', 'PermissionServiceImpl.create', 0),
(15, '修改权限', 'PermissionServiceImpl.update', 0),
(16, '删除权限', 'PermissionServiceImpl.delete', 0),
(17, '用户权限列表', 'PermissionServiceImpl.queryUserPermission', 0),
(18, '用户权限赋予', 'PermissionServiceImpl.createUserPermission', 0),
(19, '用户权限剥夺', 'PermissionServiceImpl.deleteUserPermission', 0),
(20, 'ID查找公告', 'BulletinServiceImpl.queryById', 1),
(21, '公告列表', 'BulletinServiceImpl.getList', 1),
(22, '账户信息', 'UserServiceImpl.getInfo', 1),
(23, '修改账户信息', 'UserServiceImpl.edit', 1),
(24, '修改账户密码', 'UserServiceImpl.editPass', 1),
(25, '账户权限列表', 'PermissionServiceImpl.querySelfPermission', 1);

-- --------------------------------------------------------

--
-- 表的结构 `token`
--

CREATE TABLE `token` (
  `user_id` varchar(35) NOT NULL,
  `created_at` datetime NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `user_id` varchar(35) NOT NULL COMMENT 'id',
  `username` varchar(20) NOT NULL COMMENT '用户',
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `admin_role` tinyint(4) NOT NULL DEFAULT '0',
  `reg_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `role`, `admin_role`, `reg_time`) VALUES
('475F46E9782A48D29E356D0FF6D91559', 'ouch', 'ouch@123.com', '7c43122618e6ce52a9e3399eff4f9899', 1, 2, '2018-03-21');

-- --------------------------------------------------------

--
-- 表的结构 `user_permission`
--

CREATE TABLE `user_permission` (
  `user_id` varchar(35) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
