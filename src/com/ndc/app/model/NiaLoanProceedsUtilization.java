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
@Table(name="ndc_tbl_nia_loan_proceeds_utilization")
public class NiaLoanProceedsUtilization implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Repair,Rehabilitation,Restoration is required")
	private Double repairRehabRestore;
	
	@NotNull(message="Rehabilitation of Farm-to-Market roads is required")
	private Double farmToMarketRoads;
	
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

	@Column(name="REPAIR_REHAB_RESTORE")
	public Double getRepairRehabRestore() {
		return repairRehabRestore;
	}

	public void setRepairRehabRestore(Double repairRehabRestore) {
		this.repairRehabRestore = repairRehabRestore;
	}

	@Column(name="FARM_TO_MARKET_ROADS")
	public Double getFarmToMarketRoads() {
		return farmToMarketRoads;
	}

	public void setFarmToMarketRoads(Double farmToMarketRoads) {
		this.farmToMarketRoads = farmToMarketRoads;
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
