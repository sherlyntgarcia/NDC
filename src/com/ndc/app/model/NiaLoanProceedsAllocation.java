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
@Table(name="ndc_tbl_nia_loan_proceeds_allocation")
public class NiaLoanProceedsAllocation implements java.io.Serializable {

	private Long id;
	
	//regions
	@NotNull(message="Value for Region-1 is required")
	private Double region1;
	
	@NotNull(message="Value for Region-2 is required")
	private Double region2;
	
	@NotNull(message="Value for Region-3 is required")
	private Double region3;
	
	@NotNull(message="Value for Region-4 is required")
	private Double region4;
	
	@NotNull(message="Value for Region-5 is required")
	private Double region5;
	
	@NotNull(message="Value for Region-6 is required")
	private Double region6;
	
	@NotNull(message="Value for Region-7 is required")
	private Double region7;
	
	@NotNull(message="Value for Region-8 is required")
	private Double region8;
	
	@NotNull(message="Value for Region-9 is required")
	private Double region9;
	
	@NotNull(message="Value for Region-10 is required")
	private Double region10;
	
	@NotNull(message="Value for Region-11 is required")
	private Double region11;
	
	@NotNull(message="Value for Region-12 is required")
	private Double region12;
	
	@NotNull(message="Value for Region-13 is required")
	private Double region13;
	
	@NotNull(message="Value for CAR is required")
	private Double car;
	
	@NotNull(message="Value for ARIIP is required")
	private Double ariip;
	
	@NotNull(message="Value for MARIIS is required")
	private Double mariis;
	
	@NotNull(message="Value for UPRIIS is required")
	private Double upriis;
	
	@NotNull(message="Value for ARMM is required")
	private Double armm;
	
	@NotNull(message="Value for NCR is required")
	private Double ncr;
	
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
	
	@Column(name="REGION_1")
	public Double getRegion1() {
		return region1;
	}
	
	public void setRegion1(Double region1) {
		this.region1 = region1;
	}

	@Column(name="REGION_2")
	public Double getRegion2() {
		return region2;
	}

	public void setRegion2(Double region2) {
		this.region2 = region2;
	}

	@Column(name="REGION_3")
	public Double getRegion3() {
		return region3;
	}

	public void setRegion3(Double region3) {
		this.region3 = region3;
	}

	@Column(name="REGION_4")
	public Double getRegion4() {
		return region4;
	}

	public void setRegion4(Double region4) {
		this.region4 = region4;
	}

	@Column(name="REGION_5")
	public Double getRegion5() {
		return region5;
	}

	public void setRegion5(Double region5) {
		this.region5 = region5;
	}

	@Column(name="REGION_6")
	public Double getRegion6() {
		return region6;
	}

	public void setRegion6(Double region6) {
		this.region6 = region6;
	}

	@Column(name="REGION_7")
	public Double getRegion7() {
		return region7;
	}

	public void setRegion7(Double region7) {
		this.region7 = region7;
	}

	@Column(name="REGION_8")
	public Double getRegion8() {
		return region8;
	}

	public void setRegion8(Double region8) {
		this.region8 = region8;
	}

	@Column(name="REGION_9")
	public Double getRegion9() {
		return region9;
	}

	public void setRegion9(Double region9) {
		this.region9 = region9;
	}

	@Column(name="REGION_10")
	public Double getRegion10() {
		return region10;
	}

	public void setRegion10(Double region10) {
		this.region10 = region10;
	}

	@Column(name="REGION_11")
	public Double getRegion11() {
		return region11;
	}

	public void setRegion11(Double region11) {
		this.region11 = region11;
	}

	@Column(name="REGION_12")
	public Double getRegion12() {
		return region12;
	}

	public void setRegion12(Double region12) {
		this.region12 = region12;
	}

	@Column(name="REGION_13")
	public Double getRegion13() {
		return region13;
	}

	public void setRegion13(Double region13) {
		this.region13 = region13;
	}

	@Column(name="CAR")
	public Double getCar() {
		return car;
	}

	public void setCar(Double car) {
		this.car = car;
	}

	@Column(name="ARIIP")
	public Double getAriip() {
		return ariip;
	}

	public void setAriip(Double ariip) {
		this.ariip = ariip;
	}

	@Column(name="MARIIS")
	public Double getMariis() {
		return mariis;
	}

	public void setMariis(Double mariis) {
		this.mariis = mariis;
	}

	@Column(name="UPRIIS")
	public Double getUpriis() {
		return upriis;
	}

	public void setUpriis(Double upriis) {
		this.upriis = upriis;
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

	public Double getArmm() {
		return armm;
	}

	public void setArmm(Double armm) {
		this.armm = armm;
	}

	public Double getNcr() {
		return ncr;
	}

	public void setNcr(Double ncr) {
		this.ncr = ncr;
	}
	
}
