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
@Table(name="ndc_tbl_status_assets")
public class StatusAssets implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Under Lease is required")
	private Double underLease;
	
	@NotNull(message="For Sale/Lease is required")
	private Double forSaleLease;
	
//	@NotNull(message="For CMP is required")
//	private Double forCmp;
	
	@NotNull(message="On-going Projects is required")
	private Double onGoing;
	
	@NotNull(message="With Court Case is required")
	private Double withCourtCase;
	
	@NotNull(message="For Relocation Survey is required")
	private Double forRelocationSurvey;
	
	@NotNull(message="For Titling is required")
	private Double forTitling;
	
//	@NotNull(message="Issuance of Second ODCT is required")
//	private Double issuanceOfSecondOdct;
	
	@NotNull(message="With Jv is required")
	private Double withJv;
	
	@NotNull(message="For Project Development is required")
	private Double forProjectDevelopment;
	
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

	@Column(name="UNDER_LEASE")
	public Double getUnderLease() {
		return underLease;
	}

	public void setUnderLease(Double underLease) {
		this.underLease = underLease;
	}

	@Column(name="FOR_SALE_LEASE")
	public Double getForSaleLease() {
		return forSaleLease;
	}

	public void setForSaleLease(Double forSaleLease) {
		this.forSaleLease = forSaleLease;
	}

//	@Column(name="FOR_CMP")
//	public Double getForCmp() {
//		return forCmp;
//	}
//
//	public void setForCmp(Double forCmp) {
//		this.forCmp = forCmp;
//	}

	@Column(name="WITH_COURT_CASE")
	public Double getWithCourtCase() {
		return withCourtCase;
	}

	public void setWithCourtCase(Double withCourtCase) {
		this.withCourtCase = withCourtCase;
	}

	@Column(name="FOR_RELOCATION_SURVEY")
	public Double getForRelocationSurvey() {
		return forRelocationSurvey;
	}

	public void setForRelocationSurvey(Double forRelocationSurvey) {
		this.forRelocationSurvey = forRelocationSurvey;
	}

	@Column(name="FOR_TITLING")
	public Double getForTitling() {
		return forTitling;
	}

	public void setForTitling(Double forTitling) {
		this.forTitling = forTitling;
	}

	@Column(name="FOR_PROJECT_DEVELOPMENT")
	public Double getForProjectDevelopment() {
		return forProjectDevelopment;
	}

	public void setForProjectDevelopment(Double forProjectDevelopment) {
		this.forProjectDevelopment = forProjectDevelopment;
	}
	
	@Column(name="ON_GOING")
	public Double getOnGoing() {
		return onGoing;
	}

	public void setOnGoing(Double onGoing) {
		this.onGoing = onGoing;
	}
	
	@Column(name="WITH_JV")
	public Double getWithJv() {
		return withJv;
	}

	public void setWithJv(Double withJv) {
		this.withJv = withJv;
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
	
}
