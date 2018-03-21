package main.ouch.core.dao;

import main.ouch.core.domain.User;

import java.util.List;

public interface UserDao {

    /**
     * 查询所有用户
     */
    List<User> queryAll();

    /**
     * 用户Id查询
     */
    User queryByUserId(String userId);

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
    void add(User user);

    /**
     * 检查登录信息
     */
    User queryByLoginInfo(String username,String password);

    /**
     * 更改用户信息
     */
    void update(User user);

    /**
     * 更改用户信息(本人)
     */
    void edit(User user);

    /**
     * 更改用户密码
     */
    void updatePass(User user);

    /**
     * 删除用户
     */
    void delete(String userId);

}
