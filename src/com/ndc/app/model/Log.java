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
@Table(name="ndc_tbl_logs")
public class Log implements java.io.Serializable {

	private Long id;
	private String loggedBy;
	private Date accessTime;
	private String description;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="LOGGED_BY")
	public String getLoggedBy() {
		return loggedBy;
	}
	
	public void setLoggedBy(String loggedBy) {
		this.loggedBy = loggedBy;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ACCESS_TIME")
	public Date getAccessTime() {
		return accessTime;
	}
	
	public void setAccessTime(Date accessTime) {
		this.accessTime = accessTime;
	}
	
	@Column(name="DESCRIPTION")
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
}
