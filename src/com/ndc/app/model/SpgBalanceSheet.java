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
@Table(name="ndc_tbl_spg_balance_sheet")
public class SpgBalanceSheet implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Project is required")
	private Long projectId;
	
	@NotNull(message="Total Assets is required")
	private Double totalAssets;
	
	@NotNull(message="Total Liabilities is required")
	private Double totalLiabilities;
	
	@NotNull(message="Debt to Assets is required")
	private Double debtToAssets;
	
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

	@Column(name="TOTAL_ASSETS")
	public Double getTotalAssets() {
		return totalAssets;
	}

	public void setTotalAssets(Double totalAssets) {
		this.totalAssets = totalAssets;
	}

	@Column(name="TOTAL_LIABILITIES")
	public Double getTotalLiabilities() {
		return totalLiabilities;
	}

	public void setTotalLiabilities(Double totalLiabilities) {
		this.totalLiabilities = totalLiabilities;
	}

	@Column(name="DEBT_TO_ASSETS")
	public Double getDebtToAssets() {
		return debtToAssets;
	}

	public void setDebtToAssets(Double debtToAssets) {
		this.debtToAssets = debtToAssets;
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
