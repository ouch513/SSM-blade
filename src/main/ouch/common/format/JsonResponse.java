package main.ouch.common.format;

import com.google.gson.Gson;
import main.ouch.constant.Role;
import main.ouch.core.domain.User;

public class JsonResponse {

    public static String error(String errorInfo){
        return "{\"status\":\"error\",\"info\":\"" + errorInfo + "\"}";
    }

    public static String success(Object object){
        Gson gson = new Gson();
        String data = gson.toJson(object);

        return "{\"status\":\"success\",\"data\":" + data + "}";
    }

    public static String successSession(User user){
        user = Role.getRoleType(user);
        return "{\"status\":\"success\",\"data\":{\"userId\":\""
                + user.getUserId() + "\",\"username\":\""
                + user.getUsername() + "\",\"email\":\""
                + user.getEmail() + "\",\"role\":\""
                + user.getRole() + "\",\"adminRole\":\""
                + user.getAdminRole() + "\",\"regTime\":\""
                + user.getRegTime() +"\"}}";
    }
}
