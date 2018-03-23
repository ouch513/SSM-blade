package main.ouch.core.web.api;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.ValueUtil;
import main.ouch.constant.Message;
import main.ouch.core.domain.Bulletin;
import main.ouch.core.domain.User;
import main.ouch.core.service.BulletinService;
import main.ouch.core.service.TokenService;
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
@RequestMapping("/api/bulletin")
public class BulletinApiController {


    @Autowired
    private BulletinService bulletinService;

    @Autowired
    private Bulletin bulletin;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private HttpSession session;

    @RequestMapping(value = "/list",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String list(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return bulletinService.getList(userId,token);
    }

    @RequestMapping(value = "/queryById",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String queryById(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String bulletinId = req.getParameter("bulletinId");
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(bulletinId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return bulletinService.queryById(userId, token, bulletinId);
    }

    @RequestMapping(value = "/create",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String create(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(title)){
            return JsonResponse.error(Message.NULL_TITLE);
        }

        if(ValueUtil.isMoreThan(50,title)){
            return JsonResponse.error(Message.TITLE_LIMIT);
        }

        bulletin.setUserId(userId);
        bulletin.setTitle(title);
        bulletin.setContent(content);

        return bulletinService.create(userId,token,bulletin);
    }


    @RequestMapping(value = "/update",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String update(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String bulletinId = req.getParameter("bulletinId");
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(title)){
            return JsonResponse.error(Message.NULL_TITLE);
        }

        if(ValueUtil.isEmpty(bulletinId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        if(ValueUtil.isMoreThan(50,title)){
            return JsonResponse.error(Message.TITLE_LIMIT);
        }

        bulletin.setTitle(title);
        bulletin.setContent(content);
        bulletin.setBulletinId(bulletinId);

        return bulletinService.update(userId,token,bulletin);
    }

    @RequestMapping(value = "/delete",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String delete(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String userId = req.getParameter("userId");
        String bulletinId = req.getParameter("bulletinId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(bulletinId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return bulletinService.delete(userId,token,bulletinId);
    }

}
