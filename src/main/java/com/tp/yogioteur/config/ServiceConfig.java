package com.tp.yogioteur.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import com.tp.yogioteur.service.OpenAPIService;
import com.tp.yogioteur.service.VilageFcstInfoService;

@Configuration
@Component
public class ServiceConfig {
	
//	@Bean
//	public RoomService roomService() {
//		return new RoomServiceImpl();
//	}
	
//	@Bean
//	public NonMemberService nonMemberSerivce() {
//		return new NonMemberServiceImpl();
//	}
	
	@Bean
	public OpenAPIService openAPIService() {
		return new VilageFcstInfoService();
	}
	
}
