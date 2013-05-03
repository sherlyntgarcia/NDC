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
@Table(name="ndc_tbl_personal_services")
public class BUPersonalServices implements java.io.Serializable {

	private Long id;
	private Integer month;
	private Integer year;
	private Date dateUpdated;
	private String updatedBy;
	
	@NotNull(message="Budget for Personal Services is required")
	private Double budgetPersonalServices;
	
	@NotNull(message="Actual for Personal Services is required")
	private Double actualPersonalServices;
	
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

	@Column(name="BUDGET_PERSONAL_SERVICES")
	public Double getBudgetPersonalServices() {
		return budgetPersonalServices;
	}

	public void setBudgetPersonalServices(Double budgetPersonalServices) {
		this.budgetPersonalServices = budgetPersonalServices;
	}

	@Column(name="ACTUAL_PERSONAL_SERVICES")
	public Double getActualPersonalServices() {
		return actualPersonalServices;
	}

	public void setActualPersonalServices(Double actualPersonalServices) {
		this.actualPersonalServices = actualPersonalServices;
	}
	
}
