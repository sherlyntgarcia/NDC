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
@Table(name="ndc_tbl_spg_cash_flow")
public class SpgCashFlow implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Project is required")
	private Long projectId;
	
	@NotNull(message="Operating Activities is required")
	private Double operatingActivities;
	
	@NotNull(message="Investing Activities is required")
	private Double investingActivities;
	
	@NotNull(message="Financing Activities is required")
	private Double financingActivities;
	
	private Integer year;
	private String updatedBy;
	private Date dateUpdated;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="OPERATING_ACTIVITIES")
	public Double getOperatingActivities() {
		return operatingActivities;
	}

	public void setOperatingActivities(Double operatingActivities) {
		this.operatingActivities = operatingActivities;
	}

	@Column(name="INVESTING_ACTIVITIES")
	public Double getInvestingActivities() {
		return investingActivities;
	}

	public void setInvestingActivities(Double investingActivities) {
		this.investingActivities = investingActivities;
	}

	@Column(name="FINANCING_ACTIVITIES")
	public Double getFinancingActivities() {
		return financingActivities;
	}

	public void setFinancingActivities(Double financingActivities) {
		this.financingActivities = financingActivities;
	}

	@Column(name="YEAR")
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Column(name="UPDATED_BY")
	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_UPDATED")
	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	@Column(name="PROJECT_ID")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
}
