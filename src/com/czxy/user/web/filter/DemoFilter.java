package com.czxy.user.web.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by xps13 on 2019/4/9.
 */
public class DemoFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest hsr = (HttpServletRequest) req;
        String remoteAddr = hsr.getRemoteAddr();//0:0:0:0:0:0:0:1
        if("0:0:0:0:0:0:0:1".equals(remoteAddr)){
            chain.doFilter(req, resp);
        }else{
            System.err.println("拦截到来自 "+remoteAddr+" 的非法操作");
            resp.setCharacterEncoding("utf-8");
            resp.getWriter().write("<body id='b1' bgcolor='red'><h1 align='center'>认真听课！你的IP已经被记录！</h1></body>");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
