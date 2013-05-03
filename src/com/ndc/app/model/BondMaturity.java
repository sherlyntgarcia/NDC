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
@Table(name="ndc_tbl_bond_maturity")
public class BondMaturity implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Amount Issued is required")
	private Double amountIssued;
	
	@NotNull(message="Bonds Payment is required")
	private Double bondPayment;
	
	private String updatedBy;
	private Integer year;
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

	@Column(name="AMOUNT_ISSUED")
	public Double getAmountIssued() {
		return amountIssued;
	}

	public void setAmountIssued(Double amountIssued) {
		this.amountIssued = amountIssued;
	}

	@Column(name="BOND_PAYMENT")
	public Double getBondPayment() {
		return bondPayment;
	}

	public void setBondPayment(Double bondPayment) {
		this.bondPayment = bondPayment;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_UPDATED")
	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	
}
