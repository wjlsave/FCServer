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
import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.service.SysUserService;
import com.project.wjl.fcserver.util.Result;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

@RestController
@RequestMapping("SysUser")
@Validated
public class SysUserController {
	
	@Resource
	private  SysUserService sysUserService;
	
	@RequestMapping(value = "pagelist",method = RequestMethod.GET)
	public Result<PageInfo<SysUser>> pagelist(Result<PageInfo<SysUser>> result,@Validated(ParamGroup.class)SysUser record,@NotNull(message = "pageNum不能为空")Integer pageNum,@NotNull(message = "pageSize不能为空")Integer pageSize){
		result = sysUserService.pagelist(result, record, pageNum, pageSize);
		return result;
	}
	
	@RequestMapping(value = "detail",method = RequestMethod.GET)
	public Result<SysUser> detail(Result<SysUser> result,@NotNull(message = "id不能为空")Integer id){
		result = sysUserService.detail(result, id);
		return result;
	}
	
	@RequestMapping(value = "cut",method = RequestMethod.POST)
	public Result<Boolean> cut(Result<Boolean> result,@NotNull(message = "id不能为空")Integer id){
		result = sysUserService.cut(result, id);
		return result;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public Result<Boolean> add(HttpServletResponse response,Result<Boolean> result,@Validated(AddGroup.class)SysUser record,@Pattern(message = "roleids格式不正确",regexp="^[1-9][0-9]*(,[1-9][0-9]*)*$")String roleids){
		String[] roleidlist = {};
		if(roleids!=null) {
			roleidlist = roleids.split(",");
		}
		int[] roleidary = new int[roleidlist.length];
		try {
			for(int i=0;i<roleidlist.length;i++) {
				roleidary[i] = Integer.valueOf(roleidlist[i]);
			}
		}catch (NumberFormatException e) {
			System.out.print(e);
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			result.errorResult(400, "提交的数据校验失败");
			result.setMsg("roleid过长");
			return result;
		}
		
		result = sysUserService.add(result, record, roleidary);
		return result;
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public Result<Boolean> edit(HttpServletResponse response,Result<Boolean> result,@Validated(EditGroup.class)SysUser record,@Pattern(message = "roleids格式不正确",regexp="^[1-9][0-9]*(,[1-9][0-9]*)*$")String roleids){
		String[] roleidlist = {};
		if(roleids!=null) {
			roleidlist = roleids.split(",");
		}
		int[] roleidary = new int[roleidlist.length];
		try {
			for(int i=0;i<roleidlist.length;i++) {
				roleidary[i] = Integer.valueOf(roleidlist[i]);
			}
		}catch (NumberFormatException e) {
			System.out.print(e);
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			result.errorResult(400, "提交的数据校验失败");
			result.setMsg("roleid过长");
			return result;
		}
		result = sysUserService.edit(result, record, roleidary);
		return result;
	}
	
	@RequestMapping(value = "resetpassword",method = RequestMethod.POST)
	public Result<Boolean> resetpassword(Result<Boolean> result,@NotNull(message = "id不能为空")Integer id){
		result = sysUserService.resetpassword(result, id);
		return result;
	}
	
}
