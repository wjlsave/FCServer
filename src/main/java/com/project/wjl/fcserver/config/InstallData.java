package com.project.wjl.fcserver.config;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.project.wjl.fcserver.model.SysApi;
import com.project.wjl.fcserver.service.SysApiService;

@Component
public class InstallData {
	
	@Resource
	private RedisTemplate<String, Serializable> redisTemplate;
	
	@Resource
	private  SysApiService sysApiService;

	@PostConstruct
	public void initApis() {
		Set<String> keys = redisTemplate.keys("API_PATH_*");
        if (!CollectionUtils.isEmpty(keys)) {
            redisTemplate.delete(keys);
        }
        List<SysApi> apis = sysApiService.selectAllApis();
        for(SysApi api:apis) {
        	redisTemplate.opsForValue().set("API_PATH_"+api.getApiPath(),api.getApiDescribe());
        }
	}
}
