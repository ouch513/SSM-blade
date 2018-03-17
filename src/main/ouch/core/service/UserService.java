package main.ouch.core.service;

import main.ouch.core.domain.User;

import java.util.List;

public interface UserService {

    /**
     * 查询所有用户
     */
    List<User> getList();

    /**
     * 用户名查询
     */
    List<User> queryByUsername(String username);

    /**
     * 邮箱查询
     */
    List<User> queryByEmail(String email);

    /**
     * 注册用户
     */
    User addUser(User user);

    /**
     * 检查登录信息
     */
    User queryByLoginInfo(String username,String password);

}
