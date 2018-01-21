package com.ecs.ccm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecs.ccm.entity.UserInfo;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Logger logger = Logger.getLogger(UserDAOImpl.class);

	@Override
	public UserInfo getUser(String userName) {
		Session currentSession = sessionFactory.getCurrentSession();
		UserInfo user = new UserInfo();
		Query query = currentSession.createQuery("from UserInfo u WHERE u.userName=:userName");
		query.setParameter("userName", userName);
		List<?> userList = query.getResultList();
		if (!userList.isEmpty()) {
			user = (UserInfo) userList.get(0);
			logger.info(user);
			return user;
		}
		return null;
	}

	@Override
	public void saveUser(UserInfo user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);
		logger.info("user saved");
		
	}

}
