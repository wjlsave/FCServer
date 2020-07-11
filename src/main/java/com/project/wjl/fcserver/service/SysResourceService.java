package com.project.wjl.fcserver.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.project.wjl.fcserver.dao.SysResourceMapper;
import com.project.wjl.fcserver.model.SysResource;
import com.project.wjl.fcserver.util.Result;
import com.project.wjl.fcserver.util.TreeUtils;

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
}
