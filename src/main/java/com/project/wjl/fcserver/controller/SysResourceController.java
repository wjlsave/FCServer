package com.project.wjl.fcserver.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.wjl.fcserver.model.SysResource;
import com.project.wjl.fcserver.service.SysResourceService;
import com.project.wjl.fcserver.util.Result;
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
	
}
