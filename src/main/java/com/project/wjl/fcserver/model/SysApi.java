package com.project.wjl.fcserver.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

public class SysApi {
	@Null(message = "增加时不要传id",groups = {AddGroup.class})
	@NotNull(message = "id不可为空",groups = {EditGroup.class})
    private Integer id;

	@NotNull(message = "account不可为空",groups = {AddGroup.class,EditGroup.class})
	@Size(message = "apiPath的长度超过了100",max = 100,groups = {ParamGroup.class,AddGroup.class,EditGroup.class})
    private String apiPath;

	@Size(message = "apiDescribe的长度超过了1000",max = 1000,groups = {AddGroup.class,EditGroup.class})
    private String apiDescribe;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getApiPath() {
        return apiPath;
    }

    public void setApiPath(String apiPath) {
        this.apiPath = apiPath == null ? null : apiPath.trim();
    }

    public String getApiDescribe() {
        return apiDescribe;
    }

    public void setApiDescribe(String apiDescribe) {
        this.apiDescribe = apiDescribe == null ? null : apiDescribe.trim();
    }
}