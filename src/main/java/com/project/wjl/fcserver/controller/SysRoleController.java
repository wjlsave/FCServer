package com.project.wjl.fcserver.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.project.wjl.fcserver.model.SysRole;
import com.project.wjl.fcserver.service.SysRoleService;
import com.project.wjl.fcserver.util.Result;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

@RestController
@RequestMapping("SysRole")
@Validated
public class SysRoleController {
	
	@Resource
	private  SysRoleService sysUserService;
	
	@RequestMapping(value = "pagelist",method = RequestMethod.GET)
	public Result<PageInfo<SysRole>> pagelist(Result<PageInfo<SysRole>> result,@Validated(ParamGroup.class)SysRole record,@NotNull(message = "pageNum不能为空")Integer pageNum,@NotNull(message = "pageSize不能为空")Integer pageSize){
		result = sysUserService.pagelist(result, record, pageNum, pageSize);
		return result;
	}
	
	@RequestMapping(value = "cut",method = RequestMethod.POST)
	public Result<Boolean> cut(Result<Boolean> result,@NotNull(message = "id不能为空")Integer id){
		result = sysUserService.cut(result, id);
		return result;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public Result<Boolean> add(HttpServletResponse response,Result<Boolean> result,@Validated(AddGroup.class)SysRole record,@Pattern(message = "resourceids格式不正确",regexp="^[1-9][0-9]*(,[1-9][0-9]*)+$")String resourceids){
		String[] resourceidlist = resourceids.split(",");
		int[] resourceidary = new int[resourceidlist.length];
		try {
			for(int i=0;i<resourceidlist.length;i++) {
				resourceidary[i] = Integer.valueOf(resourceidlist[i]);
			}
		}catch (NumberFormatException e) {
			System.out.print(e);
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			result.errorResult(400, "提交的数据校验失败");
			result.setMsg("resourceid过长");
			return result;
		}
		
		result = sysUserService.add(result, record, resourceidary);
		return result;
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public Result<Boolean> edit(HttpServletResponse response,Result<Boolean> result,@Validated(EditGroup.class)SysRole record,@Pattern(message = "resourceids格式不正确",regexp="^[1-9][0-9]*(,[1-9][0-9]*)+$")String resourceids){
		String[] resourceidlist = resourceids.split(",");
		int[] resourceidary = new int[resourceidlist.length];
		try {
			for(int i=0;i<resourceidlist.length;i++) {
				resourceidary[i] = Integer.valueOf(resourceidlist[i]);
			}
		}catch (NumberFormatException e) {
			System.out.print(e);
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			result.errorResult(400, "提交的数据校验失败");
			result.setMsg("resourceid过长");
			return result;
		}
		return result;
	}
	
}
