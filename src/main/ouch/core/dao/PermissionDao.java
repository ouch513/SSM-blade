package main.ouch.core.dao;


import main.ouch.core.domain.Permission;

import java.util.List;

public interface PermissionDao {

    /**
     * 所有权限
     */
    List<Permission> queryAll();

    /**
     * Id查询权限
     */
    Permission queryById(String permissionId);

    /**
     * 查询公共权限
     */
    List<Permission> queryPublicPermission();

    /**
     * 查询管理权限
     */
    List<Permission> queryAdminPermission();

    /**
     * 添加权限
     */
    void add(Permission permission);

    /**
     * 修改权限
     */
    void update(Permission permission);

    /**
     * 删除权限
     */
    void delete(String permissionId);

    /**
     * 查询用户的权限
     */
    List<Permission> queryUserPermission(String userId);

    /**
     * 增加用户的权限
     */
    void addUserPermission(String userId,String permissionId);

    /**
     * 减少用户的权限
     */
    void deleteUserPermission(String userId,String permissionId);
}
