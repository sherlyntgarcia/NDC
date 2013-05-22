package com.ndc.app.dao;

import java.util.List;

import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgParticulars;
import com.ndc.app.model.SpgSubCategory;

public interface SpgDao {
	
	public List<SpgCategory> getAll();
	public List<SpgCategory> getCategories();
	public List<SpgSubCategory> getSubCategories();
	public SpgSubCategory getSubCategoryById(Long id);
	public SpgCategory getCategoryByName(String name);
	public List<SpgParticulars> getAllParticulars();

}
