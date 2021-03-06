package main.ouch.common.format;

import com.google.gson.Gson;
import main.ouch.constant.Message;
import main.ouch.constant.PermissionType;
import main.ouch.constant.Role;
import main.ouch.core.domain.Bulletin;
import main.ouch.core.domain.Permission;
import main.ouch.core.domain.User;

import java.util.List;

public class JsonResponse {

    public static String error(String errorInfo){
        return "{\"status\":\"error\",\"info\":\"" + errorInfo + "\"}";
    }

    public static String success(Object object){
        Gson gson = new Gson();
        String data = gson.toJson(object);

        return "{\"status\":\"success\",\"data\":" + data + "}";
    }

    public static String successInfo(String successInfo){
        return "{\"status\":\"success\",\"info\":\"" + successInfo + "\"}";
    }

    public static String loginSession(User user, String token){
        user = Role.getRoleType(user);
        return "{\"status\":\"success\",\"data\":{\"userId\":\""
                + user.getUserId() + "\",\"username\":\""
                + user.getUsername() + "\",\"email\":\""
                + user.getEmail() + "\",\"role\":\""
                + user.getRole() + "\",\"adminRole\":\""
                + user.getAdminRole() + "\",\"regTime\":\""
                + user.getRegTime() + "\",\"token\":\""
                + token +"\"}}";
    }

    public static String userInfo(User user){
        user = Role.getRoleType(user);
        return "{\"status\":\"success\",\"data\":{\"userId\":\""
                + user.getUserId() + "\",\"username\":\""
                + user.getUsername() + "\",\"email\":\""
                + user.getEmail() + "\",\"role\":\""
                + user.getRole() + "\",\"adminRole\":\""
                + user.getAdminRole() + "\",\"regTime\":\""
                + user.getRegTime() +"\"}}";
    }

    public static String userList(List<User> list){
        list = Role.getRoleList(list);

        if(list.size()>0){
            String str = "{\"status\":\"success\",\"data\":[";
            for (int i=0; i<list.size(); i++) {
                str += "{\"userId\":\""
                        + list.get(i).getUserId() + "\",\"username\":\""
                        + list.get(i).getUsername() + "\",\"email\":\""
                        + list.get(i).getEmail() + "\",\"role\":\""
                        + list.get(i).getRole() + "\",\"adminRole\":\""
                        + list.get(i).getAdminRole() + "\",\"regTime\":\""
                        + list.get(i).getRegTime() +"\"}";

                if(i != list.size()-1){
                    str += ",";
                }
            }
            str += "]}";
            return str;

        }else {

            return JsonResponse.error(Message.NO_DATA);
        }
    }

    public static String bulletinInfo(Bulletin bulletin,String username){
        return "{\"status\":\"success\",\"data\":{\"bulletinId\":\""
                + bulletin.getBulletinId() + "\",\"title\":\""
                + bulletin.getTitle() + "\",\"author\":\""
                + username + "\",\"updatedAt\":\""
                + bulletin.getUpdatedAt() + "\",\"content\":\""
                + bulletin.getContent() +"\"}}";
    }

    public static String bulletinList(List<Bulletin> list){

        if(list.size()>0){

            String str = "{\"status\":\"success\",\"data\":[";
            for (int i=0; i<list.size(); i++) {
                str += "{\"bulletinId\":\""
                        + list.get(i).getBulletinId() + "\",\"title\":\""
                        + list.get(i).getTitle() + "\",\"userId\":\""
                        + list.get(i).getUserId() + "\",\"updatedAt\":\""
                        + list.get(i).getUpdatedAt() + "\",\"content\":\""
                        + list.get(i).getContent() +"\"}";
                if(i != list.size()-1){
                    str += ",";
                }
            }
            str += "]}";
            return str;

        }else {

            return JsonResponse.error(Message.NO_DATA);
        }
    }

    public static String permissionInfo(Permission permission){
        permission = PermissionType.getPermissionType(permission);
        return "{\"status\":\"success\",\"data\":{\"permissionId\":\""
                + permission.getPermissionId() + "\",\"name\":\""
                + permission.getName() + "\",\"slug\":\""
                + permission.getSlug() + "\",\"type\":\""
                + permission.getType() +"\"}}";
    }

    public static String permissionList(List<Permission> list){
        list = PermissionType.getTypeList(list);

        if(list.size()>0){

            String str = "{\"status\":\"success\",\"data\":[";
            for (int i=0; i<list.size(); i++) {
                str += "{\"permissionId\":\""
                        + list.get(i).getPermissionId() + "\",\"name\":\""
                        + list.get(i).getName() + "\",\"slug\":\""
                        + list.get(i).getSlug() + "\",\"type\":\""
                        + list.get(i).getType() +"\"}";

                if(i != list.size()-1){
                    str += ",";
                }
            }
            str += "]}";
            return str;

        }else {

            return JsonResponse.error(Message.NO_POWER_GIVEN);
        }
    }
}
