package com.ndc.app.dao;

import java.util.List;

import com.ndc.app.model.Document;
import com.ndc.app.model.Options;
import com.ndc.app.model.User;

public interface UserDao {
	
	public List<User> getAll();
	public List<User> getAllAdmins();
	public User getUserDetailsById(Long id);
	public User getUserDetailsByUsername(String username);
	public void addUser(User user);
	public void deleteUser(User user);
	public void updateUser(User user);
	public void activateUser(User user);
	public void deactivateUser(User user);
	public boolean checkLoginAttempts(User user);
	public boolean isUsernameExisting(String username);
	public boolean isEmailExisting(String email);
	public List<User> getActivatedUsers();
	public List<User> getDeactivatedUsers();
	public boolean bulkActivateUsers(Long[] idArray);
	public boolean bulkDeactivateUsers(Long[] idArray);
	public boolean isUsernameExistingOnUpdate(Long id, String username);
	public boolean isEmailExistingOnUpdate(Long id, String email);
	public boolean isUserValidOnForgotPassword(String username, String secretQuestion, String secretAnswer);
	public boolean isUserValidOnForgotPassword(String username, String email);
	public List<Document> getAllDocuments();
	public Document getDocumentById(Long id);
	public void addDocument(Document document) throws Exception;
	public List<User> getTacticalUsers();
	public Options getFeedback();
	public void addFeedback(Options options);

}
