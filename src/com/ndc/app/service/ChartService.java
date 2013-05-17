package com.ndc.app.service;

import java.util.List;
import java.util.Map;

import com.ndc.app.model.ActualIncomeExpense;
import com.ndc.app.model.AgriAgraBonds;
import com.ndc.app.model.BUCapitalExpenditures;
import com.ndc.app.model.BUMooe;
import com.ndc.app.model.BUPersonalServices;
import com.ndc.app.model.BalanceSheet;
import com.ndc.app.model.BondMaturity;
import com.ndc.app.model.BondsIssued;
import com.ndc.app.model.CollectionEfficiency;
import com.ndc.app.model.EconomicImpact;
import com.ndc.app.model.IncomeStatement;
import com.ndc.app.model.MaintenanceCost;
import com.ndc.app.model.NetLending;
import com.ndc.app.model.NiaLoanCollection;
import com.ndc.app.model.NiaLoanProceedsAllocation;
import com.ndc.app.model.NiaLoanProceedsUtilization;
import com.ndc.app.model.Occupancy;
import com.ndc.app.model.PdstFRates;
import com.ndc.app.model.PrincipalCouponPayments;
import com.ndc.app.model.ProjectedActualIncome;
import com.ndc.app.model.ProjectedActualIncome2;
import com.ndc.app.model.Shareholders;
import com.ndc.app.model.SourcesFunds;
import com.ndc.app.model.SpgBalanceSheet;
import com.ndc.app.model.SpgCashFlow;
import com.ndc.app.model.SpgIncomeStatement;
import com.ndc.app.model.SpgSubCategory;
import com.ndc.app.model.StatusAssets;


public interface ChartService {

	public BalanceSheet getBalanceSheetByYear(Integer year);
	public void addBalanceSheet(BalanceSheet balanceSheet) throws Exception;
	public List<BalanceSheet> generateBalanceSheet();
	
	public IncomeStatement getIncomeStatementByYear(Integer year);
	public void addIncomeStatement(IncomeStatement incomeStatement) throws Exception;
	public List<IncomeStatement> generateIncomeStatement();
	
	public BondsIssued getBondsIssuedByYear(Integer year);
	public void addBondsIssued(BondsIssued bondsIssued) throws Exception;
	public List<BondsIssued> generateBondsIssued();
	
	public BondMaturity getBondMaturityByYear(Integer year);
	public void addBondMaturity(BondMaturity bondMaturity) throws Exception;
	public List<BondMaturity> generateBondMaturity();
	
	public PrincipalCouponPayments getPrincipalCouponPaymentsByYear(Integer year);
	public void addPrincipalCouponPayments(PrincipalCouponPayments principalCouponPayments) throws Exception;
	public List<PrincipalCouponPayments> generatePrincipalCouponPayments();
	
	public List <PdstFRates> getPdstFRates();
	public void addPdstFRates(PdstFRates pdstFRates) throws Exception;
	
	public EconomicImpact getLatestEconomicImpact();
	public void addEconomicImpact(EconomicImpact economicImpact) throws Exception;
	
	public NiaLoanProceedsUtilization getLatestNiaLoanProceedsUtilization();
	public void addNiaLoanProceedsUtilization(NiaLoanProceedsUtilization niaLoanProceedsUtilization) throws Exception;
	
	public NiaLoanProceedsAllocation getLatestNiaLoanProceedsAllocation();
	public void addNiaLoanProceedsAllocation(NiaLoanProceedsAllocation niaLoanProceedsAllocation) throws Exception;
	
	public List<Shareholders> getShareholdersByProjectId(Long id);
	public void addShareholders(Shareholders shareholders) throws Exception;
	
	public Occupancy getOccupancyChart();
	public void addOccupancyChart(Occupancy occupancy) throws Exception;
	
	public NiaLoanCollection getLatestNiaLoanCollection();
	public void addNiaLoanCollection(NiaLoanCollection niaLoanCollection) throws Exception;
	
	public NetLending getNetLendingByYear(Integer year);
	public void addNetLending(NetLending netLending) throws Exception;
	public List<NetLending> generateNetLending();
	
	public AgriAgraBonds getAgriAgraBondsByYear(Integer year);
	public void addAgriAgraBonds(AgriAgraBonds agriAgraBonds) throws Exception;
	public Double getLatestAgriAgraBonds();
	public List<AgriAgraBonds> generateAgriAgraBonds();
	
	public MaintenanceCost getMaintenaneCostByYear(Integer year);
	public void addMaintenanceCost(MaintenanceCost maintenanceCost) throws Exception;
	public List<MaintenanceCost> generateMaintenanceCost();
	
	public SourcesFunds getSourcesFundsByYear(Integer year);
	public void addSourcesFunds(SourcesFunds sourcesFunds) throws Exception;
	public List<SourcesFunds> generateSourcesFunds();
	
	public StatusAssets getLatestStatusAssets();
	public void addStatusAssets(StatusAssets statusAssets) throws Exception;
	public List<StatusAssets> generateStatusAssets();
	
	public SpgIncomeStatement getSpgIncomeStatementByYear(Integer year, Long projectId);
	public void addSpgIncomeStatement(SpgIncomeStatement spgIncomeStatement) throws Exception;
	public List<SpgIncomeStatement> generateSpgIncomeStatement();
	
	public SpgBalanceSheet getSpgBalanceSheetByYear(Integer year, Long projectId);
	public void addSpgBalanceSheet(SpgBalanceSheet spgBalanceSheet) throws Exception;
	public List<SpgBalanceSheet> generateSpgBalanceSheet();
	
	public SpgCashFlow getSpgCashFlowByYear(Integer year, Long projectId);
	public void addSpgCashFlow(SpgCashFlow spgCashFlow) throws Exception;
	public List<SpgCashFlow> generateSpgCashFlow();
	
	public ProjectedActualIncome getLatestProjectedActualIncome();
	public void addProjectedActualIncome(ProjectedActualIncome projectedActualIncome) throws Exception;
	
	public ProjectedActualIncome2 getLatestProjectedActualIncome2();
	public void addProjectedActualIncome2(ProjectedActualIncome2 projectedActualIncome2) throws Exception;
	
	public List<ActualIncomeExpense> getActualIncomeExpense();
	public void addActualIncomeExpense(ActualIncomeExpense actualincomeexpense) throws Exception;
	
	public List<CollectionEfficiency> getCollectionEfficiency();
	public void addCollectionEfficiency(CollectionEfficiency collectionefficiency) throws Exception;
	
	//FOR BUDGET UTILIZATION
	public BUPersonalServices getLatestBUPersonalServices();
	public void addBUPersonalServices(BUPersonalServices buPersonalServices) throws Exception;
		
	public BUMooe getLatestBUMooe();
	public void addBUMooe(BUMooe buMooe) throws Exception;
		
	public BUCapitalExpenditures getLatestBUCapitalExpenditures();
	public void addBUCapitalExpenditures(BUCapitalExpenditures buCapitalExpenditures) throws Exception;
	
	public ActualIncomeExpense getActualIncomeExpenseById(Long id);
	
	public Map<String, Double> getOverallBudgetUtilization();
	
	//get latest year
	public Integer getLatestYearOfData(Class clazz);
	
}
