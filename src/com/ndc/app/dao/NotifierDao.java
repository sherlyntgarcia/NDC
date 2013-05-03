package com.ndc.app.dao;

import java.util.List;

import com.ndc.app.model.Notification;

public interface NotifierDao {
	
	public List<Notification> getNotificationOfUserByGroup(Long userId, String groupName);
	public void addNotification(Notification notification) throws Exception;
	public void refreshNotification(Long id, String group) throws Exception;

}
