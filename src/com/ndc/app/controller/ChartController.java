package com.ndc.app.controller;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Paint;
import java.awt.Polygon;
import java.awt.Shape;
import java.awt.Stroke;
import java.awt.geom.Rectangle2D;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONObject;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.LegendItem;
import org.jfree.chart.LegendItemCollection;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.SubCategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardCategoryToolTipGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.DialShape;
import org.jfree.chart.plot.MeterInterval;
import org.jfree.chart.plot.MeterPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.renderer.category.GroupedStackedBarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.title.LegendTitle;
import org.jfree.data.KeyToGroupMap;
import org.jfree.data.Range;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.DefaultValueDataset;
import org.jfree.ui.GradientPaintTransformType;
import org.jfree.ui.RectangleEdge;
import org.jfree.ui.StandardGradientPaintTransformer;
import org.jfree.util.TableOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ndc.app.AppHelper;
import com.ndc.app.CustomCylinderRenderer;
import com.ndc.app.MultipleMeterPlot;
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
import com.ndc.app.service.ChartService;
import com.ndc.app.service.SpgService;
import com.ndc.app.util.LoggerUtil;

@Controller
@RequestMapping(value = "/visualization")
public class ChartController {

	@Autowired
	@Qualifier("chartService")
	private ChartService chartService;
	
	@Autowired
	@Qualifier("spgService")
	private SpgService spgService;

	@Autowired
	private LoggerUtil loggerUtil;

	@RequestMapping(value = "/bsbarchart/{width}/{height}")
	public @ResponseBody
	void generateBalanceSheetBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			List<BalanceSheet> balanceSheets = chartService.generateBalanceSheet();

//			if (balanceSheets != null && balanceSheets.size() > 0) {
				
				for(BalanceSheet bs : balanceSheets) {
					categoryDataset.setValue(
							bs.getTotalAssets(),
							bs.getYear(), "TOTAL ASSETS");
					categoryDataset.setValue(
							bs.getTotalLiabilities(),
							bs.getYear(), "TOTAL LIABILITIES");
					categoryDataset.setValue(
							bs.getTotalEquity(),
							bs.getYear(), "EQUITY");
				}
				
				JFreeChart chart = ChartFactory.createBarChart3D(
						"BALANCE SHEET", // Title
						"", // X-Axis label
						"Millions",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false); 

				CategoryPlot plot = chart.getCategoryPlot();
				plot.getRenderer().setSeriesPaint(0, new Color(0, 204, 143));
				plot.getRenderer().setSeriesPaint(1, new Color(51, 51, 204));
				plot.getRenderer().setSeriesPaint(2, new Color(255, 111, 111));
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));

				plot.setNoDataMessage("No data to display");

				CategoryAxis domainAxis = plot.getDomainAxis();
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions
				// .createUpRotationLabelPositions(Math.PI / 6.0));
				domainAxis.setMaximumCategoryLabelLines(10);

				// change the auto tick unit selection to integer units only...
				final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
				rangeAxis.setStandardTickUnits(NumberAxis
						.createIntegerTickUnits());
				// rangeAxis.setAxisLineVisible(false);
				rangeAxis.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));

					}
				});

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}
//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING BAR CHART");
		}

	}

	@RequestMapping(value = "/stockareachart/{width}/{height}")
	public @ResponseBody
	void generateIncomeStatementStockAreaChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset defaultcategorydataset = new DefaultCategoryDataset();
			List<IncomeStatement> incomeStatements = chartService.generateIncomeStatement();

//			if (incomeStatements != null && incomeStatements.size() > 0) {
				
				for(IncomeStatement is : incomeStatements) {
					defaultcategorydataset.addValue(
							is.getOperatingIncome(),
							"Income", is.getYear());
					defaultcategorydataset.addValue(
							is.getDividend(),
							"Dividend", is.getYear());
				}

				JFreeChart chart = ChartFactory.createStackedAreaChart(
						"INCOME STATEMENT", // Title
																				// //
																				// chart
																				// title
						"Year", // domain axis label
						"Millions", // range axis label
						defaultcategorydataset, // data
						PlotOrientation.VERTICAL, // orientation
						true, // include legend
						true, false);

				LegendTitle legendTitle = chart.getLegend();
				// legendTitle.setPosition(RectangleEdge.LEFT);

				chart.setBackgroundPaint(Color.white);

				final CategoryPlot plot = (CategoryPlot) chart.getPlot();
				plot.setForegroundAlpha(0.8f);
				// plot.setBackgroundPaint(Color.lightGray);

				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
				plot.getRenderer().setSeriesPaint(0, new Color(0, 204, 143));
				plot.getRenderer().setSeriesPaint(1, new Color(51, 51, 204));

				plot.setNoDataMessage("No data to display");

				final CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setLowerMargin(0.0);
				domainAxis.setUpperMargin(0.0);

				// change the auto tick unit selection to integer units only...
				final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
				rangeAxis.setStandardTickUnits(NumberAxis
						.createIntegerTickUnits());
				// rangeAxis.setAxisLineVisible(false);
				rangeAxis.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));
					}
				});

				rangeAxis.setTickLabelsVisible(true);

				// StackedBarRenderer renderer = (StackedBarRenderer)
				// plot.getRenderer();

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();
					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING STOCK AREA CHART");
		}

	}

	@RequestMapping(value = "/bondmaturitybarchart/{width}/{height}")
	public @ResponseBody
	void generateBondMaturityBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			
			List<BondMaturity> bondMaturities = chartService.generateBondMaturity();

//			if (bondMaturities != null && bondMaturities.size() > 0) {
				
				Date currDate = null;
				for(BondMaturity bm : bondMaturities) {
					categoryDataset.setValue(
						bm.getBondPayment(),
						"Term of the Bond", bm.getYear());
//					categoryDataset.setValue(
//						bm.getAmountIssued(),
//						"Maturity(Years)", bm.getYear());
					currDate = bm.getDateUpdated();
				}

				JFreeChart chart = ChartFactory.createBarChart("Bond Maturity\n" + AppHelper.convertDateToString(currDate), // Title
						"Year of Issuance", // X-Axis label
						"Maturity(Years)",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.HORIZONTAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));

				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(23, 94, 6));
				renderer.setSeriesPaint(1, new Color(112, 242, 79));
				// (BarRenderer(renderer)).setItemMargin(0.0);

				plot.setNoDataMessage("No data to display");

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR BOND MATURITY");
		}

	}
	
	@RequestMapping(value = "/bondmaturitybarchart2/{width}/{height}")
	public @ResponseBody
	void generateBondMaturityBarChart2(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			
			List<BondMaturity> bondMaturities = chartService.generateBondMaturity();

//			if (bondMaturities != null && bondMaturities.size() > 0) {
				
				for(BondMaturity bm : bondMaturities) {
//					categoryDataset.setValue(
//						bm.getBondPayment(),
//						"Term of the Bond", bm.getYear());
					categoryDataset.setValue(
						bm.getAmountIssued(),
						"Bond Payment", bm.getYear());
				}

				JFreeChart chart = ChartFactory.createBarChart("Bond Maturity", // Title
						"Year of Issuance", // X-Axis label
						"Amount Issued (Php)",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.HORIZONTAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));

				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(23, 94, 6));
				renderer.setSeriesPaint(1, new Color(112, 242, 79));
				// (BarRenderer(renderer)).setItemMargin(0.0);

				plot.setNoDataMessage("No data to display");

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR BOND MATURITY");
		}

	}

	@RequestMapping(value = "/bondsissuedbarchart/{width}/{height}")
	public @ResponseBody
	void generateBondsIssuedBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset defaultcategorydataset = new DefaultCategoryDataset();
			List<BondsIssued> bondsIssuedList = chartService.generateBondsIssued();

//			if (bondsIssuedList != null && bondsIssuedList.size() > 0) {
				
				Date currDate = null;
				
				for(BondsIssued bi : bondsIssuedList) {
					defaultcategorydataset.addValue(
							bi.getAmount() / 1000000, "S1",
							bi.getYear());
					
					currDate = bi.getDateUpdated();
				}

				JFreeChart chart = ChartFactory.createStackedBarChart3D(
						"Bonds Issued\n" + AppHelper.convertDateToString(currDate), // chart title
						"Issuance", // domain axis label
						"Millions (Php)", // range axis label
						defaultcategorydataset, // data
						PlotOrientation.VERTICAL, // orientation
						false, // inclfude legend
						true, // tooltips
						false // urls
						);

				Paint apaint[] = createPaint();
				CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
				categoryplot.setBackgroundPaint(Color.WHITE);
				categoryplot.setRangeGridlinePaint(Color.BLACK);
				categoryplot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
