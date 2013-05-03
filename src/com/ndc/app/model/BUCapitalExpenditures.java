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
@Table(name="ndc_tbl_capital_expenditures")
public class BUCapitalExpenditures implements java.io.Serializable {

	private Long id;
	private Integer month;
	private Integer year;
	private Date dateUpdated;
	private String updatedBy;
	
	@NotNull(message="Budget for Capital Expenditures is requried")
	private Double budgetCapitalExpenditures;
	
	@NotNull(message="Actual for Capital Expenditures is required")
	private Double actualCapitalExpenditures;
	
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
	
	@Column(name="BUDGET_CAPITAL_EXPENDITURES")
	public Double getBudgetCapitalExpenditures() {
		return budgetCapitalExpenditures;
	}
	
	public void setBudgetCapitalExpenditures(Double budgetCapitalExpenditures) {
		this.budgetCapitalExpenditures = budgetCapitalExpenditures;
	}
	
	@Column(name="ACTUAL_CAPITAL_EXPENDITURES")
	public Double getActualCapitalExpenditures() {
		return actualCapitalExpenditures;
	}
	
	public void setActualCapitalExpenditures(Double actualCapitalExpenditures) {
		this.actualCapitalExpenditures = actualCapitalExpenditures;
	}
	
}
