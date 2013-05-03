package com.ndc.app.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ndc_tbl_spg_categories_existing")
public class SpgCategory implements java.io.Serializable {

	private Long id;
	private String name;
	private Date dateUpdated;
	private Set<SpgSubCategory> subCategories;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_UPDATED")
	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	@OneToMany(mappedBy="spgCategory")
	public Set<SpgSubCategory> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(Set<SpgSubCategory> subCategories) {
		this.subCategories = subCategories;
	}
	
}
