package com.ecs.ccm.dao;

import com.ecs.ccm.entity.UserInfo;

/**
 * This class is responsible for accessing the database regarding user accounts
 * @author tsegai
 *
 */
public interface UserDAO {
	
	/**
	 * Gets user using user-name
	 * @param userName String to query database
	 * @return UserInfo object if user exists
	 */
	public UserInfo getUser(String userName);
	
	/**
	 * Saves new user information
	 * @param user UserInfo object with username and password
	 */
	public void saveUser(UserInfo user);
}
