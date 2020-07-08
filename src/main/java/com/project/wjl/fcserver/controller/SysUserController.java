package com.project.wjl.fcserver.controller;


import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.service.SysUserService;
import com.project.wjl.fcserver.util.Result;

@RestController
@RequestMapping("SysUser")
public class SysUserController {
	
	@Resource
	private  SysUserService sysUserService;
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping(value = "pagelist",method = RequestMethod.GET)
	public Result<PageInfo<SysUser>> pagelist(Result<PageInfo<SysUser>> result,SysUser record,int pageNum,int pageSize){
		result = sysUserService.pagelist(result, record, pageNum, pageSize);
		return result;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping(value = "cut",method = RequestMethod.POST)
	public Result<Boolean> cut(Result<Boolean> result,Integer id){
		
		return result;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public Result<Boolean> add(Result<Boolean> result,SysUser record,String roleids){
		String[] roleidlist = roleids.split(",");
		int[] roleidary = new int[roleidlist.length];
		try {
			for(int i=0;i<roleidlist.length;i++) {
				roleidary[i] = Integer.valueOf(roleidlist[i]);
			}
		}catch (Exception e) {
			System.out.print(e);
			result.errorResult(2004, "roleids格式错误");
		}
		result = sysUserService.add(result, record, roleidary);
		return result;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public Result<Boolean> edit(Result<Boolean> result,SysUser record,String roleids){
		String[] roleidlist = roleids.split(",");
		int[] roleidary = new int[roleidlist.length];
		try {
			for(int i=0;i<roleidlist.length;i++) {
				roleidary[i] = Integer.valueOf(roleidlist[i]);
			}
		}catch (Exception e) {
			System.out.print(e);
			result.errorResult(2004, "roleids格式错误");
		}
		result = sysUserService.edit(result, record, roleidary);
		return result;
	}
	
}
