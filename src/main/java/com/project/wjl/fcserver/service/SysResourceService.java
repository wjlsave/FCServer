package com.project.wjl.fcserver.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public List<SysResource> getuserresource(Integer userid){
		List<SysResource> sysResources = sysResourceMapper.selectByUserid(userid);
		List<SysResource> tree = TreeUtils.buildTreeNodes(sysResources, 0l);
		return tree;
	}
	
	public Result<List<Integer>> getresourceapis(Result<List<Integer>> result,Integer resourceid){
		List<Integer> apis = sysResourceMapper.selectApilistByResourceid(resourceid);
		result.setData(apis);
		return result;
	}
	
	public Result<SysResource> detail(Result<SysResource> result,Integer id){
		SysResource sysResource = sysResourceMapper.selectByPrimaryKey(id);
		if(sysResource==null) {
			result.errorResult(4004, "系统无此记录");
			return result;
		}
		result.setData(sysResource);
		return result;
	}
	
	@Transactional
	public Result<Boolean> cut(Result<Boolean> result,Integer id){
		sysResourceMapper.deleteByPrimaryKey(id);
		//sysUserMapper.deleteRelationByUserid(id);
		return result;
	}
	
	public Result<Boolean> add(Result<Boolean> result,SysResource record){
		SysResource sysResource = sysResourceMapper.selectByPrimaryKey(record.getParentId().intValue());
		if(sysResource==null) {
			result.errorResult(4001, "父节点不存在");
			return result;
		}
		if(sysResource.getType()==2) {
			result.errorResult(4002, "父节点不可以是按钮");
			return result;
		}
		sysResourceMapper.insertSelective(record);
		return result;
	}
	
	public Result<Boolean> edit(Result<Boolean> result,SysResource record){
		sysResourceMapper.updateByPrimaryKeySelective(record);
		return result;
	}
	
	@Transactional
	public Result<Boolean> setapis(Result<Boolean> result,Integer resourceid,int[] apiary){
		sysResourceMapper.deleteRelationByResourceid(resourceid);
		if(apiary.length>0) {
			sysResourceMapper.insertApisBatch(resourceid, apiary);
		}
		return result;
	}
	
	public Result<Boolean> treedrag(Result<Boolean> result,Integer parentid,int[] childrenids){
		SysResource sysResource = sysResourceMapper.selectByPrimaryKey(parentid);
		if(sysResource==null) {
			result.errorResult(4001, "父节点不存在");
			return result;
		}
		if(sysResource.getType()==2) {
			result.errorResult(4002, "父节点不可以是按钮");
			return result;
		}
		sysResourceMapper.updateByChildrenIds(childrenids, parentid);
		return result;
	}
}
