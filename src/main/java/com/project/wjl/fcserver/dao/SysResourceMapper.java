package com.project.wjl.fcserver.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.wjl.fcserver.model.SysResource;

@Mapper
public interface SysResourceMapper {
	
	List<SysResource> queryByTree(SysResource record);
	
	List<SysResource> selectByUserid(Integer userid);
	
    int deleteByPrimaryKey(Integer id);

    int insert(SysResource record);

    int insertSelective(SysResource record);

    SysResource selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysResource record);

    int updateByPrimaryKey(SysResource record);
}