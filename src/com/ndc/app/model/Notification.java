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

@Entity
@Table(name="ndc_tbl_notifications")
public class Notification implements java.io.Serializable {

	private Long id;
	private Long userId;
	private String message;
	private String group;
	private Date dateNotified;
	private String triggeredBy;
	private boolean visible;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="USER_ID")
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Column(name="MESSAGE")
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name="NDC_GROUP")
	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_NOTIFIED")
	public Date getDateNotified() {
		return dateNotified;
	}

	public void setDateNotified(Date dateNotified) {
		this.dateNotified = dateNotified;
	}

	@Column(name="TRIGGERED_BY")
	public String getTriggeredBy() {
		return triggeredBy;
	}

	public void setTriggeredBy(String triggeredBy) {
		this.triggeredBy = triggeredBy;
	}

	@Column(name="VISIBLE")
	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	
}
