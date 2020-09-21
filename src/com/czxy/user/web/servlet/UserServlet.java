package com.czxy.user.web.servlet;

import cn.itcast.servlet.BaseServlet;
import com.czxy.user.domain.User;
import com.czxy.user.service.UserService;
import com.czxy.user.utils.UserUtils;

import java.util.List;

/**
 * Created by xps13 on 2019/4/3.
 */
public class UserServlet extends BaseServlet {
    //每个Servlet方法需要调用service
    //static 共享。会出现线程安全问题，一个请求一个线程
    private UserService service = new UserService();

    /**
     * 修改用户信息
     * @return
     */
    public String modifyUser(){
        //1、接收表单数据
        User user = toBean(User.class);
        System.out.println(user);
        //2、调用service修改用户
        service.modifyUser(user);
        //3、跳转到查询列表的servlet
        return "redirect:/user?method=list";
    }
    /**
     * 根据用户ID查询用户信息，并跳转到编辑页面
     * @return
     */
    public String toEditView(){
        //1、接收用户传递的ID
        String id = getRequest().getParameter("id");
        System.out.println(id);
        //2、调用service层，根据ID查询用户信息
        User user = service.searchUserById(id);
        System.out.println(user);
        //3、存入request作用域
        getRequest().setAttribute("user",user);
        //4、请求转发
        return "forward:/user/edit.jsp";
    }
    /**
     * 根据ID查询用户信息
     * @return
     */
    public String searchUserById(){
        //1、接收浏览器发来的用户ID
        String id = getRequest().getParameter("id");
        System.out.println(id);
        //2、调用service层，通过ID查询数据
        User user = service.searchUserById(id);
        System.out.println(user);
        //3、将用户信息存入request作用域
        getRequest().setAttribute("user",user);
        //4、请求转发
        return "forward:/user/view.jsp";
    }
    /**
     * 根据ID删除用户
     * @return
     */
    public String delUser(){
        //1、接收浏览器发来的用户ID
        String id = getRequest().getParameter("id");
        System.out.println(id);
        //2、调用service进行删除
        service.delUser(id);
        //3、重定向到展示列表servlet
        return "redirect:/user?method=list";
    }
    /**
     * 根据条件进行查询
     * 查询指定用户信息
     * @return
     */
    public String searchByParam(){
        //1、接收浏览器发来的查询条件（用户姓名）
        String userName = getRequest().getParameter("userName");
        System.out.println(userName);
        //2、调用service，根据条件，查询用户信息
        List<User> ulist = service.searchByParam(userName);
        System.out.println(ulist);
        //3、将查询结果存入request
        getRequest().setAttribute("ulist",ulist);
        //将查询条件保存
        getRequest().getSession().setAttribute("userName",userName);
        //4、请求转发 /user/list.jsp
        return "forward:/user/list.jsp";
    }
    /**
     * 添加用户信息
     * @return
     */
    public String addUser(){
        //1、接收浏览器发来的表单数据
        User user = toBean(User.class);
        System.out.println(user);
        //2、给用户生成随机ID
        user.setId(UserUtils.getUUID());
        //3、调用service添加用户数据
        boolean result = service.addUser(user);
        System.out.println(result);
        //4、根据添加结果，运行不同的分支
        if(result){
            //添加成功，跳转到 展示所有用户信息的Servlet
            return "redirect:/user?method=list";
        }else{
            //添加失败，保存错误信息，跳转回add.jsp展示
            getRequest().setAttribute("msg","添加失败");
            return "forward:/user/add.jsp";
        }
    }
    /**
     * 查询所有用户信息（用户列表）
     * @return
     */
    public String list(){
        //1、调用service查询用户列表
        List<User> ulist = service.searchAll();
        System.out.println(ulist);
        //2、把用户列表存入request
        getRequest().setAttribute("ulist",ulist);
        //3、请求转发 /user/list.jsp
        return "forward:/user/list.jsp";
    }
}
