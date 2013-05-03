package com.ndc.app.service;

import java.util.List;

import com.ndc.app.model.Notification;

public interface NotifierService {

	public List<Notification> getNotificationOfUserByGroup(Long userId, String groupName);
	public void addNotification(Notification notification) throws Exception;
	public void refreshNotification(Long id, String group) throws Exception;
	
}
