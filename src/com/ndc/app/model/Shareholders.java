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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="ndc_tbl_shareholders")
public class Shareholders implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Project is required")
	private Long projectId;
	
	@NotEmpty(message="Shareholders is required")
	private String shareholders;
	
	@NotNull(message="Shares is required")
	private Double shares;
	
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

	@Column(name="SHAREHOLDERS")
	public String getShareholders() {
		return shareholders;
	}

	public void setShareholders(String shareholders) {
		this.shareholders = shareholders;
	}

	@Column(name="SHARES")
	public Double getShares() {
		return shares;
	}

	public void setShares(Double shares) {
		this.shares = shares;
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

	@Column(name="PROJECT_ID")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
}
