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
@Table(name = "ndc_tbl_collection_efficiency")
public class CollectionEfficiency implements java.io.Serializable {

	private Long id;
	private Integer year;

	@NotNull(message = "Current Amount Collected is required")
	private Double currentAmountCollected;

	@NotNull(message = "Current Amount Billed is required")
	private Double currentAmountBilled;

	@NotNull(message = "Past Due Amount Collected is required")
	private Double pastdueAmountCollected;

	@NotNull(message = "Past Due Amount Billed is required")
	private Double pastdueAmountBilled;

	private Integer month;
	private String updatedBy;
	private Date dateUpdated;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "MONTH")
	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	@Column(name = "YEAR")
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Column(name = "CURRENT_AMOUNT_COLLECTED")
	public Double getCurrentAmountCollected() {
		return currentAmountCollected;
	}

	public void setCurrentAmountCollected(Double currentAmountCollected) {
		this.currentAmountCollected = currentAmountCollected;
	}

	@Column(name = "CURRENT_AMOUNT_BILLED")
	public Double getCurrentAmountBilled() {
		return currentAmountBilled;
	}

	public void setCurrentAmountBilled(Double currentAmountBilled) {
		this.currentAmountBilled = currentAmountBilled;
	}

	@Column(name = "PAST_DUE_AMOUNT_COLLECTED")
	public Double getPastdueAmountCollected() {
		return pastdueAmountCollected;
	}

	public void setPastdueAmountCollected(Double pastdueAmountCollected) {
		this.pastdueAmountCollected = pastdueAmountCollected;
	}

	@Column(name = "PAST_DUE_AMOUNT_BILLED")
	public Double getPastdueAmountBilled() {
		return pastdueAmountBilled;
	}

	public void setPastdueAmountBilled(Double pastdueAmountBilled) {
		this.pastdueAmountBilled = pastdueAmountBilled;
	}

	@Column(name = "UPDATED_BY")
	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATE_UPDATED")
	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

}
