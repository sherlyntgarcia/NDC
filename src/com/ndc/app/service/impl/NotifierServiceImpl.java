package com.ndc.app.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ndc.app.dao.NotifierDao;
import com.ndc.app.model.Notification;
import com.ndc.app.service.NotifierService;
import com.ndc.app.util.AuthenticationUtil;

@Service("notifierService")
public class NotifierServiceImpl implements NotifierService {

	@Autowired
	@Qualifier("notifierDao")
	private NotifierDao notifierDao;
	
	@Override
	@Transactional
	public List<Notification> getNotificationOfUserByGroup(Long userId,
			String groupName) {
		// TODO Auto-generated method stub
		return notifierDao.getNotificationOfUserByGroup(userId, groupName);
	}

	@Override
	@Transactional
	public void addNotification(Notification notification) throws Exception {
		// TODO Auto-generated method stub
		notification.setDateNotified(new Date());
		notification.setTriggeredBy(AuthenticationUtil.getAuthenticationDetails().getName());
		notification.setVisible(true);
		
		notifierDao.addNotification(notification);
	}

	@Override
	@Transactional
	public void refreshNotification(Long id, String group) throws Exception {
		// TODO Auto-generated method stub
		notifierDao.refreshNotification(id, group);
	}

}
