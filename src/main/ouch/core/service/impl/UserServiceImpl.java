package main.ouch.core.service.impl;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.ValueUtil;
import main.ouch.constant.Role;
import main.ouch.core.dao.UserDao;
import main.ouch.core.domain.User;
import main.ouch.core.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserDao userDao;

    @Override
    public String getList(String userId,String token) {
        List<User> userList =  userDao.queryAll();
        return JsonResponse.userList(userList);
    }

    @Override
    public List<User> queryByUsername(String username) {
        List<User> userList =  userDao.queryByUsername(username);
        return Role.getRoleList(userList);
    }

    @Override
    public List<User> queryByEmail(String email) {
        List<User> userList =  userDao.queryByEmail(email);
        return Role.getRoleList(userList);
    }

    @Override
    public User addUser(User user) {

        String id = ValueUtil.uuid();
        user.setUserId(id);

        user.setPassword(ValueUtil.md5(user.getPassword()));
        user.setRole("0");
        user.setAdminRole("0");

        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
        user.setRegTime(dateFormat.format(date));

        userDao.addUser(user);

        return user;
    }

    @Override
    public User queryByLoginInfo(String username, String password) {
        return userDao.queryByLoginInfo(username,ValueUtil.md5(password));
    }
}
