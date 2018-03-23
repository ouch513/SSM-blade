package main.ouch.constant;

import java.util.List;
import main.ouch.core.domain.Permission;

public class PermissionType {
    public static List<Permission> getTypeList(List<Permission> permissionList){

        for (int i=0; i<permissionList.size(); i++) {
            permissionList.set(i,getPermissionType(permissionList.get(i)));
        }

        return permissionList;
    }

    public static Permission getPermissionType(Permission permission){

        switch (permission.getType()){
            case "1": permission.setType("公共权限");break;
            default: permission.setType("管理权限");
        }

        return permission;
    }

    public static Permission checkData(Permission permission){
        switch (permission.getType()){
            case "1": permission.setType("1");break;
            default: permission.setType("0");
        }

        return permission;
    }
}
