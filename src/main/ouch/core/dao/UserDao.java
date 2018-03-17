package main.ouch.core.dao;

import main.ouch.core.domain.User;

import java.util.List;

public interface UserDao {

    /**
     * 查询所有用户
     */
    List<User> queryAll();

    /**
     * 用户名查询
     */
    List<User> queryByUsername(String username);

    /**
     * 邮箱查询
     */
    List<User> queryByEmail(String email);

    /**
     * 添加用户
     */
    void addUser(User user);

    /**
     * 检查登录信息
     */
    User queryByLoginInfo(String username,String password);

}
