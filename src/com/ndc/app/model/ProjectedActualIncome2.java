package com.ndc.app.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;
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
@Table(name="ndc_tbl_projected_actual_income_2")
public class ProjectedActualIncome2 implements java.io.Serializable {
	
	private Long id;
	
	@NotNull(message="Projected Income is required")
	private BigDecimal projectedIncome;
	
	@NotNull(message="Projected Dividend is required")
	private BigDecimal projectedDividend;
	
	@NotNull(message="Projected Interest is required")
	private BigDecimal projectedInterest;
	
	@NotNull(message="Projected Rental is required")
	private BigDecimal projectedRental;
	
	@NotNull(message="Projected Gain On Sale is required")
	private BigDecimal projectedGainOnSale;
	
	@NotNull(message="Projected Other Income is required")
	private BigDecimal projectedOtherIncome;
	
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
	
	@Column(name="PROJECTED_INCOME")
	public BigDecimal getProjectedIncome() {
		return projectedIncome;
	}

	public void setProjectedIncome(BigDecimal projectedIncome) {
		this.projectedIncome = projectedIncome;
	}

	@Column(name="PROJECTED_DIVIDEND")
	public BigDecimal getProjectedDividend() {
		return projectedDividend;
	}

	public void setProjectedDividend(BigDecimal projectedDividend) {
		this.projectedDividend = projectedDividend;
	}
	
	@Column(name="PROJECTED_INTEREST")
	public BigDecimal getProjectedInterest() {
		return projectedInterest;
	}

	public void setProjectedInterest(BigDecimal projectedInterest) {
		this.projectedInterest = projectedInterest;
	}
	
	@Column(name="PROJECTED_RENTAL")
	public BigDecimal getProjectedRental() {
		return projectedRental;
	}

	public void setProjectedRental(BigDecimal projectedRental) {
		this.projectedRental = projectedRental;
	}
	
	@Column(name="PROJECTED_GAIN_ON_SALE")
	public BigDecimal getProjectedGainOnSale() {
		return projectedGainOnSale;
	}

	public void setProjectedGainOnSale(BigDecimal projectedGainOnSale) {
		this.projectedGainOnSale = projectedGainOnSale;
	}
	
	@Column(name="PROJECTED_OTHER_INCOME")
	public BigDecimal getProjectedOtherIncome() {
		return projectedOtherIncome;
	}

	public void setProjectedOtherIncome(BigDecimal projectedOtherIncome) {
		this.projectedOtherIncome = projectedOtherIncome;
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
