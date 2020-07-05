package com.project.wjl.fcserver.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.service.SysUserService;
import com.project.wjl.fcserver.util.Result;

@RestController
public class SystemUserController {
	
	@Resource
	private SysUserService sysUserService;

	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping("login")
	public Result<String> login(Result<String> result,String account,String password){
		result = sysUserService.login(result, account, password);
		return result;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping("getuserinfo")
	public Result<SysUser> getUserinfo(Result<SysUser> result,HttpServletRequest request){
		SysUser sysUser = (SysUser)request.getAttribute("sysUser");
		result.setData(sysUser);
 		return result;
	}
}
