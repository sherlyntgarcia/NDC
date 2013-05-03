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
@Table(name="ndc_tbl_sources_funds")
public class SourcesFunds implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Sources of Funds is required")
	private Double projectedSourcesOfFunds;
	
	@NotNull(message="Uses of Funds is required")
	private Double projectedUsesOfFunds;
	
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
	
	@Column(name="PROJECTED_SOURCES_OF_FUNDS")
	public Double getProjectedSourcesOfFunds() {
		return projectedSourcesOfFunds;
	}
	
	public void setProjectedSourcesOfFunds(Double projectedSourcesOfFunds) {
		this.projectedSourcesOfFunds = projectedSourcesOfFunds;
	}
	
	@Column(name="PROJECTED_USES_OF_FUNDS")
	public Double getProjectedUsesOfFunds() {
		return projectedUsesOfFunds;
	}
	
	public void setProjectedUsesOfFunds(Double projectedUsesOfFunds) {
		this.projectedUsesOfFunds = projectedUsesOfFunds;
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
