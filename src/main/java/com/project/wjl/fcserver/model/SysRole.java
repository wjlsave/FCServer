package com.project.wjl.fcserver.model;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

public class SysRole {
	@Null(message = "增加时不要传id",groups = {AddGroup.class})
	@NotNull(message = "id不可为空",groups = {EditGroup.class})
    private Integer id;

	@NotNull(message = "roleName不可为空",groups = {AddGroup.class,EditGroup.class})
	@Size(message = "roleName的长度超过了50",max = 50,groups = {ParamGroup.class,AddGroup.class,EditGroup.class})
    private String roleName;

	@Size(message = "roleDescription的长度超过了1000",max = 1000,groups = {AddGroup.class,EditGroup.class})
    private String roleDescription;

	@Null(message = "createTime不可传",groups = {AddGroup.class,EditGroup.class})
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription == null ? null : roleDescription.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}