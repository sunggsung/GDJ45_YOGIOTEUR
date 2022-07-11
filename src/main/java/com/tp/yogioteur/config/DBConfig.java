package com.tp.yogioteur.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@ComponentScan(basePackages = {"com.tp.yogioteur.batch", "com.tp.yogioteur.service"})
@EnableScheduling

// @Mapper를 사용하고 있습니다. 여기에서 Mapper를 찾으세요
@MapperScan(basePackages = {"com.tp.yogioteur.mapper"})

// mybatis/properties/db.properties 파일의 내용을 참조하겠습니다.
@PropertySource(value={"classpath:mybatis/properties/db.properties"})

// TransactionManager를 사용하겠습니다.
@EnableTransactionManagement

@Configuration
public class DBConfig {

	@Value(value="${spring.datasource.driver-class-name}") private String driverClassName;
	@Value(value="${spring.datasource.url}") private String jdbcUrl;
	@Value(value="${spring.datasource.username}") private String username;
	@Value(value="${spring.datasource.password}") private String password;
	@Value(value="${mybatis.config-location}") private String configLocation;
	@Value(value="${mybatis.mapper-locations}") private String mapperLocations;
	
	@Bean
	public HikariConfig hikariConfig() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(jdbcUrl);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		return hikariConfig;
	}
	
	@Bean(destroyMethod="close")
	public HikariDataSource dataSource() {
		return new HikariDataSource(hikariConfig());
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		sqlSessionFactoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource(configLocation));
		sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(mapperLocations));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	
	@Bean
	public TransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
}