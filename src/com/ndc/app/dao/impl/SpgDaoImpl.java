package com.ndc.app.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ndc.app.dao.SpgDao;
import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgParticulars;
import com.ndc.app.model.SpgSubCategory;

@Repository("spgDao")
public class SpgDaoImpl implements SpgDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<SpgCategory> getAll() {
		// TODO Auto-generated method stub
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SpgCategory.class);
		return criteria.list();
	}

	@Override
	public List<SpgCategory> getCategories() {
		// TODO Auto-generated method stub
		String str = "SELECT DISTINCT c from SpgCategory c left join fetch c.subCategories s ORDER BY c.name ASC, s.name ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(str);
		
		return query.list();
	}
	
	@Override
	public List<SpgSubCategory> getSubCategories() {
		// TODO Auto-generated method stub
		String str = "from SpgSubCategory s ORDER BY s.id";
		Query query = sessionFactory.getCurrentSession().createQuery(str);
		
		return query.list();
	}

	@Override
	public SpgSubCategory getSubCategoryById(Long id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from SpgSubCategory s WHERE s.id = :id");
		query.setLong("id", id);
		query.setMaxResults(1);
		return (SpgSubCategory) query.uniqueResult();
	}

	@Override
	public SpgCategory getCategoryByName(String name) {
		// TODO Auto-generated method stub
		String str = "SELECT DISTINCT c from SpgCategory c left join fetch c.subCategories s WHERE c.name = :name ORDER BY c.name ASC, s.name ASC";
		Query query = sessionFactory.getCurrentSession().createQuery(str);
		query.setString("name", name);
		
		return (SpgCategory) query.uniqueResult();
	}

	@Override
	public List<SpgParticulars> getAllParticulars() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from SpgParticulars sp ORDER BY sp.name ASC");
		return query.list();
	}
	
}
