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
@Table(name="ndc_tbl_economic_impact")
public class EconomicImpact implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Rehabilitated areas is required")
	private Double rehabilitated;
	
	@NotNull(message="Restored areas is required")
	private Double restored;
	
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

	@Column(name="REHABILITATED")
	public Double getRehabilitated() {
		return rehabilitated;
	}

	public void setRehabilitated(Double rehabilitated) {
		this.rehabilitated = rehabilitated;
	}

	@Column(name="RESTORED")
	public Double getRestored() {
		return restored;
	}

	public void setRestored(Double restored) {
		this.restored = restored;
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
