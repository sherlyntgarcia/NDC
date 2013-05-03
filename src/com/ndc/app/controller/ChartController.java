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
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import org.jfree.chart.labels.CategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardCategoryToolTipGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.DialShape;
import org.jfree.chart.plot.MeterInterval;
import org.jfree.chart.plot.MeterPlot;
import org.jfree.chart.plot.PieLabelLinkStyle;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
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
import com.ndc.app.model.StatusAssets;
import com.ndc.app.service.ChartService;
import com.ndc.app.util.LoggerUtil;

@Controller
@RequestMapping(value = "/visualization")
public class ChartController {

	@Autowired
	@Qualifier("chartService")
	private ChartService chartService;

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

			Integer latestYear = chartService
					.getLatestYearOfData(BalanceSheet.class);

			// logic
			BalanceSheet balanceSheetLatestYear = chartService
					.getBalanceSheetByYear(latestYear - 2);

			if (balanceSheetLatestYear != null) {
				categoryDataset.setValue(
						balanceSheetLatestYear.getTotalAssets(),
						balanceSheetLatestYear.getYear(), "TOTAL ASSETS");
				categoryDataset.setValue(
						balanceSheetLatestYear.getTotalLiabilities(),
						balanceSheetLatestYear.getYear(), "TOTAL LIABILITIES");
				categoryDataset.setValue(
						balanceSheetLatestYear.getTotalEquity(),
						balanceSheetLatestYear.getYear(), "EQUITY");
			}

			BalanceSheet balanceSheetLatestYear2 = chartService
					.getBalanceSheetByYear(latestYear - 1);

			if (balanceSheetLatestYear2 != null) {
				categoryDataset.setValue(
						balanceSheetLatestYear2.getTotalAssets(),
						balanceSheetLatestYear2.getYear(), "TOTAL ASSETS");
				categoryDataset.setValue(
						balanceSheetLatestYear2.getTotalLiabilities(),
						balanceSheetLatestYear2.getYear(), "TOTAL LIABILITIES");
				categoryDataset.setValue(
						balanceSheetLatestYear2.getTotalEquity(),
						balanceSheetLatestYear2.getYear(), "EQUITY");
			}

			BalanceSheet balanceSheetLatestYear3 = chartService
					.getBalanceSheetByYear(latestYear);

			if (balanceSheetLatestYear3 != null) {
				categoryDataset.setValue(
						balanceSheetLatestYear3.getTotalAssets(),
						balanceSheetLatestYear3.getYear(), "TOTAL ASSETS");
				categoryDataset.setValue(
						balanceSheetLatestYear3.getTotalLiabilities(),
						balanceSheetLatestYear3.getYear(), "TOTAL LIABILITIES");
				categoryDataset.setValue(
						balanceSheetLatestYear3.getTotalEquity(),
						balanceSheetLatestYear3.getYear(), "EQUITY");
			}

