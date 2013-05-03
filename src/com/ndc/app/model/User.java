package com.ndc.app.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="ndc_tbl_users")
public class User implements java.io.Serializable {

	private Long id;
	
	@NotEmpty(message="Firstname is required") 
	private String firstName;
	
	@NotEmpty(message="Middlename is required") 
	private String middleName;
	
	@NotEmpty(message="Lastname is required") 
	private String lastName;
	
	@Size(min=3,max=10,message="Username must be at least 3-10 characters long") 
	private String username;
	
	//40 max chars because it will be converted to 40-char MD5 hash.
	@Size(min=8,max=40,message="Password must be at least 5-10 characters long")
	private String password;
	
	@Pattern(regexp=".+@.+\\.[a-z]+",message="A valid email is required")
	private String email;
	
	private String ndcGroup;
	private boolean activated;
	private Integer loginAttempts;
	private String secretQuestion;
	
	@NotEmpty(message="Secret answer is required")
	private String secretAnswer;
	
	private String role;
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="FIRST_NAME")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name="MIDDLE_NAME")
	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	@Column(name="LAST_NAME")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name="USERNAME")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name="PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name="EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="NDC_GROUP")
	public String getNdcGroup() {
		return ndcGroup;
	}

	public void setNdcGroup(String ndcGroup) {
		this.ndcGroup = ndcGroup;
	}

	@Column(name="IS_ACTIVATED")
	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}

	@Column(name="LOGIN_ATTEMPTS")
	public Integer getLoginAttempts() {
		return loginAttempts;
	}

	public void setLoginAttempts(Integer loginAttempts) {
		this.loginAttempts = loginAttempts;
	}

	@Column(name="SECRET_QUESTION")
	public String getSecretQuestion() {
		return secretQuestion;
	}

	public void setSecretQuestion(String secretQuestion) {
		this.secretQuestion = secretQuestion;
	}

	@Column(name="SECRET_ANSWER")
	public String getSecretAnswer() {
		return secretAnswer;
	}

	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
	}

	@Column(name="ROLE")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
