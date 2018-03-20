package main.ouch.core.web.dashboard;

import main.ouch.common.tool.ValueUtil;
import main.ouch.core.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    HttpSession session;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    @ResponseBody
    private ModelAndView index() {
        ModelAndView mv = new ModelAndView("dashboard/home/index");

        String username = (session.getAttribute("username")!=null)?session.getAttribute("username").toString():"";
        if(ValueUtil.isEmpty(username)){
            mv = new ModelAndView("redirect:/dashboard/login");
        }

        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    private ModelAndView login() {
        ModelAndView mv = new ModelAndView("dashboard/session/login");

        String username = (session.getAttribute("username")!=null)?session.getAttribute("username").toString():"";
        if(!ValueUtil.isEmpty(username)){
            mv = new ModelAndView("redirect:/dashboard/index");
        }

        return mv;
    }

    @RequestMapping(value = "/regin", method = RequestMethod.GET)
    private ModelAndView regin() {
        ModelAndView mv = new ModelAndView("dashboard/session/regin");
        return mv;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    private ModelAndView logout() {
        session.removeAttribute("username");
        session.removeAttribute("userId");
        session.removeAttribute("token");

        ModelAndView mv = new ModelAndView("redirect:/dashboard/login");
        return mv;
    }
}
