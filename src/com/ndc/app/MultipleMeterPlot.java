package com.ndc.app;
/** ===========================================================
 * JFreeChart : a free chart library for the Java(tm) platform
 * ===========================================================
 * --------------------
 * MultipleMeterPlot.java
 * Source: http://www.jfree.org/phpBB2/viewtopic.php?f=3&t=23145
 * --------------------
 *
 * Changes
 * -------
 * 30-Nov-2007 : Version 0.1 (lthor);
 * 08-Jul-2011 : version 0.2 (PS Tee);
 *
 */

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Paint;
import java.awt.Rectangle;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.Serializable;
import java.util.List;

import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.LegendItem;
import org.jfree.chart.LegendItemCollection;
import org.jfree.chart.event.PlotChangeEvent;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetChangeEvent;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.RectangleEdge;
import org.jfree.ui.RectangleInsets;
import org.jfree.util.ObjectUtilities;
import org.jfree.util.TableOrder;
import org.jfree.chart.plot.*;

import org.jfree.data.general.DefaultValueDataset;
import org.jfree.chart.plot.MeterPlot;

/**
 * A plot that displays multiple meter plots using data from a
 * {@link CategoryDataset}.
 */
public class MultipleMeterPlot extends Plot implements Cloneable, Serializable {

	private static final long serialVersionUID = 1L;

	/** The chart object that draws the individual meter charts. */
	private JFreeChart meterChart;

	/** The dataset. */
	private CategoryDataset dataset;

	/** The data extract order (by row or by column). */
	private TableOrder dataExtractOrder;

	/** The key that is used for drawing the chart. */
	private String selectedKey = null;

	/**
	 * Creates a new plot with no data.
	 */
	public MultipleMeterPlot() {
		this(null);
	}

	/**
	 * Creates a new plot.
	 * 
	 * @param dataset
	 *            the dataset (<code>null</code> permitted).
	 */
	public MultipleMeterPlot(CategoryDataset dataset) {
		super();
		this.dataset = dataset;
		MeterPlot meterPlot = new MeterPlot(null);
		this.meterChart = new JFreeChart(meterPlot);
		this.meterChart.removeLegend();
		this.dataExtractOrder = TableOrder.BY_COLUMN;
		this.meterChart.setBackgroundPaint(null);
		TextTitle seriesTitle = new TextTitle("Series Title", new Font(
				"SansSerif", Font.BOLD, 12));
		seriesTitle.setPosition(RectangleEdge.BOTTOM);
		this.meterChart.setTitle(seriesTitle);
	}

	/**
	 * Returns the dataset used by the plot.
	 * 
	 * @return The dataset (possibly <code>null</code>).
	 */
	public CategoryDataset getDataset() {
		return this.dataset;
	}

	/**
	 * Sets the dataset used by the plot and sends a {@link PlotChangeEvent} to
	 * all registered listeners.
	 * 
	 * @param dataset
	 *            the dataset (<code>null</code> permitted).
	 */
	public void setDataset(CategoryDataset dataset) {
		// if there is an existing dataset, remove the plot from the list of
		// change listeners...
		if (this.dataset != null) {
			this.dataset.removeChangeListener(this);
		}

		// set the new dataset, and register the chart as a change listener...
		this.dataset = dataset;
		if (dataset != null) {
			setDatasetGroup(dataset.getGroup());
			dataset.addChangeListener(this);
		}

		// send a dataset change event to self to trigger plot change event
		datasetChanged(new DatasetChangeEvent(this, dataset));
	}

	/**
	 * Returns the meter chart that is used to draw the individual meter plots.
	 * 
	 * @return The meter chart (never <code>null</code>).
	 * 
	 * @see #setMeterChart(JFreeChart)
	 */
	public JFreeChart getMeterChart() {
		return this.meterChart;
	}

	/**
	 * Sets the chart that is used to draw the individual meter plots. The
	 * chart's plot must be an instance of {@link MeterPlot}.
	 * 
	 * @param meterChart
	 *            the meter chart (<code>null</code> not permitted).
	 * 
	 * @see #getMeterChart()
	 */
	public void setMeterChart(JFreeChart meterChart) {
		if (meterChart == null) {
			throw new IllegalArgumentException("Null 'meterChart' argument.");
		}
		if (!(meterChart.getPlot() instanceof MeterPlot)) {
			throw new IllegalArgumentException(
					"The 'meterChart' argument must "
							+ "be a chart based on a MeterPlot.");
		}
		this.meterChart = meterChart;
		notifyListeners(new PlotChangeEvent(this));
	}

	/**
	 * Returns the data extract order (by row or by column).
	 * 
	 * @return The data extract order (never <code>null</code>).
	 */
	public TableOrder getDataExtractOrder() {
		return this.dataExtractOrder;
	}

	/**
	 * Sets the data extract order (by row or by column) and sends a
	 * {@link PlotChangeEvent} to all registered listeners.
	 * 
	 * @param order
	 *            the order (<code>null</code> not permitted).
	 */
	public void setDataExtractOrder(TableOrder order) {
		if (order == null) {
			throw new IllegalArgumentException("Null 'order' argument");
		}
		this.dataExtractOrder = order;
		notifyListeners(new PlotChangeEvent(this));
	}

	/**
	 * Returns a short string describing the type of plot.
	 * 
	 * @return The plot type.
	 */
	public String getPlotType() {
		return "Multiple Meter Plot";
	}

	/**
	 * Returns the selected key used by the plot.
	 * 
	 * @return The selected key (possibly <code>null</code>).
	 */
	public String getSelectedKey() {
		return this.selectedKey;
	}

