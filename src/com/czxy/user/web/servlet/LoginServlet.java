package com.czxy.user.web.servlet;

import cn.itcast.servlet.BaseServlet;
import com.czxy.user.domain.User;
import com.czxy.user.service.UserService;

import javax.servlet.http.Cookie;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by xps13 on 2019/4/9.
 */
public class LoginServlet extends BaseServlet {
    //每个Servlet方法需要调用service
    //static 共享。会出现线程安全问题，一个请求一个线程
    private UserService service = new UserService();

    /**
     * 用户登录
     * @return
     */
    public String login() throws UnsupportedEncodingException {
        //一、验证码校验
        //1、接收表单验证码
        String vc = getRequest().getParameter("verifyCode");
        //2、接收session中验证码答案
        String vci = (String) getRequest().getSession().getAttribute("vci");
        //3、删除session中验证码答案
        getRequest().getSession().removeAttribute("vci");
        //4、校验验证码    校验失败：!(vc!=null && vci!=null && vc.equalsIgnoreCase(vci))
        if(vc==null || vci==null || !vc.equalsIgnoreCase(vci)){
            //4.1、校验失败，返回login页面，回显错误信息
            getRequest().setAttribute("msg","验证码错误，登录失败");
            return "forward:/login/login.jsp";
        }
        //二、登录校验：
        //1、接收表单传递用户信息
        User user = toBean(User.class);
        System.out.println(user);
        //2、调用service层，校验用户是否登录成功
        User result = service.login(user);
        System.out.println(result);
        //3、判断登录是否成功
        if(result!=null){
            //3.1、登录成功
            System.out.println("登录成功");
            //三、记录用户名
            //1、判断用户是否勾选了“记录用户名”
            if(getRequest().getParameter("remember")!=null){
                //1.1、勾选了，需要记录
                System.out.println("勾选了 记录用户名");
                //保存一个持久化cookie，7天，有中文
                Cookie remember = new Cookie("remember", URLEncoder.encode(result.getLoginName(), "utf-8"));
                remember.setMaxAge(60*60*24*7);
                getResponse().addCookie(remember);
            }else{
                //1.2、没勾选，不需要记录，需要取消之前记录的
                System.out.println("没有勾选了 记录用户名");
                //立即删除之前保存的cookie
                Cookie remember = new Cookie("remember", "");
                remember.setMaxAge(0);
                getResponse().addCookie(remember);
            }
            //3.1.1、向session中保存用户信息
            getRequest().getSession().setAttribute("user",result);
            //3.1.2、重定向到/index.jsp
            return "redirect:/index.jsp";
        }else{
            //3.2、登录失败
            System.out.println("登录失败");
            //3.2.1、向request中保存错误信息
            getRequest().setAttribute("msg","用户名或密码错误，登录失败");
            //3.2.2、请求转发
            return "forward:/login/login.jsp";
        }
    }
}
