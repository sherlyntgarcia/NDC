package com.ndc.app;

import java.awt.Color;
import java.awt.Paint;

public class CustomCylinderRenderer extends CylinderRenderer {

	private Paint[] colors;
	 public CustomCylinderRenderer() 
	 { 
	    this.colors = new Paint[] {new Color(30, 144, 255)}; 
	 }
	 
	 public Paint getItemPaint(final int row, final int column) 
	 { 
	    // returns color for each column 
	    return (this.colors[column % this.colors.length]); 
	 } 
	
}