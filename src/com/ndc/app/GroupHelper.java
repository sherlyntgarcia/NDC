package com.ndc.app;

import java.util.ArrayList;
import java.util.List;

public class GroupHelper extends AppHelper {
	
	public static final String AMG = "AMG";
	public static final String FMG = "FMG";
	public static final String FAD = "FAD";
	public static final String SPG = "SPG";
	
	public static List<String> getGroups() {
		
		List<String> groups = new ArrayList<String>();
		groups.add("AMG");
		groups.add("FAD");
		groups.add("FMG");
		groups.add("SPG");
		
		return groups;
		
	}

}
