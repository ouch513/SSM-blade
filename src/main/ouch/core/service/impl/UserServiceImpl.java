package main.ouch.core.service.impl;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.ValueUtil;
import main.ouch.constant.Message;
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
    public String getInfo(String userId,String token) {
        User user = userDao.queryByUserId(userId);
        if(user==null){
            return JsonResponse.error(Message.GET_DATA_ERROR);
        }else{
            return JsonResponse.userInfo(user);
        }
    }

    @Override
    public String queryById(String curId,String token,String userId) {
        User user = userDao.queryByUserId(userId);
        if(user==null){
            return JsonResponse.error(Message.GET_DATA_ERROR);
        }else{
            return JsonResponse.userInfo(user);
        }
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

        userDao.add(user);

        return user;
    }

    @Override
    public String create(String userId,String token,User user) {

        String id = ValueUtil.uuid();
        user.setUserId(id);
        user.setPassword(ValueUtil.md5(user.getPassword()));

        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
        user.setRegTime(dateFormat.format(date));

        user = Role.checkData(user);
        userDao.add(user);

        return JsonResponse.userInfo(user);
    }

    @Override
    public User queryByLoginInfo(String username, String password) {
        return userDao.queryByLoginInfo(username,ValueUtil.md5(password));
    }

    @Override
    public String update(String userId,String token,User user) {
        userDao.update(user);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String updatePass(String userId, String token, User user) {
        user.setPassword(ValueUtil.md5(user.getPassword()));
        userDao.updatePass(user);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String toggleAdmin(String curId, String token, String userId) {
        User user = userDao.queryByUserId(userId);
        if(user.getAdminRole().equals("2")){
            return JsonResponse.successInfo(Message.NOT_OWNER);
        }else if(user.getAdminRole().equals("1")){
            userDao.updateAdmin(userId,"0");
        }else {
            userDao.updateAdmin(userId,"1");
        }
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String edit(String userId, String token, User user) {
        if(userId.equals(user.getUserId())){
            userDao.edit(user);
            return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
        }else{
            return JsonResponse.error(Message.NOT_OWNER);
        }
    }

    @Override
    public String editPass(String userId, String token, User user) {
        if(userId.equals(user.getUserId())){
            user.setPassword(ValueUtil.md5(user.getPassword()));
            userDao.updatePass(user);
            return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
        }else{
            return JsonResponse.error(Message.NOT_OWNER);
        }
    }

    @Override
    public String delete(String userId, String token, User user) {
        userDao.delete(user.getUserId());
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }
}
