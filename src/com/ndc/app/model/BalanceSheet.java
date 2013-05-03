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
@Table(name="ndc_tbl_balance_sheet")
public class BalanceSheet implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Total Assets is required")
	private Double totalAssets;
	
	@NotNull(message="Total Liabilities is required")
	private Double totalLiabilities;

	private Double totalEquity;
	private String updatedBy;
	private Date dateUpdated;
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

	@Column(name="TOTAL_EQUITY")
	public Double getTotalEquity() {
		return totalEquity;
	}

	public void setTotalEquity(Double totalEquity) {
		this.totalEquity = totalEquity;
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

	@Column(name="YEAR")
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}
	
}
