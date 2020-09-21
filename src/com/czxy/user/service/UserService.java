package com.czxy.user.service;

import com.czxy.user.dao.UserDao;
import com.czxy.user.domain.User;

import java.util.Iterator;
import java.util.List;

/**
 * Created by xps13 on 2019/4/3.
 */
public class UserService {
    //每个service方法需要调用dao
    //static 共享。会出现线程安全问题，一个请求一个线程
    private UserDao dao = new UserDao();

    /**
     * 查询所有用户信息
     * @return 用户信息列表
     */
    public List<User> searchAll() {
        //调用Dao层，查询所有数据并返回
        return dao.searchAll();
    }

    /**
     * 添加用户数据
     * @param user 待添加的用户信息
     * @return  添加结果（true添加成功，false添加失败）
     */
    public boolean addUser(User user) {
        try {
            //1、调用Dao方法，保存用户数据
            dao.addUser(user);
            //2、添加结束后，没有出现任何异常，说明添加成功
            return true;
        } catch (Exception e) {
            //抛了异常，说明dao方法出问题，添加失败
            return false;
        }
    }

    /**
     * 根据条件查询用户信息
     * 查询指定用户信息
     * @param userName  查询条件
     * @return  查询结果
     */
    public List<User> searchByParam(String userName) {
        //1、查询所有用户信息，list集合
        List<User> ulist = dao.searchAll();
        //2、遍历list集合，删掉不符合要求的数据
        if(ulist!=null){
            //迭代器
            Iterator<User> it = ulist.iterator();
            while(it.hasNext()){
                User user = it.next();
                //判断：如果当前用户的用户名 不包含 查询条件 ,删掉
                if(user.getUserName()!=null && !user.getUserName().contains(userName)){
                    it.remove();
                }
            }
        }
        //3、返回list集合
        return ulist;
    }

    /**
     * 根据ID删除用户
     * @param id 待删除用户的ID
     */
    public void delUser(String id) {
        //方式一：可以用迭代器删除  效率高

        //方式二：用List集合自带的remove  ，更方便，效率一般
        //1、查询所有用户数据，List
        List<User> ulist = dao.searchAll();
        System.out.println(ulist);
        //2、从集合中删除用户
        if(id!=null && ulist!=null){
            //删除
            ulist.remove(new User(id));
        }
        System.out.println(ulist);
        //3、以覆盖方式写回xml
        dao.writeOver(ulist);
    }

    /**
     * 根据ID查询用户信息
     * @param id
     * @return
     */
    public User searchUserById(String id) {
        //1、查询所有用户信息，List
        List<User> ulist = dao.searchAll();
        //2、遍历集合，通过ID查询用户
        if(id!=null && ulist!=null){
            for (User user : ulist) {
                if(user.getId().equals(id)){
                    return user;
                }
            }
        }
//        return new User();  为了避免空指针异常，建议可以new一个对象返回
        return null;
    }

    /**
     * 修改用户
     * @param user  待修改的用户信息
     */
    public void modifyUser(User user) {
        //1、查询所有用户信息
        List<User> ulist = dao.searchAll();
        //2、删除旧信息(User重写 hashCode和equals，针对id)
        ulist.remove(user);
        //3、追加新信息
        ulist.add(user);
        //4、以覆盖方式写回XML
        dao.writeOver(ulist);
    }

    /**
     * 用户登录
     * @param user 保存用户名和密码的对象
     * @return      查询到的用户信息
     */
    public User login(User user) {
        //1、查询到所有用户信息,List
        List<User> ulist = dao.searchAll();
        //2、遍历List，判断：用户名和密码都相同，返回找到的用户
        if(ulist!=null){
            for (User u : ulist) {
                if(u.getLoginName().equals(user.getLoginName())
                        && u.getLoginPwd().equals(user.getLoginPwd())){
                    return u;
                }
            }
        }
        //3、如果遍历完List都找不到用户，返回null
        return null;
    }
}
