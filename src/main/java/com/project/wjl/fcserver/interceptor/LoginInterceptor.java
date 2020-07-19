package com.project.wjl.fcserver.interceptor;

import java.io.Serializable;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.project.wjl.fcserver.model.SysUser;
import com.project.wjl.fcserver.util.Result;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {
	
	@Resource
	private RedisTemplate<String, Serializable> redisTemplate;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getMethod().equals("OPTIONS")) {
			response.setStatus(HttpServletResponse.SC_OK);
		    return true;
		}
		String token = request.getHeader("Authorization");
		if(token == null || token.isEmpty()||!redisTemplate.hasKey("USER_"+token)) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return false;
		}
		String apiPath = request.getServletPath();
		if(apiPath.equals("//loginOut")) {
			redisTemplate.delete("USER_"+token);
			return true;
		}
		SysUser sysUser = (SysUser)redisTemplate.opsForValue().get("USER_"+token);
		if(redisTemplate.hasKey("API_PATH_"+apiPath)&&!sysUser.getApis().contains(apiPath)) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return false;
		}
		redisTemplate.expire("USER_"+token, 60 * 60 *24, TimeUnit.SECONDS);
		request.setAttribute("sysUser", sysUser);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
