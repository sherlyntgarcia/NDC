package com.ndc.app;

import java.awt.Paint;

public class CustomCylinderRenderer extends CylinderRenderer {

	private Paint colors[];

	public Paint getItemPaint(int i, int j) {
		return colors[j % colors.length];
	}

	public CustomCylinderRenderer(Paint apaint[]) {
		colors = apaint;
	}
	
}