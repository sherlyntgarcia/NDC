package com.ndc.app.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.ndc.app.RoleHelper;
import com.ndc.app.dao.UserDao;
import com.ndc.app.model.Document;
import com.ndc.app.model.Options;
import com.ndc.app.model.User;
import com.ndc.app.util.PropertiesUtil;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private static final Integer MAX_ATTEMPTS = Integer.parseInt(PropertiesUtil.getProperty("max.login.attempts"));
	private static final Logger logger = Logger.getLogger(UserDao.class);
	
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.role != :role");
		query.setString("role", RoleHelper.POWER_USER);
		
		return query.list();
	}
	
	@Override
	public List<User> getAllAdmins() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.role = :power OR u.role = :tac");
		query.setString("power", RoleHelper.POWER_USER);
		query.setString("tac", RoleHelper.TACTICAL_USER);
			
		return query.list();
	}
	
	@Override
	public User getUserDetailsById(Long id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.id = :id");
		query.setLong("id", id);
		query.setMaxResults(1);
				
		return (User) query.uniqueResult();
	}
	
	@Override
	public User getUserDetailsByUsername(String username) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.username = :username");
		query.setString("username", username);
		query.setMaxResults(1);
					
		return (User) query.uniqueResult();
	}
	
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);
		logger.info("User with username '" + user.getUsername() + "' is added");
	}
	
	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(user);
		logger.info("User with username '" + user.getUsername() + "' is deleted");
	}
	
	@Override
	public void updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
		logger.info("User with username '" + user.getUsername() + "' is updated");
	}
	
	@Override
	public void activateUser(User user) {
		// TODO Auto-generated method stub
		User u = getUserDetailsById(user.getId());
		u.setActivated(true);
		updateUser(u);
		
		logger.info("User with username '" + user.getUsername() + "' is activated");
	}
	
	@Override
	public void deactivateUser(User user) {
		// TODO Auto-generated method stub
		User u = getUserDetailsById(user.getId());
		u.setActivated(false);
		updateUser(u);
		
		logger.info("User with username '" + user.getUsername() + "' is deactivated");
	}
	
	@Override
	public boolean checkLoginAttempts(User user) {
		// TODO Auto-generated method stub
		Integer loginAttempts = user.getLoginAttempts();
	
		if(loginAttempts != null) {
			
			if(loginAttempts < MAX_ATTEMPTS) {
				
				//if user is still valid
				logger.info("User with username " + user.getUsername() + " is attempting to login...");
				return true;
				
			} else {
				
				//if user has 5 attempts
				User u = getUserDetailsById(user.getId());
				u.setActivated(false);
				updateUser(u);
				
				logger.info("User with username " + user.getUsername() + " is deactivated...");
				
				return false;
				
			}
			
		}
		
		return true;
	}

	@Override
	public boolean isUsernameExisting(String username) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.username = :username");
		query.setString("username", username);
		
		List<User> list = query.list();
		
		if(list != null) {
			if(list.size() > 0) {
				return true;
			}
		}
		
		return false;
	}

	@Override
	public boolean isEmailExisting(String email) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.email = :email");
		query.setString("email", email);
				
		List<User> list = query.list();
				
		if(list != null) {
			if(list.size() > 0) {
				return true;
			}
		}
				
		return false;
	}

	@Override
	public List<User> getActivatedUsers() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.activated = :activated AND u.id != :id");
		query.setBoolean("activated", true);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth != null) {
			User u = getUserDetailsByUsername(auth.getName());
			query.setLong("id", u.getId());
		} else {
			query.setLong("id", 0);	//for error prevention only
		}
		
		return query.list();
	}

	@Override
	public List<User> getDeactivatedUsers() {
		
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.activated = :activated AND u.id != :id");
		query.setBoolean("activated", false);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth != null) {
			User u = getUserDetailsByUsername(auth.getName());
			query.setLong("id", u.getId());
		} else {
			query.setLong("id", 0);	//for error prevention only
		}
				
		return query.list();
		
	}

	@Override
	public boolean bulkActivateUsers(Long[] idArray) {
		// TODO Auto-generated method stub
		if(idArray != null) {
			if(idArray.length > 0) {
				
				Query query = sessionFactory.getCurrentSession().createQuery("UPDATE User u SET u.activated=:activated WHERE u.id IN (:ids)");
				query.setBoolean("activated", true);
				query.setParameterList("ids", idArray);
				
				int status = query.executeUpdate();
				
				if(status > 0) {
					return true;
				} else {
					return false;
				}
				
			}
		} else {
			return false;
		}
		
		return false;
	}

	@Override
	public boolean bulkDeactivateUsers(Long[] idArray) {
		// TODO Auto-generated method stub
		if(idArray != null) {
			if(idArray.length > 0) {
						
				Query query = sessionFactory.getCurrentSession().createQuery("UPDATE User u SET u.activated=:activated WHERE u.id IN (:ids)");
				query.setBoolean("activated", false);
				query.setParameterList("ids", idArray);
						
				int status = query.executeUpdate();
						
				if(status > 0) {
					return true;
				} else {
					return false;
				}
						
			}
		} else {
			return false;
		}
				
		return false;
	}

	@Override
	public boolean isUsernameExistingOnUpdate(Long id, String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEmailExistingOnUpdate(Long id, String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isUserValidOnForgotPassword(String username, String secretQuestion, String secretAnswer) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.username=:username AND u.secretQuestion=:secretQuestion AND u.secretAnswer=:secretAnswer AND u.role!=:role");
		query.setString("username", username);
		query.setString("secretQuestion", secretQuestion);
		query.setString("secretAnswer", secretAnswer);
		query.setString("role", RoleHelper.POWER_USER);
		query.setMaxResults(1);
		
		Integer numOfResult = query.list().size();
		
		if(numOfResult != null) {
			if(numOfResult > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public Document getDocumentById(Long id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Document d WHERE d.id = :id");
		query.setLong("id", id);
		query.setMaxResults(1);
		
		return (Document) query.uniqueResult();
	}

	@Override
	public void addDocument(Document document) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(document);
	}

	@Override
	public List<User> getTacticalUsers() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.role = :role");
		query.setString("role", RoleHelper.TACTICAL_USER);
		
		return query.list();
	}

	@Override
	public List<Document> getAllDocuments() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Document d ORDER BY d.id DESC");
		return query.list();
	}

	@Override
	public boolean isUserValidOnForgotPassword(String username, String email) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from User u WHERE u.username=:username AND u.email=:email AND (u.role=:power OR u.role=:tac)");
		query.setString("username", username);
		query.setString("email", email);
		query.setString("power", RoleHelper.POWER_USER);
		query.setString("tac", RoleHelper.TACTICAL_USER);
		query.setMaxResults(1);
				
		Integer numOfResult = query.list().size();
				
		if(numOfResult != null) {
			if(numOfResult > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public Options getFeedback() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Options o ORDER BY o.id DESC LIMIT 1");
		query.setMaxResults(1);
		
		return (Options) query.uniqueResult();
	}

	@Override
	public void addFeedback(Options options) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(options);
	}

}
