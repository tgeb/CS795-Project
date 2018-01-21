package com.ecs.ccm.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ecs.ccm.dao.UserDAO;
import com.ecs.ccm.entity.UserInfo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	private Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Override
	public void saveUser(UserInfo user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRole("ROLE_ADMIN");
		logger.info("This is encoded user pass " + user.getPassword());
		
		userDAO.saveUser(user);

	}

	@Override
	public UserInfo getUser(String userName) {
		
		return userDAO.getUser(userName);
	}

}
