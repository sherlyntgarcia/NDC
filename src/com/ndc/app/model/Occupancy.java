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
@Table(name="ndc_tbl_occupancy")
public class Occupancy implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Occupied field is required")
	private Long occupied;
	
	@NotNull(message="Vacant field is required")
	private Long vacant;
	
	private String updatedBy;
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

	@Column(name="OCCUPIED")
	public Long getOccupied() {
		return occupied;
	}

	public void setOccupied(Long occupied) {
		this.occupied = occupied;
	}

	@Column(name="VACANT")
	public Long getVacant() {
		return vacant;
	}

	public void setVacant(Long vacant) {
		this.vacant = vacant;
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
	
}
