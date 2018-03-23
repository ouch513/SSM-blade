package main.ouch.core.web.aop;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.PermissionUtil;
import main.ouch.constant.Message;
import main.ouch.core.dao.PermissionDao;
import main.ouch.core.dao.UserDao;
import main.ouch.core.domain.User;
import main.ouch.core.service.TokenService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Component
@Aspect
public class CheckController {

    @Autowired
    TokenService tokenService;

    @Autowired
    UserDao userDao;

    @Autowired
    PermissionDao permissionDao;

    @Autowired
    HttpSession session;

    //登录检测(枚举)
//    @Pointcut("execution(* main.ouch.core.service.impl.*.getList(..))||" +
//            "execution(* main.ouch.core.service.impl.*.getInfo(..))||" +
//            "execution(* main.ouch.core.service.impl.*.queryById(..))||" +
//            "execution(* main.ouch.core.service.impl.*.create(..))||" +
//            "execution(* main.ouch.core.service.impl.*.update*(..))||" +
//            "execution(* main.ouch.core.service.impl.*.edit*(..))||" +
//            "execution(* main.ouch.core.service.impl.*.delete(..))")

    //登录检测(排除)
    @Pointcut("execution(* main.ouch.core.service.impl.*.*(..))&&" +
            "(!execution(* main.ouch.core.service.impl.TokenServiceImpl.*(..)))&&" +
            "(!execution(* main.ouch.core.service.impl.UserServiceImpl.queryByUsername(..)))&&" +
            "(!execution(* main.ouch.core.service.impl.UserServiceImpl.queryByEmail(..)))&&" +
            "(!execution(* main.ouch.core.service.impl.UserServiceImpl.queryByLoginInfo(..)))&&" +
            "(!execution(* main.ouch.core.service.impl.UserServiceImpl.addUser(..)))&&" +
            "(!execution(* main.ouch.core.service.impl.UserServiceImpl.delete(..)))")
    public void pointCut() {

    }

    @Around("pointCut()")
    public Object check(ProceedingJoinPoint proceedingJoinPoint) {
        // proceedingJoinPoint封装了连接点的详细信息
        // proceed，执行目标方法 method.invoke
        Object proceed = null;
        Object[] args = proceedingJoinPoint.getArgs();

        Boolean isLogin = false;
        Boolean hasPermission = false;

        // 获得切入方法参数
        Object[] aopArgs = proceedingJoinPoint.getArgs();

        // 1.登录检验
        isLogin = tokenService.checkToken(aopArgs[0].toString(),aopArgs[1].toString());

        if(!isLogin){

            tokenService.deleteToken(aopArgs[0].toString(),aopArgs[1].toString());
            session.removeAttribute("username");
            session.removeAttribute("userId");
            session.removeAttribute("token");

            return JsonResponse.error(Message.LOGIN_TIME_OUT);
        }

        // 2.权限检验
        User user = userDao.queryByUserId(aopArgs[0].toString());
        String method = ((MethodSignature) proceedingJoinPoint.getSignature()).getMethod().toString();
//        System.out.println(method);
        if(user.getAdminRole().equals("2")){
//            System.out.println("超级管理员最大权限");
            hasPermission = true;
        }else if(PermissionUtil.check(method,permissionDao.queryPublicPermission())){
//            System.out.println("公共权限");
            hasPermission = true;
        }else{
            if(user.getAdminRole().equals("1")){
                if(PermissionUtil.check(method,permissionDao.queryUserPermission(aopArgs[0].toString()))){
//                    System.out.println("被赋予管理权限");
                    hasPermission = true;
                }
            }
        }

        if(!hasPermission){
            return JsonResponse.error(Message.NO_POWER);
        }

        try {
            // 获得切入的方法
//            // 获得所有参数
//            Parameter[] parameters = method.getParameters();
//
//            for (int i = 0; i < parameters.length; i++) {
//                System.out.println(aopArgs[i]);
//            }

            // method.invoke
            // 目标方法执行完成后会有返回值，这个返回值一定return出去
            proceed = proceedingJoinPoint.proceed(args);

         } catch (Throwable e) {
//            e.printStackTrace();
//            异常通知
//            System.out.println("proceed...异常");
//            注意：
//            一定将这个异常继续抛出去，以方便外界都能收到这个异常
            throw new RuntimeException(e);
        } finally {
            //后置通知
            //System.out.println("proceed...结束");
        }
        return proceed;
    }

}
