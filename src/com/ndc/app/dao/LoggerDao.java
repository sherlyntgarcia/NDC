package com.ndc.app.dao;

import java.util.List;

import com.ndc.app.model.Log;

public interface LoggerDao {

	public List<Log> getAll();
	public void insertLog(Log log);
	
}