//				CustomCylinderRenderer customcylinderrenderer = new CustomCylinderRenderer();
//				customcylinderrenderer
//						.setGradientPaintTransformer(new StandardGradientPaintTransformer(
//								GradientPaintTransformType.CENTER_HORIZONTAL));
//				customcylinderrenderer.setBaseOutlinePaint(Color.gray);
//				customcylinderrenderer.setBaseOutlineStroke(new BasicStroke(
//						0.3F));
//				customcylinderrenderer
//						.setBaseToolTipGenerator(new StandardCategoryToolTipGenerator());
//
//				categoryplot.setRenderer(customcylinderrenderer);
				categoryplot.setNoDataMessage("No data to display");
				
				GroupedStackedBarRenderer renderer = new GroupedStackedBarRenderer();
				
				Paint p1 = new Color(30, 144, 255);
				renderer.setSeriesPaint(0, p1);
				
				categoryplot.setRenderer(renderer);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR BONDS ISSUED");
		}

	}

	private static Paint[] createPaint() {

		Color DARK_RED = Color.decode("#66CDAA");

		Paint apaint[] = new Paint[1];
		apaint[0] = new GradientPaint(0.0F, 0.0F, DARK_RED, 0.0F, 0.0F,
				Color.BLUE);
		return apaint;
	}

	@RequestMapping(value = "/economicimpactcategoryplot/{width}/{height}")
	public @ResponseBody
	void generateEconomicImpactCategoryPlot(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			EconomicImpact economicImpact = chartService
					.getLatestEconomicImpact();

//			if (economicImpact != null) {
				
				Date currDate = economicImpact.getDateUpdated();
				categoryDataset.setValue(economicImpact.getRehabilitated(),
						"S1", "Rehabilitated irrigation system");
				categoryDataset.setValue(economicImpact.getRestored(), "S1",
						"Restored irrigable areas");

				JFreeChart chart = ChartFactory.createBarChart(
						"Economic Impact of NIA Loan\n" + AppHelper.convertDateToString(currDate), // Title
						"", // X-Axis label
						"Hectares",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, false, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
				plot.setNoDataMessage("No data to display");

				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				domainAxis.setMaximumCategoryLabelLines(10);
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI
				// / 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setSeriesItemLabelGenerator(0,
						new StandardCategoryItemLabelGenerator("{2}",
								new DecimalFormat("#,###")));
				renderer.setSeriesItemLabelsVisible(0, true);
				renderer.setMaximumBarWidth(0.20f);

				renderer.setSeriesPaint(0, new GradientPaint(0.0F, 0.0F,
						new Color(255, 128, 0), 0.0F, 0.0F, Color.ORANGE));
				
				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis();
				//rangeAxis2.setNumberFormatOverride(new DecimalFormat());
				rangeAxis2.setStandardTickUnits(NumberAxis.createIntegerTickUnits());

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR ECONOMIC IMPACT");
		}

	}

	@RequestMapping(value = "/principalcouponpaymentsbarchart/{width}/{height}")
	public @ResponseBody
	void generatePrincipalCouponPaymentsBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			List<PrincipalCouponPayments> couponPayments = chartService.generatePrincipalCouponPayments();

//			if (couponPayments != null && couponPayments.size() > 0) {
				
				Date currDate = null;
				
				for(PrincipalCouponPayments cp : couponPayments) {
					categoryDataset.setValue(
							cp.getBondIssued(),
							"Bond Issued", cp.getYear());
					categoryDataset.setValue(
							cp.getBondPayment(),
							"Bond Payment", cp.getYear());
					categoryDataset.setValue(
							cp.getCoupon(),
							"Coupon", cp.getYear());
					categoryDataset.setValue(
							cp.getCouponPayment(),
							"Coupon Payment", cp.getYear());
					
					currDate = cp.getDateUpdated();
				}

				JFreeChart chart = ChartFactory.createBarChart(
						"Principal and Coupon Payments\n" + AppHelper.convertDateToString(currDate), // Title
						"Issuance", // X-Axis label
						"Millions (Php)",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.BOTTOM);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
				plot.setNoDataMessage("No data to display");

				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				domainAxis.setMaximumCategoryLabelLines(10);
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI
				// / 6.0));

				// BarRenderer3D renderer = (BarRenderer3D) plot.getRenderer();
				// renderer.setSeriesItemLabelGenerator(0, new
				// StandardCategoryItemLabelGenerator("{2}", new
				// DecimalFormat("#,###")));
				// renderer.setSeriesItemLabelsVisible(0, true);
				// renderer.setMaximumBarWidth(0.20f);

				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis(0);
				// rangeAxis2.setNumberFormatOverride(new DecimalFormat());
				// rangeAxis2.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				rangeAxis2.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));
					}
				});

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil
					.log(auth,
							"ERROR WHILE DISPLAYING BAR CHART FOR PRINCIPAL/COUPON PAYMENTS");
		}

	}

	@RequestMapping(value = "/nialoancollectionbarchart/{width}/{height}")
	public @ResponseBody
	void generateNiaLoanCollectionBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset result = new DefaultCategoryDataset();

			NiaLoanCollection niaLoanCollection = chartService
					.getLatestNiaLoanCollection();

//			if (niaLoanCollection != null) {
				
				Date currDate = niaLoanCollection.getDateUpdated();

				result.addValue(niaLoanCollection.getPrincipalCollection(),
						"Collection", "Principal");
				result.addValue(niaLoanCollection.getInterestCollection(),
						"Collection", "Interest");
				result.addValue(niaLoanCollection.getPrincipalLoanReceivable(),
						"Loan Receivable", "Principal");
				result.addValue(niaLoanCollection.getInterestLoanReceivable(),
						"Loan Receivable", "Interest");

				JFreeChart chart = ChartFactory.createStackedBarChart3D(
						"Collection of NIA Loan\n" + AppHelper.convertDateToString(currDate), // Title
						"Collection of NIA Loan", // X-Axis label
						"Millions (Php)",// Y-Axis label
						result, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				GroupedStackedBarRenderer renderer = new GroupedStackedBarRenderer();
				KeyToGroupMap map = new KeyToGroupMap("G1");
				map.mapKeyToGroup("Collection", "G1");
				map.mapKeyToGroup("Loan Receivable", "G2");
				renderer.setSeriesToGroupMap(map);
				renderer.setItemMargin(0.0);

				renderer.setItemMargin(0.0);

				// set color here
				Paint p1 = new Color(16, 22, 103);
				Paint p2 = new Color(87, 98, 230);

				renderer.setSeriesPaint(0, p1);
				renderer.setSeriesPaint(2, p1);
				renderer.setSeriesPaint(4, p1);

				renderer.setSeriesPaint(1, p2);
				renderer.setSeriesPaint(3, p2);
				renderer.setSeriesPaint(5, p2);

				SubCategoryAxis domainAxis2 = new SubCategoryAxis("");
				domainAxis2.setCategoryMargin(0.05);
				domainAxis2.addSubCategory("Collection");
				domainAxis2.addSubCategory("Loan Receivable");

				// LegendTitle legend = chart.getLegend();
				// legend.setPosition(RectangleEdge.B);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
				
				BarRenderer3D renderer2 = (BarRenderer3D) plot.getRenderer();

				plot.setNoDataMessage("No data to display");

				plot.setDomainAxis(domainAxis2);
				plot.setRenderer(renderer);
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				domainAxis.setMaximumCategoryLabelLines(10);

				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis();
				rangeAxis2.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));
					}
				});

				LegendItemCollection result2 = new LegendItemCollection();
				LegendItem item1 = new LegendItem("Collection", new Color(16,
						22, 103));
				LegendItem item2 = new LegendItem("Loan Receivable", new Color(
						87, 98, 230));
				result2.add(item1);
				result2.add(item2);
				plot.setFixedLegendItems(result2);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR NIA Loan Collection");
		}

	}

	@RequestMapping(value = "/loanproceedsallocationpiechart")
	public @ResponseBody
	String generateLoanProceedsAllocationPieChart() {
		
		JSONObject json = new JSONObject();

		try {
			
			NiaLoanProceedsAllocation allocation = 
				chartService.getLatestNiaLoanProceedsAllocation();

			if (allocation != null) {
				
				json.put("CAR", allocation.getCar());
				json.put("I", allocation.getRegion1());
				json.put("ARIIP", allocation.getAriip());
				json.put("II", allocation.getRegion2());
				json.put("MARIIS", allocation.getMariis());
				json.put("III", allocation.getRegion13());
				json.put("UPRIIS", allocation.getUpriis());
				json.put("IV", allocation.getRegion4());
				json.put("V", allocation.getRegion5());
				json.put("VI", allocation.getRegion6());
				json.put("VII", allocation.getRegion7());
				json.put("VIII", allocation.getRegion8());
				json.put("IX", allocation.getRegion9());
				json.put("X", allocation.getRegion10());
				json.put("XI", allocation.getRegion11());
				json.put("XII", allocation.getRegion12());
				json.put("XIII", allocation.getRegion13());
				json.put("ARMM", allocation.getArmm());
				json.put("NCR", allocation.getNcr());
			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING PIE CHART FOR NIA LOAN PROCEEDS ALLOCATION");
		}
		
		return json.toString();
	}

	@RequestMapping(value = "/loanproceedsutilizationpiechart")
	public @ResponseBody
	String generateLoanProceedsUtilizationPieChart() {

		JSONObject json = new JSONObject();
		
		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			NiaLoanProceedsUtilization utilization = chartService
					.getLatestNiaLoanProceedsUtilization();

			if (utilization != null) {
				
				json.put("Repair", utilization.getRepairRehabRestore());
				json.put("Rehab", utilization.getFarmToMarketRoads());
				
			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil
					.log(auth,
							"ERROR WHILE DISPLAYING PIE CHART FOR NIA LOAN PROCEEDS UTILIZATION");
		}
		
		return json.toString();

	}

	@RequestMapping(value = "/shareholderspiechart/{id}")
	public @ResponseBody
	String  generateShareholdersPieChart(@PathVariable(value = "id") Long id) {

		JSONObject json = new JSONObject();
		
		try {

			List<Shareholders> shareholders = chartService.getShareholdersByProjectId(id);

			if (shareholders != null) {
				
				List<String> shareholdersList = new ArrayList<String>();
				List<Double> sharesList = new ArrayList<Double>();
				
				for(Shareholders sh : shareholders) {
					shareholdersList.add(sh.getShareholders());
					sharesList.add(sh.getShares());
				}
				
					json.put("shareholdersList", shareholdersList);
					json.put("sharesList", sharesList);
					
				}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING STOCK AREA CHART");
		}
		
		return json.toString();

	}

	@RequestMapping(value = "/occupancypiechart")
	public @ResponseBody
	String generateOccupancyPieChart() {

		JSONObject json = new JSONObject();
		
		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			Occupancy occupancy = chartService.getOccupancyChart();
			
			if(occupancy != null) {
				json.put("Occupied", occupancy.getOccupied());
				json.put("Vacant", occupancy.getVacant());
			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING OCCUPANCY CHART");
		}

		return json.toString();
		
	}

	@RequestMapping(value = "/netlendingbarchart/{width}/{height}")
	public @ResponseBody
	void generateNetLendingBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset result = new DefaultCategoryDataset();	
			List<NetLending> netLendings = chartService.generateNetLending();

//			if (netLendings != null && netLendings.size() > 0) {
				
				Date currDate = null;
				
				for(NetLending nl : netLendings) {
					result.addValue(nl.getBondIssued(),
					"NDC Payment (bond_percent)",
					nl.getYear());
					result.addValue(nl.getBondNetLending(),
					"NDC Payment (coupon_percent)",
					nl.getYear());
					result.addValue(nl.getCoupon(),
					"NDC Lending (bond_percent)",
					nl.getYear());
					result.addValue(nl.getCouponNetLending(),
					"NDC Lending (coupon_percent)",
					nl.getYear());
					
					currDate = nl.getDateUpdated();
				}

				JFreeChart chart = ChartFactory.createStackedBarChart3D(
						"Net Lending\n" + AppHelper.convertDateToString(currDate), // Title
						"", // X-Axis label
						"Millions (Php)",// Y-Axis label
						result, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				GroupedStackedBarRenderer renderer = new GroupedStackedBarRenderer();
				KeyToGroupMap map = new KeyToGroupMap("G1");
				map.mapKeyToGroup("NDC Payment (bond_percent)", "G1");
				map.mapKeyToGroup("NDC Payment (coupon_percent)", "G1");
				map.mapKeyToGroup("NDC Lending (bond_percent)", "G2");
				map.mapKeyToGroup("NDC Lending (coupon_percent)", "G2");
				renderer.setSeriesToGroupMap(map);
				renderer.setItemMargin(0.0);

				renderer.setItemMargin(0.0);

				// change color here
				Paint p1 = new Color(48, 29, 255);
				Paint p2 = new Color(135, 186, 205);

				renderer.setSeriesPaint(0, p1);
				renderer.setSeriesPaint(2, p1);
				renderer.setSeriesPaint(4, p1);

				renderer.setSeriesPaint(1, p2);
				renderer.setSeriesPaint(3, p2);
				renderer.setSeriesPaint(5, p2);

				SubCategoryAxis domainAxis2 = new SubCategoryAxis("");
				domainAxis2.setCategoryMargin(0.05);
				domainAxis2.addSubCategory("Bond");
				domainAxis2.addSubCategory("Coupon");

				// LegendTitle legend = chart.getLegend();
				// legend.setPosition(RectangleEdge.B);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
				
				BarRenderer3D renderer2 = (BarRenderer3D) plot.getRenderer();

				plot.setNoDataMessage("No data to display");

				plot.setDomainAxis(domainAxis2);
				plot.setRenderer(renderer);
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				domainAxis.setMaximumCategoryLabelLines(10);

				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis();
				// rangeAxis2.setNumberFormatOverride(new
				// DecimalFormat("#,###"));

				rangeAxis2.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));
					}
				});

				LegendItemCollection result2 = new LegendItemCollection();
				LegendItem item1 = new LegendItem("NDC Payment", new Color(90,
						145, 154));
				LegendItem item2 = new LegendItem("Net Lending", new Color(135,
						186, 205));
				result2.add(item1);
				result2.add(item2);
				plot.setFixedLegendItems(result2);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING BAR CHART");
		}

	}

	@RequestMapping(value = "/agriagrabondspiechart")
	public @ResponseBody
	String generateAgriAgraBondsPieChart() {
		
		JSONObject json = new JSONObject();
		
		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			Double totalAgriAgraBonds = chartService.getLatestAgriAgraBonds();
			Double unutilized = null;
			
			List<AgriAgraBonds> bondsList = chartService.generateAgriAgraBonds();
			
			List<Integer> years = new ArrayList<Integer>();
			List<Double> amounts = new ArrayList<Double>();
			double total = 0;
			
			if(bondsList != null) {
				
				Date currDate = null;
				
				for(AgriAgraBonds a : bondsList) {
					years.add(a.getYear());
					amounts.add(a.getAmount());
					
					total += a.getAmount();
					currDate = a.getDateUpdated();
				}
				
				json.put("dateUpdated", AppHelper.convertDateToString(currDate));
				json.put("years", years);
				json.put("amounts", amounts);
				json.put("unutilized", totalAgriAgraBonds - total);
			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING PIE CHART FOR AGRI-AGRA BONDS");
		}
		
		return json.toString();

	}

	@RequestMapping(value = "/maintenancecostlinechart/{width}/{height}")
	public @ResponseBody
	void generateMaintenanceCostLineChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			List<MaintenanceCost> maintenanceCosts = chartService.generateMaintenanceCost();

