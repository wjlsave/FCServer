package com.project.wjl.fcserver.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import com.project.wjl.fcserver.dao.SysResourceMapper;
import com.project.wjl.fcserver.model.SysResource;
import com.project.wjl.fcserver.util.Result;
import com.project.wjl.fcserver.util.TreeUtils;
import com.project.wjl.fcserver.validate.group.AddGroup;

@Service
public class SysResourceService {
	
	@Resource
	private SysResourceMapper sysResourceMapper;
	
	public Result<List<SysResource>> treelist(Result<List<SysResource>> result,SysResource record){
		List<SysResource> sysResources = sysResourceMapper.queryByTree(record);
		List<SysResource> tree = TreeUtils.buildTreeNodes(sysResources, 0l);
		result.setData(tree);
		return result;
	}
	
	public Result<List<SysResource>> getuserresource(Result<List<SysResource>> result,Integer userid){
		List<SysResource> sysResources = sysResourceMapper.selectByUserid(userid);
		List<SysResource> tree = TreeUtils.buildTreeNodes(sysResources, 0l);
		result.setData(tree);
		return result;
	}
	
	public Result<Boolean> add(Result<Boolean> result,@Validated(AddGroup.class)SysResource record){
		sysResourceMapper.insertSelective(record);
		return result;
	}
}
