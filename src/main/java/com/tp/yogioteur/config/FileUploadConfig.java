package com.tp.yogioteur.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileUploadConfig {
	
	// 파일 첨부할 때 필요한 Bean
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024);  // 하나당 최대 10MB
		multipartResolver.setMaxUploadSize(50 * 1024 * 1024);         // 전체 최대 50MB
		return multipartResolver;
	}
	
}
