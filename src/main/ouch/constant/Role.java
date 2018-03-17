package main.ouch.constant;

import main.ouch.core.domain.User;

import java.util.List;

public class Role {
    public static List<User> getRoleList(List<User> userList){

        for (int i=0; i<userList.size(); i++) {
            userList.set(i,getRoleType(userList.get(i)));
        }

        return userList;
    }

    public static User getRoleType(User user){

            switch (user.getRole()){
                default: user.setRole("普通用户");
            }

            switch (user.getAdminRole()){
                case "1": user.setAdminRole("超级管理员");break;
                case "2": user.setAdminRole("管理员");break;
                default: user.setAdminRole("非管理员");
            }

        return user;
    }
}
