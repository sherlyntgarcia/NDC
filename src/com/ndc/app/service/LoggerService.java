package com.ndc.app.service;

import java.util.List;

import com.ndc.app.model.Log;

public interface LoggerService {
	
	public List<Log> getAll();
	public void insertLog(Log log);

}