//			if (maintenanceCosts != null && maintenanceCosts.size() > 0) {
				
				for(MaintenanceCost mc : maintenanceCosts) {
					double partialTotal = mc.getDuesFees() + mc.getRpt() + mc.getSecurity();
					dataset.addValue(mc.getMarketValue(), "Revenue on Properties", mc.getYear());
					dataset.addValue(partialTotal, "Maintenance Cost", mc.getYear());
					System.out.println("Partial total for year " + mc.getYear() + ": " + partialTotal);
				}

				JFreeChart chart = ChartFactory.createLineChart(
						"Maintenance Cost", // chart
						"", // domain(x-axis) axis label
						"Millions(Php)", // range(y-axis) axis label
						dataset, // data
						PlotOrientation.VERTICAL, // orientation
						true, // include legend
						true, // tooltips
						true // urls
						);

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.BOTTOM);

				// set chart background
				chart.setBackgroundPaint(Color.white);
				chart.setTitle(new org.jfree.chart.title.TextTitle("Maintenance Cost", new java.awt.Font("Arial", java.awt.Font.BOLD, 25)));
						  
				// set plot specifications
				final CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
				plot.setDomainGridlinesVisible(true);
				plot.setDomainGridlinePaint(Color.lightGray);
				plot.setRangeGridlinePaint(Color.lightGray);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
				plot.setDomainGridlinesVisible(false);
				plot.setNoDataMessage("No data to display");

				// CUSTOMIZE DOMAIN AXIS
				final CategoryAxis domainAxis = (CategoryAxis) plot
						.getDomainAxis();

				// customize domain label position
				domainAxis.setCategoryLabelPositions(CategoryLabelPositions
						.createUpRotationLabelPositions(Math.PI / 6.0));
				
				// CUSTOMIZE RANGE AXIS
				final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
				rangeAxis.setStandardTickUnits(NumberAxis
						.createIntegerTickUnits());
				rangeAxis.setAutoRangeIncludesZero(true);
				// rangeAxis.setVerticalTickLabels(true);
				// rangeAxis.setAutoTickUnitSelection(rootPaneCheckingEnabled);
				rangeAxis.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));
					}
				});

				// CUSTOMIZE THE RENDERER
				final LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
						.getRenderer();

				renderer.setBaseItemLabelsVisible(true);
				renderer.setSeriesShapesVisible(1, true);

				// set dots or you can say shapes at a point
				renderer.setBaseShapesFilled(true);
				renderer.setBaseShapesVisible(true);
				// DISPLAY LINES TYPE

				// It would show solid lines
				Stroke stroke = new BasicStroke(3f, BasicStroke.CAP_ROUND,
						BasicStroke.JOIN_BEVEL);
				renderer.setBaseOutlineStroke(stroke);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING LINE CHART");
		}

	}

	@RequestMapping(value = "/sourcesfundsbarchart/{width}/{height}")
	public @ResponseBody
	void generateSourcesFundsBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			List<SourcesFunds> sourcesFunds = chartService.generateSourcesFunds();

//			if (sourcesFunds != null && sourcesFunds.size() > 0) {
				
				for(SourcesFunds sf : sourcesFunds) {
					categoryDataset.setValue(
							sf.getProjectedSourcesOfFunds(),
							"Projected Sources of Funds",
							sf.getYear());
					categoryDataset.setValue(
							sf.getProjectedSourcesOfFunds(),
							"Projected Uses of Funds",
							sf.getYear());
				}

				JFreeChart chart = ChartFactory.createBarChart(
						"Sources & Uses of Funds", // Title
						"", // X-Axis label
						"in millions",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.BOTTOM);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
		        plot.setRangeGridlinePaint(Color.BLACK);
		        plot.setRangeGridlineStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));

				plot.setNoDataMessage("No data to display");

				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				domainAxis.setMaximumCategoryLabelLines(10);
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI
				// / 6.0));

				BarRenderer renderer4 = (BarRenderer) plot.getRenderer();
				renderer4.setSeriesPaint(0, new Color(36, 134, 38));
				renderer4.setSeriesPaint(1, new Color(121, 219, 123));
				// BarRenderer3D renderer = (BarRenderer3D) plot.getRenderer();
				// renderer.setSeriesItemLabelGenerator(0, new
				// StandardCategoryItemLabelGenerator("{2}", new
				// DecimalFormat("#,###")));
				// renderer.setSeriesItemLabelsVisible(0, true);
				// renderer.setMaximumBarWidth(0.20f);

				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis(0);
				// rangeAxis2.setNumberFormatOverride(new DecimalFormat());
				// rangeAxis2.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				rangeAxis2.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {

						return new StringBuffer(String.format("%.1f",
								number / 1000000));
					}
				});

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil
					.log(auth,
							"ERROR WHILE DISPLAYING BAR CHART FOR SOURCES & USES OF FUNDS");
		}

	}

	@RequestMapping(value = "/statusassetsbarchart/{width}/{height}")
	public @ResponseBody
	void generateStatusAssetsBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			//StatusAssets statusAssets = chartService.getLatestStatusAssets();	
			List<StatusAssets> assets = chartService.generateStatusAssets();

