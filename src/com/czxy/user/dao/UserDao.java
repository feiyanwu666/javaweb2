package com.czxy.user.dao;

import cn.itcast.xml.XmlUtils;
import com.czxy.user.domain.User;

import java.util.List;

/**
 * Created by xps13 on 2019/4/3.
 */
public class UserDao {
    //每个Dao方法，都需要一个XML文件的路径。 数据库文件路径
    private static final String DATABASE_PATH="D:\\ums56.xml";

    /**
     * 从XML上查询所有用户信息
     * @return 用户信息列表
     */
    public List<User> searchAll() {
        //从XML上查询所有用户信息并返回
        return XmlUtils.readAll(DATABASE_PATH,User.class);
    }

    /**
     * 向XML中追加一条用户信息
     * @param user  待追加的用户信息
     */
    public void addUser(User user) {
        XmlUtils.write(DATABASE_PATH,user,true);
    }

    /**
     * 以覆盖方式写入XML
     * @param ulist 待写入的数据
     */
    public void writeOver(List<User> ulist) {
        XmlUtils.write(DATABASE_PATH,ulist,false);
    }
}
