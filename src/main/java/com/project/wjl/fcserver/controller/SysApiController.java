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
import com.project.wjl.fcserver.model.SysApi;
import com.project.wjl.fcserver.service.SysApiService;
import com.project.wjl.fcserver.util.Result;
import com.project.wjl.fcserver.validate.group.AddGroup;
import com.project.wjl.fcserver.validate.group.EditGroup;
import com.project.wjl.fcserver.validate.group.ParamGroup;

@RestController
@RequestMapping("SysApi")
@Validated
public class SysApiController {
	
	@Resource
	private  SysApiService sysApiService;
	
	@RequestMapping(value = "pagelist",method = RequestMethod.GET)
	public Result<PageInfo<SysApi>> pagelist(Result<PageInfo<SysApi>> result,@Validated(ParamGroup.class)SysApi record,@NotNull(message = "pageNum不能为空")Integer pageNum,@NotNull(message = "pageSize不能为空")Integer pageSize){
		result = sysApiService.pagelist(result, record, pageNum, pageSize);
		return result;
	}
	
	@RequestMapping(value = "detail",method = RequestMethod.GET)
	public Result<SysApi> detail(Result<SysApi> result,@NotNull(message = "id不能为空")Integer id){
		result = sysApiService.detail(result, id);
		return result;
	}
	
	@RequestMapping(value = "cut",method = RequestMethod.POST)
	public Result<Boolean> cut(Result<Boolean> result,@NotNull(message = "id不能为空")Integer id){
		result = sysApiService.cut(result, id);
		return result;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public Result<Boolean> add(HttpServletResponse response,Result<Boolean> result,@Validated(AddGroup.class)SysApi record){
		result = sysApiService.add(result, record);
		return result;
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public Result<Boolean> edit(HttpServletResponse response,Result<Boolean> result,@Validated(EditGroup.class)SysApi record){
		result = sysApiService.edit(result, record);
		return result;
	}
}
