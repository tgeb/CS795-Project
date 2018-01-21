package com.ecs.ccm.service;

import com.ecs.ccm.entity.UserInfo;


/**
 * This class is responsible for fetching users(authentication) and saving new users.
 * @author tsegai
 *
 */
public interface UserService {

	/**
	 * Saves new user information
	 * @param user UserInfo object(user-name and password)
	 */
	public void saveUser(UserInfo user);
	
	/**
	 * Fetches users for authentication
	 * @param userName String to identify user
	 * @return UserInfo object if user exists
	 */
	public UserInfo getUser(String userName);
}