//			if (assets != null && assets.size() > 0) {
				
				for(StatusAssets asset : assets) {
					categoryDataset.setValue(asset.getUnderLease(),
							"Under Lease", asset.getYear());
					categoryDataset.setValue(asset.getForSaleLease(),
							"For Sale/Lease", asset.getYear());
					categoryDataset.setValue(asset.getWithCourtCase(),
							"With Court Cases", asset.getYear());
					categoryDataset.setValue(asset.getForRelocationSurvey(),
							"For Relocation Survey", asset.getYear());
					categoryDataset.setValue(asset.getForTitling(),
							"For Titling/Issuance of ODCT", asset.getYear());
					categoryDataset.setValue(asset.getWithJv(), "With JV",
							asset.getYear());
					categoryDataset.setValue(
							asset.getForProjectDevelopment(),
							"For Project Development", asset.getYear());
					categoryDataset.setValue(
							asset.getOnGoing(),
							"On-Going Projects", asset.getYear());
				}

				JFreeChart chart = ChartFactory.createBarChart(
						"", // Title
						"", // X-Axis label
						"no. of properties",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);
				
				chart.setTitle(new org.jfree.chart.title.TextTitle("Status of Assets\nas of " + AppHelper.convertDateToString(new Date()), new java.awt.Font("Arial", java.awt.Font.BOLD, 25)));

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.BOTTOM);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
		        plot.setRangeGridlinePaint(Color.BLACK);
		        plot.setRangeGridlineStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));

				plot.setNoDataMessage("No data to display");

				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				domainAxis.setMaximumCategoryLabelLines(10);
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI
				// / 6.0));

				// BarRenderer3D renderer = (BarRenderer3D) plot.getRenderer();
				// renderer.setSeriesItemLabelGenerator(0, new
				// StandardCategoryItemLabelGenerator("{2}", new
				// DecimalFormat("#,###")));
				// renderer.setSeriesItemLabelsVisible(0, true);
				// renderer.setMaximumBarWidth(0.20f);

				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis(0);
				// rangeAxis2.setNumberFormatOverride(new DecimalFormat());
				// rangeAxis2.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				rangeAxis2.setNumberFormatOverride(new DecimalFormat("#"));
				// @Override
				// public StringBuffer format(double number, StringBuffer
				// toAppendTo, FieldPosition pos) {
				//
				// return new StringBuffer(String.format("%d", number));
				// }
				// });

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR STATUS OF ASSETS");
		}

	}

	@RequestMapping(value = "/spgincomestatementbarlinechart/{width}/{height}/{id}")
	public @ResponseBody
	void generateSpgIncomeStatementBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			@PathVariable(value = "id") Long id,
			HttpServletResponse response) {

		try {
			
			JFreeChart chart = null;

			// dataset for line graph
			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			final DefaultCategoryDataset dataset2 = new DefaultCategoryDataset();
			
			List<SpgIncomeStatement> incomeStatements = chartService.generateSpgIncomeStatement(id);

//			if(incomeStatements != null && incomeStatements.size() > 0) {
				
				SpgSubCategory category = spgService.getSubCategoryById(id);
				String currency = category.getCurrency();
				
				for(SpgIncomeStatement incomeStatement : incomeStatements) {
					categoryDataset.addValue(incomeStatement.getRevenue(),
							"Revenue", incomeStatement.getYear());
					categoryDataset.setValue(incomeStatement.getNetIncome(),
							"Net Income", incomeStatement.getYear());
					dataset2.addValue(incomeStatement.getProfitMargin(),
							"% Profit Margin", incomeStatement.getYear());
				}
				
				chart = ChartFactory.createBarChart(
						"Income Statement", // Title
						"", // X-Axis label
						currency,// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				chart.setBackgroundPaint(Color.white);

				final CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(new Color(0xEE, 0xEE, 0xFF));
				plot.setDomainAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));

				plot.setNoDataMessage("No data to display");

				plot.setDataset(1, dataset2);
				plot.mapDatasetToRangeAxis(1, 1);

				final CategoryAxis domainAxis = plot.getDomainAxis();
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_45);

				// final ValueAxis axis1 = new NumberAxis("RM Millions");
				// plot.setRangeAxis(1, axis1);

				final ValueAxis axis2 = new NumberAxis("");
				plot.setRangeAxis(1, axis2);

				// //last part edited
				// NumberAxis rangeAxis1 = (NumberAxis) plot.getRangeAxis(1);
				// rangeAxis1.setNumberFormatOverride(new DecimalFormat() {
				// @Override
				// public StringBuffer format(double number, StringBuffer
				// toAppendTo, FieldPosition pos) {
				// return new StringBuffer(String.format("%.1f",
				// number/1000000));
				// }
				// });
				// /////////////////////
				
				//NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis(0);
				// rangeAxis2.setNumberFormatOverride(new DecimalFormat());
				//rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				

				// last part edited
				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis(1);
				rangeAxis2.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				rangeAxis2.setRange(0, 100);
				rangeAxis2.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {
						return new StringBuffer(String.format("%.1f", number))
								.append("%");
					}
				});
				// ////////////////////

				final LineAndShapeRenderer renderer2 = new LineAndShapeRenderer();
				renderer2.setToolTipGenerator(new StandardCategoryToolTipGenerator());

				renderer2.setSeriesPaint(0, Color.BLUE);

				BarRenderer renderer3 = (BarRenderer) plot.getRenderer();
				renderer3.setSeriesPaint(0, new Color(56, 115, 137));
				renderer3.setSeriesPaint(1, new Color(146, 192, 209));

				plot.setRenderer(1, renderer2);
				plot.setDatasetRenderingOrder(DatasetRenderingOrder.FORWARD);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING BAR LINE CHART");
		}

	}

	@RequestMapping(value = "/spgbalancesheetbarlinechart/{width}/{height}/{id}")
	public @ResponseBody
	void generateSpgBalanceSheetBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			@PathVariable(value = "id") Long id,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();

			// dataset for line graph
			final DefaultCategoryDataset dataset2 = new DefaultCategoryDataset();
			List<SpgBalanceSheet> balanceSheets = chartService.generateSpgBalanceSheet(id);

//			if(balanceSheets != null && balanceSheets.size() > 0) {
				
				SpgSubCategory category = spgService.getSubCategoryById(id);
				String currency = category.getCurrency();
				
				for(SpgBalanceSheet sheet : balanceSheets) {
					dataset1.setValue(sheet.getTotalAssets(),
					"Total Assets", sheet.getYear());
					dataset1.setValue(sheet.getTotalLiabilities(),
							"Total Liabilities",sheet.getYear());
					dataset2.addValue(sheet.getDebtToAssets(),
							"% Debt to Assets", sheet.getYear());
				}
				
				// create the chart...
				JFreeChart chart = ChartFactory.createBarChart("Balance Sheet", // Title
						"", // X-Axis label
						currency,// Y-Axis label
						dataset1, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				chart.setBackgroundPaint(Color.white);

				final CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(new Color(0xEE, 0xEE, 0xFF));
				plot.setDomainAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));

				plot.setNoDataMessage("No data to display");

				plot.setDataset(1, dataset2);
				plot.mapDatasetToRangeAxis(1, 1);

				final CategoryAxis domainAxis = plot.getDomainAxis();
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_45);

				// final ValueAxis axis1 = new NumberAxis("RM Millions");
				// plot.setRangeAxis(1, axis1);

				final ValueAxis axis2 = new NumberAxis("");
				plot.setRangeAxis(1, axis2);

				// //last part edited
				// NumberAxis rangeAxis1 = (NumberAxis) plot.getRangeAxis(1);
				// rangeAxis1.setNumberFormatOverride(new DecimalFormat() {
				// @Override
				// public StringBuffer format(double number, StringBuffer
				// toAppendTo, FieldPosition pos) {
				// return new StringBuffer(String.format("%.1f",
				// number/1000000));
				// }
				// });
				// /////////////////////
				
				//NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis(0);
				// rangeAxis2.setNumberFormatOverride(new DecimalFormat());
				//rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				

				// last part edited
				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis(1);
				rangeAxis2.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				rangeAxis2.setRange(0, 100);
				rangeAxis2.setNumberFormatOverride(new DecimalFormat() {
					@Override
					public StringBuffer format(double number,
							StringBuffer toAppendTo, FieldPosition pos) {
						return new StringBuffer(String.format("%.1f", number))
								.append("%");
					}
				});
				// ////////////////////

				final LineAndShapeRenderer renderer2 = new LineAndShapeRenderer();
				renderer2.setToolTipGenerator(new StandardCategoryToolTipGenerator());

				renderer2.setSeriesPaint(0, Color.BLUE);

				BarRenderer renderer3 = (BarRenderer) plot.getRenderer();
				renderer3.setSeriesPaint(0, new Color(56, 115, 137));
				renderer3.setSeriesPaint(1, new Color(146, 192, 209));

				plot.setRenderer(1, renderer2);
				plot.setDatasetRenderingOrder(DatasetRenderingOrder.FORWARD);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING BAR LINE CHART");
		}

	}

	@RequestMapping(value = "/spgcashflowlinechart/{width}/{height}/{id}")
	public @ResponseBody
	void generateSpgCashFlowLineChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			@PathVariable(value = "id") Long id,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			List<SpgCashFlow> cashFlows = chartService.generateSpgCashFlow(id);

//			if(cashFlows != null && cashFlows.size() > 0) {
				
				SpgSubCategory category = spgService.getSubCategoryById(id);
				String currency = category.getCurrency();
				
				for(SpgCashFlow cashFlow : cashFlows) {
					dataset.addValue(cashFlow.getOperatingActivities(),
					"Operating Activities", cashFlow.getYear());
					dataset.addValue(cashFlow.getInvestingActivities(),
					"Investing Activities", cashFlow.getYear());
					dataset.addValue(cashFlow.getFinancingActivities(),
							"Financing Activities", cashFlow.getYear());
				}
				
				JFreeChart chart = ChartFactory.createLineChart("Cash Flow", // chart
																				// title
						"", // domain(x-axis) axis label
						currency, // range(y-axis) axis label
						dataset, // data
						PlotOrientation.VERTICAL, // orientation
						true, // include legend
						true, // tooltips
						false // urls
						);

				//LegendTitle legend = chart.getLegend();
				//legend.setPosition(RectangleEdge.RIGHT);

				// set chart background
				chart.setBackgroundPaint(Color.white);

				// set plot specifications
				final CategoryPlot plot = chart.getCategoryPlot();
				plot.setBackgroundPaint(Color.WHITE);
				plot.setDomainGridlinesVisible(true);
				plot.setDomainGridlinePaint(Color.lightGray);
				plot.setRangeGridlinePaint(Color.lightGray);
				//
				//plot.setDomainGridlineStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
				plot.setDomainGridlinesVisible(false);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));

				plot.setNoDataMessage("No data to display");

				// CUSTOMIZE DOMAIN AXIS
				final CategoryAxis domainAxis = (CategoryAxis) plot
						.getDomainAxis();

				// customize domain label position
				domainAxis.setCategoryLabelPositions(CategoryLabelPositions
						.createUpRotationLabelPositions(Math.PI / 6.0));

				// CUSTOMIZE RANGE AXIS
				final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
				rangeAxis.setStandardTickUnits(NumberAxis
						.createIntegerTickUnits());
				rangeAxis.setAutoRangeIncludesZero(true);
				// rangeAxis.setVerticalTickLabels(true);
				// rangeAxis.setAutoTickUnitSelection(rootPaneCheckingEnabled);
