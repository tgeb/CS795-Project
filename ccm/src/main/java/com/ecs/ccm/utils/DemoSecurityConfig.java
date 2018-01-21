package com.ecs.ccm.utils;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.ecs.ccm.service.CCMUserDetailsService;

/**
 * 
 * @see https://docs.spring.io/spring-security/site/docs/4.1.2.RELEASE/apidocs/org/springframework/security/config/annotation/web/configuration/WebSecurityConfigurerAdapter.html
 *
 */
@Configurable
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CCMUserDetailsService ccmUserDetailsService;
	private Logger logger = Logger.getLogger(DemoSecurityConfig.class);
	/*
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("john").password("secret123").roles("EMPLOYEE");
		auth.inMemoryAuthentication().withUser("mary").password("secret123").roles("MANAGER");
		auth.inMemoryAuthentication().withUser("susan").password("secret123").roles("ADMIN");
	}*/	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		logger.info("inside antMatchers method");
		http.csrf().disable();
		http.authorizeRequests().antMatchers("/login","/register","/registerProcessing").permitAll();
		http.authorizeRequests().anyRequest().authenticated()
		//.antMatchers("/**").hasAnyRole("ADMIN")			
			.and().formLogin() // login configuration
				.loginPage("/login").permitAll()
				.loginProcessingUrl("/j_spring_security_check")				
				.usernameParameter("username")
				.passwordParameter("password")
				.defaultSuccessUrl("/home")
				.failureUrl("/login?error=true")
			.and().logout() // logout configuration
				.logoutUrl("/ccmLogout")
				.logoutSuccessUrl("/login")
			.and().exceptionHandling(); // exception handling configuration
			
			//.accessDeniedPage("/loginPage?error=true");
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(ccmUserDetailsService).passwordEncoder(passwordEncoder());
	}

	/**
	 * Password encoder BcryptPasswordEncoder
	 * @return BCryptPasswordEncoder object
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder;
	}

}
