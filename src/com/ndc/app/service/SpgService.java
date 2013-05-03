package com.ndc.app.service;

import java.util.List;

import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgParticulars;
import com.ndc.app.model.SpgSubCategory;

public interface SpgService {
	
	public List<SpgCategory> getAll();
	public List<SpgCategory> getCategories();
	public SpgSubCategory getSubCategoryById(Long id);
	public SpgCategory getCategoryByName(String name);
	public List<SpgParticulars> getAllParticulars();

}