//				rangeAxis.setNumberFormatOverride(new DecimalFormat() {
//					@Override
//					public StringBuffer format(double number,
//							StringBuffer toAppendTo, FieldPosition pos) {
//
//						return new StringBuffer(String.format("%.1f",
//								number / 1000000));
//					}
//				});

				// CUSTOMIZE THE RENDERER
				final LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
						.getRenderer();

				renderer.setBaseItemLabelsVisible(true);
				renderer.setSeriesShapesVisible(1, true);

				// set dots or you can say shapes at a point
				renderer.setBaseShapesFilled(true);
				renderer.setBaseShapesVisible(true);
				// DISPLAY LINES TYPE

				// It would show solid lines
				Stroke stroke = new BasicStroke(3f, BasicStroke.CAP_ROUND,
						BasicStroke.JOIN_BEVEL);
				renderer.setBaseOutlineStroke(stroke);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING LINE CHART");
		}

	}

	@RequestMapping(value = "/projectedactualincomechart/{width}/{height}")
	public @ResponseBody
	void generateProjectedActualIncomeChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			// get two value from database
			ProjectedActualIncome projectedActualIncome = chartService
					.getLatestProjectedActualIncome();
			ProjectedActualIncome2 projectedActualIncome2 = chartService
					.getLatestProjectedActualIncome2();
			
			Date currDate = null;

//			if (projectedActualIncome != null && projectedActualIncome2 != null) {

				Double newData = (projectedActualIncome.getactualIncome().doubleValue() / (projectedActualIncome2
						.getProjectedIncome().doubleValue()) * 100);

				DefaultValueDataset data = new DefaultValueDataset();
				
				currDate = projectedActualIncome.getDateUpdated();

				MeterPlot plot = new MeterPlot(data);
				System.out.println("New Data: " + newData);
				
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(projectedActualIncome.getDateUpdated());
				
				int month = calendar.get(Calendar.MONTH);
				int year = calendar.get(Calendar.YEAR);
				String monthString = AppHelper.convertIntegerToMonth(month);
				
				plot.setUnits("% of " + monthString + " " +  calendar.get(Calendar.YEAR));

				// validate data if over 100
				if (newData > 100) {
					data.setValue(newData);
					plot.addInterval(new MeterInterval("Critical", new Range(0,
							newData), Color.YELLOW, new BasicStroke(2.0f),
							new Color(255, 0, 0, 128)));
					plot.setRange(new Range(0, newData));

					for (int x = 10; x < newData; x += 10) {
						plot.addInterval(new MeterInterval("Critical",
								new Range(x, x + 10)));
					}

				} else {
					data.setValue(newData);
					// plot.addInterval(new MeterInterval("Good", new Range(0,
					// 100),Color.lightGray, new BasicStroke(2.0f),
					// Color.WHITE));
					plot.setRange(new Range(0, 100D));

					for (int x = 0; x < 100; x += 10) {
						plot.addInterval(new MeterInterval("Good", new Range(x,
								x + 10), Color.lightGray,
								new BasicStroke(2.0f), Color.WHITE));
					}
				}

				plot.setTickLabelFormat(new DecimalFormat("#"));
				plot.setNeedlePaint(Color.red);
				plot.setDialBackgroundPaint(Color.white);
				plot.setDialOutlinePaint(Color.WHITE);
				plot.setDialShape(DialShape.CHORD);
				plot.setMeterAngle(260);
				plot.setTickLabelsVisible(true);
				plot.setTickLabelFont(new Font("Dialog", Font.BOLD, 10));
				plot.setTickLabelPaint(Color.BLACK);
				plot.setTickSize(10.0);
				plot.setTickPaint(Color.lightGray);
				plot.setValuePaint(Color.black);

				plot.setNoDataMessage("No data to display");
				plot.setValueFont(new Font("Dialog", Font.BOLD, 18));

				JFreeChart chart = new JFreeChart(
						"Income:  Actual vs Budget\n" + AppHelper.convertDateToString(currDate),
						JFreeChart.DEFAULT_TITLE_FONT, plot, true);

				chart.getLegend().setVisible(false);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING STOCK AREA CHART");
		}

	}

	@RequestMapping(value = "/actualincomeexpensesubchartbatchone/{id}/{width}/{height}")
	public @ResponseBody
	void generateActualIncomeExpenseSubChartBatchOne(
			@PathVariable(value = "id") Long id,
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			ActualIncomeExpense expense = chartService
					.getActualIncomeExpenseById(id);

//			if (expense != null) {
				categoryDataset.setValue(expense.getActualAdvertising(),
						"Actual", "Advertising");
				categoryDataset.setValue(expense.getActualAthletics(),
						"Actual", "Athletics");
				categoryDataset.setValue(expense.getActualAuditing(), "Actual",
						"Auditing");
				categoryDataset.setValue(expense.getActualBoardExpenses(), "Actual",
						"Board Expenses");
				categoryDataset.setValue(expense.getActualChristmasAnniversary(), "Actual",
						"Christmas and Anniversary");

				// Enrollment in Masters level
				categoryDataset.setValue(expense.getBudgetAdvertising(),
						"Budget", "Advertising");
				categoryDataset.setValue(expense.getBudgetAthletics(),
						"Budget", "Athletics");
				categoryDataset.setValue(expense.getBudgetAuditing(), "Budget",
						"Auditing");
				categoryDataset.setValue(expense.getBudgetBoardExpenses(), "Budget",
						"Board Expenses");
				categoryDataset.setValue(expense.getBudgetChristmasAnniversary(), "Budget",
						"Christmas and Anniversary");
			

				JFreeChart chart = ChartFactory.createBarChart3D(AppHelper.convertIntegerToMonth(expense.getMonth()) + " " + expense.getYear(), // Title
						"", // X-Axis label
						"Php ",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setNoDataMessage("No data to display");
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(0, 100, 0));
				renderer.setSeriesPaint(1, new Color(127, 255, 0));
				// (BarRenderer(renderer)).setItemMargin(0.0);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING ACTUAL INCOME EXPENSE BAR CHART");
		}

	}
	
	@RequestMapping(value = "/actualincomeexpensesubchartbatchtwo/{id}/{width}/{height}")
	public @ResponseBody
	void generateActualIncomeExpenseSubChartBatchTwo (
			@PathVariable(value = "id") Long id,
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			ActualIncomeExpense expense = chartService
					.getActualIncomeExpenseById(id);

//			if (expense != null) {
				categoryDataset.setValue(expense.getActualCommunicationService(),
						"Actual", "Communication Service");
				categoryDataset.setValue(expense.getActualConsultancy(),
						"Actual", "Consultancy");
				categoryDataset.setValue(expense.getActualDonations(),
						"Actual", "Donations");
				categoryDataset.setValue(expense.getActualExtraordinary(), "Actual",
						"Extraordinary and Misc.");
				categoryDataset.setValue(expense.getActualFidelityAndInsurance(), "Actual",
						"Fidelity Bond and Insurance Premium.");
				

				// Enrollment in Masters level
				categoryDataset.setValue(expense.getBudgetCommunicationService(),
						"Budget", "Communication Service");
				categoryDataset.setValue(expense.getBudgetConsultancy(),
						"Budget", "Consultancy");
				categoryDataset.setValue(expense.getBudgetDonations(),
						"Budget", "Donations");
				categoryDataset.setValue(expense.getBudgetExtraordinary(), "Budget",
						"Extraordinary and Misc.");
				categoryDataset.setValue(expense.getBudgetFidelityAndInsurance(), "Budget",
						"Fidelity Bond and Insurance Premium.");

				JFreeChart chart = ChartFactory.createBarChart3D(AppHelper.convertIntegerToMonth(expense.getMonth()) + " " + expense.getYear(), // Title
						"", // X-Axis label
						"Php ",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setNoDataMessage("No data to display");
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(0, 100, 0));
				renderer.setSeriesPaint(1, new Color(127, 255, 0));
				// (BarRenderer(renderer)).setItemMargin(0.0);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING ACTUAL INCOME EXPENSE BAR CHART");
		}

	}
	
	@RequestMapping(value = "/actualincomeexpensesubchartbatchthree/{id}/{width}/{height}")
	public @ResponseBody
	void generateActualIncomeExpenseSubChartBatchThree (
			@PathVariable(value = "id") Long id,
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			ActualIncomeExpense expense = chartService
					.getActualIncomeExpenseById(id);

//			if (expense != null) {
				categoryDataset.setValue(expense.getActualJanitorial(), "Actual",
					"Janitorial");
				categoryDataset.setValue(expense.getActualLegal(), "Actual",
					"Legal");
				categoryDataset.setValue(expense.getActualLightWater(),
						"Actual", "Light & Water");
				categoryDataset.setValue(expense.getActualMeetings(),
						"Actual", "Meetings");
				categoryDataset.setValue(expense.getActualMemberships(), "Actual",
						"Memberships");
				

				categoryDataset.setValue(expense.getBudgetJanitorial(), "Budget",
						"Janitorial");
				categoryDataset.setValue(expense.getBudgetLegal(), "Budget",
						"Legal");
				categoryDataset.setValue(expense.getBudgetLightWater(),
						"Budget", "Light & Water");
				categoryDataset.setValue(expense.getBudgetMeetings(),
						"Budget", "Meetings");
				categoryDataset.setValue(expense.getBudgetMemberships(), "Budget",
						"Memberships");

				JFreeChart chart = ChartFactory.createBarChart3D(AppHelper.convertIntegerToMonth(expense.getMonth()) + " " + expense.getYear(), // Title
						"", // X-Axis label
						"Php ",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setNoDataMessage("No data to display");
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(0, 100, 0));
				renderer.setSeriesPaint(1, new Color(127, 255, 0));
				// (BarRenderer(renderer)).setItemMargin(0.0);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING ACTUAL INCOME EXPENSE BAR CHART");
		}

	}
	
	@RequestMapping(value = "/actualincomeexpensesubchartbatchfour/{id}/{width}/{height}")
	public @ResponseBody
	void generateActualIncomeExpenseSubChartBatchFour (
			@PathVariable(value = "id") Long id,
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			ActualIncomeExpense expense = chartService
					.getActualIncomeExpenseById(id);

//			if (expense != null) {
				categoryDataset.setValue(expense.getActualMessengerial(), "Actual",
					"Messengerial");
				categoryDataset.setValue(expense.getActualMisc(), "Actual",
					"Misc");
				categoryDataset.setValue(expense.getActualOtherMisc(),
						"Actual", "Other Misc");
				categoryDataset.setValue(expense.getActualRentals(),
						"Actual", "Rentals");
				categoryDataset.setValue(expense.getActualRepairFacilities(), "Actual",
						"Repair of Facilities");
				categoryDataset.setValue(expense.getActualRepairVehicles(), "Actual",
						"Repair of Vehicles");

				categoryDataset.setValue(expense.getActualMessengerial(), "Budget",
						"Messengerial");
				categoryDataset.setValue(expense.getBudgetMisc(), "Budget",
						"Misc");
				categoryDataset.setValue(expense.getBudgetOtherMisc(),
						"Budget", "Other Misc");
				categoryDataset.setValue(expense.getBudgetRentals(),
						"Budget", "Rentals");
				categoryDataset.setValue(expense.getBudgetRepairFacilities(), "Budget",
						"Repair of Facilities");
				categoryDataset.setValue(expense.getBudgetRepairVehicles(), "Budget",
						"Repair of Vehicles");

				JFreeChart chart = ChartFactory.createBarChart3D(AppHelper.convertIntegerToMonth(expense.getMonth()) + " " + expense.getYear(), // Title
						"", // X-Axis label
						"Php ",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setNoDataMessage("No data to display");
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(0, 100, 0));
				renderer.setSeriesPaint(1, new Color(127, 255, 0));
				// (BarRenderer(renderer)).setItemMargin(0.0);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING ACTUAL INCOME EXPENSE BAR CHART");
		}

	}
	
	@RequestMapping(value = "/actualincomeexpensesubchartbatchfive/{id}/{width}/{height}")
	public @ResponseBody
	void generateActualIncomeExpenseSubChartBatchFive (
			@PathVariable(value = "id") Long id,
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			ActualIncomeExpense expense = chartService
					.getActualIncomeExpenseById(id);

//			if (expense != null) {
				categoryDataset.setValue(expense.getActualRewards(), "Actual",
					"Rewards/Other Claims");
				categoryDataset.setValue(expense.getActualSecurity(), "Actual",
					"Security");
				categoryDataset.setValue(expense.getActualSubscription(),
						"Actual", "Subscription");
				categoryDataset.setValue(expense.getActualSuppliesMaterials(),
						"Actual", "Supplies & Materials");
				categoryDataset.setValue(expense.getActualTaxes(), "Actual",
						"Taxes");
				categoryDataset.setValue(expense.getActualTraining(), "Actual",
						"Training");
				categoryDataset.setValue(expense.getActualTravelling(), "Actual",
						"Travelling");

				categoryDataset.setValue(expense.getActualRewards(), "Actual",
						"Rewards/Other Claims");
				categoryDataset.setValue(expense.getBudgetSecurity(), "Budget",
						"Security");
				categoryDataset.setValue(expense.getBudgetSubscription(),
						"Budget", "Subscription");
				categoryDataset.setValue(expense.getBudgetSuppliesMaterials(),
						"Budget", "Supplies & Materials");
				categoryDataset.setValue(expense.getBudgetTaxes(), "Budget",
						"Taxes");
				categoryDataset.setValue(expense.getBudgetTraining(), "Budget",
						"Training");
				categoryDataset.setValue(expense.getBudgetTravelling(), "Budget",
						"Travelling");

				JFreeChart chart = ChartFactory.createBarChart3D(AppHelper.convertIntegerToMonth(expense.getMonth()) + " " + expense.getYear(), // Title
						"", // X-Axis label
						"Php ",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				plot.setNoDataMessage("No data to display");
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(0, 100, 0));
				renderer.setSeriesPaint(1, new Color(127, 255, 0));
				// (BarRenderer(renderer)).setItemMargin(0.0);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING ACTUAL INCOME EXPENSE BAR CHART");
		}

	}

	@RequestMapping(value = "/actualincomeexpensechart/{width}/{height}")
	public @ResponseBody
	void generateActualIncomeExpenseChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

			List<ActualIncomeExpense> actualIncomeExpense = chartService
					.getActualIncomeExpense();
			// Double dividendData = (projectedActualIncome.getactualDividend()
			// / projectedActualIncome.getprojectedDividend()) * 100;

