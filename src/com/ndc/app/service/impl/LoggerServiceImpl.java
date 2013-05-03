package com.ndc.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ndc.app.dao.LoggerDao;
import com.ndc.app.model.Log;
import com.ndc.app.service.LoggerService;

@Service("loggerService")
public class LoggerServiceImpl implements LoggerService {
	
	@Autowired
	@Qualifier("loggerDao")
	private LoggerDao loggerDao;

	@Override
	@Transactional
	public List<Log> getAll() {
		// TODO Auto-generated method stub
		return loggerDao.getAll();
	}

	@Override
	@Transactional
	public void insertLog(Log log) {
		// TODO Auto-generated method stub
		loggerDao.insertLog(log);
	}

}
