package com.project.wjl.fcserver.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.wjl.fcserver.util.Result;

@RestController
public class SystemUserController {

	@RequestMapping("login1")
	public Result<String> login(Result<String> result){
		return result;
	}
}