//			if (actualIncomeExpense != null) {
				
				String newDate = null;
				int year = 0;

				if (actualIncomeExpense.size() != 0) {
					for (ActualIncomeExpense expense : actualIncomeExpense) {
						if (expense != null) {

							newDate = AppHelper.convertIntegerToMonth(expense.getMonth());
							year = expense.getYear();

							dataset.addValue(expense.gettotalExpense(),
									"Budget", newDate + " " + year);
							dataset.addValue(expense.gettotalIncome(),
									"Actual", newDate + " " + year);

						}
					}

					JFreeChart chart = ChartFactory.createLineChart(
							"Expense: Actual vs Budget\nas of " + newDate + " " + year, // chart
							// title
							"", // domain(x-axis) axis label
							"Php ", // range(y-axis) axis label
							dataset, // data
							PlotOrientation.VERTICAL, // orientation
							true, // include legend
							true, // tooltips
							false // urls
							);

					// set chart background
					chart.setBackgroundPaint(Color.white);

					// set plot specifications
					final CategoryPlot plot = chart.getCategoryPlot();
					plot.setBackgroundPaint(Color.WHITE);
					plot.setDomainGridlinesVisible(true);
					// plot.setDomainGridlinePaint(Color.BLACK);
					plot.setRangeGridlinePaint(Color.BLACK);
					plot.setRangeGridlineStroke(new BasicStroke(0.5f,
							BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
					plot.setNoDataMessage("No data to display");

					// Change Legend Plot
					
//					 LegendItemCollection chartLegend = new
//					 LegendItemCollection(); Shape shape = new Rectangle(10,
//					 10); chartLegend.add(new LegendItem("label1", null, null,
//					 null, shape, Color.red)); chartLegend.add(new
//					 LegendItem("label2", null, null, null, shape,
//					 Color.blue)); plot.setFixedLegendItems(chartLegend);

					// CUSTOMIZE DOMAIN AXIS
					final CategoryAxis domainAxis = (CategoryAxis) plot
							.getDomainAxis();

					// customize domain label position
					domainAxis.setCategoryLabelPositions(CategoryLabelPositions
							.createUpRotationLabelPositions(Math.PI / 6.0));

					// CUSTOMIZE RANGE AXIS
					final NumberAxis rangeAxis = (NumberAxis) plot
							.getRangeAxis();
					rangeAxis.setStandardTickUnits(NumberAxis
							.createIntegerTickUnits());
					rangeAxis.setAutoRangeIncludesZero(true);
					// rangeAxis.setVerticalTickLabels(true);
					// rangeAxis.setAutoTickUnitSelection(rootPaneCheckingEnabled);

					// CUSTOMIZE THE RENDERER
					final LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
							.getRenderer();
					// renderer.setDrawOutlines(true);

					Shape[] shapes = new Shape[3];
					int[] xpoints;
					int[] ypoints;

					// right-pointing triangle
					xpoints = new int[] { -3, 3, -3 };
					ypoints = new int[] { -3, 0, 3 };
					shapes[0] = new Polygon(xpoints, ypoints, 3);

					// vertical rectangle
					shapes[1] = new Rectangle2D.Double(-2, -3, 3, 6);

					// draw a star
					xpoints = new int[] { 0, 6, 24, 9, 15, 0, -15, -9, -24, -6 };
					ypoints = new int[] { -25, -8, -8, 3, 20, 9, 20, 3, -8, -8 };
					shapes[2] = new Polygon(xpoints, ypoints, 10);

					// You can also set series line colors for each line
					// Shape cross = ShapeUtilities.createDiagonalCross(3, 1);
					// Shape cross2 = ShapeUtilities.createRegularCross(4, 1);
					// renderer.setSeriesShape(0, shapes[2]);
					// renderer.setSeriesShape(1, new Point2D.Double(10, 20));
//					 renderer.setSeriesPaint(0, Color.);
//					 renderer.setSeriesPaint(1, Color.GREEN);
					renderer.setSeriesPaint(0, new Color(127, 255, 0));
					renderer.setSeriesPaint(1, new Color(0, 100, 0));
					// renderer.setSeriesPaint(2, Color.YELLOW);
					// renderer.setSeriesPaint(3, Color.GREEN);
					// renderer.setSeriesPaint(4, Color.ORANGE);
					// renderer.setSeriesPaint(5, Color.white);

					// Working Code to show values along with dots
					//NumberFormat format = NumberFormat.getNumberInstance();
					//format.setMaximumFractionDigits(2);
					//CategoryItemLabelGenerator generator = new StandardCategoryItemLabelGenerator(
					//		StandardCategoryItemLabelGenerator.DEFAULT_LABEL_FORMAT_STRING,
					//		format);
					//renderer.setBaseItemLabelGenerator(generator);
					renderer.setBaseItemLabelsVisible(true);
					renderer.setSeriesShapesVisible(1, true);

					// set dots or you can say shapes at a point
					renderer.setBaseShapesFilled(true);
					renderer.setBaseShapesVisible(true);
					// DISPLAY LINES TYPE

					// It would show solid lines
					Stroke stroke = new BasicStroke(3f, BasicStroke.CAP_ROUND,
							BasicStroke.JOIN_BEVEL);
					renderer.setBaseOutlineStroke(stroke);

					chart.setBackgroundPaint(Color.WHITE);

					if (chart != null) {
						final ChartRenderingInfo info = new ChartRenderingInfo(
								new StandardEntityCollection());
						response.setContentType("image/png");
						OutputStream out = response.getOutputStream();

						ChartUtilities.writeChartAsPNG(out, chart, width,
								height, info);

						out.close();
						/*
						 * PrintWriter wr = response.getWriter();
						 * wr.write("asdasdasd"); wr.close();
						 */

					}
				}
//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING ACTUAL INCOME EXPENSE CHART");
		}

	}

	@RequestMapping(value = "/projectedactualincomesubchart/{width}/{height}")
	public @ResponseBody
	void generateProjectedActualIncomeSubChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			ProjectedActualIncome projectedActualIncome = chartService
					.getLatestProjectedActualIncome();
			ProjectedActualIncome2 projectedActualIncome2 = chartService
					.getLatestProjectedActualIncome2();

