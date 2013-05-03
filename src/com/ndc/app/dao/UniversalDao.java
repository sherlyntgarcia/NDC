package com.ndc.app.dao;

import java.util.List;

public interface UniversalDao<T> {
	
	public List<T> findAll();
	public Integer countAll();
	public T get(Long id);
	public void add(T t) throws Exception;
	public void delete(T t) throws Exception;
	public void update(T t) throws Exception;

}
