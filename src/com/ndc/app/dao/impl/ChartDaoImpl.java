package com.ndc.app.dao.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ndc.app.dao.ChartDao;
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
import com.ndc.app.model.StatusAssets;

@Repository("chartDao")
public class ChartDaoImpl implements ChartDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addBalanceSheet(BalanceSheet balanceSheet) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(balanceSheet);
	}

	@Override
	public BalanceSheet getBalanceSheetByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from BalanceSheet bs WHERE bs.year = :year ORDER BY bs.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (BalanceSheet) query.uniqueResult();
	}
	
	@Override
	public List<BalanceSheet> generateBalanceSheet() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_balance_sheet` WHERE id  in (select max(id) from ndc_tbl_balance_sheet group by year) order by year DESC LIMIT 3").addEntity(BalanceSheet.class);
		List<BalanceSheet> l = (List<BalanceSheet>) query.list();
		
		Collections.sort(l, new Comparator<BalanceSheet>() {
			@Override
			public int compare(BalanceSheet o1, BalanceSheet o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public IncomeStatement getIncomeStatementByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from IncomeStatement i WHERE i.year = :year ORDER BY i.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (IncomeStatement) query.uniqueResult();
	}
	
	@Override
	public List<IncomeStatement> generateIncomeStatement() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_income_statement` WHERE id  in (select max(id) from ndc_tbl_income_statement group by year) order by year DESC LIMIT 3").addEntity(IncomeStatement.class);
		List<IncomeStatement> l = (List<IncomeStatement>) query.list();
		
		Collections.sort(l, new Comparator<IncomeStatement>() {
			@Override
			public int compare(IncomeStatement o1, IncomeStatement o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public void addIncomeStatement(IncomeStatement incomeStatement)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(incomeStatement);
	}

	@Override
	public BondsIssued getBondsIssuedByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from BondsIssued bi WHERE bi.year = :year ORDER BY bi.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (BondsIssued) query.uniqueResult();
	}

	@Override
	public void addBondsIssued(BondsIssued bondsIssued) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(bondsIssued);
	}
	
	@Override
	public List<BondsIssued> generateBondsIssued() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_bonds_issued` WHERE id  in (select max(id) from ndc_tbl_bonds_issued group by year) ORDER BY YEAR DESC LIMIT 4").addEntity(BondsIssued.class);
		List<BondsIssued> l = (List<BondsIssued>) query.list();
		
		Collections.sort(l, new Comparator<BondsIssued>() {
			@Override
			public int compare(BondsIssued o1, BondsIssued o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public BondMaturity getBondMaturityByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from BondMaturity bm WHERE bm.year = :year ORDER BY bm.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (BondMaturity) query.uniqueResult();
	}

	@Override
	public void addBondMaturity(BondMaturity bondMaturity) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(bondMaturity);
	}
	
	@Override
	public List<BondMaturity> generateBondMaturity() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_bond_maturity` WHERE id  in (select max(id) from ndc_tbl_bond_maturity group by year) order by year DESC LIMIT 4").addEntity(BondMaturity.class);
		List<BondMaturity> l = (List<BondMaturity>) query.list();
		
		Collections.sort(l, new Comparator<BondMaturity>() {
			@Override
			public int compare(BondMaturity o1, BondMaturity o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public PrincipalCouponPayments getPrincipalCouponPaymentsByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from PrincipalCouponPayments pcp WHERE pcp.year = :year ORDER BY pcp.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (PrincipalCouponPayments) query.uniqueResult();
	}

	@Override
	public void addPrincipalCouponPayments(
			PrincipalCouponPayments principalCouponPayments) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(principalCouponPayments);
	}
	
	@Override
	public List<PrincipalCouponPayments> generatePrincipalCouponPayments() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_principal_and_coupon_payments` WHERE id  in (select max(id) from ndc_tbl_principal_and_coupon_payments group by year) order by year DESC LIMIT 4").addEntity(PrincipalCouponPayments.class);
		List<PrincipalCouponPayments> l = (List<PrincipalCouponPayments>) query.list();
		
		Collections.sort(l, new Comparator<PrincipalCouponPayments>() {
			@Override
			public int compare(PrincipalCouponPayments o1,
					PrincipalCouponPayments o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public List<PdstFRates> getPdstFRates() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from ndc_tbl_pdst_f_rates where year="
								+ getLatestYearOfData(PdstFRates.class)
								+ " AND id in(select max(id) from ndc_tbl_pdst_f_rates group by month) order by month asc").addEntity(PdstFRates.class);

		return (List<PdstFRates>) query.list();
	}

	@Override
	public void addPdstFRates(PdstFRates pdstFRates) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(pdstFRates);
	}

	@Override
	public EconomicImpact getLatestEconomicImpact() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from EconomicImpact ei ORDER BY ei.id DESC");
		query.setMaxResults(1);

		return (EconomicImpact) query.uniqueResult();
	}

	@Override
	public void addEconomicImpact(EconomicImpact economicImpact)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(economicImpact);
	}

	@Override
	public NiaLoanProceedsUtilization getLatestNiaLoanProceedsUtilization() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from NiaLoanProceedsUtilization n ORDER BY n.id DESC");
		query.setMaxResults(1);

		return (NiaLoanProceedsUtilization) query.uniqueResult();
	}

	@Override
	public void addNiaLoanProceedsUtilization(
			NiaLoanProceedsUtilization niaLoanProceedsUtilization)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(niaLoanProceedsUtilization);
	}

	@Override
	public NiaLoanProceedsAllocation getLatestNiaLoanProceedsAllocation() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from NiaLoanProceedsAllocation n ORDER BY n.id DESC");
		query.setMaxResults(1);

		return (NiaLoanProceedsAllocation) query.uniqueResult();
	}

	@Override
	public void addNiaLoanProceedsAllocation(
			NiaLoanProceedsAllocation niaLoanProceedsAllocation)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(niaLoanProceedsAllocation);
	}

	@Override
	public List<Shareholders> getShareholdersByProjectId(Long id) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM ndc_tbl_shareholders WHERE id in (select MAX(id) from ndc_tbl_shareholders WHERE project_id = :id group by shareholders ) order by id desc")
				.addEntity(Shareholders.class);
		query.setLong("id", id);

		return query.list();
	}

	@Override
	public void addShareholders(Shareholders shareholders) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(shareholders);
	}

	@Override
	public Occupancy getOccupancyChart() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Occupancy o ORDER BY o.id DESC");
		query.setMaxResults(1);

		return (Occupancy) query.uniqueResult();
	}

	@Override
	public void addOccupancyChart(Occupancy occupancy) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(occupancy);
	}

	@Override
	public NiaLoanCollection getLatestNiaLoanCollection() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from NiaLoanCollection n ORDER BY n.id DESC");
		query.setMaxResults(1);

		return (NiaLoanCollection) query.uniqueResult();
	}

	@Override
	public void addNiaLoanCollection(NiaLoanCollection niaLoanCollection)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(niaLoanCollection);
	}

	@Override
	public NetLending getNetLendingByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from NetLending n WHERE n.year = :year ORDER BY n.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (NetLending) query.uniqueResult();
	}

	@Override
	public void addNetLending(NetLending netLending) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(netLending);
	}
	
	@Override
	public List<NetLending> generateNetLending() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_net_lending` WHERE id  in (select max(id) from ndc_tbl_net_lending group by year) order by year DESC LIMIT 3").addEntity(NetLending.class);
		List<NetLending> l = (List<NetLending>) query.list();
		
		Collections.sort(l, new Comparator<NetLending>() {
			@Override
			public int compare(NetLending o1,
					NetLending o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public AgriAgraBonds getAgriAgraBondsByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from AgriAgraBonds a WHERE a.year = :year ORDER BY a.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);


		return (AgriAgraBonds) query.uniqueResult();
	}

	@Override
	public void addAgriAgraBonds(AgriAgraBonds agriAgraBonds) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(agriAgraBonds);
	}

	@Override
	public Double getLatestAgriAgraBonds() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("SELECT a.total from AgriAgraBonds a ORDER BY a.id DESC");
		query.setMaxResults(1);

		return (Double) query.uniqueResult();
	}
	
	@Override
	public List<AgriAgraBonds> generateAgriAgraBonds() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_agri_agra_bonds` WHERE id  in (select max(id) from ndc_tbl_agri_agra_bonds group by year) order by year DESC LIMIT 4").addEntity(AgriAgraBonds.class);
		return (List<AgriAgraBonds>) query.list();
	}

	@Override
	public MaintenanceCost getMaintenaneCostByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from MaintenanceCost m WHERE m.year = :year ORDER BY m.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (MaintenanceCost) query.uniqueResult();
	}

	@Override
	public void addMaintenanceCost(MaintenanceCost maintenanceCost)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(maintenanceCost);
	}
	
	@Override
	public List<MaintenanceCost> generateMaintenanceCost() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_maintenance_cost` WHERE id  in (select max(id) from ndc_tbl_maintenance_cost group by year) order by year DESC LIMIT 3").addEntity(MaintenanceCost.class);
		List<MaintenanceCost> l = (List<MaintenanceCost>) query.list();
		
		Collections.sort(l, new Comparator<MaintenanceCost>() {
			@Override
			public int compare(MaintenanceCost o1,
					MaintenanceCost o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public SourcesFunds getSourcesFundsByYear(Integer year) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from SourcesFunds s WHERE s.year = :year ORDER BY s.id DESC");
		query.setInteger("year", year);
		query.setMaxResults(1);

		return (SourcesFunds) query.uniqueResult();
	}

	@Override
	public void addSourcesFunds(SourcesFunds sourcesFunds) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(sourcesFunds);
	}
	
	@Override
	public List<SourcesFunds> generateSourcesFunds() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_sources_funds` WHERE id  in (select max(id) from ndc_tbl_sources_funds group by year) order by year DESC LIMIT 3").addEntity(SourcesFunds.class);
		List<SourcesFunds> l = (List<SourcesFunds>) query.list();
		
		Collections.sort(l, new Comparator<SourcesFunds>() {
			@Override
			public int compare(SourcesFunds o1,
					SourcesFunds o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public StatusAssets getLatestStatusAssets() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from StatusAssets s ORDER BY s.id DESC");
		query.setMaxResults(1);

		return (StatusAssets) query.uniqueResult();
	}

	@Override
	public void addStatusAssets(StatusAssets statusAssets) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(statusAssets);
	}
	
	@Override
	public List<StatusAssets> generateStatusAssets() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_status_assets` WHERE id  in (select max(id) from ndc_tbl_status_assets group by year) order by year DESC LIMIT 3").addEntity(StatusAssets.class);
		List<StatusAssets> l = (List<StatusAssets>) query.list();
		
		Collections.sort(l, new Comparator<StatusAssets>() {
			@Override
			public int compare(StatusAssets o1, StatusAssets o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public SpgIncomeStatement getSpgIncomeStatementByYear(Integer year, Long projectId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from SpgIncomeStatement s WHERE s.year = :year AND s.projectId = :id ORDER BY s.id DESC");
		query.setInteger("year", year);
		query.setLong("id", projectId);
		query.setMaxResults(1);
		
		return (SpgIncomeStatement) query.uniqueResult();
	}

	@Override
	public void addSpgIncomeStatement(SpgIncomeStatement spgIncomeStatement)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(spgIncomeStatement);
	}
	
	@Override
	public List<SpgIncomeStatement> generateSpgIncomeStatement() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_spg_income_statement` WHERE id  in (select max(id) from ndc_tbl_spg_income_statement group by year) order by year DESC LIMIT 3").addEntity(SpgIncomeStatement.class);
		List<SpgIncomeStatement> l = (List<SpgIncomeStatement>) query.list();
		
		Collections.sort(l, new Comparator<SpgIncomeStatement>() {
			@Override
			public int compare(SpgIncomeStatement o1, SpgIncomeStatement o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public SpgBalanceSheet getSpgBalanceSheetByYear(Integer year, Long projectId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from SpgBalanceSheet s WHERE s.year = :year AND s.projectId = :id ORDER BY s.id DESC");
		query.setInteger("year", year);
		query.setLong("id", projectId);
		query.setMaxResults(1);
				
		return (SpgBalanceSheet) query.uniqueResult();
	}

	@Override
	public void addSpgBalanceSheet(SpgBalanceSheet spgBalanceSheet)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(spgBalanceSheet);
	}
	
	@Override
	public List<SpgBalanceSheet> generateSpgBalanceSheet() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_spg_balance_sheet` WHERE id  in (select max(id) from ndc_tbl_spg_balance_sheet group by year) order by year DESC LIMIT 3").addEntity(SpgBalanceSheet.class);
		List<SpgBalanceSheet> l = (List<SpgBalanceSheet>) query.list();
		
		Collections.sort(l, new Comparator<SpgBalanceSheet>() {
			@Override
			public int compare(SpgBalanceSheet o1, SpgBalanceSheet o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public SpgCashFlow getSpgCashFlowByYear(Integer year, Long projectId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from SpgCashFlow s WHERE s.year = :year AND s.projectId = :id ORDER BY s.id DESC");
		query.setInteger("year", year);
		query.setLong("id", projectId);
		query.setMaxResults(1);
						
		return (SpgCashFlow) query.uniqueResult();
	}

	@Override
	public void addSpgCashFlow(SpgCashFlow spgCashFlow) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(spgCashFlow);
	}
	
	@Override
	public List<SpgCashFlow> generateSpgCashFlow() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM `ndc_tbl_spg_cash_flow` WHERE id  in (select max(id) from ndc_tbl_spg_cash_flow group by year) order by year DESC LIMIT 3").addEntity(SpgCashFlow.class);
		List<SpgCashFlow> l = (List<SpgCashFlow>) query.list();
		
		Collections.sort(l, new Comparator<SpgCashFlow>() {
			@Override
			public int compare(SpgCashFlow o1, SpgCashFlow o2) {
				// TODO Auto-generated method stub
				return o1.getYear().compareTo(o2.getYear());
			}
		});
		
		return l;
	}

	@Override
	public Integer getLatestYearOfData(Class clazz) {
		// TODO Auto-generated method stub
//		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(clazz);
//		criteria.setProjection(Projections.max("year"));
		Query query = sessionFactory.getCurrentSession().createQuery("SELECT MAX(c.year) from " + clazz.getSimpleName() + " c");
		query.setMaxResults(1);
		
		return (Integer) query.uniqueResult();
	}

	@Override
	public ProjectedActualIncome getLatestProjectedActualIncome() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from ProjectedActualIncome p ORDER BY p.id DESC");
		query.setMaxResults(1);

		return (ProjectedActualIncome) query.uniqueResult();
	}

	@Override
	public void addProjectedActualIncome(
			ProjectedActualIncome projectedactualincome) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(projectedactualincome);

	}

	@Override
	public List<ActualIncomeExpense> getActualIncomeExpense() {
		// TODO Auto-generated method stub
		Integer latestYear = getLatestYearOfData(ActualIncomeExpense.class);

		if (latestYear != null) {	
			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery(
							"SELECT * FROM ndc_tbl_actual_income_expense WHERE id in (select max(id) from ndc_tbl_actual_income_expense group by year) order by year ASC")
					.addEntity(ActualIncomeExpense.class);

			return (List<ActualIncomeExpense>) query.list();
		}

		return null;
	}

	@Override
	public void addActualIncomeExpense(ActualIncomeExpense actualincomeexpense)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(actualincomeexpense);
	}

	@Override
	public ActualIncomeExpense getActualIncomeExpenseById(Long id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from ActualIncomeExpense a WHERE a.id = :id");
		query.setLong("id", id);
		query.setMaxResults(1);

		return (ActualIncomeExpense) query.uniqueResult();
	}

	@Override
	public ProjectedActualIncome2 getLatestProjectedActualIncome2() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from ProjectedActualIncome2 p ORDER BY p.id DESC");
		query.setMaxResults(1);

		return (ProjectedActualIncome2) query.uniqueResult();
	}

	@Override
	public void addProjectedActualIncome2(
			ProjectedActualIncome2 projectedActualIncome2) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(projectedActualIncome2);
	}

	@Override
	public List<CollectionEfficiency> getCollectionEfficiency() {
		// TODO Auto-generated method stub
		Integer latestYear = getLatestYearOfData(CollectionEfficiency.class);

		if (latestYear != null) {

			Query query = sessionFactory.getCurrentSession().createSQLQuery(
							"select * from ndc_tbl_collection_efficiency where year="
									+ latestYear
									+ " AND id in(select max(id) from ndc_tbl_collection_efficiency group by month)")
					.addEntity(CollectionEfficiency.class);

			return (List<CollectionEfficiency>) query.list();

		}

		return null;

	}

	@Override
	public void addCollectionEfficiency(
			CollectionEfficiency collectionefficiency) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(collectionefficiency);
	}

	@Override
	public BUPersonalServices getLatestBUPersonalServices() {
		// TODO Auto-generated method stub
		Integer latestYear = getLatestYearOfData(BUPersonalServices.class);
		
		if (latestYear != null) {
			Query query = sessionFactory
					.getCurrentSession()
					.createSQLQuery(
							"select * from ndc_tbl_personal_services where year="
									+ latestYear
									+ " AND id in(select max(id) from ndc_tbl_personal_services group by month) order by month desc limit 1")
					.addEntity(BUPersonalServices.class);

			return (BUPersonalServices) query.list().get(0);
		}

		return null;
	}

	@Override
	public void addBUPersonalServices(BUPersonalServices buPersonalServices)
			throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(buPersonalServices);
	}

	@Override
	public BUMooe getLatestBUMooe() {
		// TODO Auto-generated method stub
		Integer latestYear = getLatestYearOfData(BUMooe.class);

		if (latestYear != null) {
			Query query = sessionFactory
					.getCurrentSession()
					.createSQLQuery(
							"select * from ndc_tbl_mooe where year="
									+ latestYear
									+ " AND id in(select max(id) from ndc_tbl_mooe group by month) order by month desc limit 1")
					.addEntity(BUMooe.class);

			return (BUMooe) query.list().get(0);
		}

		return null;
	}

	@Override
	public void addBUMooe(BUMooe buMooe) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(buMooe);
	}

	@Override
	public BUCapitalExpenditures getLatestBUCapitalExpenditures() {
		// TODO Auto-generated method stub
		Integer latestYear = getLatestYearOfData(BUCapitalExpenditures.class);

		if (latestYear != null) {
			Query query = sessionFactory
					.getCurrentSession()
					.createSQLQuery(
							"select * from ndc_tbl_capital_expenditures where year="
									+ latestYear
									+ " AND id in(select max(id) from ndc_tbl_capital_expenditures group by month) order by month desc limit 1")
					.addEntity(BUCapitalExpenditures.class);

			return (BUCapitalExpenditures) query.list().get(0);
		}
			
		return null;
	}

	@Override
	public void addBUCapitalExpenditures(
			BUCapitalExpenditures buCapitalExpenditures) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(buCapitalExpenditures);
	}

	@Override
	public Map<String, Double> getOverallBudgetUtilization() {
		
		// TODO Auto-generated method stub
		Map<String, Double> budgetUtilization = new HashMap<String, Double>();
		
		BUPersonalServices buPersonalServices = getLatestBUPersonalServices();
		BUMooe buMooe = getLatestBUMooe();
		BUCapitalExpenditures buCapitalExpenditures = getLatestBUCapitalExpenditures();
		
		if(buPersonalServices != null) {
			budgetUtilization.put("actualPersonalServices", buPersonalServices.getActualPersonalServices());
			budgetUtilization.put("budgetPersonalServices", buPersonalServices.getBudgetPersonalServices());
		}
		
		if(buMooe != null) {
			budgetUtilization.put("actualMooe", buMooe.getActualMooe());
			budgetUtilization.put("budgetMooe", buMooe.getBudgetMooe());
		}
		
		if(buCapitalExpenditures != null) {
			budgetUtilization.put("actualCapitalExpenditures", buCapitalExpenditures.getActualCapitalExpenditures());
			budgetUtilization.put("budgetCapitalExpenditures", buCapitalExpenditures.getBudgetCapitalExpenditures());
		}
		
		return budgetUtilization;
		
	}

}
