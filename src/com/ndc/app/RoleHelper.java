package com.ndc.app;

import java.util.ArrayList;
import java.util.List;

public class RoleHelper extends AppHelper {
	
	//ADMIN
	public static final String POWER_USER = "POWER_USER";
	public static final String TACTICAL_USER = "TACTICAL_USER";
	
	public static final String STRATEGIC_USER = "STRATEGIC_USER";
	public static final String OPERATIONAL_USER = "OPERATIONAL_USER";
	
	//FOR RETRIEVAL
	public static final String FAD_STRATEGIC_USER = "FAD_STRATEGIC_USER";
	public static final String FAD_OPERATIONAL_USER = "FAD_OPERATIONAL_USER";
	public static final String FAD_TACTICAL_USER = "FAD_TACTICAL_USER";
	
	public static final String FMG_STRATEGIC_USER = "FMG_STRATEGIC_USER";
	public static final String FMG_OPERATIONAL_USER = "FMG_OPERATIONAL_USER";
	public static final String FMG_TACTICAL_USER = "FMG_TACTICAL_USER";
	
	public static final String AMG_STRATEGIC_USER = "AMG_STRATEGIC_USER";
	public static final String AMG_OPERATIONAL_USER = "AMG_OPERATIONAL_USER";
	public static final String AMG_TACTICAL_USER = "AMG_TACTICAL_USER";
	
	public static final String SPG_STRATEGIC_USER = "SPG_STRATEGIC_USER";
	public static final String SPG_OPERATIONAL_USER = "SPG_OPERATIONAL_USER";
	public static final String SPG_TACTICAL_USER = "SPG_TACTICAL_USER";
	
	public static List<String> getRoles() {
		
		List<String> roles = new ArrayList<String>();
		//roles.add(POWER_USER);
		roles.add(STRATEGIC_USER);
		roles.add(OPERATIONAL_USER);
		//roles.add(TACTICAL_USER);
		
		return roles;
		
	}

}
