package main.ouch.core.service;

import main.ouch.core.domain.Permission;

import java.util.List;

public interface PermissionService {

    /**
     * 查询所有权限
     */
    String getList(String userId,String token);

    /**
     * Id查询权限
     */
    String queryById(String userId,String token,String permissionId);

    /**
     * 查询公共权限
     */
    String queryPublicPermission(String userId,String token);

    /**
     * 查询管理权限
     */
    String queryAdminPermission(String userId,String token);

    /**
     * 添加权限
     */
    String create(String userId,String token,Permission permission);

    /**
     * 修改权限
     */
    String update(String userId,String token,Permission permission);

    /**
     * 删除权限
     */
    String delete(String userId,String token,String permissionId);

    /**
     * 查询用户的权限
     */
    String queryUserPermission(String curId,String token,String userId);

    /**
     * 查询自己的权限
     */
    String querySelfPermission(String userId,String token);

    /**
     * 增加用户的权限
     */
    String createUserPermission(String curId,String token,String userId,String permissionId);

    /**
     * 减少用户的权限
     */
    String deleteUserPermission(String curId,String token,String userId,String permissionId);
}
