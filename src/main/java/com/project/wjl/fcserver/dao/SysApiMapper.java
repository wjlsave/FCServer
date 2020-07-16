package com.project.wjl.fcserver.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.wjl.fcserver.model.SysApi;

@Mapper
public interface SysApiMapper {

    SysApi selectByPrimaryKey(Integer id);
    
    List<SysApi> queryByPage(SysApi record); 
    
    int deleteByPrimaryKey(Integer id);

    int insertSelective(SysApi record);

    int updateByPrimaryKeySelective(SysApi record);

}