package main.ouch.core.web.api;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.ValueUtil;
import main.ouch.constant.Message;
import main.ouch.core.domain.Permission;
import main.ouch.core.service.PermissionService;
import main.ouch.core.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/api/permission")
public class PermissionApiController {

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private Permission permission;

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

        return permissionService.getList(userId,token);
    }

    @RequestMapping(value = "/queryById",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String queryById(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String permissionId = req.getParameter("permissionId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(permissionId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return permissionService.queryById(userId,token,permissionId);
    }

    @RequestMapping(value = "/listPublic",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String listPublic(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return permissionService.queryPublicPermission(userId,token);
    }

    @RequestMapping(value = "/listAdmin",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String listAdmin(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return permissionService.queryAdminPermission(userId,token);
    }

    @RequestMapping(value = "/create",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String create(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String name = req.getParameter("name");
        String slug = req.getParameter("slug");
        String type = req.getParameter("type");
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(name)||ValueUtil.isEmpty(slug)||ValueUtil.isEmpty(type)){
            return JsonResponse.error(Message.NULL_STR);
        }

        permission.setName(name);
        permission.setSlug(slug);
        permission.setType(type);

        return permissionService.create(userId,token,permission);
    }


    @RequestMapping(value = "/update",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String update(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String name = req.getParameter("name");
        String slug = req.getParameter("slug");
        String type = req.getParameter("type");
        String permissionId = req.getParameter("permissionId");
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(name)||ValueUtil.isEmpty(slug)||ValueUtil.isEmpty(type)||ValueUtil.isEmpty(permissionId)){
            return JsonResponse.error(Message.NULL_STR);
        }

        permission.setName(name);
        permission.setSlug(slug);
        permission.setType(type);
        permission.setPermissionId(permissionId);

        return permissionService.update(userId,token,permission);
    }

    @RequestMapping(value = "/delete",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String delete(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");//设置参数的编码格式

        String userId = req.getParameter("userId");
        String permissionId = req.getParameter("permissionId");
        String token = req.getParameter("token");

        if(ValueUtil.isEmpty(permissionId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return permissionService.delete(userId,token,permissionId);
    }

    @RequestMapping(value = "/ofUser",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String ofUser(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String curId = req.getParameter("curId");
        String token = req.getParameter("token");
        String userId = req.getParameter("userId");

        return permissionService.queryUserPermission(curId,token,userId);
    }

    @RequestMapping(value = "/ofSelf",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String ofSelf(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String userId = req.getParameter("userId");
        String token = req.getParameter("token");

        return permissionService.querySelfPermission(userId,token);
    }

    @RequestMapping(value = "/giveToUser",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String giveToUser(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String curId = req.getParameter("curId");
        String token = req.getParameter("token");
        String userId = req.getParameter("userId");
        String permissionId = req.getParameter("permissionId");

        if(ValueUtil.isEmpty(userId)||ValueUtil.isEmpty(permissionId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return permissionService.createUserPermission(curId,token,userId,permissionId);
    }

    @RequestMapping(value = "/dropFromUser",produces = "text/plain;charset=utf-8")
    @ResponseBody
    private String dropFromUser(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");//设置参数的编码格式
        String curId = req.getParameter("curId");
        String token = req.getParameter("token");
        String userId = req.getParameter("userId");
        String permissionId = req.getParameter("permissionId");

        if(ValueUtil.isEmpty(userId)||ValueUtil.isEmpty(permissionId)){
            return JsonResponse.error(Message.NULL_ID);
        }

        return permissionService.deleteUserPermission(curId,token,userId,permissionId);
    }


}
