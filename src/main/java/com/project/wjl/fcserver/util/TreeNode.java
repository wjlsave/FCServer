package com.project.wjl.fcserver.util;

import java.util.List;

public class TreeNode {
	protected Long id;
	 
    protected Long parentId;
 
    public List<TreeNode> children;
 
    public Long getId() {
        return id;
    }
 
    public void setId(Long id) {
        this.id = id;
    }
 
    public Long getParentId() {
        return parentId;
    }
 
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
 
    public List<TreeNode> getChildren() {
        return children;
    }
 
    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }
 
}