//			if (projectedActualIncome != null && projectedActualIncome2 != null) {

				Double dividendData = (projectedActualIncome
						.getactualDividend().doubleValue() / (projectedActualIncome2
						.getProjectedDividend().doubleValue()) * 100);
				
				Double gainOnSaleOfAssetsData = (projectedActualIncome
						.getactualGainOnSale().doubleValue() / (projectedActualIncome2
						.getProjectedGainOnSale().doubleValue()) * 100);
				
				Double interestIncomeData = (projectedActualIncome
						.getactualInterest().doubleValue() / (projectedActualIncome2
						.getProjectedInterest().doubleValue()) * 100);
				
				Double rentalData = (projectedActualIncome.getactualRental().doubleValue() / (projectedActualIncome2
						.getProjectedRental().doubleValue()) * 100);

				DefaultCategoryDataset dataset = new DefaultCategoryDataset();

				// set your dataset here
				if (dividendData != null) {
					dataset.addValue(dividendData, "row2", "\nDividends Income");
				}

				if (gainOnSaleOfAssetsData != null) {
					dataset.addValue(gainOnSaleOfAssetsData, "row2",
							"\nGain on Sale of Assets");
				}

				if (interestIncomeData != null) {
					dataset.addValue(interestIncomeData, "row2",
							"\nInterest Income on Loans");
				}

				if (rentalData != null) {
					dataset.addValue(rentalData, "row2", "\nRental Income");
				}

				// MeterPlot plot = new MeterPlot(data);
				MultipleMeterPlot plot = new MultipleMeterPlot(dataset);
				plot.setDataExtractOrder(TableOrder.BY_COLUMN);

				plot.setSelectedKey("row2");
				plot.setOutlineVisible(false);

				plot.setNoDataMessage("No data to display.");

				JFreeChart subchart = plot.getMeterChart();
				MeterPlot m = (MeterPlot) subchart.getPlot();

				// add meter interval(s)
				m.addInterval(new MeterInterval("Critical", new Range(0, 50),
						Color.lightGray, new BasicStroke(2.0f), new Color(0,
								255, 0, 64)));

				m.addInterval(new MeterInterval("Critical", new Range(50, 100),
						Color.lightGray, new BasicStroke(2.0f), new Color(0,
								255, 0, 64)));

				m.addInterval(new MeterInterval("Critical",
						new Range(100, 200), Color.lightGray, new BasicStroke(
								2.0f), new Color(0, 0, 255, 128)));

				// set the maximum range of the meter
				m.setRange(new Range(0, 200));
				m.setNeedlePaint(Color.darkGray);
				m.setDialBackgroundPaint(Color.white);
				m.setDialOutlinePaint(Color.gray);
				m.setDialShape(DialShape.CHORD);
				m.setMeterAngle(180);
				m.setTickLabelsVisible(true);
				m.setTickLabelFont(new Font("Dialog", Font.BOLD, 10));
				m.setTickLabelPaint(Color.BLACK);
				m.setTickSize(10.0);
				m.setTickPaint(Color.lightGray);

				m.setValuePaint(Color.black);
				m.setValueFont(new Font("Dialog", Font.BOLD, 14));

				// other chart appearance settings
				m.setUnits("%");

				JFreeChart chart = new JFreeChart("",
						JFreeChart.DEFAULT_TITLE_FONT, plot, true);
				chart.getLegend().setVisible(false);
				chart.setBackgroundPaint(Color.WHITE);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING PROJECTED ACTUAL INCOME SUB CHART");
		}

	}

	@RequestMapping(value = "/collectionefficiencychart/{width}/{height}")
	public @ResponseBody
	void generateCollectionEfficiencyChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			List<CollectionEfficiency> collectionEfficiency = chartService
					.getCollectionEfficiency();

//			if (collectionEfficiency != null) {
//
//				if (collectionEfficiency.size() != 0) {

					DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

					Double current_amountCollected = 0.0;
					Double current_amountBilled = 0.0;
					Double pastDue_amountColleted = 0.0;
					Double pastDue_amountBilled = 0.0;
					int monthNum = 0;
					int year = 0;

					for (CollectionEfficiency newCollectionEfficiency : collectionEfficiency) {
						current_amountCollected += newCollectionEfficiency
								.getCurrentAmountCollected();
						current_amountBilled += newCollectionEfficiency
								.getCurrentAmountBilled();
						pastDue_amountColleted += newCollectionEfficiency
								.getPastdueAmountCollected();
						pastDue_amountBilled += newCollectionEfficiency
								.getPastdueAmountBilled();
						
						monthNum = newCollectionEfficiency.getMonth();
						year = newCollectionEfficiency.getYear();
					}
					
					System.out.println("Current amount collected: " + current_amountCollected);
					System.out.println("Current amount billed: " + current_amountBilled);
					
					String month = AppHelper.convertIntegerToMonth(monthNum);

					categoryDataset.setValue(pastDue_amountColleted,
							"Amount Collected", "Past Due");
					categoryDataset.setValue(current_amountCollected,
							"Amount Collected", "Current");

					categoryDataset.setValue(pastDue_amountBilled,
							"Amount Billed", "Past Due");
					categoryDataset.setValue(current_amountBilled,
							"Amount Billed", "Current");

					JFreeChart chart = ChartFactory.createBarChart3D(
							"Collection Efficiency\nas of " + month + " " + year, // Title
							"", // X-Axis label
							"Php ",// Y-Axis label
							categoryDataset, // Dataset
							PlotOrientation.HORIZONTAL, true, // Show legend
							true, false);

					CategoryPlot plot = chart.getCategoryPlot();
					plot.setBackgroundPaint(Color.WHITE);
					plot.setRangeGridlinePaint(Color.BLACK);
					plot.setRangeGridlineStroke(new BasicStroke(0.5f,
							BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
					plot.setNoDataMessage("No data to display");
					
					CategoryAxis domainAxis = plot.getDomainAxis();
					domainAxis.setTickLabelFont(new Font("sansSerif",
							Font.PLAIN, 12));
					// plot.setBackgroundPaint(Color.WHITE);
					// plot.setBackgroundPaint(Color.WHITE);
					// plot.setRangeGridlinePaint(Color.BLACK);
					// plot.setRangeGridlineStroke(new BasicStroke(0.5f,
					// BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
					// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
					// 6.0));

					BarRenderer renderer = (BarRenderer) plot.getRenderer();
					renderer.setItemMargin(0.0);
					renderer.setMaximumBarWidth(0.20f);
					renderer.setSeriesPaint(0, new Color(77, 67, 252));
					renderer.setSeriesPaint(1, new Color(184, 180, 254));
					// (BarRenderer(renderer)).setItemMargin(0.0);
					renderer.setItemLabelsVisible(true);
					chart.setBackgroundPaint(Color.WHITE);
					plot.setNoDataMessage("No data to display");

					if (chart != null) {
						final ChartRenderingInfo info = new ChartRenderingInfo(
								new StandardEntityCollection());
						response.setContentType("image/png");
						OutputStream out = response.getOutputStream();

						ChartUtilities.writeChartAsPNG(out, chart, width,
								height, info);
					}

//				}
//
//			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING COLLECTION EFFICIENCY CHART");
		}

	}

	@RequestMapping(value = "/budgetutilizationchart/{width}/{height}")
	public @ResponseBody
	void generateBudgetUtilizationChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			BUPersonalServices buPersonalServices = chartService
					.getLatestBUPersonalServices();
			BUMooe buMooe = chartService.getLatestBUMooe();
			BUCapitalExpenditures buCapitalExpenditures = chartService
					.getLatestBUCapitalExpenditures();

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			
//			if(buPersonalServices != null) {
				categoryDataset.setValue(buPersonalServices.getActualPersonalServices(),
						"Actual", "Personal Services");
//			}
			
//			if(buMooe != null) {
				categoryDataset.setValue(buMooe.getActualMooe(),
						"Actual", "MOOE");
//			}
			
//			if(buCapitalExpenditures != null) {
				categoryDataset.setValue(buCapitalExpenditures.getActualCapitalExpenditures(),
						"Actual", "Capital Expenditures");
//			}
			
//			if(buPersonalServices != null) {
				categoryDataset.setValue(buPersonalServices.getBudgetPersonalServices() - buPersonalServices.getActualPersonalServices(),
								"Unutilized", "Personal Services");
//			}
			
//			if(buMooe != null) {
				categoryDataset.setValue(buMooe.getBudgetMooe() - buMooe.getActualMooe(), 
						"Unutilized", "MOOE");
//			}
			
//			if(buCapitalExpenditures != null) {
				categoryDataset.setValue(buCapitalExpenditures.getBudgetCapitalExpenditures() - buCapitalExpenditures.getActualCapitalExpenditures(),
						"Unutilized", "Capital Expenditures");
