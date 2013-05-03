package com.ndc.app.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ndc.app.dao.NotifierDao;
import com.ndc.app.model.Notification;

@Repository("notifierDao")
public class NotifierDaoImpl implements NotifierDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Notification> getNotificationOfUserByGroup(Long userId,
			String groupName) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Notification n WHERE n.userId=:userId AND n.group=:group AND n.visible=:visible ORDER BY n.id DESC");
		query.setLong("userId", userId);
		query.setString("group", groupName);
		query.setBoolean("visible", true);
		
		return query.list();
	}

	@Override
	public void addNotification(Notification notification) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(notification);
	}

	@Override
	public void refreshNotification(Long id, String group) throws Exception {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("UPDATE Notification n SET n.visible = :visible WHERE n.userId = :userId AND n.group = :group");
		query.setBoolean("visible", false);
		query.setLong("userId", id);
		query.setString("group", group);
		
		query.executeUpdate();
	}

}
