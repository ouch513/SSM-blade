package main.ouch.core.web.dashboard.user;

import main.ouch.common.tool.ValueUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/user")
public class UserController {

    @Autowired
    HttpSession session;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private ModelAndView checkLogin(ModelAndView mv){
        String username = (session.getAttribute("username")!=null)?session.getAttribute("username").toString():"";
        if(ValueUtil.isEmpty(username)){
            mv = new ModelAndView("redirect:/dashboard/login");
        }
        return mv;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    private ModelAndView index() {
        ModelAndView mv = new ModelAndView("dashboard/user/index");
        return checkLogin(mv);
    }

}
