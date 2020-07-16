package com.project.wjl.fcserver.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.wjl.fcserver.model.SysResource;

@Mapper
public interface SysResourceMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(SysResource record);

    SysResource selectByPrimaryKey(Integer id);
    
    List<SysResource> selectByUserid(Integer userid);

    List<SysResource> queryByTree(SysResource record);

    int updateByPrimaryKeySelective(SysResource record);
    
    int updateByChildrenIds(@Param("childrenids")int[] childrenids,@Param("parentid")Integer parentid);
}