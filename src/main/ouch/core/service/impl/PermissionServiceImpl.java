package main.ouch.core.service.impl;

import main.ouch.common.format.JsonResponse;
import main.ouch.constant.Message;
import main.ouch.constant.PermissionType;
import main.ouch.core.dao.PermissionDao;
import main.ouch.core.domain.Permission;
import main.ouch.core.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Autowired
    private Permission permission;

    @Override
    public String getList(String userId, String token) {
        List<Permission> permissionList =  permissionDao.queryAll();
        return JsonResponse.permissionList(permissionList);
    }

    @Override
    public String queryById(String userId, String token, String permissionId) {
        permission = permissionDao.queryById(permissionId);
        if(permission==null){
            return JsonResponse.error(Message.GET_DATA_ERROR);
        }else{
            return JsonResponse.permissionInfo(permission);
        }
    }

    @Override
    public String queryPublicPermission(String userId, String token) {
        List<Permission> permissionList =  permissionDao.queryPublicPermission();
        return JsonResponse.permissionList(permissionList);
    }

    @Override
    public String queryAdminPermission(String userId, String token) {
        List<Permission> permissionList =  permissionDao.queryAdminPermission();
        return JsonResponse.permissionList(permissionList);
    }

    @Override
    public String create(String userId, String token, Permission permission) {
        permission = PermissionType.checkData(permission);
        permissionDao.add(permission);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String update(String userId, String token, Permission permission) {
        permission = PermissionType.checkData(permission);
        permissionDao.update(permission);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String delete(String userId, String token, String permissionId) {
        permissionDao.delete(permissionId);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String queryUserPermission(String curId, String token, String userId) {
        List<Permission> permissionList =  permissionDao.queryUserPermission(userId);
        return JsonResponse.permissionList(permissionList);
    }

    @Override
    public String querySelfPermission(String userId, String token) {
        List<Permission> permissionList =  permissionDao.queryUserPermission(userId);
        return JsonResponse.permissionList(permissionList);
    }

    @Override
    public String createUserPermission(String curId, String token, String userId, String permissionId) {
        permissionDao.addUserPermission(userId,permissionId);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String deleteUserPermission(String curId, String token, String userId, String permissionId) {
        permissionDao.deleteUserPermission(userId,permissionId);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }
}
