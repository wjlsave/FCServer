package com.project.wjl.fcserver.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.service.LoginService;
import com.project.wjl.fcserver.util.Result;

@RestController
public class LoginController {

	@Resource
	private LoginService loginService;

	@RequestMapping("login")
	public Result<String> login(Result<String> result,String account,String password){
		result = loginService.login(result, account, password);
		return result;
	}
	
	@RequestMapping("loginOut")
	public Result<Boolean> getUserinfo(Result<Boolean> result){
 		return result;
	}
}
