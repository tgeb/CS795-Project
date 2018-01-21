package com.ecs.ccm.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ecs.ccm.dao.UserDAO;
import com.ecs.ccm.entity.UserInfo;

/**
 * 
 * @see https://docs.spring.io/spring-security/site/docs/4.0.4.RELEASE/apidocs/org/springframework/security/core/userdetails/UserDetailsService.html
 *
 */
@Service
public class CCMUserDetailsService implements UserDetailsService {
	
	/**
	 * Any implementation can be injected here for database access
	 */
	@Autowired
	private UserDAO userDAO;
	
	
	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		UserInfo activeUserInfo = userDAO.getUser(userName);
		GrantedAuthority authority = new SimpleGrantedAuthority(activeUserInfo.getRole());
		UserDetails userDetails = (UserDetails)new User(activeUserInfo.getUserName(),
				activeUserInfo.getPassword(), Arrays.asList(authority));
		return userDetails;
	}

}
