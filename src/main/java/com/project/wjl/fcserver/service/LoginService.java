package com.project.wjl.fcserver.service;

import java.io.Serializable;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.project.wjl.fcserver.dao.SysUserMapper;
import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.util.Result;

@Service
public class LoginService {
	
	@Resource
	private SysUserMapper sysUserMapper;
	
	@Resource
	private RedisTemplate<String, Serializable> redisTemplate;
	
	public Result<String> login(Result<String> result,String account,String password){
		SysUser sysUser = sysUserMapper.selectByAccount(account);
		if(sysUser == null||sysUser.getState()== 9||!DigestUtils.md5DigestAsHex(password.getBytes()).equals(sysUser.getPassword())) {
			result.errorResult(2001, "账号或密码错误");
		}else if(sysUser.getState()!= 1){
			result.errorResult(2002, "您的账户已被停用");
		}else {
			String token = UUID.randomUUID().toString();
			result.setData(token);
			redisTemplate.opsForValue().set("USER_"+token, sysUser, 60 * 10, TimeUnit.SECONDS);
		}
		return result;
	}
	
}
