package com.ndc.app.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ndc.app.dao.UserDao;
import com.ndc.app.model.Document;
import com.ndc.app.model.Options;
import com.ndc.app.model.User;
import com.ndc.app.service.UserService;
import com.ndc.app.util.AuthenticationUtil;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	@Override
	@Transactional
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userDao.getAll();
	}
	
	@Override
	@Transactional
	public List<User> getAllAdmins() {
		// TODO Auto-generated method stub
		return userDao.getAllAdmins();
	}

	@Override
	@Transactional
	public User getUserDetailsById(Long id) {
		// TODO Auto-generated method stub
		return userDao.getUserDetailsById(id);
	}

	@Override
	@Transactional
	public User getUserDetailsByUsername(String username) {
		// TODO Auto-generated method stub
		return userDao.getUserDetailsByUsername(username);
	}

	@Override
	@Transactional
	public void addUser(User user) {
		// TODO Auto-generated method stub
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		user.setLoginAttempts(0);
		userDao.addUser(user);
	}

	@Override
	@Transactional
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		userDao.deleteUser(user);
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		user.setPassword( DigestUtils.md5Hex(user.getPassword()) );
		userDao.updateUser(user);
	}

	@Override
	@Transactional
	public void activateUser(User user) {
		// TODO Auto-generated method stub
		userDao.activateUser(user);
	}

	@Override
	@Transactional
	public void deactivateUser(User user) {
		// TODO Auto-generated method stub
		userDao.deactivateUser(user);
	}

	@Override
	@Transactional
	public boolean checkLoginAttempts(User user) {
		// TODO Auto-generated method stub
		return userDao.checkLoginAttempts(user);
	}

	@Override
	@Transactional
	public boolean isUsernameExisting(String username) {
		// TODO Auto-generated method stub
		return userDao.isUsernameExisting(username);
	}

	@Override
	@Transactional
	public boolean isEmailExisting(String email) {
		// TODO Auto-generated method stub
		return userDao.isEmailExisting(email);
	}

	@Override
	@Transactional
	public List<User> getActivatedUsers() {
		// TODO Auto-generated method stub
		return userDao.getActivatedUsers();
	}

	@Override
	@Transactional
	public List<User> getDeactivatedUsers() {
		// TODO Auto-generated method stub
		return userDao.getDeactivatedUsers();
	}

	@Override
	@Transactional
	public boolean bulkActivateUsers(Long[] idArray) {
		// TODO Auto-generated method stub
		return userDao.bulkActivateUsers(idArray);
	}

	@Override
	@Transactional
	public boolean bulkDeactivateUsers(Long[] idArray) {
		// TODO Auto-generated method stub
		return userDao.bulkDeactivateUsers(idArray);
	}

	@Override
	@Transactional
	public boolean isUserValidOnForgotPassword(String username,
			String secretQuestion, String secretAnswer) {
		// TODO Auto-generated method stub
		return userDao.isUserValidOnForgotPassword(username, secretQuestion, secretAnswer);
	}

	@Override
	@Transactional
	public Document getDocumentById(Long id) {
		// TODO Auto-generated method stub
		return userDao.getDocumentById(id);
	}

	@Override
	@Transactional
	public void addDocument(Document document) throws Exception {
		// TODO Auto-generated method stub
		userDao.addDocument(document);
	}

	@Override
	@Transactional
	public List<User> getTacticalUsers() {
		// TODO Auto-generated method stub
		return userDao.getTacticalUsers();
	}

	@Override
	@Transactional
	public List<Document> getAllDocuments() {
		// TODO Auto-generated method stub
		return userDao.getAllDocuments();
	}

	@Override
	@Transactional
	public boolean isUserValidOnForgotPassword(String username, String email) {
		// TODO Auto-generated method stub
		return userDao.isUserValidOnForgotPassword(username, email);
	}

	@Override
	@Transactional
	public Options getFeedback() {
		// TODO Auto-generated method stub
		return userDao.getFeedback();
	}

	@Override
	@Transactional
	public void addFeedback(Options options) {
		// TODO Auto-generated method stub
		options.setDateUpdated(new Date());
		options.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());
		
		userDao.addFeedback(options);
	}
	
}
