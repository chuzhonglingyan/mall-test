package mall.web.local;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author zy
 * @create 2020-05-07-11:15
 */
@Controller
@RequestMapping("/local")
public class LocalController {
    /**
     * 绑定帐号页路由
     *
     * @return
     */
    @RequestMapping(value = "/accountbind", method = RequestMethod.GET)
    private String accountbind() {
        return "local/accountbind";
    }
    /**
     * 修改密码页路由
     *
     * @return
     */
    @RequestMapping(value = "/changepsw", method = RequestMethod.GET)
    private String changepsw() {
        return "local/changepsw";
    }
    /**
     * 登录页路由
     *
     * @return
     */
    @RequestMapping(value = "/blogin", method = RequestMethod.GET)
    private String blogin() {
        return "local/blogin";
    }


    /**
     * 登录页路由
     *
     * @return
     */
    @RequestMapping(value = "/clogin", method = RequestMethod.GET)
    private String clogin() {
        return "local/clogin";
    }

}