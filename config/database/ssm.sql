-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-03-22 14:17:42
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
