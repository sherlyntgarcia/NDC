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
@Table(name="ndc_tbl_pdst_f_rates")
public class PdstFRates implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="1-MONTH Avg is required")
	private Double month1Avg;
	
	@NotNull(message="3-MONTH Avg is required")
	private Double month3Avg;
	
	@NotNull(message="6-MONTH Avg is required")
	private Double month6Avg;
	
	@NotNull(message="1-YEAR Avg is required")
	private Double year1Avg;
	
	@NotNull(message="2-YEAR Avg is required")
	private Double year2Avg;
	
	@NotNull(message="3-YEAR Avg is required")
	private Double year3Avg;
	
	@NotNull(message="4-YEAR Avg is required")
	private Double year4Avg;
	
	@NotNull(message="5-YEAR Avg is required")
	private Double year5Avg;
	
	@NotNull(message="7-YEAR Avg is required")
	private Double year7Avg;
	
	@NotNull(message="10-YEAR Avg is required")
	private Double year10Avg;
	
	@NotNull(message="20-YEAR Avg is required")
	private Double year20Avg;
	
	@NotNull(message="25-YEAR Avg is required")
	private Double year25Avg;
	
	private Date dateUpdated;
	private String updatedBy;
	private Integer year;
	private Integer month;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="1_MONTH_AVG")
	public Double getMonth1Avg() {
		return month1Avg;
	}

	public void setMonth1Avg(Double month1Avg) {
		this.month1Avg = month1Avg;
	}

	@Column(name="3_MONTH_AVG")
	public Double getMonth3Avg() {
		return month3Avg;
	}

	public void setMonth3Avg(Double month3Avg) {
		this.month3Avg = month3Avg;
	}

	@Column(name="6_MONTH_AVG")
	public Double getMonth6Avg() {
		return month6Avg;
	}

	public void setMonth6Avg(Double month6Avg) {
		this.month6Avg = month6Avg;
	}

	@Column(name="1_YEAR_AVG")
	public Double getYear1Avg() {
		return year1Avg;
	}

	public void setYear1Avg(Double year1Avg) {
		this.year1Avg = year1Avg;
	}

	@Column(name="2_YEAR_AVG")
	public Double getYear2Avg() {
		return year2Avg;
	}

	public void setYear2Avg(Double year2Avg) {
		this.year2Avg = year2Avg;
	}

	@Column(name="3_YEAR_AVG")
	public Double getYear3Avg() {
		return year3Avg;
	}

	public void setYear3Avg(Double year3Avg) {
		this.year3Avg = year3Avg;
	}

	@Column(name="4_YEAR_AVG")
	public Double getYear4Avg() {
		return year4Avg;
	}

	public void setYear4Avg(Double year4Avg) {
		this.year4Avg = year4Avg;
	}

	@Column(name="5_YEAR_AVG")
	public Double getYear5Avg() {
		return year5Avg;
	}

	public void setYear5Avg(Double year5Avg) {
		this.year5Avg = year5Avg;
	}

	@Column(name="7_YEAR_AVG")
	public Double getYear7Avg() {
		return year7Avg;
	}

	public void setYear7Avg(Double year7Avg) {
		this.year7Avg = year7Avg;
	}

	@Column(name="10_YEAR_AVG")
	public Double getYear10Avg() {
		return year10Avg;
	}

	public void setYear10Avg(Double year10Avg) {
		this.year10Avg = year10Avg;
	}

	@Column(name="20_YEAR_AVG")
	public Double getYear20Avg() {
		return year20Avg;
	}

	public void setYear20Avg(Double year20Avg) {
		this.year20Avg = year20Avg;
	}

	@Column(name="25_YEAR_AVG")
	public Double getYear25Avg() {
		return year25Avg;
	}

	public void setYear25Avg(Double year25Avg) {
		this.year25Avg = year25Avg;
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
	
	@Column(name="MONTH")
	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}
	
}
