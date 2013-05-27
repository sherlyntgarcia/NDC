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
@Table(name="ndc_tbl_actual_income_expense")
public class ActualIncomeExpense implements java.io.Serializable {

	private Long id;
	
	@NotNull(message="Total Expense is required")
	private Double totalExpense;
	
	@NotNull(message="Total Income is required")
	private Double totalIncome;
	
	@NotNull(message="Actual Advertising is required")
	private Double actualAdvertising;
	
	@NotNull(message="Actual Athletics is required")
	private Double actualAthletics;
	
	@NotNull(message="Actual Auditing is required")
	private Double actualAuditing;
	
	@NotNull(message="Actual Consultancy is required")
	private Double actualConsultancy;
	
	@NotNull(message="Actual Board Expense is required")
	private Double actualBoardExpenses;

	@NotNull(message="Actual Christmas & Anniversary is required")
	private Double actualChristmasAnniversary;
	
	@NotNull(message="Actual Communication Service is required")
	private Double actualCommunicationService;
	
	@NotNull(message="Actual Extraordinary and Miscellaneous Expense is required")
	private Double actualExtraordinary;
	
	@NotNull(message="Actual Janitorial Services is required")
	private Double actualJanitorial;
	
	@NotNull(message="Actual Legal Services is required")
	private Double actualLegal;
	
	@NotNull(message="Actual Light and Water is required")
	private Double actualLightWater;
	
	@NotNull(message="Actual Meetings/Planning and Conference is required")
	private Double actualMeetings;
	
	@NotNull(message="Actual Membership Dues and Contributions to Organizations is required")
	private Double actualMemberships;
	
	@NotNull(message="Actual Messengerial Services is required")
	private Double actualMessengerial;
	
	@NotNull(message="Actual Miscellaneous Other Services is required")
	private Double actualMisc;
	
	@NotNull(message="Actual Other Miscellaneous Expense is required")
	private Double actualOtherMisc;
	
	@NotNull(message="Actual Rentals and Storage Fees is required")
	private Double actualRentals;
	
	@NotNull(message="Actual Repair and Maintenance of Facilities is required")
	private Double actualRepairFacilities;
	
	@NotNull(message="Actual Repair and Maintenance of Vehicles is required")
	private Double actualRepairVehicles;
	
	@NotNull(message="Actual Security Services is required")
	private Double actualSecurity;
	
	@NotNull(message="Actual Subscription is required")
	private Double actualSubscription;
	
	@NotNull(message="Actual Supplies and Materials is required")
	private Double actualSuppliesMaterials;
	
	@NotNull(message="Actual Taxes, Insurance and Other Fees is required")
	private Double actualTaxes;
	
	@NotNull(message="Actual Training and Personnel Development is required")
	private Double actualTraining;
	
	@NotNull(message="Actual Travelling Expenses is required")
	private Double actualTravelling;
	
	@NotNull(message="Actual Donations is required")
	private Double actualDonations;
	
	@NotNull(message="Actual Rewards is required")
	private Double actualRewards;
	
	@NotNull(message="Budget Advertising is required")
	private Double budgetAdvertising;
	
	@NotNull(message="Budget Athletics is required")
	private Double budgetAthletics;
	
	@NotNull(message="Budget Auditing is required")
	private Double budgetAuditing;
	
	@NotNull(message="Budget Consultancy is required")
	private Double budgetConsultancy;
	
	@NotNull(message="Budget Board Expense is required")
	private Double budgetBoardExpenses;
	
	@NotNull(message="Budget Christmas & Anniversary is required")
	private Double budgetChristmasAnniversary;
	
	@NotNull(message="Budget Communication Service is required")
	private Double budgetCommunicationService;
	
	@NotNull(message="Budget Extraordinary and Miscellaneous Expense is required")
	private Double budgetExtraordinary;
	
	@NotNull(message="Budget Janitorial Services is required")
	private Double budgetJanitorial;
	
	@NotNull(message="Budget Legal Services is required")
	private Double budgetLegal;
	
	@NotNull(message="Budget Light and Water is required")
	private Double budgetLightWater;
	