			if (balanceSheetLatestYear != null || balanceSheetLatestYear2 != null || balanceSheetLatestYear3 != null) {
				
				JFreeChart chart = ChartFactory.createBarChart3D(
						"BALANCE SHEET (" + ((balanceSheetLatestYear!=null)?balanceSheetLatestYear.getYear():"NA")
								+ " - " + ((balanceSheetLatestYear3!=null)?balanceSheetLatestYear3.getYear():"NA")
								+ ")", // Title
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
			}

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

			Integer latestYear = chartService
					.getLatestYearOfData(IncomeStatement.class);

			IncomeStatement incomeStatementLatestYear = chartService
					.getIncomeStatementByYear(latestYear - 2);
			IncomeStatement incomeStatementLatestYear2 = chartService
					.getIncomeStatementByYear(latestYear - 1);
			IncomeStatement incomeStatementLatestYear3 = chartService
					.getIncomeStatementByYear(latestYear);

			if (incomeStatementLatestYear != null) {
				defaultcategorydataset.addValue(
						incomeStatementLatestYear.getOperatingIncome(),
						"Income", incomeStatementLatestYear.getYear());
				defaultcategorydataset.addValue(
						incomeStatementLatestYear.getDividend(), "Dividend",
						incomeStatementLatestYear.getYear());
			}

			if (incomeStatementLatestYear2 != null) {
				defaultcategorydataset.addValue(
						incomeStatementLatestYear2.getOperatingIncome(),
						"Income", incomeStatementLatestYear2.getYear());
				defaultcategorydataset.addValue(
						incomeStatementLatestYear2.getDividend(), "Dividend",
						incomeStatementLatestYear2.getYear());
			}

			if (incomeStatementLatestYear3 != null) {
				defaultcategorydataset.addValue(
						incomeStatementLatestYear3.getOperatingIncome(),
						"Income", incomeStatementLatestYear3.getYear());
				defaultcategorydataset.addValue(
						incomeStatementLatestYear3.getDividend(), "Dividend",
						incomeStatementLatestYear3.getYear());
			}

			if (incomeStatementLatestYear != null || incomeStatementLatestYear2 != null || incomeStatementLatestYear3 != null) {

				JFreeChart chart = ChartFactory.createStackedAreaChart(
						"INCOME STATEMENT ("
								+ ((incomeStatementLatestYear!=null)?incomeStatementLatestYear.getYear():"NA") + " - "
								+ ((incomeStatementLatestYear3!=null)?incomeStatementLatestYear3.getYear():"NA") + ")", // Title
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

			}

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

			Integer latestYear = chartService
					.getLatestYearOfData(BondMaturity.class);

			BondMaturity bondMaturityLatestYear = chartService
					.getBondMaturityByYear(latestYear - 2);
			BondMaturity bondMaturityLatestYear2 = chartService
					.getBondMaturityByYear(latestYear - 1);
			BondMaturity bondMaturityLatestYear3 = chartService
					.getBondMaturityByYear(latestYear);

			if (bondMaturityLatestYear != null) {
				categoryDataset.setValue(
						bondMaturityLatestYear.getAmountIssued() / 1000000,
						"Term of the Bond", bondMaturityLatestYear.getYear());
			}

			if (bondMaturityLatestYear2 != null) {
				categoryDataset.setValue(
						bondMaturityLatestYear2.getAmountIssued() / 1000000,
						"Term of the Bond", bondMaturityLatestYear2.getYear());
			}

			if (bondMaturityLatestYear3 != null) {
				categoryDataset.setValue(
						bondMaturityLatestYear3.getAmountIssued() / 1000000,
						"Term of the Bond", bondMaturityLatestYear3.getYear());
			}

			if (bondMaturityLatestYear != null) {
				categoryDataset.setValue(
						bondMaturityLatestYear.getBondPayment() / 1000000,
						"Bond Payment", bondMaturityLatestYear.getYear());
			}

			if (bondMaturityLatestYear2 != null) {
				categoryDataset.setValue(
						bondMaturityLatestYear2.getBondPayment() / 1000000,
						"Bond Payment", bondMaturityLatestYear2.getYear());
			}

			if (bondMaturityLatestYear3 != null) {
				categoryDataset.setValue(
						bondMaturityLatestYear3.getBondPayment() / 1000000,
						"Bond Payment", bondMaturityLatestYear3.getYear());
			}

			if (bondMaturityLatestYear != null || bondMaturityLatestYear2 != null || bondMaturityLatestYear3 != null) {

				JFreeChart chart = ChartFactory.createBarChart("Bond Maturity", // Title
						"Years", // X-Axis label
						"Issuance (Billions)",// Y-Axis label
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

			}

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

			// get the latest 3 years.
			Integer latestYear = chartService
					.getLatestYearOfData(BondsIssued.class);

			BondsIssued bondsIssuedLatestYear = chartService
					.getBondsIssuedByYear(latestYear);
			BondsIssued bondsIssuedLatestYear2 = chartService
					.getBondsIssuedByYear(latestYear - 1);
			BondsIssued bondsIssuedLatestYear3 = chartService
					.getBondsIssuedByYear(latestYear - 2);
			
			if (bondsIssuedLatestYear3 != null) {
				defaultcategorydataset.addValue(
						bondsIssuedLatestYear3.getAmount() / 1000000, "S1",
						bondsIssuedLatestYear3.getYear());
			}
			
			if (bondsIssuedLatestYear2 != null) {
				defaultcategorydataset.addValue(
						bondsIssuedLatestYear2.getAmount() / 1000000, "S1",
						bondsIssuedLatestYear2.getYear());
			}

			if (bondsIssuedLatestYear != null) {
				defaultcategorydataset.addValue(
						bondsIssuedLatestYear.getAmount() / 1000000, "S1",
						bondsIssuedLatestYear.getYear());
			}

			

			

			if (bondsIssuedLatestYear != null || bondsIssuedLatestYear2 != null
					|| bondsIssuedLatestYear3 != null) {

				JFreeChart chart = ChartFactory.createStackedBarChart3D(
						"Bonds Issued", // chart title
						"Issuance", // domain axis label
						"Millions", // range axis label
						defaultcategorydataset, // data
						PlotOrientation.VERTICAL, // orientation
						false, // include legend
						true, // tooltips
						false // urls
						);

				Paint apaint[] = createPaint();
				CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
				categoryplot.setBackgroundPaint(Color.WHITE);
				categoryplot.setRangeGridlinePaint(Color.BLACK);
				categoryplot.setRangeGridlineStroke(new BasicStroke(0.5f,
						BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
				CustomCylinderRenderer customcylinderrenderer = new CustomCylinderRenderer(
						apaint);
				customcylinderrenderer
						.setGradientPaintTransformer(new StandardGradientPaintTransformer(
								GradientPaintTransformType.CENTER_HORIZONTAL));
				customcylinderrenderer.setBaseOutlinePaint(Color.gray);
				customcylinderrenderer.setBaseOutlineStroke(new BasicStroke(
						0.3F));
				customcylinderrenderer
						.setBaseToolTipGenerator(new StandardCategoryToolTipGenerator());

				categoryplot.setRenderer(customcylinderrenderer);
				categoryplot.setNoDataMessage("No data to display");

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR BONDS ISSUED");
		}

	}

	private static Paint[] createPaint() {

		Color DARK_RED = Color.decode("#151B8D");

		Paint apaint[] = new Paint[5];
		apaint[0] = new GradientPaint(0.0F, 0.0F, DARK_RED, 0.0F, 0.0F,
				Color.BLUE);
		apaint[1] = new GradientPaint(0.0F, 0.0F, DARK_RED, 0.0F, 0.0F,
				Color.BLUE);
		apaint[2] = new GradientPaint(0.0F, 0.0F, DARK_RED, 0.0F, 0.0F,
				Color.BLUE);
		apaint[3] = new GradientPaint(0.0F, 0.0F, DARK_RED, 0.0F, 0.0F,
				Color.BLUE);
		apaint[4] = new GradientPaint(0.0F, 0.0F, DARK_RED, 0.0F, 0.0F,
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

			if (economicImpact != null) {

				categoryDataset.setValue(economicImpact.getRehabilitated(),
						"S1", "Rehabilitated irrigation system");
				categoryDataset.setValue(economicImpact.getRestored(), "S1",
						"Restored irrigable areas");

				JFreeChart chart = ChartFactory.createBarChart(
						"Economic Impact", // Title
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

			}

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

			Integer latestYear = chartService
					.getLatestYearOfData(PrincipalCouponPayments.class);

			PrincipalCouponPayments couponPaymentsLatestYear = chartService
					.getPrincipalCouponPaymentsByYear(latestYear - 2);
			PrincipalCouponPayments couponPaymentsLatestYear2 = chartService
					.getPrincipalCouponPaymentsByYear(latestYear - 1);
			PrincipalCouponPayments couponPaymentsLatestYear3 = chartService
					.getPrincipalCouponPaymentsByYear(latestYear);

			if (couponPaymentsLatestYear != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear.getBondIssued(),
						"Bond Issued", couponPaymentsLatestYear.getYear());
			}

			if (couponPaymentsLatestYear2 != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear2.getBondIssued(),
						"Bond Issued", couponPaymentsLatestYear2.getYear());
			}

			if (couponPaymentsLatestYear3 != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear3.getBondIssued(),
						"Bond Issued", couponPaymentsLatestYear3.getYear());
			}

			if (couponPaymentsLatestYear != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear.getBondPayment(),
						"Bond Payment", couponPaymentsLatestYear.getYear());
			}

			if (couponPaymentsLatestYear2 != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear2.getBondPayment(),
						"Bond Payment", couponPaymentsLatestYear2.getYear());
			}

			if (couponPaymentsLatestYear3 != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear3.getBondPayment(),
						"Bond Payment", couponPaymentsLatestYear3.getYear());
			}

			if (couponPaymentsLatestYear != null) {
				categoryDataset.setValue(couponPaymentsLatestYear.getCoupon(),
						"Coupon", couponPaymentsLatestYear.getYear());
			}

			if (couponPaymentsLatestYear2 != null) {
				categoryDataset.setValue(couponPaymentsLatestYear2.getCoupon(),
						"Coupon", couponPaymentsLatestYear2.getYear());
			}

			if (couponPaymentsLatestYear3 != null) {
				categoryDataset.setValue(couponPaymentsLatestYear3.getCoupon(),
						"Coupon", couponPaymentsLatestYear3.getYear());
			}

			if (couponPaymentsLatestYear != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear.getCouponPayment(),
						"Coupon Payment", couponPaymentsLatestYear.getYear());
			}

