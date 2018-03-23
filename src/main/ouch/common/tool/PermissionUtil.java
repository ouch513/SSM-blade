package main.ouch.common.tool;

import main.ouch.core.domain.Permission;

import java.util.List;

public class PermissionUtil {

//    sql
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('发布公告', 'BulletinServiceImpl.create');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('编辑公告', 'BulletinServiceImpl.update');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('删除公告', 'BulletinServiceImpl.delete');
//
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('ID查找用户', 'UserServiceImpl.queryById');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('用户列表', 'UserServiceImpl.getList');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('创建用户', 'UserServiceImpl.create');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('修改用户信息', 'UserServiceImpl.update');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('修改用户密码', 'UserServiceImpl.updatePass');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('删除用户', 'UserServiceImpl.delete');
//
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('权限列表', 'PermissionServiceImpl.getList');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('ID查找权限', 'PermissionServiceImpl.queryById');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('公共权限列表', 'PermissionServiceImpl.queryPublicPermission');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('管理权限列表', 'PermissionServiceImpl.queryAdminPermission');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('创建权限', 'PermissionServiceImpl.create');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('修改权限', 'PermissionServiceImpl.update');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('删除权限', 'PermissionServiceImpl.delete');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('用户权限列表', 'PermissionServiceImpl.queryUserPermission');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('用户权限赋予', 'PermissionServiceImpl.createUserPermission');
//    INSERT INTO `permission` (`name`, `slug`) VALUES ('用户权限剥夺', 'PermissionServiceImpl.deleteUserPermission');
//
//    INSERT INTO `permission` (`name`, `slug`, `type`) VALUES ('ID查找公告', 'BulletinServiceImpl.queryById','1');
//    INSERT INTO `permission` (`name`, `slug`, `type`) VALUES ('公告列表', 'BulletinServiceImpl.getList','1');
//
//    INSERT INTO `permission` (`name`, `slug`, `type`) VALUES ('账户信息', 'UserServiceImpl.getInfo','1');
//    INSERT INTO `permission` (`name`, `slug`, `type`) VALUES ('修改账户信息', 'UserServiceImpl.edit','1');
//    INSERT INTO `permission` (`name`, `slug`, `type`) VALUES ('修改账户密码', 'UserServiceImpl.editPass','1');
//
//    INSERT INTO `permission` (`name`, `slug`, `type`) VALUES ('账户权限列表', 'PermissionServiceImpl.querySelfPermission','1');
//

    public static Boolean check(String method, List<Permission> list) {

        for (int i = 0; i < list.size(); i++) {
            if (method.contains(list.get(i).getSlug() + "(")) {
                return true;
            }
        }
        return false;
    }
}
