package com.czxy.user.utils;

import java.util.UUID;

/**
 * Created by xps13 on 2019/4/4.
 */
public class UserUtils {
    public static void main(String[] args) {
        String s = UUID.randomUUID().toString();
        System.out.println(s);//363e4326-51c1-4491-990d-74d2fb0e46f7
        System.out.println(s.length());//36
        //32位
        System.out.println(s.replaceAll("-",""));
    }

    /**
     * 生成随机ID（32位）
     * @return 随机ID
     */
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
