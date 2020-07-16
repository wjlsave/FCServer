package com.project.wjl.fcserver.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import com.project.wjl.fcserver.util.TreeNode;
import com.project.wjl.fcserver.validate.annotation.IsState;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

public class SysResource extends TreeNode{
	
	@Null(message = "增加时不要传id",groups = {AddGroup.class})
	@NotNull(message = "id不可为空",groups = {EditGroup.class})
    private Long id;

	@Size(message = "iconClass的长度超过了100",max = 100,groups = {AddGroup.class,EditGroup.class})
    private String iconClass;

    @NotNull(message = "resourceName不可为空",groups = {AddGroup.class,EditGroup.class})
	@Size(message = "resourceName的长度超过了50",max = 50,groups = {ParamGroup.class,AddGroup.class,EditGroup.class})
    private String resourceName;

    @NotNull(message = "path不可为空",groups = {AddGroup.class,EditGroup.class})
    @Size(message = "path的长度超过了200",max = 200,groups = {AddGroup.class,EditGroup.class})
    private String path;

    @NotNull(message = "parentId不可为空",groups = {AddGroup.class})
    private Long parentId;

    @NotNull(message = "type不可为空",groups = {AddGroup.class,EditGroup.class})
    @IsState(values= {"1","2"},message = "type格式不正确",groups = {AddGroup.class,EditGroup.class})
    private Integer type;

    private Integer sort;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIconClass() {
		return iconClass;
	}

	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

    
}