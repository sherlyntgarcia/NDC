package com.ndc.app.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ndc.app.dao.ChartDao;
import com.ndc.app.model.ActualIncomeExpense;
import com.ndc.app.model.AgriAgraBonds;
import com.ndc.app.model.BUCapitalExpenditures;
import com.ndc.app.model.BUMooe;
import com.ndc.app.model.BUPersonalServices;
import com.ndc.app.model.CollectionEfficiency;
import com.ndc.app.model.BalanceSheet;
import com.ndc.app.model.BondMaturity;
import com.ndc.app.model.BondsIssued;
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
import com.ndc.app.service.ChartService;
import com.ndc.app.util.AuthenticationUtil;

@Service("chartService")
public class ChartServiceImpl implements ChartService {

	@Autowired
	@Qualifier("chartDao")
	private ChartDao chartDao;

	@Override
	@Transactional
	public void addBalanceSheet(BalanceSheet balanceSheet) throws Exception {
		// TODO Auto-generated method stub
		balanceSheet.setDateUpdated(new Date());
		balanceSheet.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addBalanceSheet(balanceSheet);
	}

	@Override
	@Transactional
	public BalanceSheet getBalanceSheetByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getBalanceSheetByYear(year);
	}
	
	@Override
	@Transactional
	public List<BalanceSheet> generateBalanceSheet() {
		// TODO Auto-generated method stub
		return chartDao.generateBalanceSheet();
	}

	@Override
	@Transactional
	public IncomeStatement getIncomeStatementByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getIncomeStatementByYear(year);
	}

	@Override
	@Transactional
	public void addIncomeStatement(IncomeStatement incomeStatement)
			throws Exception {
		// TODO Auto-generated method stub
		incomeStatement.setDateUpdated(new Date());
		incomeStatement.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addIncomeStatement(incomeStatement);
	}
	
	@Override
	@Transactional
	public List<IncomeStatement> generateIncomeStatement() {
		// TODO Auto-generated method stub
		return chartDao.generateIncomeStatement();
	}

	@Override
	@Transactional
	public BondsIssued getBondsIssuedByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getBondsIssuedByYear(year);
	}

	@Override
	@Transactional
	public void addBondsIssued(BondsIssued bondsIssued) throws Exception {
		// TODO Auto-generated method stub
		bondsIssued.setDateUpdated(new Date());
		bondsIssued.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addBondsIssued(bondsIssued);
	}
	
	@Override
	@Transactional
	public List<BondsIssued> generateBondsIssued() {
		// TODO Auto-generated method stub
		return chartDao.generateBondsIssued();
	}

	@Override
	@Transactional
	public BondMaturity getBondMaturityByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getBondMaturityByYear(year);
	}

	@Override
	@Transactional
	public void addBondMaturity(BondMaturity bondMaturity) throws Exception {
		// TODO Auto-generated method stub
		bondMaturity.setDateUpdated(new Date());
		bondMaturity.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addBondMaturity(bondMaturity);
	}
	
	@Override
	@Transactional
	public List<BondMaturity> generateBondMaturity() {
		// TODO Auto-generated method stub
		return chartDao.generateBondMaturity();
	}

	@Override
	@Transactional
	public PrincipalCouponPayments getPrincipalCouponPaymentsByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getPrincipalCouponPaymentsByYear(year);
	}

	@Override
	@Transactional
	public void addPrincipalCouponPayments(
			PrincipalCouponPayments principalCouponPayments) throws Exception {
		// TODO Auto-generated method stub
		principalCouponPayments.setDateUpdated(new Date());
		principalCouponPayments.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addPrincipalCouponPayments(principalCouponPayments);
	}
	
	@Override
	@Transactional
	public List<PrincipalCouponPayments> generatePrincipalCouponPayments() {
		// TODO Auto-generated method stub
		return chartDao.generatePrincipalCouponPayments();
	}

	@Override
	@Transactional
	public List <PdstFRates> getPdstFRates() {
		// TODO Auto-generated method stub
		return chartDao.getPdstFRates();
	}

	@Override
	@Transactional
	public void addPdstFRates(PdstFRates pdstFRates) throws Exception {
		// TODO Auto-generated method stub
		pdstFRates.setDateUpdated(new Date());
		pdstFRates.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addPdstFRates(pdstFRates);
	}

	@Override
	@Transactional
	public EconomicImpact getLatestEconomicImpact() {
		// TODO Auto-generated method stub
		return chartDao.getLatestEconomicImpact();
	}

	@Override
	@Transactional
	public void addEconomicImpact(EconomicImpact economicImpact)
			throws Exception {
		// TODO Auto-generated method stub
		economicImpact.setDateUpdated(new Date());
		economicImpact.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addEconomicImpact(economicImpact);
	}

	@Override
	@Transactional
	public NiaLoanProceedsUtilization getLatestNiaLoanProceedsUtilization() {
		// TODO Auto-generated method stub
		return chartDao.getLatestNiaLoanProceedsUtilization();
	}

	@Override
	@Transactional
	public void addNiaLoanProceedsUtilization(
			NiaLoanProceedsUtilization niaLoanProceedsUtilization)
			throws Exception {
		// TODO Auto-generated method stub
		niaLoanProceedsUtilization.setDateUpdated(new Date());
		niaLoanProceedsUtilization.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addNiaLoanProceedsUtilization(niaLoanProceedsUtilization);
	}

	@Override
	@Transactional
	public NiaLoanProceedsAllocation getLatestNiaLoanProceedsAllocation() {
		// TODO Auto-generated method stub
		return chartDao.getLatestNiaLoanProceedsAllocation();
	}

	@Override
	@Transactional
	public void addNiaLoanProceedsAllocation(
			NiaLoanProceedsAllocation niaLoanProceedsAllocation)
			throws Exception {
		// TODO Auto-generated method stub
		niaLoanProceedsAllocation.setDateUpdated(new Date());
		niaLoanProceedsAllocation.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addNiaLoanProceedsAllocation(niaLoanProceedsAllocation);
	}

	@Override
	@Transactional
	public List<Shareholders> getShareholdersByProjectId(Long id) {
		// TODO Auto-generated method stub
		return chartDao.getShareholdersByProjectId(id);
	}

	@Override
	@Transactional
	public void addShareholders(Shareholders shareholders) throws Exception {
		// TODO Auto-generated method stub
		shareholders.setDateUpdated(new Date());
		shareholders.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addShareholders(shareholders);
	}

	@Override
	@Transactional
	public Occupancy getOccupancyChart() {
		// TODO Auto-generated method stub
		return chartDao.getOccupancyChart();
	}

	@Override
	@Transactional
	public void addOccupancyChart(Occupancy occupancy) throws Exception {
		// TODO Auto-generated method stub
		occupancy.setDateUpdated(new Date());
		occupancy.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addOccupancyChart(occupancy);
	}

	@Override
	@Transactional
	public NiaLoanCollection getLatestNiaLoanCollection() {
		// TODO Auto-generated method stub
		return chartDao.getLatestNiaLoanCollection();
	}

	@Override
	@Transactional
	public void addNiaLoanCollection(NiaLoanCollection niaLoanCollection)
			throws Exception {
		// TODO Auto-generated method stub
		niaLoanCollection.setDateUpdated(new Date());
		niaLoanCollection.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addNiaLoanCollection(niaLoanCollection);
	}

	@Override
	@Transactional
	public NetLending getNetLendingByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getNetLendingByYear(year);
	}

	@Override
	@Transactional
	public void addNetLending(NetLending netLending) throws Exception {
		// TODO Auto-generated method stub
		netLending.setDateUpdated(new Date());
		netLending.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addNetLending(netLending);
	}
	
	@Override
	@Transactional
	public List<NetLending> generateNetLending() {
		// TODO Auto-generated method stub
		return chartDao.generateNetLending();
	}

	@Override
	@Transactional
	public AgriAgraBonds getAgriAgraBondsByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getAgriAgraBondsByYear(year);
	}

	@Override
	@Transactional
	public void addAgriAgraBonds(AgriAgraBonds agriAgraBonds) throws Exception {
		// TODO Auto-generated method stub
		agriAgraBonds.setDateUpdated(new Date());
		agriAgraBonds.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addAgriAgraBonds(agriAgraBonds);
	}

	@Override
	@Transactional
	public Double getLatestAgriAgraBonds() {
		// TODO Auto-generated method stub
		return chartDao.getLatestAgriAgraBonds();
	}
	
	@Override
	@Transactional
	public List<AgriAgraBonds> generateAgriAgraBonds() {
		// TODO Auto-generated method stub
		return chartDao.generateAgriAgraBonds();
	}

	@Override
	@Transactional
	public MaintenanceCost getMaintenaneCostByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getMaintenaneCostByYear(year);
	}

	@Override
	@Transactional
	public void addMaintenanceCost(MaintenanceCost maintenanceCost)
			throws Exception {
		// TODO Auto-generated method stub
		maintenanceCost.setDateUpdated(new Date());
		maintenanceCost.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addMaintenanceCost(maintenanceCost);
	}
	
	@Override
	@Transactional
	public List<MaintenanceCost> generateMaintenanceCost() {
		// TODO Auto-generated method stub
		return chartDao.generateMaintenanceCost();
	}

	@Override
	@Transactional
	public SourcesFunds getSourcesFundsByYear(Integer year) {
		// TODO Auto-generated method stub
		return chartDao.getSourcesFundsByYear(year);
	}

	@Override
	@Transactional
	public void addSourcesFunds(SourcesFunds sourcesFunds) throws Exception {
		// TODO Auto-generated method stub
		sourcesFunds.setDateUpdated(new Date());
		sourcesFunds.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addSourcesFunds(sourcesFunds);
	}
	
	@Override
	@Transactional
	public List<SourcesFunds> generateSourcesFunds() {
		// TODO Auto-generated method stub
		return chartDao.generateSourcesFunds();
	}

	@Override
	@Transactional
	public StatusAssets getLatestStatusAssets() {
		// TODO Auto-generated method stub
		return chartDao.getLatestStatusAssets();
	}

	@Override
	@Transactional
	public void addStatusAssets(StatusAssets statusAssets) throws Exception {
		// TODO Auto-generated method stub
		statusAssets.setDateUpdated(new Date());
		statusAssets.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());

		chartDao.addStatusAssets(statusAssets);
	}
	
	@Override
	@Transactional
	public List<StatusAssets> generateStatusAssets() {
		// TODO Auto-generated method stub
		return chartDao.generateStatusAssets();
	}

	@Override
	@Transactional
	public SpgIncomeStatement getSpgIncomeStatementByYear(Integer year, Long projectId) {
		// TODO Auto-generated method stub
		return chartDao.getSpgIncomeStatementByYear(year, projectId);
	}

	@Override
	@Transactional
	public void addSpgIncomeStatement(SpgIncomeStatement spgIncomeStatement)
			throws Exception {
		// TODO Auto-generated method stub
		spgIncomeStatement.setDateUpdated(new Date());
		spgIncomeStatement.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addSpgIncomeStatement(spgIncomeStatement);
	}
	
	@Override
	@Transactional
	public List<SpgIncomeStatement> generateSpgIncomeStatement(Long projectId) {
		// TODO Auto-generated method stub
		return chartDao.generateSpgIncomeStatement(projectId);
	}

	@Override
	@Transactional
	public SpgBalanceSheet getSpgBalanceSheetByYear(Integer year, Long projectId) {
		// TODO Auto-generated method stub
		return chartDao.getSpgBalanceSheetByYear(year, projectId);
	}

	@Override
	@Transactional
	public void addSpgBalanceSheet(SpgBalanceSheet spgBalanceSheet)
			throws Exception {
		// TODO Auto-generated method stub
		spgBalanceSheet.setDateUpdated(new Date());
		spgBalanceSheet.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addSpgBalanceSheet(spgBalanceSheet);
	}
	
	@Override
	@Transactional
	public List<SpgBalanceSheet> generateSpgBalanceSheet(Long projectId) {
		// TODO Auto-generated method stub
		return chartDao.generateSpgBalanceSheet(projectId);
	}

	@Override
	@Transactional
	public SpgCashFlow getSpgCashFlowByYear(Integer year, Long projectId) {
		// TODO Auto-generated method stub
		return chartDao.getSpgCashFlowByYear(year, projectId);
	}

	@Override
	@Transactional
	public void addSpgCashFlow(SpgCashFlow spgCashFlow) throws Exception {
		// TODO Auto-generated method stub
		spgCashFlow.setDateUpdated(new Date());
		spgCashFlow.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
				.getName());
		
		chartDao.addSpgCashFlow(spgCashFlow);
	}
	
	@Override
	@Transactional
	public List<SpgCashFlow> generateSpgCashFlow(Long projectId) {
		// TODO Auto-generated method stub
		return chartDao.generateSpgCashFlow(projectId);
	}

	@Override
	@Transactional
	public Integer getLatestYearOfData(Class clazz) {
		// TODO Auto-generated method stub
		return chartDao.getLatestYearOfData(clazz);
	}
	
	@Override
	@Transactional
	public ProjectedActualIncome getLatestProjectedActualIncome() {
		// TODO Auto-generated method stub
		return chartDao.getLatestProjectedActualIncome();
	}

	@Override
	@Transactional
	public void addProjectedActualIncome(ProjectedActualIncome projectedactualincome)
			throws Exception {
		// TODO Auto-generated method stub
		projectedactualincome.setDateUpdated(new Date());
		projectedactualincome.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails().getName());
		
		chartDao.addProjectedActualIncome(projectedactualincome);
		
	}

	@Override
	@Transactional
	public List<ActualIncomeExpense> getActualIncomeExpense() {
		// TODO Auto-generated method stub
		return chartDao.getActualIncomeExpense();
	}

	@Override
	@Transactional
	public void addActualIncomeExpense(ActualIncomeExpense actualincomeexpense)
			throws Exception {
		// TODO Auto-generated method stub
		actualincomeexpense.setDateUpdated(new Date());
		actualincomeexpense.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails().getName());
		
		chartDao.addActualIncomeExpense(actualincomeexpense);
	}

	@Override
	@Transactional
	public ActualIncomeExpense getActualIncomeExpenseById(Long id) {
		// TODO Auto-generated method stub
		return chartDao.getActualIncomeExpenseById(id);
	}

	@Override
	@Transactional
	public ProjectedActualIncome2 getLatestProjectedActualIncome2() {
		// TODO Auto-generated method stub
		return chartDao.getLatestProjectedActualIncome2();
	}

	@Override
	@Transactional
	public void addProjectedActualIncome2(
			ProjectedActualIncome2 projectedActualIncome2) throws Exception {
		// TODO Auto-generated method stub
		projectedActualIncome2.setDateUpdated(new Date());
		projectedActualIncome2.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails().getName());
		
		chartDao.addProjectedActualIncome2(projectedActualIncome2);
	}

	@Override
	@Transactional
	public BUPersonalServices getLatestBUPersonalServices() {
		// TODO Auto-generated method stub
		return chartDao.getLatestBUPersonalServices();
	}

	@Override
	@Transactional
	public void addBUPersonalServices(BUPersonalServices buPersonalServices)
			throws Exception {
		// TODO Auto-generated method stub
		buPersonalServices.setDateUpdated(new Date());
		buPersonalServices.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails().getName());
		
		chartDao.addBUPersonalServices(buPersonalServices);
	}

	@Override
	@Transactional
	public BUMooe getLatestBUMooe() {
		// TODO Auto-generated method stub
		return chartDao.getLatestBUMooe();
	}

	@Override
	@Transactional
	public void addBUMooe(BUMooe buMooe) throws Exception {
		// TODO Auto-generated method stub
		buMooe.setDateUpdated(new Date());
		buMooe.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails().getName());
		
		chartDao.addBUMooe(buMooe);
	}

	@Override
	@Transactional
	public BUCapitalExpenditures getLatestBUCapitalExpenditures() {
		// TODO Auto-generated method stub
		return chartDao.getLatestBUCapitalExpenditures();
	}

	@Override
	@Transactional
	public void addBUCapitalExpenditures(
			BUCapitalExpenditures buCapitalExpenditures) throws Exception {
		// TODO Auto-generated method stub
		buCapitalExpenditures.setDateUpdated(new Date());
		buCapitalExpenditures.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails().getName());
		
		chartDao.addBUCapitalExpenditures(buCapitalExpenditures);
	}
	
	@Override
	@Transactional
	public List<CollectionEfficiency> getCollectionEfficiency() {
		// TODO Auto-generated method stub
		return chartDao.getCollectionEfficiency();
	}
	
	@Override
	@Transactional
	public void addCollectionEfficiency(
			CollectionEfficiency collectionefficiency) throws Exception {
		// TODO Auto-generated method stub
		collectionefficiency.setDateUpdated(new Date());
		collectionefficiency.setUpdatedBy(AuthenticationUtil
				.getAuthenticationDetails().getName());

		chartDao.addCollectionEfficiency(collectionefficiency);
	}

	@Override
	@Transactional
	public Map<String, Double> getOverallBudgetUtilization() {
		// TODO Auto-generated method stub
		return chartDao.getOverallBudgetUtilization();
	}
	
}
