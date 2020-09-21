package com.czxy.utils.web.servlet;

import cn.itcast.servlet.BaseServlet;

import java.io.IOException;

/**
 * Created by xps13 on 2019/4/9.
 */
public class UtilsServlet extends BaseServlet {

    /**
     * 生成验证码图片（带答案）
     * @return
     */
    public String vc() throws IOException {
        //1、生成验证码
        String vci = createVerifyCodeImage();
        //2、向session中存验证码答案
        System.out.println(vci);
        getRequest().getSession().setAttribute("vci",vci);
        return null;
    }
}
