package com.ndc.app.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ndc_tbl_spg_sub_categories_existing")
public class SpgSubCategory implements java.io.Serializable {

	private Long id;
	private String name;
	private Date dateUpdated;
	private SpgCategory spgCategory;
	private String profile;
	private String milestone;
	
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

	@ManyToOne
	@JoinColumn(nullable=false, name="CATEGORY_ID")
	public SpgCategory getSpgCategory() {
		return spgCategory;
	}

	public void setSpgCategory(SpgCategory spgCategory) {
		this.spgCategory = spgCategory;
	}
	
	@Column(name="PROFILE")
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	@Column(name="MILESTONE")
	public String getMilestone() {
		return milestone;
	}

	public void setMilestone(String milestone) {
		this.milestone = milestone;
	}
	
}
