package main.ouch.core.web.aop;

import main.ouch.common.format.JsonResponse;
import main.ouch.constant.Message;
import main.ouch.core.service.TokenService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

@Component
@Aspect
public class CheckController {

    @Autowired
    TokenService tokenService;

    @Autowired
    HttpSession session;

    //登录检测
    @Pointcut("execution(* main.ouch.core.service.impl.*.getList(..))||" +
            "execution(* main.ouch.core.service.impl.*.create(..))||" +
            "execution(* main.ouch.core.service.impl.*.update*(..))||" +
            "execution(* main.ouch.core.service.impl.*.delete(..))||" +
            "execution(* main.ouch.core.service.impl.*.edit*(..))||" +
            "execution(* main.ouch.core.service.impl.*.queryById(..))")
    public void pointCut() {

    }

    @Around("pointCut()")
    public Object checkLogin(ProceedingJoinPoint proceedingJoinPoint) {
        // proceedingJoinPoint封装了连接点的详细信息
        // proceed，执行目标方法 method.invoke
        Object proceed = null;
        Object[] args = proceedingJoinPoint.getArgs();

        Boolean isLogin = false;

        // 获得切入方法参数
        Object[] aopArgs = proceedingJoinPoint.getArgs();
        try {
            // 获得切入的方法
//            Method method = ((MethodSignature) proceedingJoinPoint.getSignature()).getMethod();
//            System.out.println(method);
//            // 获得所有参数
//            Parameter[] parameters = method.getParameters();
//
//            for (int i = 0; i < parameters.length; i++) {
//                System.out.println(aopArgs[i]);
//            }

            isLogin = tokenService.checkToken(aopArgs[0].toString(),aopArgs[1].toString());

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

        if(isLogin){
            return proceed;
        }else {
            tokenService.deleteToken(aopArgs[0].toString(),aopArgs[1].toString());
            session.removeAttribute("username");
            session.removeAttribute("userId");
            session.removeAttribute("token");

            return JsonResponse.error(Message.LOGIN_TIME_OUT);
        }
    }

}
