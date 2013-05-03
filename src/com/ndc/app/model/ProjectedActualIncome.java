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
@Table(name="ndc_tbl_projected_actual_income")
public class ProjectedActualIncome implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Actual Income is required")
	private BigDecimal actualIncome;
	
	@NotNull(message="Actual Dividend is required")
	private BigDecimal actualDividend;
	
	@NotNull(message="Actual Interest is required")
	private BigDecimal actualInterest;
	
	@NotNull(message="Actual Rental Assets is required")
	private BigDecimal actualRental;
	
	@NotNull(message="Actual Gain On Sale is required")
	private BigDecimal actualGainOnSale;
	
	@NotNull(message="Other Actual Income is required")
	private BigDecimal actualOtherIncome;
	
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

	@Column(name="ACTUAL_INCOME")
	public BigDecimal getactualIncome() {
		return actualIncome;
	}

	public void setactualIncome(BigDecimal actualIncome) {
		this.actualIncome = actualIncome;
	}
	
	@Column(name="ACTUAL_DIVIDEND")
	public BigDecimal getactualDividend() {
		return actualDividend;
	}

	public void setactualDividend(BigDecimal actualDividend) {
		this.actualDividend = actualDividend;
	}
	
	@Column(name="ACTUAL_INTEREST")
	public BigDecimal getactualInterest() {
		return actualInterest;
	}

	public void setactualInterest(BigDecimal actualInterest) {
		this.actualInterest = actualInterest;
	}
	
	@Column(name="ACTUAL_RENTAL")
	public BigDecimal getactualRental() {
		return actualRental;
	}

	public void setactualRental(BigDecimal actualRental) {
		this.actualRental = actualRental;
	}
	
	@Column(name="ACTUAL_GAIN_ON_SALE")
	public BigDecimal getactualGainOnSale() {
		return actualGainOnSale;
	}

	public void setactualGainOnSale(BigDecimal actualGainOnSale) {
		this.actualGainOnSale = actualGainOnSale;
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

	@Column(name="ACTUAL_OTHER_INCOME")
	public BigDecimal getActualOtherIncome() {
		return actualOtherIncome;
	}

	public void setActualOtherIncome(BigDecimal actualOtherIncome) {
		this.actualOtherIncome = actualOtherIncome;
	}
	
}