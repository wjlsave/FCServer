package com.project.wjl.fcserver.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.wjl.fcserver.dao.SysApiMapper;
import com.project.wjl.fcserver.model.SysApi;
import com.project.wjl.fcserver.util.Result;

@Service
public class SysApiService {
	
	@Resource
	private SysApiMapper sysApiMapper;
	
	public Result<PageInfo<SysApi>> pagelist(Result<PageInfo<SysApi>> result,SysApi record,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<SysApi> sysApis = sysApiMapper.queryByPage(record); 
		PageInfo<SysApi> pageInfo = new PageInfo<SysApi>(sysApis);
		result.setData(pageInfo);
		return result;
	}
	
	public Result<SysApi> detail(Result<SysApi> result,Integer id){
		SysApi sysApi = sysApiMapper.selectByPrimaryKey(id);
		if(sysApi==null) {
			result.errorResult(5004, "系统无此记录");
			return result;
		}
		result.setData(sysApi);
		return result;
	}
	
	public Result<Boolean> cut(Result<Boolean> result,Integer id){
		sysApiMapper.deleteByPrimaryKey(id);
		return result;
	}
	
	public Result<Boolean> add(Result<Boolean> result,SysApi record){
		sysApiMapper.insertSelective(record);
		return result;
	}
	
	public Result<Boolean> edit(Result<Boolean> result,SysApi record){
		sysApiMapper.updateByPrimaryKeySelective(record);
		return result;
	}
	
}
