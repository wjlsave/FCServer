package com.project.wjl.fcserver.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.wjl.fcserver.model.SysUser;

@Mapper
public interface SysUserMapper {
	
	SysUser selectByAccount(String account);
	
    int deleteByPrimaryKey(Integer id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
}