			if (couponPaymentsLatestYear2 != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear2.getCouponPayment(),
						"Coupon Payment", couponPaymentsLatestYear2.getYear());
			}

			if (couponPaymentsLatestYear3 != null) {
				categoryDataset.setValue(
						couponPaymentsLatestYear3.getCouponPayment(),
						"Coupon Payment", couponPaymentsLatestYear3.getYear());
			}

			if (couponPaymentsLatestYear != null
					|| couponPaymentsLatestYear2 != null
					|| couponPaymentsLatestYear3 != null) {

				JFreeChart chart = ChartFactory.createBarChart(
						"Principal and Coupon Payments", // Title
						"Issuance", // X-Axis label
						"Millions",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.RIGHT);

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

			}

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

			if (niaLoanCollection != null) {

				result.addValue(niaLoanCollection.getPrincipalCollection(),
						"Collection", "Principal");
				result.addValue(niaLoanCollection.getInterestCollection(),
						"Collection", "Interest");
				result.addValue(niaLoanCollection.getPrincipalLoanReceivable(),
						"Loan Receivable", "Principal");
				result.addValue(niaLoanCollection.getInterestLoanReceivable(),
						"Loan Receivable", "Interest");

				JFreeChart chart = ChartFactory.createStackedBarChart3D(
						"Collection of NIA Loan", // Title
						"Collection of NIA Loan", // X-Axis label
						"in millions",// Y-Axis label
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

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING BAR CHART FOR NIA Loan Collection");
		}

	}

	@RequestMapping(value = "/loanproceedsallocationpiechart/{width}/{height}")
	public @ResponseBody
	void generateLoanProceedsAllocationPieChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			NiaLoanProceedsAllocation allocation = chartService
					.getLatestNiaLoanProceedsAllocation();

			if (allocation != null) {

				dataset.setValue("CAR", allocation.getCar());
				dataset.setValue("I", allocation.getRegion1());
				dataset.setValue("ARIIP", allocation.getAriip());
				dataset.setValue("II", allocation.getRegion2());
				dataset.setValue("MARIIS", allocation.getMariis());
				dataset.setValue("III", allocation.getRegion13());
				dataset.setValue("UPRIIS", allocation.getUpriis());
				dataset.setValue("IV", allocation.getRegion4());
				dataset.setValue("V", allocation.getRegion5());
				dataset.setValue("VI", allocation.getRegion6());
				dataset.setValue("VII", allocation.getRegion7());
				dataset.setValue("VIII", allocation.getRegion8());
				dataset.setValue("IX", allocation.getRegion9());
				dataset.setValue("X", allocation.getRegion10());
				dataset.setValue("XI", allocation.getRegion11());
				dataset.setValue("XII", allocation.getRegion12());
				dataset.setValue("XIII", allocation.getRegion13());
				dataset.setValue("ARMM", allocation.getArmm());
				dataset.setValue("NCR", allocation.getNcr());

				JFreeChart chart = ChartFactory.createPieChart(
						"Loan proceeds allocation (per region)", dataset, true,
						true, false);

				chart.setBorderVisible(false);

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.RIGHT);

				PiePlot piePlot = (PiePlot) chart.getPlot();
				StandardPieSectionLabelGenerator labelGenerator = new StandardPieSectionLabelGenerator(
						"{0} - {2}");
				// labelGenerator.getPercentFormat().setMaximumFractionDigits(2);
				piePlot.setLabelGenerator(labelGenerator);
				piePlot.setOutlineVisible(false);
				piePlot.setBackgroundPaint(Color.WHITE);
				// piePlot.setLegendLabelGenerator(labelGenerator);

				piePlot.setNoDataMessage("No data to display");
				piePlot.setSectionPaint(0, new Color(193, 0, 0));
				piePlot.setSectionPaint(1, new Color(255, 34, 34));
				piePlot.setSectionPaint(2, new Color(173, 31, 60));
				piePlot.setSectionPaint(3, new Color(235, 141, 160));
				piePlot.setSectionPaint(4, new Color(223, 112, 0));
				piePlot.setSectionPaint(5, new Color(225, 160, 66));
				piePlot.setSectionPaint(6, new Color(221, 243, 97));
				piePlot.setSectionPaint(7, new Color(234, 228, 19));
				piePlot.setSectionPaint(8, new Color(6, 202, 223));
				piePlot.setSectionPaint(9, new Color(102, 236, 251));
				piePlot.setSectionPaint(10, new Color(36, 90, 134));
				piePlot.setSectionPaint(11, new Color(111, 169, 217));
				piePlot.setSectionPaint(12, new Color(108, 40, 138));
				piePlot.setSectionPaint(13, new Color(180, 107, 211));
				piePlot.setSectionPaint(14, new Color(36, 134, 38));
				piePlot.setSectionPaint(15, new Color(121, 219, 123));
				piePlot.setSectionPaint(16, new Color(90, 116, 91));
				piePlot.setSectionPaint(17, new Color(169, 188, 169));
				piePlot.setSectionPaint(18, new Color(64, 0, 0));

				PiePlot plot3 = (PiePlot) chart.getPlot();
				// plot3.setForegroundAlpha(0.6f);
				// plot3.setCircular(true);
				// plot3.setSimpleLabels(true);
				plot3.setShadowXOffset(0);
				plot3.setShadowYOffset(0);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil
					.log(auth,
							"ERROR WHILE DISPLAYING PIE CHART FOR NIA LOAN PROCEEDS ALLOCATION");
		}

	}

	@RequestMapping(value = "/loanproceedsutilizationpiechart/{width}/{height}")
	public @ResponseBody
	void generateLoanProceedsUtilizationPieChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			NiaLoanProceedsUtilization utilization = chartService
					.getLatestNiaLoanProceedsUtilization();

			if (utilization != null) {

				dataset.setValue("Repair, Rehabilitation and Restoration",
						utilization.getRepairRehabRestore());
				dataset.setValue("Rehabilitation of farm-to-market roads",
						utilization.getFarmToMarketRoads());

				JFreeChart chart = ChartFactory.createPieChart(
						"Utilization of NIA Loan Proceeds", dataset, true,
						true, false);

				chart.setBorderVisible(false);

				// LegendTitle legend = chart.getLegend();
				// legend.setPosition(RectangleEdge.RIGHT);

				PiePlot piePlot = (PiePlot) chart.getPlot();
				piePlot.setOutlineVisible(false);
				piePlot.setBackgroundPaint(Color.WHITE);
				StandardPieSectionLabelGenerator labelGenerator = new StandardPieSectionLabelGenerator(
						"{2}");
				// labelGenerator.getPercentFormat().setMaximumFractionDigits(2);
				piePlot.setLabelGenerator(labelGenerator);
				// piePlot.setLegendLabelGenerator(labelGenerator);

				piePlot.setNoDataMessage("No data to display");

				PiePlot plot3 = (PiePlot) chart.getPlot();
				// plot3.setForegroundAlpha(0.6f);
				// plot3.setCircular(true);
				plot3.setSimpleLabels(true);
				plot3.setSectionPaint(0, new Color(235, 141, 160));
				plot3.setSectionPaint(1, new Color(108, 40, 138));
				plot3.setShadowXOffset(0);
				plot3.setShadowYOffset(0);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil
					.log(auth,
							"ERROR WHILE DISPLAYING PIE CHART FOR NIA LOAN PROCEEDS UTILIZATION");
		}

	}

	@RequestMapping(value = "/shareholderspiechart/{width}/{height}/{id}")
	public @ResponseBody
	void generateShareholdersPieChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			@PathVariable(value = "id") Long id,
			HttpServletResponse response) {

		try {

			List<Shareholders> shareholders = chartService.getShareholdersByProjectId(id);

			if (shareholders != null) {
				
				if(shareholders.size() != 0) {
					
					DefaultPieDataset dataset = new DefaultPieDataset();
					
					for (Shareholders sh : shareholders) {
						if (sh != null) {
							dataset.setValue(sh.getShareholders(), sh.getShares());
						}
					}
	
					JFreeChart chart = ChartFactory.createPieChart("Shareholders",
							dataset, true, true, true);
	
					chart.setBorderVisible(false);
	
					PiePlot piePlot = (PiePlot) chart.getPlot();
					StandardPieSectionLabelGenerator labelGenerator = new StandardPieSectionLabelGenerator(
							"{0} - {2}");
					labelGenerator.getPercentFormat().setMaximumFractionDigits(1);
					piePlot.setLabelGenerator(labelGenerator);
					// piePlot.setLegendLabelGenerator(labelGenerator);
	
					piePlot.setNoDataMessage("No data to display");
	
					LegendTitle legendTitle = chart.getLegend();
					legendTitle.setPosition(RectangleEdge.RIGHT);
	
					PiePlot plot3 = (PiePlot) chart.getPlot();
					// plot3.setForegroundAlpha(0.6f);
					// plot3.setCircular(true);
					plot3.setMaximumLabelWidth(0.17);
					plot3.setLabelLinkStyle(PieLabelLinkStyle.CUBIC_CURVE);
					// plot3.setLabelGap(20);
					plot3.setShadowXOffset(0);
					plot3.setShadowYOffset(0);
	
					// legend = chart.getLegend();
					// legend.setVisible(false);
					plot3.setBackgroundPaint(Color.WHITE);
					plot3.setOutlineVisible(false);
	
					if (chart != null) {
						final ChartRenderingInfo info = new ChartRenderingInfo(
								new StandardEntityCollection());
						response.setContentType("image/png");
						OutputStream out = response.getOutputStream();
	
						ChartUtilities.writeChartAsPNG(out, chart, width, height,
								info);
					}	
					
				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING STOCK AREA CHART");
		}

	}

	@RequestMapping(value = "/occupancypiechart/{width}/{height}")
	public @ResponseBody
	void generateOccupancyPieChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			Occupancy occupancy = chartService.getOccupancyChart();

			if (occupancy != null) {
				dataset.setValue("Occupied", occupancy.getOccupied());
				dataset.setValue("Vacant", occupancy.getVacant());

				JFreeChart chart = ChartFactory.createPieChart(
						"NDC & l&l Bldg. Occupancy Rate", dataset, true, true,
						true);

				chart.setBorderVisible(false);

				PiePlot piePlot = (PiePlot) chart.getPlot();
				StandardPieSectionLabelGenerator labelGenerator = new StandardPieSectionLabelGenerator(
						"{0} - {2}");
				labelGenerator.getPercentFormat().setMaximumFractionDigits(1);
				piePlot.setLabelGenerator(labelGenerator);
				// piePlot.setLegendLabelGenerator(labelGenerator);
				piePlot.setSectionPaint(0, new Color(36, 90, 134));
				piePlot.setSectionPaint(1, new Color(6, 202, 223));
				piePlot.setNoDataMessage("No data to display");

				LegendTitle legendTitle = chart.getLegend();
				legendTitle.setPosition(RectangleEdge.RIGHT);

				PiePlot plot3 = (PiePlot) chart.getPlot();
				// plot3.setForegroundAlpha(0.6f);
				// plot3.setCircular(true);
				plot3.setSimpleLabels(true);
				plot3.setShadowXOffset(0);
				plot3.setShadowYOffset(0);

				// legend = chart.getLegend();
				// legend.setVisible(false);
				plot3.setBackgroundPaint(Color.WHITE);
				plot3.setOutlineVisible(false);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING OCCUPANCY CHART");
		}

	}

	@RequestMapping(value = "/netlendingbarchart/{width}/{height}")
	public @ResponseBody
	void generateNetLendingBarChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset result = new DefaultCategoryDataset();

			Integer latestYear = chartService
					.getLatestYearOfData(NetLending.class);

			NetLending netLendingLatestYear = chartService
					.getNetLendingByYear(latestYear - 2);
			NetLending netLendingLatestYear2 = chartService
					.getNetLendingByYear(latestYear - 1);
			NetLending netLendingLatestYear3 = chartService
					.getNetLendingByYear(latestYear);

			if (netLendingLatestYear != null) {
				result.addValue(netLendingLatestYear.getBondIssued(),
						"NDC Payment (bond_percent)",
						netLendingLatestYear.getYear());
			}

			if (netLendingLatestYear2 != null) {
				result.addValue(netLendingLatestYear2.getBondIssued(),
						"NDC Payment (bond_percent)",
						netLendingLatestYear2.getYear());
			}

			if (netLendingLatestYear3 != null) {
				result.addValue(netLendingLatestYear3.getBondIssued(),
						"NDC Payment (bond_percent)",
						netLendingLatestYear3.getYear());
			}

			if (netLendingLatestYear != null) {
				result.addValue(netLendingLatestYear.getBondNetLending(),
						"NDC Payment (coupon_percent)",
						netLendingLatestYear.getYear());
			}

			if (netLendingLatestYear2 != null) {
				result.addValue(netLendingLatestYear2.getBondNetLending(),
						"NDC Payment (coupon_percent)",
						netLendingLatestYear2.getYear());
			}

			if (netLendingLatestYear3 != null) {
				result.addValue(netLendingLatestYear3.getBondNetLending(),
						"NDC Payment (coupon_percent)",
						netLendingLatestYear3.getYear());
			}

			if (netLendingLatestYear != null) {
				result.addValue(netLendingLatestYear.getCoupon(),
						"NDC Lending (bond_percent)",
						netLendingLatestYear.getYear());
			}

			if (netLendingLatestYear2 != null) {
				result.addValue(netLendingLatestYear2.getCoupon(),
						"NDC Lending (bond_percent)",
						netLendingLatestYear2.getYear());
			}

			if (netLendingLatestYear3 != null) {
				result.addValue(netLendingLatestYear3.getCoupon(),
						"NDC Lending (bond_percent)",
						netLendingLatestYear3.getYear());
			}

			if (netLendingLatestYear != null) {
				result.addValue(netLendingLatestYear.getCouponNetLending(),
						"NDC Lending (coupon_percent)",
						netLendingLatestYear.getYear());
			}

			if (netLendingLatestYear2 != null) {
				result.addValue(netLendingLatestYear2.getCouponNetLending(),
						"NDC Lending (coupon_percent)",
						netLendingLatestYear2.getYear());
			}

			if (netLendingLatestYear3 != null) {
				result.addValue(netLendingLatestYear3.getCouponNetLending(),
						"NDC Lending (coupon_percent)",
						netLendingLatestYear3.getYear());
			}

			if (netLendingLatestYear != null || netLendingLatestYear2 != null
					|| netLendingLatestYear3 != null) {

				JFreeChart chart = ChartFactory.createStackedBarChart3D(
						"Net Lending", // Title
						"", // X-Axis label
						"in millions",// Y-Axis label
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
				Paint p1 = new Color(90, 145, 154);
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

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING BAR CHART");
		}

	}

	@RequestMapping(value = "/agriagrabondspiechart/{width}/{height}")
	public @ResponseBody
	void generateAgriAgraBondsPieChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultPieDataset dataset = new DefaultPieDataset();

			Integer latestYear = chartService
					.getLatestYearOfData(AgriAgraBonds.class);

			AgriAgraBonds agriAgraBondsLatestYear = chartService
					.getAgriAgraBondsByYear(latestYear - 2);
			AgriAgraBonds agriAgraBondsLatestYear2 = chartService
					.getAgriAgraBondsByYear(latestYear - 1);
			AgriAgraBonds agriAgraBondsLatestYear3 = chartService
					.getAgriAgraBondsByYear(latestYear);

			if (agriAgraBondsLatestYear != null) {
				dataset.setValue(agriAgraBondsLatestYear.getYear(),
						agriAgraBondsLatestYear.getAmount());
			}

			if (agriAgraBondsLatestYear2 != null) {
				dataset.setValue(agriAgraBondsLatestYear2.getYear(),
						agriAgraBondsLatestYear2.getAmount());
			}

			if (agriAgraBondsLatestYear3 != null) {
				dataset.setValue(agriAgraBondsLatestYear3.getYear(),
						agriAgraBondsLatestYear3.getAmount());
			}

			Double totalAgriAgraBonds = chartService.getLatestAgriAgraBonds();
			Double unutilized = null;

			if (agriAgraBondsLatestYear != null || agriAgraBondsLatestYear2 != null || agriAgraBondsLatestYear3 != null) {
				
				Double l1 = (agriAgraBondsLatestYear!=null)?agriAgraBondsLatestYear.getAmount():0;
				Double l2 = (agriAgraBondsLatestYear2!=null)?agriAgraBondsLatestYear2.getAmount():0;
				Double l3 = (agriAgraBondsLatestYear3!=null)?agriAgraBondsLatestYear3.getAmount():0;
				
				if (totalAgriAgraBonds != null) {
					unutilized = totalAgriAgraBonds - (l1 + l2 + l3);
				}

				if (unutilized != null) {
					dataset.setValue("Unutilized", unutilized);
				}

				JFreeChart chart = ChartFactory.createPieChart(
						"Balance of NDC Agri-Agra Bonds", dataset, true, true,
						true);


				PiePlot piePlot = (PiePlot) chart.getPlot();
				StandardPieSectionLabelGenerator labelGenerator = new StandardPieSectionLabelGenerator(
						"{0} = {1} ({2})");
				labelGenerator.getPercentFormat().setMaximumFractionDigits(2);
				piePlot.setLabelGenerator(labelGenerator);
				piePlot.setLegendLabelGenerator(labelGenerator);
				piePlot.setOutlineVisible(false);
				piePlot.setBackgroundPaint(Color.WHITE);
				piePlot.setNoDataMessage("No data to display");

				PiePlot plot3 = (PiePlot) chart.getPlot();
				// plot3.setForegroundAlpha(0.6f);
				// plot3.setCircular(true);
				// plot3.setSimpleLabels(true);
				plot3.setShadowXOffset(0);
				plot3.setShadowYOffset(0);

				LegendTitle legend = chart.getLegend();
				legend.setVisible(false);

				if (chart != null) {
					final ChartRenderingInfo info = new ChartRenderingInfo(
							new StandardEntityCollection());
					response.setContentType("image/png");
					OutputStream out = response.getOutputStream();

					ChartUtilities.writeChartAsPNG(out, chart, width, height,
							info);
				}

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth,
					"ERROR WHILE DISPLAYING PIE CHART FOR AGRI-AGRA BONDS");
		}

	}

	@RequestMapping(value = "/maintenancecostlinechart/{width}/{height}")
	public @ResponseBody
	void generateMaintenanceCostLineChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset dataset = new DefaultCategoryDataset();

			Integer latestYear = chartService
					.getLatestYearOfData(MaintenanceCost.class);

			MaintenanceCost maintenanceCostLatestYear = chartService
					.getMaintenaneCostByYear(latestYear - 2);
			MaintenanceCost maintenanceCostLatestYear2 = chartService
					.getMaintenaneCostByYear(latestYear - 1);
			MaintenanceCost maintenanceCostLatestYear3 = chartService
					.getMaintenaneCostByYear(latestYear);

			if (maintenanceCostLatestYear != null) {
				dataset.addValue(maintenanceCostLatestYear.getMarketValue(),
						"Market Value", maintenanceCostLatestYear.getYear());
			}

			if (maintenanceCostLatestYear2 != null) {
				dataset.addValue(maintenanceCostLatestYear2.getMarketValue(),
						"Market Value", maintenanceCostLatestYear2.getYear());
			}

			if (maintenanceCostLatestYear3 != null) {
				dataset.addValue(maintenanceCostLatestYear3.getMarketValue(),
						"Market Value", maintenanceCostLatestYear3.getYear());
			}

			if (maintenanceCostLatestYear != null) {
				dataset.addValue(maintenanceCostLatestYear.getRpt(), "RPT",
						maintenanceCostLatestYear.getYear());
			}

			if (maintenanceCostLatestYear2 != null) {
				dataset.addValue(maintenanceCostLatestYear2.getRpt(), "RPT",
						maintenanceCostLatestYear2.getYear());
			}

			if (maintenanceCostLatestYear3 != null) {
				dataset.addValue(maintenanceCostLatestYear3.getRpt(), "RPT",
						maintenanceCostLatestYear3.getYear());
			}

			if (maintenanceCostLatestYear != null) {
				dataset.addValue(maintenanceCostLatestYear.getSecurity(),
						"Security", maintenanceCostLatestYear.getYear());
			}

			if (maintenanceCostLatestYear2 != null) {
				dataset.addValue(maintenanceCostLatestYear2.getSecurity(),
						"Security", maintenanceCostLatestYear2.getYear());
			}

			if (maintenanceCostLatestYear3 != null) {
				dataset.addValue(maintenanceCostLatestYear3.getSecurity(),
						"Security", maintenanceCostLatestYear3.getYear());
			}

			if (maintenanceCostLatestYear != null
					|| maintenanceCostLatestYear2 != null
					|| maintenanceCostLatestYear3 != null) {

				JFreeChart chart = ChartFactory.createLineChart(
						"Maintenance Cost", // chart
											// title
						"", // domain(x-axis) axis label
						"in millions", // range(y-axis) axis label
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

			}

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

			Integer latestYear = chartService
					.getLatestYearOfData(SourcesFunds.class);

			SourcesFunds sourcesFundsLatestYear = chartService
					.getSourcesFundsByYear(latestYear - 2);
			SourcesFunds sourcesFundsLatestYear2 = chartService
					.getSourcesFundsByYear(latestYear - 1);
			SourcesFunds sourcesFundsLatestYear3 = chartService
					.getSourcesFundsByYear(latestYear);

			if (sourcesFundsLatestYear != null) {
				categoryDataset.setValue(
						sourcesFundsLatestYear.getProjectedSourcesOfFunds(),
						"Projected Sources of Funds",
						sourcesFundsLatestYear.getYear());
			}

			if (sourcesFundsLatestYear2 != null) {
				categoryDataset.setValue(
						sourcesFundsLatestYear2.getProjectedSourcesOfFunds(),
						"Projected Sources of Funds",
						sourcesFundsLatestYear2.getYear());
			}

			if (sourcesFundsLatestYear3 != null) {
				categoryDataset.setValue(
						sourcesFundsLatestYear3.getProjectedSourcesOfFunds(),
						"Projected Sources of Funds",
						sourcesFundsLatestYear3.getYear());
			}

			if (sourcesFundsLatestYear != null) {
				categoryDataset.setValue(
						sourcesFundsLatestYear.getProjectedUsesOfFunds(),
						"Projected Uses of Funds",
						sourcesFundsLatestYear.getYear());
			}

			if (sourcesFundsLatestYear2 != null) {
				categoryDataset.setValue(
						sourcesFundsLatestYear2.getProjectedUsesOfFunds(),
						"Projected Uses of Funds",
						sourcesFundsLatestYear2.getYear());
			}

			if (sourcesFundsLatestYear3 != null) {
				categoryDataset.setValue(
						sourcesFundsLatestYear3.getProjectedUsesOfFunds(),
						"Projected Uses of Funds",
						sourcesFundsLatestYear3.getYear());
			}

			if (sourcesFundsLatestYear != null
					|| sourcesFundsLatestYear2 != null
					|| sourcesFundsLatestYear3 != null) {

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

			}

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

			StatusAssets statusAssets = chartService.getLatestStatusAssets();

			if (statusAssets != null) {

				categoryDataset.setValue(statusAssets.getUnderLease(),
						"Under Lease", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getForSaleLease(),
						"For Sale/Lease", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getNegotiatedSale(),
						"For Negotiated Sale", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getForCmp(), "For CMP",
						statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getWithCourtCase(),
						"With Court Case", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getForRelocationSurvey(),
						"For Relocation Survey", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getForTitling(),
						"For Titling", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getIssuanceOfSecondOdct(),
						"Issuance of Second ODCT", statusAssets.getYear());
				categoryDataset.setValue(statusAssets.getWithJv(), "With JV",
						statusAssets.getYear());
				categoryDataset.setValue(
						statusAssets.getForProjectDevelopment(),
						"For Project Development", statusAssets.getYear());

				JFreeChart chart = ChartFactory.createBarChart(
						"Status of Assets", // Title
						"", // X-Axis label
						"no. of properties",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				LegendTitle legend = chart.getLegend();
				legend.setPosition(RectangleEdge.RIGHT);

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

			}

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

			DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();

			Integer latestYear = chartService
					.getLatestYearOfData(SpgIncomeStatement.class);

			SpgIncomeStatement spgIncomeStatementLatestYear = chartService
					.getSpgIncomeStatementByYear(latestYear - 2, id);
			SpgIncomeStatement spgIncomeStatementLatestYear2 = chartService
					.getSpgIncomeStatementByYear(latestYear - 1, id);
			SpgIncomeStatement spgIncomeStatementLatestYear3 = chartService
					.getSpgIncomeStatementByYear(latestYear, id);

			// Enrollment in Bachelors level
			// dataset1.setValue(617135 / 1000, "Revenue", "2008");
			if (spgIncomeStatementLatestYear != null) {
				dataset1.setValue(spgIncomeStatementLatestYear.getRevenue(),
						"Revenue", spgIncomeStatementLatestYear.getYear());
			}

			if (spgIncomeStatementLatestYear2 != null) {
				dataset1.setValue(spgIncomeStatementLatestYear2.getRevenue(),
						"Revenue", spgIncomeStatementLatestYear2.getYear());
			}

			if (spgIncomeStatementLatestYear3 != null) {
				dataset1.setValue(spgIncomeStatementLatestYear3.getRevenue(),
						"Revenue", spgIncomeStatementLatestYear3.getYear());
			}

			// Enrollment in Masters level
			// dataset1.setValue(257701 / 1000, "Net Income", "2008");
			if (spgIncomeStatementLatestYear != null) {
				dataset1.setValue(spgIncomeStatementLatestYear.getNetIncome(),
						"Net Income", spgIncomeStatementLatestYear.getYear());
			}

			if (spgIncomeStatementLatestYear2 != null) {
				dataset1.setValue(spgIncomeStatementLatestYear2.getNetIncome(),
						"Net Income", spgIncomeStatementLatestYear2.getYear());
			}

			if (spgIncomeStatementLatestYear3 != null) {
				dataset1.setValue(spgIncomeStatementLatestYear3.getNetIncome(),
						"Net Income", spgIncomeStatementLatestYear3.getYear());
			}

			// dataset for line graph
			final DefaultCategoryDataset dataset2 = new DefaultCategoryDataset();

			if (spgIncomeStatementLatestYear != null) {
				dataset2.addValue(
						spgIncomeStatementLatestYear.getProfitMargin(),
						"Profit Margin", spgIncomeStatementLatestYear.getYear());
			}

			if (spgIncomeStatementLatestYear2 != null) {
				dataset2.addValue(
						spgIncomeStatementLatestYear2.getProfitMargin(),
						"Profit Margin",
						spgIncomeStatementLatestYear2.getYear());
			}

			if (spgIncomeStatementLatestYear3 != null) {
				dataset2.addValue(
						spgIncomeStatementLatestYear3.getProfitMargin(),
						"Profit Margin",
						spgIncomeStatementLatestYear3.getYear());
			}

		
				// create the chart...
				JFreeChart chart = ChartFactory.createBarChart(
						"Income Statement", // Title
						"", // X-Axis label
						"RM Millions",// Y-Axis label
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

				// last part edited
				NumberAxis rangeAxis2 = (NumberAxis) plot.getRangeAxis(1);
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
				renderer2
						.setToolTipGenerator(new StandardCategoryToolTipGenerator());

				renderer2.setSeriesPaint(0, Color.BLACK);

				BarRenderer renderer3 = (BarRenderer) plot.getRenderer();
				renderer3.setSeriesPaint(0, new Color(46, 106, 19));
				renderer3.setSeriesPaint(1, new Color(126, 224, 84));

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

			Integer latestYear = chartService
					.getLatestYearOfData(SpgBalanceSheet.class);

			SpgBalanceSheet spgBalanceSheetLatestYear = chartService
					.getSpgBalanceSheetByYear(latestYear - 2, id);
			SpgBalanceSheet spgBalanceSheetLatestYear2 = chartService
					.getSpgBalanceSheetByYear(latestYear - 1, id);
			SpgBalanceSheet spgBalanceSheetLatestYear3 = chartService
					.getSpgBalanceSheetByYear(latestYear, id);

			// Enrollment in Bachelors level
			// dataset1.setValue(617135 / 1000, "Revenue", "2008");
			if (spgBalanceSheetLatestYear != null) {
				dataset1.setValue(spgBalanceSheetLatestYear.getTotalAssets(),
						"Total Assets", spgBalanceSheetLatestYear.getYear());
			}

			if (spgBalanceSheetLatestYear2 != null) {
				dataset1.setValue(spgBalanceSheetLatestYear2.getTotalAssets(),
						"Total Assets", spgBalanceSheetLatestYear2.getYear());
			}

			if (spgBalanceSheetLatestYear3 != null) {
				dataset1.setValue(spgBalanceSheetLatestYear3.getTotalAssets(),
						"Total Assets", spgBalanceSheetLatestYear3.getYear());
			}

			// Enrollment in Masters level
			// dataset1.setValue(257701 / 1000, "Net Income", "2008");
			if (spgBalanceSheetLatestYear != null) {
				dataset1.setValue(
						spgBalanceSheetLatestYear.getTotalLiabilities(),
						"Total Liabilities",
						spgBalanceSheetLatestYear.getYear());
			}

			if (spgBalanceSheetLatestYear2 != null) {
				dataset1.setValue(
						spgBalanceSheetLatestYear2.getTotalLiabilities(),
						"Total Liabilities",
						spgBalanceSheetLatestYear2.getYear());
			}

			if (spgBalanceSheetLatestYear3 != null) {
				dataset1.setValue(
						spgBalanceSheetLatestYear3.getTotalLiabilities(),
						"Total Liabilities",
						spgBalanceSheetLatestYear3.getYear());
			}

			// dataset for line graph
			final DefaultCategoryDataset dataset2 = new DefaultCategoryDataset();

			if (spgBalanceSheetLatestYear != null) {
				dataset2.addValue(spgBalanceSheetLatestYear.getDebtToAssets(),
						"Debt to Assets", spgBalanceSheetLatestYear.getYear());
			}

			if (spgBalanceSheetLatestYear2 != null) {
				dataset2.addValue(spgBalanceSheetLatestYear2.getDebtToAssets(),
						"Debt to Assets", spgBalanceSheetLatestYear2.getYear());
			}

			if (spgBalanceSheetLatestYear3 != null) {
				dataset2.addValue(spgBalanceSheetLatestYear3.getDebtToAssets(),
						"Debt to Assets", spgBalanceSheetLatestYear3.getYear());
			}


				// create the chart...
				JFreeChart chart = ChartFactory.createBarChart("Balance Sheet", // Title
						"", // X-Axis label
						"RM Millions",// Y-Axis label
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

	@RequestMapping(value = "/spgcashflowlinechart/{width}/{height}/{id}")
	public @ResponseBody
	void generateSpgCashFlowLineChart(
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			@PathVariable(value = "id") Long id,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset dataset = new DefaultCategoryDataset();

			Integer latestYear = chartService
					.getLatestYearOfData(SpgCashFlow.class);

			SpgCashFlow spgCashFlowLatestYear = chartService
					.getSpgCashFlowByYear(latestYear - 2, id);
			SpgCashFlow spgCashFlowLatestYear2 = chartService
					.getSpgCashFlowByYear(latestYear - 1, id);
			SpgCashFlow spgCashFlowLatestYear3 = chartService
					.getSpgCashFlowByYear(latestYear, id);

			if (spgCashFlowLatestYear != null) {
				dataset.addValue(
						spgCashFlowLatestYear.getOperatingActivities(),
						"Operating Activities", spgCashFlowLatestYear.getYear());
			}

			if (spgCashFlowLatestYear2 != null) {
				dataset.addValue(
						spgCashFlowLatestYear2.getOperatingActivities(),
						"Operating Activities",
						spgCashFlowLatestYear2.getYear());
			}

			if (spgCashFlowLatestYear3 != null) {
				dataset.addValue(
						spgCashFlowLatestYear3.getOperatingActivities(),
						"Operating Activities",
						spgCashFlowLatestYear3.getYear());
			}

			if (spgCashFlowLatestYear != null) {
				dataset.addValue(
						spgCashFlowLatestYear.getInvestingActivities(),
						"Investing Activities", spgCashFlowLatestYear.getYear());
			}

			if (spgCashFlowLatestYear2 != null) {
				dataset.addValue(
						spgCashFlowLatestYear2.getInvestingActivities(),
						"Investing Activities",
						spgCashFlowLatestYear2.getYear());
			}

			if (spgCashFlowLatestYear3 != null) {
				dataset.addValue(
						spgCashFlowLatestYear3.getInvestingActivities(),
						"Investing Activities",
						spgCashFlowLatestYear3.getYear());
			}

			if (spgCashFlowLatestYear != null) {
				dataset.addValue(
						spgCashFlowLatestYear.getFinancingActivities(),
						"Financing Activities", spgCashFlowLatestYear.getYear());
			}

			if (spgCashFlowLatestYear2 != null) {
				dataset.addValue(
						spgCashFlowLatestYear2.getFinancingActivities(),
						"Financing Activities",
						spgCashFlowLatestYear2.getYear());
			}

			if (spgCashFlowLatestYear3 != null) {
				dataset.addValue(
						spgCashFlowLatestYear3.getFinancingActivities(),
						"Financing Activities",
						spgCashFlowLatestYear3.getYear());
			}


				JFreeChart chart = ChartFactory.createLineChart("Cash Flow", // chart
																				// title
						"", // domain(x-axis) axis label
						"RM Millions", // range(y-axis) axis label
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

			if (projectedActualIncome != null && projectedActualIncome2 != null) {

				Double newData = (projectedActualIncome.getactualIncome().doubleValue() / (projectedActualIncome2
						.getProjectedIncome().doubleValue()) * 100);

				DefaultValueDataset data = new DefaultValueDataset();

				MeterPlot plot = new MeterPlot(data);
				System.out.println("New Data: " + newData);
				
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(projectedActualIncome.getDateUpdated());
				
				int month = calendar.get(Calendar.MONTH);
				String monthString = "";
				
				if(month==0) monthString="Jan";
				if(month==1) monthString="Feb";
				if(month==2) monthString="Mar";
				if(month==3) monthString="Apr";
				if(month==4) monthString="May";
				if(month==5) monthString="Jun";
				if(month==6) monthString="Jul";
				if(month==7) monthString="Aug";
				if(month==8) monthString="Sep";
				if(month==9) monthString="Oct";
				if(month==10) monthString="Nov";
				if(month==11) monthString="Dec";
				
				plot.setUnits("% of " + monthString + " " +  calendar.get(Calendar.YEAR));

				// plot.addInterval(new MeterInterval("Good", new Range(0,
				// 30),Color.lightGray, new BasicStroke(2.0f),new Color(0, 255,
				// 0,
				// 64)));
				// plot.addInterval(new MeterInterval("Warning", new Range(30,
				// 50),Color.lightGray, new BasicStroke(2.0f), new Color(255,
				// 255,
				// 0,64)));

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

				/*
				 * float h = displayFrame.getHeight(); float w =
				 * displayFrame.getWidth();
				 */
				// GradientPaint gradientPaint = new GradientPaint(0.0F, 10.0F,
				// Color.WHITE, h, w, Color.green.darker());
				// plot.setBackgroundPaint(gradientPaint);
				/*
				 * chart.setBackgroundPaint(new GradientPaint(0, 0, new
				 * Color(102, 0, 102), 0, h, Color.black));
				 * chart.getTitle().setPaint(Color.white);
				 */
				plot.setValueFont(new Font("Dialog", Font.BOLD, 14));

				JFreeChart chart = new JFreeChart(
						"INCOME- ACTUAL VS PROJECTION CHART",
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

			}

		} catch (Exception e) {
			e.printStackTrace(System.out);

			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			loggerUtil.log(auth, "ERROR WHILE DISPLAYING STOCK AREA CHART");
		}

	}

	@RequestMapping(value = "/actualincomeexpensesubchart/{id}/{width}/{height}/{title}")
	public @ResponseBody
	void generateActualIncomeExpenseSubChart(
			@PathVariable(value = "id") Long id,
			@PathVariable(value = "width") Integer width,
			@PathVariable(value = "height") Integer height,
			@PathVariable(value = "title") String title,
			HttpServletResponse response) {

		try {

			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

			ActualIncomeExpense expense = chartService
					.getActualIncomeExpenseById(id);

			if (expense != null) {
				categoryDataset.setValue(expense.getActualAdvertising(),
						"Actual", "Advertising");
				categoryDataset.setValue(expense.getActualAthletics(),
						"Actual", "Athletics");
				categoryDataset.setValue(expense.getActualAuditing(), "Actual",
						"Auditing");
				categoryDataset.setValue(expense.getActualConsultancy(),
						"Actual", "Consultancy");

				// Enrollment in Masters level
				categoryDataset.setValue(expense.getBudgetAdvertising(),
						"Budget", "Advertising");
				categoryDataset.setValue(expense.getBudgetAthletics(),
						"Budget", "Athletics");
				categoryDataset.setValue(expense.getBudgetAuditing(), "Budget",
						"Auditing");
				categoryDataset.setValue(expense.getBudgetConsultancy(),
						"Budget", "Consultancy");

				JFreeChart chart = ChartFactory.createBarChart3D(title, // Title
						"", // X-Axis label
						"",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);

				CategoryPlot plot = chart.getCategoryPlot();
				CategoryAxis domainAxis = plot.getDomainAxis();
				domainAxis.setTickLabelFont(new Font("sansSerif", Font.PLAIN,
						12));
				// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI,
				// 6.0));

				BarRenderer renderer = (BarRenderer) plot.getRenderer();
				renderer.setItemMargin(0.0);
				renderer.setSeriesPaint(0, new Color(33, 188, 72));
				renderer.setSeriesPaint(1, new Color(141, 235, 165));
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

			}

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

			if (actualIncomeExpense != null) {

				if (actualIncomeExpense.size() != 0) {
					for (ActualIncomeExpense expense : actualIncomeExpense) {
						if (expense != null) {

							String newDate = "";
							if (expense.getMonth() == AppHelper.JANUARY)
								newDate = "January";
							else if (expense.getMonth() == AppHelper.FEBRUARY)
								newDate = "February";
							else if (expense.getMonth() == AppHelper.MARCH)
								newDate = "March";
							else if (expense.getMonth() == AppHelper.APRIL)
								newDate = "April";
							else if (expense.getMonth() == AppHelper.MAY)
								newDate = "May";
							else if (expense.getMonth() == AppHelper.JUNE)
								newDate = "June";
							else if (expense.getMonth() == AppHelper.JULY)
								newDate = "July";
							else if (expense.getMonth() == AppHelper.AUGUST)
								newDate = "August";
							else if (expense.getMonth() == AppHelper.SEPTEMBER)
								newDate = "September";
							else if (expense.getMonth() == AppHelper.OCTOBER)
								newDate = "October";
							else if (expense.getMonth() == AppHelper.NOVEMBER)
								newDate = "November";
							else if (expense.getMonth() == AppHelper.DECEMBER)
								newDate = "December";

							dataset.addValue(expense.gettotalExpense(),
									"Expense", newDate);
							dataset.addValue(expense.gettotalIncome(),
									"Income", newDate);

						}
					}

					JFreeChart chart = ChartFactory.createLineChart(
							"Actual Income vs Actual Expenses", // chart
							// title
							"", // domain(x-axis) axis label
							"", // range(y-axis) axis label
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
					/*
					 * LegendItemCollection chartLegend = new
					 * LegendItemCollection(); Shape shape = new Rectangle(10,
					 * 10); chartLegend.add(new LegendItem("label1", null, null,
					 * null, shape, Color.red)); chartLegend.add(new
					 * LegendItem("label2", null, null, null, shape,
					 * Color.blue)); plot.setFixedLegendItems(chartLegend);
					 */

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
					// renderer.setSeriesPaint(0, Color.RED);
					// renderer.setSeriesPaint(1, Color.GREEN);
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
			}

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

			if (projectedActualIncome != null && projectedActualIncome2 != null) {

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

			}

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

			if (collectionEfficiency != null) {

				if (collectionEfficiency.size() != 0) {

					DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();

					Double current_amountCollected = 0.0;
					Double current_amountBilled = 0.0;
					Double pastDue_amountColleted = 0.0;
					Double pastDue_amountBilled = 0.0;

					for (CollectionEfficiency newCollectionEfficiency : collectionEfficiency) {
						current_amountCollected += newCollectionEfficiency
								.getCurrentAmountCollected();
						current_amountBilled += newCollectionEfficiency
								.getCurrentAmountBilled();
						pastDue_amountColleted += newCollectionEfficiency
								.getPastdueAmountCollected();
						pastDue_amountBilled += newCollectionEfficiency
								.getPastdueAmountBilled();
					}

					categoryDataset.setValue(pastDue_amountColleted,
							"Amount Collected", "Past Due");
					categoryDataset.setValue(current_amountCollected,
							"Amount Collected", "Current");

					categoryDataset.setValue(pastDue_amountBilled,
							"Amount Billed", "Past Due");
					categoryDataset.setValue(current_amountBilled,
							"Amount Billed", "Current");

					JFreeChart chart = ChartFactory.createStackedBarChart3D(
							"Collection Efficiency", // Title
							"", // X-Axis label
							"",// Y-Axis label
							categoryDataset, // Dataset
							PlotOrientation.HORIZONTAL, true, // Show legend
							true, false);

					CategoryPlot plot = chart.getCategoryPlot();
					plot.setBackgroundPaint(Color.WHITE);
					plot.setRangeGridlinePaint(Color.BLACK);
					plot.setRangeGridlineStroke(new BasicStroke(0.5f,
							BasicStroke.CAP_ROUND, BasicStroke.CAP_ROUND));
					
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

				}

			}

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
			
			if(buPersonalServices != null) {
				categoryDataset.setValue(buPersonalServices.getActualPersonalServices(),
						"Actual", "Personal Services");
			}
			
			if(buMooe != null) {
				categoryDataset.setValue(buMooe.getActualMooe(),
						"Actual", "MOOE");
			}
			
			if(buCapitalExpenditures != null) {
				categoryDataset.setValue(buCapitalExpenditures.getActualCapitalExpenditures(),
						"Actual", "Capital Expenditures");
			}
			
			if(buPersonalServices != null) {
				categoryDataset.setValue(buPersonalServices.getBudgetPersonalServices() - buPersonalServices.getActualPersonalServices(),
								"Unutilized", "Personal Services");
			}
			
			if(buMooe != null) {
				categoryDataset.setValue(buMooe.getBudgetMooe() - buMooe.getActualMooe(), 
						"Unutilized", "MOOE");
			}
			
			if(buCapitalExpenditures != null) {
				categoryDataset.setValue(buCapitalExpenditures.getBudgetCapitalExpenditures() - buCapitalExpenditures.getActualCapitalExpenditures(),
						"Unutilized", "Capital Expenditures");
			}
			
			if(buPersonalServices != null || buMooe != null || buCapitalExpenditures != null) {
				
				JFreeChart chart = ChartFactory.createStackedBarChart(
						"Budget Utilization", // Title
						"", // X-Axis label
						"",// Y-Axis label
						categoryDataset, // Dataset
						PlotOrientation.VERTICAL, true, // Show legend
						true, false);
	
				CategoryPlot plot = chart.getCategoryPlot();
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

				if (pdstfrates.size() != 0) {

					for (PdstFRates newAvg : pdstfrates) {
						if (newAvg != null) {
							String newDate = "";
							if (newAvg.getMonth() == AppHelper.JANUARY)
								newDate = "January";
							else if (newAvg.getMonth() == AppHelper.FEBRUARY)
								newDate = "February";
							else if (newAvg.getMonth() == AppHelper.MARCH)
								newDate = "March";
							else if (newAvg.getMonth() == AppHelper.APRIL)
								newDate = "April";
							else if (newAvg.getMonth() == AppHelper.MAY)
								newDate = "May";
							else if (newAvg.getMonth() == AppHelper.JUNE)
								newDate = "June";
							else if (newAvg.getMonth() == AppHelper.JULY)
								newDate = "July";
							else if (newAvg.getMonth() == AppHelper.AUGUST)
								newDate = "August";
							else if (newAvg.getMonth() == AppHelper.SEPTEMBER)
								newDate = "September";
							else if (newAvg.getMonth() == AppHelper.OCTOBER)
								newDate = "October";
							else if (newAvg.getMonth() == AppHelper.NOVEMBER)
								newDate = "November";
							else if (newAvg.getMonth() == AppHelper.DECEMBER)
								newDate = "December";

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
						}
					}

					JFreeChart chart = ChartFactory.createLineChart(
							"2012 PDST-F Rates", // chart title
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
