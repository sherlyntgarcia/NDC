package com.ndc.app.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="ndc_tbl_mooe")
public class BUMooe implements java.io.Serializable {

	private Long id;
	private Integer month;
	private Integer year;
	private Date dateUpdated;
	private String updatedBy;
	
	@NotNull(message="Budget for Mooe is required")
	private Double budgetMooe;
	
	@NotNull(message="Actual for Mooe is required")
	private Double actualMooe;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="MONTH")
	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	@Column(name="YEAR")
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_UPDATED")
	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	@Column(name="UPDATED_BY")
	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Column(name="BUDGET_MOOE")
	public Double getBudgetMooe() {
		return budgetMooe;
	}

	public void setBudgetMooe(Double budgetMooe) {
		this.budgetMooe = budgetMooe;
	}

	@Column(name="ACTUAL_MOOE")
	public Double getActualMooe() {
		return actualMooe;
	}

	public void setActualMooe(Double actualMooe) {
		this.actualMooe = actualMooe;
	}
	
}
