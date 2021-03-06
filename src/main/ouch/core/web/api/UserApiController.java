package main.ouch.core.web.api;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.ValueUtil;
import main.ouch.constant.Message;
import main.ouch.core.domain.User;
import main.ouch.core.service.TokenService;
import main.ouch.core.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/api/user")
public class UserApiController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private HttpSession session;

    @Autowired
    private User user;

    @RequestMapping(value = "/list",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String list(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return userService.getList(userId,token);
    }

    @RequestMapping(value = "/getSelfInfo",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String selfInfo(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return userService.getInfo(userId,token);
    }

    @RequestMapping(value = "/queryById",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String queryById(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String curId = req.getParameter("curId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return userService.queryById(curId,token,userId);
    }

    @RequestMapping(value = "/queryByUsername",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String queryByUsername(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException  {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String username = req.getParameter("username");

        List<User> list = userService.queryByUsername(username);

        if (list.size()>0) {
            return JsonResponse.success(list);
        } else {
            return JsonResponse.error(Message.NO_DATA);
        }
    }

    @RequestMapping(value = "/queryByEmail",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String queryByEmail(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException  {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String email = req.getParameter("email");

        List<User> list = userService.queryByEmail(email);

        if (list.size()>0) {
            return JsonResponse.success(list);
        } else {
            return JsonResponse.error(Message.NO_DATA);
        }
    }

    @RequestMapping(value = "/create",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String create(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String adminRole = req.getParameter("adminRole");

        if(ValueUtil.isEmpty(username)){
            return JsonResponse.error(Message.NULL_USERNAME);
        }

        if(ValueUtil.isMoreThan(20,username)){
            return JsonResponse.error(Message.USERNAME_LIMIT);
        }

        if(ValueUtil.isEmpty(email)){
            return JsonResponse.error(Message.NULL_EMAIL);
        }

        if(ValueUtil.checkEmail(email)){
            return JsonResponse.error(Message.ERROR_EMAIL);
        }

        if(ValueUtil.isEmpty(password)){
            return JsonResponse.error(Message.NULL_PASSWORD);
        }

        if(ValueUtil.checkLength(6,22, password)){
            return JsonResponse.error(Message.PASSWORD_LIMIT);
        }

        List<User> nameList = userService.queryByUsername(username);
        if(nameList.size()>0){
            return JsonResponse.error(Message.USED_USERNAME);
        }

        List<User> emailList = userService.queryByEmail(email);
        if(emailList.size()>0){
            return JsonResponse.error(Message.USED_EMAIL);
        }

        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        user.setAdminRole(adminRole);

        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return userService.create(userId,token,user);
    }

    @RequestMapping(value = "/update",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String update(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String email = req.getParameter("email");
        String role = req.getParameter("role");
        String userId = req.getParameter("userId");

        if(ValueUtil.isEmpty(email)){
            return JsonResponse.error(Message.NULL_EMAIL);
        }

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        if(ValueUtil.checkEmail(email)){
            return JsonResponse.error(Message.ERROR_EMAIL);
        }

        List<User> emailList = userService.queryByEmail(email);
        if(emailList.size()>0){
            String emailId = emailList.get(0).getUserId();
            if(!emailId.equals(userId)){
                return JsonResponse.error(Message.USED_EMAIL);
            }
        }

        String curId = req.getParameter("curId");
        String token = req.getParameter("token");

        user.setEmail(email);
        user.setRole(role);
        user.setUserId(userId);

        return userService.update(curId,token,user);
    }

    @RequestMapping(value = "/updatePass",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String updatePass(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String userId = req.getParameter("userId");
        String password = req.getParameter("password");

        if(ValueUtil.isEmpty(password)){
            return JsonResponse.error(Message.NULL_PASSWORD);
        }

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        if(ValueUtil.checkLength(6,22, password)){
            return JsonResponse.error(Message.PASSWORD_LIMIT);
        }

        String curId = req.getParameter("curId");
        String token = req.getParameter("token");

        user.setUserId(userId);
        user.setPassword(password);

        return userService.updatePass(curId,token,user);
    }

    @RequestMapping(value = "/toggleAdmin",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String toggleAdmin(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String curId = req.getParameter("curId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return userService.toggleAdmin(curId,token,userId);
    }

    @RequestMapping(value = "/edit",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String edit(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String email = req.getParameter("email");
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(email)){
            return JsonResponse.error(Message.NULL_EMAIL);
        }

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        if(ValueUtil.checkEmail(email)){
            return JsonResponse.error(Message.ERROR_EMAIL);
        }

        List<User> emailList = userService.queryByEmail(email);
        if(emailList.size()>0){
            String emailId = emailList.get(0).getUserId();
            if(!emailId.equals(userId)){
                return JsonResponse.error(Message.USED_EMAIL);
            }
        }

        user.setEmail(email);
        user.setUserId(userId);

        return userService.edit(userId,token,user);
    }

    @RequestMapping(value = "/editPass",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String editPass(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String userId = req.getParameter("userId");
        String password = req.getParameter("password");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(password)){
            return JsonResponse.error(Message.NULL_PASSWORD);
        }

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        if(ValueUtil.checkLength(6,22, password)){
            return JsonResponse.error(Message.PASSWORD_LIMIT);
        }

        user.setUserId(userId);
        user.setPassword(password);

        return userService.editPass(userId,token,user);
    }

    @RequestMapping(value = "/delete",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String delete(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String userId = req.getParameter("userId");
        String curId = req.getParameter("curId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(userId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        user.setUserId(userId);

        return userService.delete(curId,token,user);
    }

    @RequestMapping(value = "/regist",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String regin(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String checkpass = req.getParameter("checkpass");

        if(ValueUtil.isEmpty(username)){
            return JsonResponse.error(Message.NULL_USERNAME);
        }

        if(ValueUtil.isMoreThan(20,username)){
            return JsonResponse.error(Message.USERNAME_LIMIT);
        }

        if(ValueUtil.isEmpty(email)){
            return JsonResponse.error(Message.NULL_EMAIL);
        }

        if(ValueUtil.checkEmail(email)){
            return JsonResponse.error(Message.ERROR_EMAIL);
        }

        if(ValueUtil.isEmpty(password)){
            return JsonResponse.error(Message.NULL_PASSWORD);
        }

        if(ValueUtil.checkLength(6,22, password)){
            return JsonResponse.error(Message.PASSWORD_LIMIT);
        }

        if(!password.equals(checkpass)){
            return JsonResponse.error(Message.NOT_SAME_PASS);
        }

        List<User> nameList = userService.queryByUsername(username);
        if(nameList.size()>0){
            return JsonResponse.error(Message.USED_USERNAME);
        }

        List<User> emailList = userService.queryByEmail(email);
        if(emailList.size()>0){
            return JsonResponse.error(Message.USED_EMAIL);
        }

        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        User newUser = userService.addUser(user);
        return JsonResponse.userInfo(newUser);
    }

    @RequestMapping(value = "/login",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String login(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        user = userService.queryByLoginInfo(username,password);

        if(user == null){
            return JsonResponse.error(Message.ERROR_LOGIN);
        }

        String token = tokenService.addToken(user.getUserId());

        session.setAttribute("username",username);
        session.setAttribute("userId",user.getUserId());
        session.setAttribute("token",token);
        session.setAttribute("adminRole",user.getAdminRole());

        return JsonResponse.loginSession(user,token);
    }

}