//			}
			
			int m1 = buCapitalExpenditures.getMonth();
			int m2 = buMooe.getMonth();
			int m3 = buPersonalServices.getMonth();
			
			int y1 = buCapitalExpenditures.getYear();
			int y2 = buMooe.getYear();
			int y3 = buPersonalServices.getYear();
			
			int[] months = new int[3];
			months[0] = m1;
			months[1] = m2;
			months[2] = m3;
			
			int[] years = new int[3];
			years[0] = y1;
			years[1] = y2;
			years[2] = y3;
			
			Arrays.sort(months);
			Arrays.sort(years);
			
			String month = AppHelper.convertIntegerToMonth(months[2]);
			String year = "" + years[2];
			
			if(buPersonalServices != null || buMooe != null || buCapitalExpenditures != null) {
				
				JFreeChart chart = ChartFactory.createStackedBarChart(
						"Budget Utilization\nas of " + month + " " + year, // Title
						"", // X-Axis label
						"Php ",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);
	
				CategoryPlot plot = chart.getCategoryPlot();
				plot.setNoDataMessage("No data to display");
				plot.setBackgroundPaint(Color.WHITE);
				plot.setRangeGridlinePaint(Color.BLACK);
				plot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN, 12));
				domainAxis.setMaximumCategoryLabelLines(10);
				// plot.setBackgroundPaint(Color.WHITE);
				// plot.setBackgroundPaint(Color.WHITE);
				// plot.setRangeGridlinePaint(Color.BLACK);
				// plot.setRangeGridlineStroke(new BasicStroke(0.5f,
				// BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));
	
				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setMaximumBarWidth(0.20f);
//				renderer.setSeriesPaint(0, Color.decode("#FDE4D0"));
//				renderer.setSeriesPaint(1, Color.decode("#F79646"));
				renderer.setSeriesPaint(0, Color.decode("#F79646"));
				renderer.setSeriesPaint(1, Color.decode("#FDE4D0"));
				// renderer.setSeriesItemLabelGenerator(0, new
				// StandardCategoryItemLabelGenerator("{2}", new
				// DecimalFormat("#,###")));
				// renderer.setSeriesItemLabelsVisible(0, true);
				// (BarRenderer(renderer)).setItemMargin(0.0);
				chart.setBackgroundPaint(Color.WHITE);
	
				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();
	
					ChartUtilities.writeChartAsPNG(out, chart, width, height, info);
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BUDGET UTILIZATION CHART");
		}

	}

	@RequestMapping(value = "/pdstfrateschart/{width}/{height}")
	public @ResponseBody
	void generatePdstFRatesChart(@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			List<PdstFRates> pdstfrates = chartService.getPdstFRates();

			final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

			if (pdstfrates != null) {
				System.out.println("Rates: " + pdstfrates.size());
				Date currDate = null;

				if (pdstfrates.size() != 0) {

					for (PdstFRates newAvg : pdstfrates) {
						if (newAvg != null) {
							String newDate = AppHelper.convertIntegerToMonth(newAvg.getMonth());

							dataset.addValue(newAvg.getYear25Avg(), "25 Years",
									newDate);
							dataset.addValue(newAvg.getYear20Avg(), "20 Years",
									newDate);
							dataset.addValue(newAvg.getYear10Avg(), "10 Years",
									newDate);
							dataset.addValue(newAvg.getYear7Avg(), "7 Years",
									newDate);
							dataset.addValue(newAvg.getYear5Avg(), "5 Years",
									newDate);
							dataset.addValue(newAvg.getYear4Avg(), "4 Years",
									newDate);
							dataset.addValue(newAvg.getYear3Avg(), "3 Years",
									newDate);
							dataset.addValue(newAvg.getYear2Avg(), "2 Years",
									newDate);
							dataset.addValue(newAvg.getYear1Avg(), "1 Year",
									newDate);
							dataset.addValue(newAvg.getMonth6Avg(), "6 Months",
									newDate);
							dataset.addValue(newAvg.getMonth3Avg(), "3 Months",
									newDate);
							dataset.addValue(newAvg.getMonth1Avg(), "1 Month",
									newDate);
							
							currDate = newAvg.getDateUpdated();
						}
					}

					JFreeChart chart = ChartFactory.createLineChart(
							"2012 PDST-F Rates\n" + AppHelper.convertDateToString(currDate), // chart title
							"", // domain(x-axis) axis label
							"", // range(y-axis) axis label
							dataset, // data
							PlotOrientation.VERTICAL, // orientation
							true, // include legend
							true, // tooltips
							false // urls
							);

					LegendTitle legend = chart.getLegend();
					legend.setPosition(RectangleEdge.RIGHT);

					// set chart background
					chart.setBackgroundPaint(Color.white);

					// set plot specifications
					final CategoryPlot plot = chart.getCategoryPlot();
					plot.setBackgroundPaint(Color.WHITE);
					plot.setDomainGridlinesVisible(true);
					plot.setDomainGridlinePaint(Color.lightGray);
					plot.setRangeGridlinePaint(Color.lightGray);
					plot.setRangeGridlineStroke(new BasicStroke(0.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
					plot.setDomainGridlinesVisible(false);
					
					// CUSTOMIZE DOMAIN AXIS
					final CategoryAxis domainAxis = (CategoryAxis) plot
							.getDomainAxis();

					// customize domain label position
					domainAxis.setCategoryLabelPositions(CategoryLabelPositions
							.createUpRotationLabelPositions(Math.PI / 6.0));

					// CUSTOMIZE RANGE AXIS
					final NumberAxis rangeAxis = (NumberAxis) plot
							.getRangeAxis();
					rangeAxis.setStandardTickUnits(NumberAxis
							.createIntegerTickUnits());
					rangeAxis.setAutoRangeIncludesZero(true);
					// rangeAxis.setVerticalTickLabels(true);
					// rangeAxis.setAutoTickUnitSelection(rootPaneCheckingEnabled);

					// CUSTOMIZE THE RENDERER
					final LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
							.getRenderer();

					renderer.setBaseItemLabelsVisible(true);
					renderer.setSeriesShapesVisible(1, true);

					// set dots or you can say shapes at a point
					renderer.setBaseShapesFilled(true);
					renderer.setBaseShapesVisible(true);
					// DISPLAY LINES TYPE

					// It would show solid lines
					Stroke stroke = new BasicStroke(3f, BasicStroke.CAP_ROUND,
							BasicStroke.JOIN_BEVEL);
					renderer.setBaseOutlineStroke(stroke);

					if (chart != null) {
						final ChartRenderingInfo info = new ChartRenderingInfo(
								new StandardEntityCollection());
						response.setContentType("image/png");
						OutputStream out = response.getOutputStream();

						ChartUtilities.writeChartAsPNG(out, chart, width,
								height, info);
					}

				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BUDGET UTILIZATION CHART");
		}

	}
	
	@RequestMapping(value = "/spglinechart/{width}/{height}")
	public @ResponseBody
	void spgLineChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {
			
			//row keys
			final String series1 = "Investment";
			final String series2 = "Project Financing";
			
			//column keys
			final String type1 = "2000";
			final String type2 = "2001";
			final String type3 = "2002";
			final String type4 = "2003";
			final String type5 = "2004";
			final String type6 = "2005";
			final String type7 = "2006";
			final String type8 = "2007";
			final String type9 = "2008";
			final String type10 = "2009";
			final String type11 = "2010";
			final String type12 = "2011";
			final String type13 = "2012";
			
			final DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			
			dataset.addValue(7.0, series1, type1);
	        dataset.addValue(2.0, series1, type2);
	        dataset.addValue(4.0, series1, type3);
	        dataset.addValue(2.0, series1, type4);
	        dataset.addValue(0.0, series1, type5);
	        dataset.addValue(159.0, series1, type6);
	        dataset.addValue(129.0, series1, type7);
	        dataset.addValue(171.0, series1, type8);
	        dataset.addValue(8.0, series1, type9);
	        dataset.addValue(0.0, series1, type10);
	        dataset.addValue(0.0, series1, type11);
	        dataset.addValue(208.0, series1, type12);
	        dataset.addValue(8.0, series1, type13);
	        
	        dataset.addValue(1.0, series2, type1);
	        dataset.addValue(32.0, series2, type2);
	        dataset.addValue(5.0, series2, type3);
	        dataset.addValue(0.0, series2, type4);
	        dataset.addValue(216.0, series2, type5);
	        dataset.addValue(631.0, series2, type6);
	        dataset.addValue(1519.0, series2, type7);
	        dataset.addValue(2075.0, series2, type8);
	        dataset.addValue(1000.0, series2, type9);
	        dataset.addValue(3672.0, series2, type10);
	        dataset.addValue(828.0, series2, type11);
	        dataset.addValue(0.0, series2, type12);
	        dataset.addValue(3.0, series2, type13);
	        
			final JFreeChart chart = ChartFactory.createLineChart(
					"Investment/Project Financing", // chart title
					"Year", // domain axis label
					"Million", // range axis label
					dataset, // data
					PlotOrientation.VERTICAL, // orientation
					true, // include legend
					true, // tooltips
					false // urls
					);
			
			chart.setBackgroundPaint(Color.white);

	        final CategoryPlot plot = (CategoryPlot) chart.getPlot();
	        plot.setNoDataMessage("No data to display");
	        plot.setBackgroundPaint(Color.white);
	        plot.setRangeGridlinePaint(Color.black);

	        // customise the range axis...
	        final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	        rangeAxis.setAutoRangeIncludesZero(true);
	        
	        final LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
//	        renderer.setDrawShapes(true);

	        renderer.setSeriesStroke(
	            0, new BasicStroke(
	                2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
	                1.0f, new float[] {10.0f, 6.0f}, 0.0f
	            )
	        );
	        renderer.setSeriesStroke(
	            1, new BasicStroke(
	                2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
	                1.0f, new float[] {6.0f, 6.0f}, 0.0f
	            )
	        );
	        renderer.setSeriesStroke(
	            2, new BasicStroke(
	                2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
	                1.0f, new float[] {2.0f, 6.0f}, 0.0f
	            )
	        );
	        
	        if (chart != null) {
				final ChartRenderingInfo info = new ChartRenderingInfo(
						new StandardEntityCollection());
				response.setContentType("image/png");
				OutputStream out = response.getOutputStream();

				ChartUtilities.writeChartAsPNG(out, chart, width,
						height, info);
			}
			
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}

	}

}
