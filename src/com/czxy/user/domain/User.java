package com.czxy.user.domain;

import java.io.Serializable;
import java.util.Arrays;

/**
 * Created by xps13 on 2019/4/3.
 */
public class User implements Serializable {
    /**用户ID---唯一标识*/
    private String id;
    /**用户类型/权限*/
    private String utype;
    /**生日*/
    private String birthday;
    /**学历*/
    private String education;
    /**爱好*/
    private String[] interest;
    /**登录名*/
    private String loginName;
    /**登录密码*/
    private String loginPwd;
    /**备注*/
    private String remark;
    /**性别*/
    private String sex;
    /**电话号码*/
    private String telephone;
    /**用户名称*/
    private String userName;

    public User(String id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        return id != null ? id.equals(user.id) : user.id == null;
    }
    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", utype='" + utype + '\'' +
                ", birthday='" + birthday + '\'' +
                ", education='" + education + '\'' +
                ", interest=" + Arrays.toString(interest) +
                ", loginName='" + loginName + '\'' +
                ", loginPwd='" + loginPwd + '\'' +
                ", remark='" + remark + '\'' +
                ", sex='" + sex + '\'' +
                ", telephone='" + telephone + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }

    public User(String id, String utype, String birthday, String education, String[] interest, String loginName, String loginPwd, String remark, String sex, String telephone, String userName) {
        this.id = id;
        this.utype = utype;
        this.birthday = birthday;
        this.education = education;
        this.interest = interest;
        this.loginName = loginName;
        this.loginPwd = loginPwd;
        this.remark = remark;
        this.sex = sex;
        this.telephone = telephone;
        this.userName = userName;
    }

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUtype() {
        return utype;
    }

    public void setUtype(String utype) {
        this.utype = utype;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String[] getInterest() {
        return interest;
    }

    public void setInterest(String[] interest) {
        this.interest = interest;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
