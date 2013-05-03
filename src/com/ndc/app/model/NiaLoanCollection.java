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
@Table(name="ndc_tbl_nia_loan_collections")
public class NiaLoanCollection implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Principal (Loan Receivable) is required")
	private Double principalLoanReceivable;
	
	@NotNull(message="Principal Collection is required")
	private Double principalCollection;
	
	@NotNull(message="Interest (Loan Receivable) is required")
	private Double interestLoanReceivable;
	
	@NotNull(message="Interest Collection is required")
	private Double interestCollection;
	
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

	@Column(name="PRINCIPAL_LOAN_RECEIVABLE")
	public Double getPrincipalLoanReceivable() {
		return principalLoanReceivable;
	}

	public void setPrincipalLoanReceivable(Double principalLoanReceivable) {
		this.principalLoanReceivable = principalLoanReceivable;
	}

	@Column(name="PRINCIPAL_COLLECTION")
	public Double getPrincipalCollection() {
		return principalCollection;
	}

	public void setPrincipalCollection(Double principalCollection) {
		this.principalCollection = principalCollection;
	}

	@Column(name="INTEREST_LOAN_RECEIVABLE")
	public Double getInterestLoanReceivable() {
		return interestLoanReceivable;
	}

	public void setInterestLoanReceivable(Double interestLoanReceivable) {
		this.interestLoanReceivable = interestLoanReceivable;
	}

	@Column(name="INTEREST_COLLECTION")
	public Double getInterestCollection() {
		return interestCollection;
	}

	public void setInterestCollection(Double interestCollection) {
		this.interestCollection = interestCollection;
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
