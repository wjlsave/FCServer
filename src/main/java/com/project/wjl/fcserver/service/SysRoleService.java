package com.project.wjl.fcserver.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.wjl.fcserver.dao.SysRoleMapper;
import com.project.wjl.fcserver.model.SysRole;
import com.project.wjl.fcserver.util.Result;

@Service
public class SysRoleService {
	
	@Resource
	private SysRoleMapper sysRoleMapper;
	
	public Result<PageInfo<SysRole>> pagelist(Result<PageInfo<SysRole>> result,SysRole record,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<SysRole> sysRoles = sysRoleMapper.queryByPage(record); 
		PageInfo<SysRole> pageInfo = new PageInfo<SysRole>(sysRoles);
		result.setData(pageInfo);
		return result;
	}
	
	@Transactional
	public Result<Boolean> cut(Result<Boolean> result,Integer id){
		if(sysRoleMapper.selectByRoleid(id)>0) {
			result.errorResult(3001, "该角色关联了用户,无法删除");
		}
		sysRoleMapper.deleteByPrimaryKey(id);
		sysRoleMapper.deleteRelationByRoleid(id);
		return result;
	}
	
	@Transactional
	public Result<Boolean> add(Result<Boolean> result,SysRole record,int[] roleidary){
		sysRoleMapper.insertSelective(record);
		sysRoleMapper.insertResourcesBatch(record.getId(), roleidary);
		return result;
	}
	
	@Transactional
	public Result<Boolean> edit(Result<Boolean> result,SysRole record,int[] roleidary){
		sysRoleMapper.updateByPrimaryKeySelective(record);
		sysRoleMapper.deleteRelationByRoleid(record.getId());
		sysRoleMapper.insertResourcesBatch(record.getId(), roleidary);
		return result;
	}
	
}