	/**
	 * Sets the selected key used by the plot.
	 * 
	 * @param key
	 *            the key (<code>null</code> permitted).
	 */
	public void setSelectedKey(String key) {
		this.selectedKey = key;
	}

	/**
	 * Draws the plot on a Java 2D graphics device (such as the screen or a
	 * printer).
	 * 
	 * @param g2
	 *            the graphics device.
	 * @param area
	 *            the area within which the plot should be drawn.
	 * @param anchor
	 *            the anchor point (<code>null</code> permitted).
	 * @param parentState
	 *            the state from the parent plot, if there is one.
	 * @param info
	 *            collects info about the drawing.
	 */
	public void draw(Graphics2D g2, Rectangle2D area, Point2D anchor,
			PlotState parentState, PlotRenderingInfo info) {

		// adjust the drawing area for the plot insets (if any)...
		RectangleInsets insets = getInsets();
		insets.trim(area);
		drawBackground(g2, area);
		drawOutline(g2, area);

		// check that there is some data to display...
		if (DatasetUtilities.isEmptyOrNull(this.dataset)) {
			drawNoDataMessage(g2, area);
			return;
		}

		int meterCount = 0;
		if (this.dataExtractOrder == TableOrder.BY_ROW)
			meterCount = this.dataset.getRowCount();
		else
			meterCount = this.dataset.getColumnCount();

		// the columns variable is always >= rows
		int displayCols = (int) Math.ceil(Math.sqrt(meterCount));
		int displayRows = (int) Math.ceil((double) meterCount
				/ (double) displayCols);

		// swap rows and columns to match plotArea shape
		if (displayCols > displayRows && area.getWidth() < area.getHeight()) {
			int temp = displayCols;
			displayCols = displayRows;
			displayRows = temp;
		}

		int x = (int) area.getX();
		int y = (int) area.getY();
		int width = ((int) area.getWidth()) / displayCols;
		int height = ((int) area.getHeight()) / displayRows;
		int row = 0;
		int column = 0;
		int diff = (displayRows * displayCols) - meterCount;
		int xoffset = 0;
		int myindex = 0;

		Rectangle rect = new Rectangle();
		DefaultValueDataset meterdataset = null;

		for (int meterIndex = 0; meterIndex < meterCount; meterIndex++) {
			rect.setBounds(x + xoffset + (width * column), y + (height * row),
					width, height);

			String title = "";
			if (this.dataExtractOrder == TableOrder.BY_ROW) {
				if (this.dataset.getRowKey(meterIndex) != null)
					title = this.dataset.getRowKey(meterIndex).toString();

				this.meterChart.setTitle(title);
				meterdataset = new DefaultValueDataset(this.dataset.getValue(
						title, selectedKey));
			} else {
				if (this.dataset.getColumnKey(meterIndex) != null)
					title = this.dataset.getColumnKey(meterIndex).toString();

				this.meterChart.setTitle(title);
				meterdataset = new DefaultValueDataset(this.dataset.getValue(
						selectedKey, title));
			}

			myindex++;
			MeterPlot meterPlot = (MeterPlot) this.meterChart.getPlot();
			meterPlot.setDataset(meterdataset);

			ChartRenderingInfo subinfo = null;
			if (info != null) {
				subinfo = new ChartRenderingInfo();
			}
			this.meterChart.draw(g2, rect, subinfo);
			if (info != null) {
				info.getOwner().getEntityCollection()
						.addAll(subinfo.getEntityCollection());
				info.addSubplotInfo(subinfo.getPlotInfo());
			}

			++column;
			if (column == displayCols) {
				column = 0;
				++row;

				if (row == displayRows - 1 && diff != 0) {
					xoffset = (diff * width) / 2;
				}
			}
		}
	}

	/**
	 * Returns a collection of legend items for the meter chart.
	 * 
	 * @return The legend items.
	 */
	@SuppressWarnings("unchecked")
	public LegendItemCollection getLegendItems() {
		LegendItemCollection result = new LegendItemCollection();

		if (this.dataset != null) {
			List<MeterInterval> intervals = ((MeterPlot) this.meterChart
					.getPlot()).getIntervals();

			// no legend if there is no meter interval
			if (intervals != null) {
				for (int i = 0; i < intervals.size(); i++) {
					MeterInterval interval = intervals.get(i);

					// set legend items based on meter intervals
					if (interval != null) {
						String label =interval.getLabel();
						String description = label;
						Paint paint = interval.getBackgroundPaint();

						LegendItem item = new LegendItem(label, description,
								null, null, Plot.DEFAULT_LEGEND_ITEM_BOX,
								paint, Plot.DEFAULT_OUTLINE_STROKE, paint);
						item.setDataset(getDataset());
						result.add(item);
					}
				}
			}
		}
		return result;
	}

	/**
	 * Tests this plot for equality with an arbitrary object. Note that the
	 * plot's dataset is not considered in the equality test.
	 * 
	 * @param obj
	 *            the object (<code>null</code> permitted).
	 * 
	 * @return <code>true</code> if this plot is equal to <code>obj</code>, and
	 *         <code>false</code> otherwise.
	 */
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if (!(obj instanceof MultipleMeterPlot)) {
			return false;
		}
		MultipleMeterPlot that = (MultipleMeterPlot) obj;
		if (this.dataExtractOrder != that.dataExtractOrder) {
			return false;
		}
		if (!ObjectUtilities.equal(this.meterChart, that.meterChart)) {
			return false;
		}
		if (!super.equals(obj)) {
			return false;
		}
		return true;
	}
}