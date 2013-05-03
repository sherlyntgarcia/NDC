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
@Table(name="ndc_tbl_principal_and_coupon_payments")
public class PrincipalCouponPayments implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Bond Issued is required")
	private Double bondIssued;
	
	@NotNull(message="Coupon is required")
	private Double coupon;
	
	@NotNull(message="Bond Payment is required")
	private Double bondPayment;
	
	@NotNull(message="Coupon Payment is required")
	private Double couponPayment;
	
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

	@Column(name="BOND_ISSUED")
	public Double getBondIssued() {
		return bondIssued;
	}

	public void setBondIssued(Double bondIssued) {
		this.bondIssued = bondIssued;
	}

	@Column(name="COUPON")
	public Double getCoupon() {
		return coupon;
	}

	public void setCoupon(Double coupon) {
		this.coupon = coupon;
	}

	@Column(name="BOND_PAYMENT")
	public Double getBondPayment() {
		return bondPayment;
	}

	public void setBondPayment(Double bondPayment) {
		this.bondPayment = bondPayment;
	}

	@Column(name="COUPON_PAYMENT")
	public Double getCouponPayment() {
		return couponPayment;
	}

	public void setCouponPayment(Double couponPayment) {
		this.couponPayment = couponPayment;
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