	@NotNull(message="Budget Meetings/Planning and Conference is required")
	private Double budgetMeetings;
	
	@NotNull(message="Budget Membership Dues and Contributions to Organizations is required")
	private Double budgetMemberships;
	
	@NotNull(message="Budget Messengerial Services is required")
	private Double budgetMessengerial;
	
	@NotNull(message="Budget Miscellaneous Other Services is required")
	private Double budgetMisc;
	
	@NotNull(message="Budget Other Miscellaneous Expense is required")
	private Double budgetOtherMisc;
	
	@NotNull(message="Budget Rentals and Storage Fees is required")
	private Double budgetRentals;
	
	@NotNull(message="Budget Repair and Maintenance of Facilities is required")
	private Double budgetRepairFacilities;
	
	@NotNull(message="Budget Repair and Maintenance of Vehicles is required")
	private Double budgetRepairVehicles;
	
	@NotNull(message="Budget Security Services is required")
	private Double budgetSecurity;
	
	@NotNull(message="Budget Subscription is required")
	private Double budgetSubscription;
	
	@NotNull(message="Budget Supplies and Materials is required")
	private Double budgetSuppliesMaterials;
	
	@NotNull(message="Budget Taxes, Insurance and Other Fees is required")
	private Double budgetTaxes;
	
	@NotNull(message="Budget Training and Personnel Development is required")
	private Double budgetTraining;
	
	@NotNull(message="Budget Travelling Expenses is required")
	private Double budgetTravelling;
	
	@NotNull(message="Budget Donations is required")
	private Double budgetDonations;
	
	@NotNull(message="Budget Rewards is required")
	private Double budgetRewards;
	
	private Integer year;
	private Integer month;
	
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

	@Column(name="TOTAL_EXPENSE")
	public Double gettotalExpense() {
		return totalExpense;
	}

	public void settotalExpense(Double totalExpense) {
		this.totalExpense = totalExpense;
	}
	
	@Column(name="YEAR")
	public Integer getYear() {
		return year;
	}
	
	public void setYear(Integer year) {
		this.year = year;
	}
	
	@Column(name="MONTH")
	public Integer getMonth() {
		return month;
	}
	
	public void setMonth(Integer month) {
		this.month = month;
	}
	
	@Column(name="TOTAL_INCOME")
	public Double gettotalIncome() {
		return totalIncome;
	}

