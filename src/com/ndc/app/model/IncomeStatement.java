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
@Table(name="ndc_tbl_income_statement")
public class IncomeStatement implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Operating Income is required")
	private Double operatingIncome;
	
	@NotNull(message="Dividend is required")
	private Double dividend;
	
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

	@Column(name="OPERATING_INCOME")
	public Double getOperatingIncome() {
		return operatingIncome;
	}

	public void setOperatingIncome(Double operatingIncome) {
		this.operatingIncome = operatingIncome;
	}

	@Column(name="DIVIDEND")
	public Double getDividend() {
		return dividend;
	}

	public void setDividend(Double dividend) {
		this.dividend = dividend;
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
