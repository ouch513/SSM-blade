package main.ouch.core.web.dashboard;

import main.ouch.common.tool.ValueUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/bulletin")
public class BulletinController {

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
        ModelAndView mv = new ModelAndView("dashboard/bulletin/index");
        return checkLogin(mv);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    private ModelAndView create() {
        ModelAndView mv = new ModelAndView("dashboard/bulletin/create");
        return checkLogin(mv);
    }

    @RequestMapping(value = "/show/{bulletinId}", method = RequestMethod.GET)
    private ModelAndView show(@PathVariable("bulletinId") String bulletinId) {
        ModelAndView mv = new ModelAndView("dashboard/bulletin/show");
        mv.addObject("bulletinId",bulletinId);
        return checkLogin(mv);
    }

    @RequestMapping(value = "/edit/{bulletinId}", method = RequestMethod.GET)
    private ModelAndView edit(@PathVariable("bulletinId") String bulletinId) {
        ModelAndView mv = new ModelAndView("dashboard/bulletin/edit");
        mv.addObject("bulletinId",bulletinId);
        return checkLogin(mv);
    }

}
