package com.ndc.app;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


public class AppHelper {
	
	public static final String ASEAN = "ASEAN";
	public static final String MINING = "Mining";
	public static final String ENERGY = "Energy";
	public static final String INDUSTRIAL = "Industrial";
	public static final String REAL_ESTATE = "Real Estate";
	public static final String OTHERS = "Others";
	
	//MONTHS HELPER
	public static final int JANUARY = 0;
	public static final int FEBRUARY = 1;
	public static final int MARCH = 2;
	public static final int APRIL = 3;
	public static final int MAY = 4;
	public static final int JUNE = 5;
	public static final int JULY = 6;
	public static final int AUGUST = 7;
	public static final int SEPTEMBER = 8;
	public static final int OCTOBER = 9;
	public static final int NOVEMBER = 10;
	public static final int DECEMBER = 11;
	
	public static List<String> getQuestions() {
		
		//added a comment
		
		List<String> questions = new ArrayList<String>();
		questions.add("Month and Year of Appointment in NDC?");
		questions.add("Mother\'s Birthday (yyyy-mm-dd)?");
		questions.add("Father\'s name initials (e.g. CHC)?");
		
		return questions;
		
	}
	
	public static String convertIntegerToMonth(int num) {
		String month = null;
		
		if (num == AppHelper.JANUARY)
			month = "January";
		else if (num == AppHelper.FEBRUARY)
			month = "February";
		else if (num == AppHelper.MARCH)
			month = "March";
		else if (num == AppHelper.APRIL)
			month = "April";
		else if (num == AppHelper.MAY)
			month = "May";
		else if (num == AppHelper.JUNE)
			month = "June";
		else if (num == AppHelper.JULY)
			month = "July";
		else if (num == AppHelper.AUGUST)
			month = "August";
		else if (num == AppHelper.SEPTEMBER)
			month = "September";
		else if (num == AppHelper.OCTOBER)
			month = "October";
		else if (num == AppHelper.NOVEMBER)
			month = "November";
		else if (num == AppHelper.DECEMBER)
			month = "December";
		
		return month;
	}
	
	public static String convertDateToString(Date currentDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentDate);
		
		return convertIntegerToMonth(cal.get(Calendar.MONTH)) + " " + cal.get(Calendar.DAY_OF_MONTH) + ", " + cal.get(Calendar.YEAR);
	}
	
	public static Map<Integer, String> getMonths() {
		Map<Integer, String> months = new HashMap<Integer, String>();
		
		months.put(AppHelper.JANUARY, "January");
		months.put(AppHelper.FEBRUARY, "February");
		months.put(AppHelper.MARCH, "March");
		months.put(AppHelper.APRIL, "April");
		months.put(AppHelper.MAY, "May");
		months.put(AppHelper.JUNE, "June");
		months.put(AppHelper.JULY, "July");
		months.put(AppHelper.AUGUST, "August");
		months.put(AppHelper.SEPTEMBER, "September");
		months.put(AppHelper.OCTOBER, "October");
		months.put(AppHelper.NOVEMBER, "November");
		months.put(AppHelper.DECEMBER, "December");
		
		return months;
	}
	
	public static long generateFilename() {
		Random rand = new Random();
		long salt = ((rand.nextInt() + 10000) + 1) + System.currentTimeMillis();
		
		return salt;
	}

}
