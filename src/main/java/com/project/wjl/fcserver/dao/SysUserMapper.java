package com.project.wjl.fcserver.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.wjl.fcserver.model.SysUser;

@Mapper
public interface SysUserMapper {
	    
    SysUser selectByPrimaryKey(Integer id);
    
    SysUser selectByAccount(String account);
    
    List<SysUser> queryByPage(SysUser record); 
    
    int deleteByPrimaryKey(Integer id);
    
    int deleteRelationByUserid(Integer userid);
	
	int insertSelective(SysUser record);
	
	int insertRolesBatch(@Param("userid")Integer userid,@Param("roleidlist")int[] roleidlist);
	
	int updateByPrimaryKeySelective(SysUser record);
    
}