	public void settotalIncome(Double totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	@Column(name="ACTUAL_ADVERTISING")
	public Double getActualAdvertising() {
		return actualAdvertising;
	}

	public void setActualAdvertising(Double actualAdvertising) {
		this.actualAdvertising = actualAdvertising;
	}
	
	@Column(name="ACTUAL_ATHLETICS")
	public Double getActualAthletics() {
		return actualAthletics;
	}

	public void setActualAthletics(Double athletics) {
		this.actualAthletics = athletics;
	}
	
	@Column(name="ACTUAL_AUDITING")
	public Double getActualAuditing() {
		return actualAuditing;
	}

	public void setActualAuditing(Double auditing) {
		this.actualAuditing = auditing;
	}

	@Column(name="ACTUAL_CONSULTANCY")
	public Double getActualConsultancy() {
		return actualConsultancy;
	}
	
	public void setActualConsultancy(Double consultancy) {
		this.actualConsultancy = consultancy;
	}
	
	@Column(name="BUDGET_ADVERTISING")
	public Double getBudgetAdvertising() {
		return budgetAdvertising;
	}

	public void setBudgetAdvertising(Double budgetAdvertising) {
		this.budgetAdvertising = budgetAdvertising;
	}

	@Column(name="BUDGET_ATHLETICS")
	public Double getBudgetAthletics() {
		return budgetAthletics;
	}

	public void setBudgetAthletics(Double budgetAthletics) {
		this.budgetAthletics = budgetAthletics;
	}

	@Column(name="BUDGET_AUDITING")
	public Double getBudgetAuditing() {
		return budgetAuditing;
	}

	public void setBudgetAuditing(Double budgetAuditing) {
		this.budgetAuditing = budgetAuditing;
	}

	@Column(name="BUDGET_CONSULTANCY")
	public Double getBudgetConsultancy() {
		return budgetConsultancy;
	}

	public void setBudgetConsultancy(Double budgetConsultancy) {
		this.budgetConsultancy = budgetConsultancy;
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

	@Column(name="ACTUAL_BOARD_EXPENSES")
	public Double getActualBoardExpenses() {
		return actualBoardExpenses;
	}

	public void setActualBoardExpenses(Double actualBoardExpenses) {
		this.actualBoardExpenses = actualBoardExpenses;
	}

	@Column(name="ACTUAL_CHRISTMAS_ANNIVERSARY")
	public Double getActualChristmasAnniversary() {
		return actualChristmasAnniversary;
	}

	public void setActualChristmasAnniversary(Double actualChristmasAnniversary) {
		this.actualChristmasAnniversary = actualChristmasAnniversary;
	}

	@Column(name="ACTUAL_COMMUNICATION_SERVICE")
	public Double getActualCommunicationService() {
		return actualCommunicationService;
	}

	public void setActualCommunicationService(Double actualCommunicationService) {
		this.actualCommunicationService = actualCommunicationService;
	}

	@Column(name="ACTUAL_EXTRAORDINARY")
	public Double getActualExtraordinary() {
		return actualExtraordinary;
	}

	public void setActualExtraordinary(Double actualExtraordinary) {
		this.actualExtraordinary = actualExtraordinary;
	}

	@Column(name="ACTUAL_JANITORIAL")
	public Double getActualJanitorial() {
		return actualJanitorial;
	}

	public void setActualJanitorial(Double actualJanitorial) {
		this.actualJanitorial = actualJanitorial;
	}

	@Column(name="ACTUAL_LEGAL")
	public Double getActualLegal() {
		return actualLegal;
	}

	public void setActualLegal(Double actualLegal) {
		this.actualLegal = actualLegal;
	}

	@Column(name="ACTUAL_LIGHT_WATER")
	public Double getActualLightWater() {
		return actualLightWater;
	}

	public void setActualLightWater(Double actualLightWater) {
		this.actualLightWater = actualLightWater;
	}

	@Column(name="ACTUAL_MEETINGS")
	public Double getActualMeetings() {
		return actualMeetings;
	}

	public void setActualMeetings(Double actualMeetings) {
		this.actualMeetings = actualMeetings;
	}

	@Column(name="ACTUAL_MEMBERSHIPS")
	public Double getActualMemberships() {
		return actualMemberships;
	}

	public void setActualMemberships(Double actualMemberships) {
		this.actualMemberships = actualMemberships;
	}

	@Column(name="ACTUAL_MESSENGERIAL")
	public Double getActualMessengerial() {
		return actualMessengerial;
	}

	public void setActualMessengerial(Double actualMessengerial) {
		this.actualMessengerial = actualMessengerial;
	}
	
	@Column(name="ACTUAL_MISC")
	public Double getActualMisc() {
		return actualMisc;
	}

	public void setActualMisc(Double actualMisc) {
		this.actualMisc = actualMisc;
	}

	@Column(name="ACTUAL_OTHER_MISC")
	public Double getActualOtherMisc() {
		return actualOtherMisc;
	}

	public void setActualOtherMisc(Double actualOtherMisc) {
		this.actualOtherMisc = actualOtherMisc;
	}

	@Column(name="ACTUAL_RENTALS")
	public Double getActualRentals() {
		return actualRentals;
	}

	public void setActualRentals(Double actualRentals) {
		this.actualRentals = actualRentals;
	}

	@Column(name="ACTUAL_REPAIR_FACILITIES")
	public Double getActualRepairFacilities() {
		return actualRepairFacilities;
	}

	public void setActualRepairFacilities(Double actualRepairFacilities) {
		this.actualRepairFacilities = actualRepairFacilities;
	}

	@Column(name="ACTUAL_REPAIR_VEHICLES")
	public Double getActualRepairVehicles() {
		return actualRepairVehicles;
	}

	public void setActualRepairVehicles(Double actualRepairVehicles) {
		this.actualRepairVehicles = actualRepairVehicles;
	}

	@Column(name="ACTUAL_SECURITY")
	public Double getActualSecurity() {
		return actualSecurity;
	}

	public void setActualSecurity(Double actualSecurity) {
		this.actualSecurity = actualSecurity;
	}

	@Column(name="ACTUAL_SUBSCRIPTION")
	public Double getActualSubscription() {
		return actualSubscription;
	}

	public void setActualSubscription(Double actualSubscription) {
		this.actualSubscription = actualSubscription;
	}

	@Column(name="ACTUAL_SUPPLIES_MATERIALS")
	public Double getActualSuppliesMaterials() {
		return actualSuppliesMaterials;
	}

	public void setActualSuppliesMaterials(Double actualSuppliesMaterials) {
		this.actualSuppliesMaterials = actualSuppliesMaterials;
	}

	@Column(name="ACTUAL_TAXES")
	public Double getActualTaxes() {
		return actualTaxes;
	}

	public void setActualTaxes(Double actualTaxes) {
		this.actualTaxes = actualTaxes;
	}

	@Column(name="ACTUAL_TRAINING")
	public Double getActualTraining() {
		return actualTraining;
	}

	public void setActualTraining(Double actualTraining) {
		this.actualTraining = actualTraining;
	}

	@Column(name="ACTUAL_TRAVELLING")
	public Double getActualTravelling() {
		return actualTravelling;
	}

	public void setActualTravelling(Double actualTravelling) {
		this.actualTravelling = actualTravelling;
	}
	
	@Column(name="ACTUAL_DONATIONS")
	public Double getActualDonations() {
		return actualDonations;
	}

	public void setActualDonations(Double actualDonations) {
		this.actualDonations = actualDonations;
	}

	@Column(name="ACTUAL_REWARDS")
	public Double getActualRewards() {
		return actualRewards;
	}

	public void setActualRewards(Double actualRewards) {
		this.actualRewards = actualRewards;
	}

	@Column(name="BUDGET_BOARD_EXPENSES")
	public Double getBudgetBoardExpenses() {
		return budgetBoardExpenses;
	}

	public void setBudgetBoardExpenses(Double budgetBoardExpenses) {
		this.budgetBoardExpenses = budgetBoardExpenses;
	}

	@Column(name="BUDGET_CHRISTMAS_ANNIVERSARY")
	public Double getBudgetChristmasAnniversary() {
		return budgetChristmasAnniversary;
	}

	public void setBudgetChristmasAnniversary(Double budgetChristmasAnniversary) {
		this.budgetChristmasAnniversary = budgetChristmasAnniversary;
	}

	@Column(name="BUDGET_COMMUNICATION_SERVICE")
	public Double getBudgetCommunicationService() {
		return budgetCommunicationService;
	}

	public void setBudgetCommunicationService(Double budgetCommunicationService) {
		this.budgetCommunicationService = budgetCommunicationService;
	}

	@Column(name="BUDGET_EXTRAORDINARY")
	public Double getBudgetExtraordinary() {
		return budgetExtraordinary;
	}

	public void setBudgetExtraordinary(Double budgetExtraordinary) {
		this.budgetExtraordinary = budgetExtraordinary;
	}

	@Column(name="BUDGET_JANITORIAL")
	public Double getBudgetJanitorial() {
		return budgetJanitorial;
	}

	public void setBudgetJanitorial(Double budgetJanitorial) {
		this.budgetJanitorial = budgetJanitorial;
	}

	@Column(name="BUDGET_LEGAL")
	public Double getBudgetLegal() {
		return budgetLegal;
	}

	public void setBudgetLegal(Double budgetLegal) {
		this.budgetLegal = budgetLegal;
	}

	@Column(name="BUDGET_LIGHT_WATER")
	public Double getBudgetLightWater() {
		return budgetLightWater;
	}

	public void setBudgetLightWater(Double budgetLightWater) {
		this.budgetLightWater = budgetLightWater;
	}

	@Column(name="BUDGET_MEETINGS")
	public Double getBudgetMeetings() {
		return budgetMeetings;
	}

	public void setBudgetMeetings(Double budgetMeetings) {
		this.budgetMeetings = budgetMeetings;
	}

	@Column(name="BUDGET_MEMBERSHIPS")
	public Double getBudgetMemberships() {
		return budgetMemberships;
	}

	public void setBudgetMemberships(Double budgetMemberships) {
		this.budgetMemberships = budgetMemberships;
	}

	@Column(name="BUDGET_MESSENGERIAL")
	public Double getBudgetMessengerial() {
		return budgetMessengerial;
	}

	public void setBudgetMessengerial(Double budgetMessengerial) {
		this.budgetMessengerial = budgetMessengerial;
	}

	@Column(name="BUDGET_MISC")
	public Double getBudgetMisc() {
		return budgetMisc;
	}

	public void setBudgetMisc(Double budgetMisc) {
		this.budgetMisc = budgetMisc;
	}

	@Column(name="BUDGET_OTHER_MISC")
	public Double getBudgetOtherMisc() {
		return budgetOtherMisc;
	}

	public void setBudgetOtherMisc(Double budgetOtherMisc) {
		this.budgetOtherMisc = budgetOtherMisc;
	}

	@Column(name="BUDGET_RENTALS")
	public Double getBudgetRentals() {
		return budgetRentals;
	}

	public void setBudgetRentals(Double budgetRentals) {
		this.budgetRentals = budgetRentals;
	}

	@Column(name="BUDGET_REPAIR_FACILITIES")
	public Double getBudgetRepairFacilities() {
		return budgetRepairFacilities;
	}

	public void setBudgetRepairFacilities(Double budgetRepairFacilities) {
		this.budgetRepairFacilities = budgetRepairFacilities;
	}

	@Column(name="BUDGET_REPAIR_VEHICLES")
	public Double getBudgetRepairVehicles() {
		return budgetRepairVehicles;
	}

	public void setBudgetRepairVehicles(Double budgetRepairVehicles) {
		this.budgetRepairVehicles = budgetRepairVehicles;
	}

	@Column(name="BUDGET_SECURITY")
	public Double getBudgetSecurity() {
		return budgetSecurity;
	}

	public void setBudgetSecurity(Double budgetSecurity) {
		this.budgetSecurity = budgetSecurity;
	}

	@Column(name="BUDGET_SUBSCRIPTION")
	public Double getBudgetSubscription() {
		return budgetSubscription;
	}

	public void setBudgetSubscription(Double budgetSubscription) {
		this.budgetSubscription = budgetSubscription;
	}

	@Column(name="BUDGET_SUPPLIES_MATERIALS")
	public Double getBudgetSuppliesMaterials() {
		return budgetSuppliesMaterials;
	}

	public void setBudgetSuppliesMaterials(Double budgetSuppliesMaterials) {
		this.budgetSuppliesMaterials = budgetSuppliesMaterials;
	}

	@Column(name="BUDGET_TAXES")
	public Double getBudgetTaxes() {
		return budgetTaxes;
	}

	public void setBudgetTaxes(Double budgetTaxes) {
		this.budgetTaxes = budgetTaxes;
	}

	@Column(name="BUDGET_TRAINING")
	public Double getBudgetTraining() {
		return budgetTraining;
	}

	public void setBudgetTraining(Double budgetTraining) {
		this.budgetTraining = budgetTraining;
	}

	@Column(name="BUDGET_TRAVELLING")
	public Double getBudgetTravelling() {
		return budgetTravelling;
	}

	public void setBudgetTravelling(Double budgetTravelling) {
		this.budgetTravelling = budgetTravelling;
	}
	
	@Column(name="BUDGET_DONATIONS")
	public Double getBudgetDonations() {
		return budgetDonations;
	}

	public void setBudgetDonations(Double budgetDonations) {
		this.budgetDonations = budgetDonations;
	}

	@Column(name="BUDGET_REWARDS")
	public Double getBudgetRewards() {
		return budgetRewards;
	}

	public void setBudgetRewards(Double budgetRewards) {
		this.budgetRewards = budgetRewards;
	}
	
}