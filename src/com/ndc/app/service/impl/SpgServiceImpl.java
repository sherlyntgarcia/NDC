package com.ndc.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ndc.app.dao.SpgDao;
import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgParticulars;
import com.ndc.app.model.SpgSubCategory;
import com.ndc.app.service.SpgService;

@Service("spgService")
public class SpgServiceImpl implements SpgService {

	@Autowired
	@Qualifier("spgDao")
	private SpgDao spgDao;
	
	@Override
	@Transactional
	public List<SpgCategory> getAll() {
		// TODO Auto-generated method stub
		return spgDao.getAll();
	}

	@Override
	@Transactional
	public List<SpgCategory> getCategories() {
		// TODO Auto-generated method stub
		return spgDao.getCategories();
	}

	@Override
	@Transactional
	public SpgSubCategory getSubCategoryById(Long id) {
		// TODO Auto-generated method stub
		return spgDao.getSubCategoryById(id);
	}

	@Override
	@Transactional
	public SpgCategory getCategoryByName(String name) {
		// TODO Auto-generated method stub
		return spgDao.getCategoryByName(name.toUpperCase());
	}

	@Override
	@Transactional
	public List<SpgParticulars> getAllParticulars() {
		// TODO Auto-generated method stub
		return spgDao.getAllParticulars();
	}
	
}
