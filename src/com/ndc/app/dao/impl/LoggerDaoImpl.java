package com.ndc.app.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ndc.app.dao.LoggerDao;
import com.ndc.app.model.Log;

@Repository("loggerDao")
public class LoggerDaoImpl implements LoggerDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Log> getAll() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Log l ORDER BY l.accessTime DESC");
		return query.list();
	}

	@Override
	public void insertLog(Log log) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(log);
	}

}
