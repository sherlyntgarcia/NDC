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
@Table(name="ndc_tbl_actual_income_expense")
public class ActualIncomeExpense implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Total Expense is required")
	private Double totalExpense;
	
	@NotNull(message="Total Income is required")
	private Double totalIncome;
	
	@NotNull(message="Actual Advertising is required")
	private Double actualAdvertising;
	
	@NotNull(message="Actual Athletics is required")
	private Double actualAthletics;
	
	@NotNull(message="Actual Auditing is required")
	private Double actualAuditing;
	
	@NotNull(message="Actual Consultancy is required")
	private Double actualConsultancy;
	
	@NotNull(message="Budget Advertising is required")
	private Double budgetAdvertising;
	
	@NotNull(message="Budget Athletics is required")
	private Double budgetAthletics;
	
	@NotNull(message="Budget Auditing is required")
	private Double budgetAuditing;
	
	@NotNull(message="Budget Consultancy is required")
	private Double budgetConsultancy;
	
	private Integer year;
	private Integer month;
	
	private Date dateUpdated;
	private String updatedBy;

	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="TOTAL_EXPENSE")
	public Double gettotalExpense() {
		return totalExpense;
	}

	public void settotalExpense(Double totalExpense) {
		this.totalExpense = totalExpense;
	}
	
	@Column(name="YEAR")
	public Integer getYear() {
		return year;
	}
	
	public void setYear(Integer year) {
		this.year = year;
	}
	
	@Column(name="MONTH")
	public Integer getMonth() {
		return month;
	}
	
	public void setMonth(Integer month) {
		this.month = month;
	}
	
	@Column(name="TOTAL_INCOME")
	public Double gettotalIncome() {
		return totalIncome;
	}

	public void settotalIncome(Double totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	@Column(name="ACTUAL_ADVERTISING")
	public Double getActualAdvertising() {
		return actualAdvertising;
	}

	public void setActualAdvertising(Double actualAdvertising) {
		this.actualAdvertising = actualAdvertising;
	}
	
	@Column(name="ACTUAL_ATHLETICS")
	public Double getActualAthletics() {
		return actualAthletics;
	}

	public void setActualAthletics(Double athletics) {
		this.actualAthletics = athletics;
	}
	
	@Column(name="ACTUAL_AUDITING")
	public Double getActualAuditing() {
		return actualAuditing;
	}

	public void setActualAuditing(Double auditing) {
		this.actualAuditing = auditing;
	}

	@Column(name="ACTUAL_CONSULTANCY")
	public Double getActualConsultancy() {
		return actualConsultancy;
	}
	
	public void setActualConsultancy(Double consultancy) {
		this.actualConsultancy = consultancy;
	}
	
	@Column(name="BUDGET_ADVERTISING")
	public Double getBudgetAdvertising() {
		return budgetAdvertising;
	}

	public void setBudgetAdvertising(Double budgetAdvertising) {
		this.budgetAdvertising = budgetAdvertising;
	}

	@Column(name="BUDGET_ATHLETICS")
	public Double getBudgetAthletics() {
		return budgetAthletics;
	}

	public void setBudgetAthletics(Double budgetAthletics) {
		this.budgetAthletics = budgetAthletics;
	}

	@Column(name="BUDGET_AUDITING")
	public Double getBudgetAuditing() {
		return budgetAuditing;
	}

	public void setBudgetAuditing(Double budgetAuditing) {
		this.budgetAuditing = budgetAuditing;
	}

	@Column(name="BUDGET_CONSULTANCY")
	public Double getBudgetConsultancy() {
		return budgetConsultancy;
	}

	public void setBudgetConsultancy(Double budgetConsultancy) {
		this.budgetConsultancy = budgetConsultancy;
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
	
}