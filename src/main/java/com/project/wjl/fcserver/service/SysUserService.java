package com.project.wjl.fcserver.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.wjl.fcserver.dao.SysUserMapper;
import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.util.Result;

@Service
public class SysUserService {
	
	@Resource
	private SysUserMapper sysUserMapper;
	
	public Result<PageInfo<SysUser>> pagelist(Result<PageInfo<SysUser>> result,SysUser record,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<SysUser> sysUsers = sysUserMapper.queryByPage(record); 
		PageInfo<SysUser> pageInfo = new PageInfo<SysUser>(sysUsers);
		result.setData(pageInfo);
		return result;
	}
	
	@Transactional
	public Result<Boolean> cut(Result<Boolean> result,Integer id){
		sysUserMapper.deleteByPrimaryKey(id);
		sysUserMapper.deleteRelationByUserid(id);
		return result;
	}
	
	@Transactional
	public Result<Boolean> add(Result<Boolean> result,SysUser record,int[] roleidary){
		SysUser sysUser = sysUserMapper.selectByAccount(record.getAccount());
		if(sysUser!=null) {
			result.errorResult(2003, "账号名已存在");
			return result;
		}
		String password = DigestUtils.md5DigestAsHex(record.getPassword().getBytes());
		record.setPassword(password);
		sysUserMapper.insertSelective(record);
		sysUserMapper.insertRolesBatch(record.getId(), roleidary);
		return result;
	}
	
	@Transactional
	public Result<Boolean> edit(Result<Boolean> result,SysUser record,int[] roleidary){
		SysUser sysUser = sysUserMapper.selectByAccount(record.getAccount());
		if(sysUser!=null&&!sysUser.getId().equals(record.getId())) {
			result.errorResult(2003, "账号名已存在");
			return result;
		}
		String password = DigestUtils.md5DigestAsHex(record.getPassword().getBytes());
		record.setPassword(password);
		sysUserMapper.updateByPrimaryKeySelective(record);
		sysUserMapper.deleteRelationByUserid(record.getId());
		sysUserMapper.insertRolesBatch(record.getId(), roleidary);
		return result;
	}
	
}
