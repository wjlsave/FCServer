package com.project.wjl.fcserver.model;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.project.wjl.fcserver.validate.annotation.IsState;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

public class SysUser implements Serializable{
  
	private static final long serialVersionUID = 1L;

	@Null(message = "增加时不要传id",groups = {AddGroup.class})
	@NotNull(message = "id不可为空",groups = {EditGroup.class})
	private Integer id;

	@NotNull(message = "account不可为空",groups = {AddGroup.class,EditGroup.class})
	@Size(message = "account的长度超过了50",max = 50,groups = {ParamGroup.class,AddGroup.class,EditGroup.class})
    private String account;

    @NotNull(message = "userName不可为空",groups = {AddGroup.class,EditGroup.class})
    @Size(message = "userName的长度超过了50",max = 50,groups = {ParamGroup.class,AddGroup.class,EditGroup.class})
    private String userName;

    @Size(message = "password的长度超过了100",max = 100,groups = {AddGroup.class,EditGroup.class})
    private String password;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date lastLoginTime;

    @IsState(groups = {ParamGroup.class,AddGroup.class,EditGroup.class})
    private Integer state;

    @Null(message = "createTime不可传",groups = {AddGroup.class,EditGroup.class})
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}