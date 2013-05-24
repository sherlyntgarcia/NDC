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
@Table(name="ndc_tbl_maintenance_cost")
public class MaintenanceCost implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Revenue on Properties is required")
	private Double marketValue;
	
	@NotNull(message="Rpt is required")
	private Double rpt;
	
	@NotNull(message="Dues/Fees is required")
	private Double duesFees;
	
	@NotNull(message="Security is required")
	private Double security;
	
	private Date dateUpdated;
	private String updatedBy;
	private Integer year;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="MARKET_VALUE")
	public Double getMarketValue() {
		return marketValue;
	}

	public void setMarketValue(Double marketValue) {
		this.marketValue = marketValue;
	}

	@Column(name="RPT")
	public Double getRpt() {
		return rpt;
	}

	public void setRpt(Double rpt) {
		this.rpt = rpt;
	}

	@Column(name="SECURITY")
	public Double getSecurity() {
		return security;
	}

	public void setSecurity(Double security) {
		this.security = security;
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

	@Column(name="YEAR")
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Column(name="DUESFEES")
	public Double getDuesFees() {
		return duesFees;
	}

	public void setDuesFees(Double duesFees) {
		this.duesFees = duesFees;
	}
	
}
