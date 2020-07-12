package com.project.wjl.fcserver.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.wjl.fcserver.model.SysRole;

@Mapper
public interface SysRoleMapper {
	
	SysRole selectByPrimaryKey(Integer id);
	
	int selectByRoleid(Integer roleid);
	
	List<Integer> selectResourcelistByRoleid(Integer roleid);
	
	List<SysRole> queryByPage(SysRole record); 
	 
    int deleteByPrimaryKey(Integer id);
    
    int deleteRelationByRoleid(Integer roleid);

    int insertSelective(SysRole record);
    
    int insertResourcesBatch(@Param("roleid")Integer roleid,@Param("resourceidlist")int[] resourceidlist);

    int updateByPrimaryKeySelective(SysRole record);

}