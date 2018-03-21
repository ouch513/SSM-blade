package main.ouch.core.service;

import main.ouch.core.domain.User;

import java.util.List;

public interface UserService {

    /**
     * 查询所有用户
     */
    String getList(String userId,String token);

    /**
     * 用户ID查询
     */
    String queryById(String curId,String token,String userId);

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
     * 创建用户（管理员）
     */
    String create(String userId,String token,User user);

    /**
     * 检查登录信息
     */
    User queryByLoginInfo(String username,String password);

    /**
     * 更改用户信息
     */
    String update(String userId,String token,User user);

    /**
     * 更改用户密码
     */
    String updatePass(String userId,String token,User user);

    /**
     * 更改用户信息(限本人操作)
     */
    String edit(String userId,String token,User user);

    /**
     * 更改用户密码(限本人操作)
     */
    String editPass(String userId,String token,User user);

    /**
     * 删除用户
     */
    String delete(String userId,String token,User user);

}
