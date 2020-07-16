package com.project.wjl.fcserver.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.wjl.fcserver.model.SysResource;

@Mapper
public interface SysResourceMapper {
    

    SysResource selectByPrimaryKey(Integer id);
    
    List<SysResource> selectByUserid(Integer userid);
    
    List<Integer> selectApilistByResourceid(Integer resourceid);

    List<SysResource> queryByTree(SysResource record);
    
    int deleteByPrimaryKey(Integer id);
    
    int deleteRelationByResourceid(Integer resourceid);

    int insertSelective(SysResource record);
    
    int insertApisBatch(@Param("resourceid")Integer resourceid,@Param("apilist")int[] apilist);

    int updateByPrimaryKeySelective(SysResource record);
    
    int updateByChildrenIds(@Param("childrenids")int[] childrenids,@Param("parentid")Integer parentid);
}