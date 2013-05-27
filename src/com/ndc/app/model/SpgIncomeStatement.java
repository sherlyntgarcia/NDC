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

import org.hibernate.validator.constraints.Range;

@Entity
@Table(name="ndc_tbl_spg_income_statement")
public class SpgIncomeStatement implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Project is required")
	private Long projectId;
	
	@NotNull(message="Revenue is required")
	private Double revenue;
	
	@NotNull(message="Net Income is required")
	private Double netIncome;
	
	@NotNull(message="Profit Margin is required")
	@Range(max=100,message="Profit Margin can only have a maximum value of 100")
	private Double profitMargin;
	
	private Integer year;
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

	@Column(name="REVENUE")
	public Double getRevenue() {
		return revenue;
	}

	public void setRevenue(Double revenue) {
		this.revenue = revenue;
	}

	@Column(name="NET_INCOME")
	public Double getNetIncome() {
		return netIncome;
	}

	public void setNetIncome(Double netIncome) {
		this.netIncome = netIncome;
	}

	@Column(name="PROFIT_MARGIN")
	public Double getProfitMargin() {
		return profitMargin;
	}

	public void setProfitMargin(Double profitMargin) {
		this.profitMargin = profitMargin;
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

	@Column(name="PROJECT_ID")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
}
