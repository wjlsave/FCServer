package com.project.wjl.fcserver.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.wjl.fcserver.model.SysResource;
import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.service.SysResourceService;
import com.project.wjl.fcserver.util.Result;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

@RestController
@RequestMapping("SysResource")
@Validated
public class SysResourceController {
	
	@Resource
	private SysResourceService sysResourceService;
	
	@RequestMapping(value = "treelist",method = RequestMethod.GET)
	public Result<List<SysResource>> treelist(Result<List<SysResource>> result,@Validated(ParamGroup.class)SysResource record){
		result = sysResourceService.treelist(result, record);
		return result;
	}
	
	@RequestMapping(value = "getuserresource",method = RequestMethod.GET)
	public Result<Map<String,Object>> getuserresource(HttpServletRequest request,Result<Map<String,Object>> result){
		SysUser sysUser = (SysUser)request.getAttribute("sysUser");
		List<SysResource> sysResources = sysResourceService.getuserresource(sysUser.getId());
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("sysUser", sysUser);
		map.put("sysResources", sysResources);
		result.setData(map);
		return result;
	}
	
	@RequestMapping(value = "detail",method = RequestMethod.GET)
	public Result<SysResource> detail(Result<SysResource> result,@NotNull(message = "id不能为空")Integer id){
		result = sysResourceService.detail(result, id);
		return result;
	}
	
	@RequestMapping(value = "getresourceapis",method = RequestMethod.GET)
	public Result<List<Integer>> getresourceapis(Result<List<Integer>> result,@NotNull(message = "id不能为空")Integer id){
		result = sysResourceService.getresourceapis(result, id);
		return result;
	}
	
	@RequestMapping(value = "cut",method = RequestMethod.POST)
	public Result<Boolean> cut(Result<Boolean> result,@NotNull(message = "id不能为空")Integer id){
		result = sysResourceService.cut(result, id);
		return result;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public Result<Boolean> add(Result<Boolean> result,@Validated(AddGroup.class)SysResource record){
		result = sysResourceService.add(result, record);
		return result;
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public Result<Boolean> edit(Result<Boolean> result,@Validated(EditGroup.class)SysResource record){
		result = sysResourceService.edit(result, record);
		return result;
	}
	
	@RequestMapping(value = "treedrag",method = RequestMethod.POST)
	public Result<Boolean> treedrag(HttpServletResponse response,Result<Boolean> result,@NotNull(message = "parentid不能为空")Integer parentid,@Pattern(message = "childrenids格式不正确",regexp="^([1-9][0-9]*(,[1-9][0-9]*)*)*$")String childrenids){
		String[] childrenidlist = {};
		if(childrenids!=null&&!childrenids.equals("")) {
			childrenidlist = childrenids.split(",");
		}
		int[] childrenary = new int[childrenidlist.length];
		try {
			for(int i=0;i<childrenidlist.length;i++) {
				childrenary[i] = Integer.valueOf(childrenidlist[i]);
			}
		}catch (NumberFormatException e) {
			System.out.print(e);
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			result.errorResult(400, "提交的数据校验失败");
			result.setMsg("childrenid过长");
			return result;
		}
		sysResourceService.treedrag(result, parentid, childrenary);
		return result;
	}
	
	@RequestMapping(value = "setapis",method = RequestMethod.POST)
	public Result<Boolean> setapis(HttpServletResponse response,Result<Boolean> result,@NotNull(message = "id不能为空")Integer id,@Pattern(message = "apiids格式不正确",regexp="^([1-9][0-9]*(,[1-9][0-9]*)*)*$")String apiids){
		String[] apilist = {};
		if(apiids!=null&&!apiids.equals("")) {
			apilist = apiids.split(",");
		}
		int[] apiidary = new int[apilist.length];
		try {
			for(int i=0;i<apilist.length;i++) {
				apiidary[i] = Integer.valueOf(apilist[i]);
			}
		}catch (NumberFormatException e) {
			System.out.print(e);
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			result.errorResult(400, "提交的数据校验失败");
			result.setMsg("apiid过长");
			return result;
		}
		sysResourceService.setapis(result, id, apiidary);
		return result;
	}
}
