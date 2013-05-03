<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<security:authorize access="!hasRole('SPG_STRATEGIC_USER') and !hasRole('SPG_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (SPG)</label> 
				</div>
			</div>
			
		</div>
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/spgLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
			
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">SPG Internal Dashboard</p>
						<hr />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						
						<table class="table table-bordered table-striped">
							
								<tr>
									<th>YEAR</td>
									<th>EQUITY INVESTMENTS (in millions)</td>
									<th>PROJECT FINANCING (in millions)</td>
									<th>TOTAL (in millions)</td>
								</tr>
							
								<tr>
									<td>2000</td>
									<td>6.70</td>
									<td>1.30</td>
									<td>8.00</td>
								</tr>
								
								<tr>
									<td>2001</td>
									<td>1.70</td>
									<td>32.00</td>
									<td>33.70</td>
								</tr>
								
								<tr>
									<td>2002</td>
									<td>3.90</td>
									<td>5.00</td>
									<td>8.90</td>
								</tr>
								
								<tr>
									<td>2003</td>
									<td>2.00</td>
									<td>-</td>
									<td>2.00</td>
								</tr>
								
								<tr>
									<td>2004</td>
									<td>-</td>
									<td>216.20</td>
									<td>216.20</td>
								</tr>
								
								<tr>
									<td>2005</td>
									<td>158.70</td>
									<td>631.10</td>
									<td>789.80</td>
								</tr>
								
								<tr>
									<td>2006</td>
									<td>128.50</td>
									<td>1,518.60</td>
									<td>1,647.10</td>
								</tr>
								
								<tr>
									<td>2007</td>
									<td>170.80</td>
									<td>2,075.00</td>
									<td>2,245.80</td>
								</tr>
								
								<tr>
									<td>2008</td>
									<td>8.10</td>
									<td>1,000.00</td>
									<td>1,008.10</td>
								</tr>
								
								<tr>
									<td>2009</td>
									<td>-</td>
									<td>3,671.80</td>
									<td>3,671.80</td>
								</tr>
								
								<tr>
									<td>2010</td>
									<td>-</td>
									<td>828.20</td>
									<td>828.20</td>
								</tr>
								
								<tr>
									<td>2011</td>
									<td>207.50</td>
									<td>-</td>
									<td>207.50</td>
								</tr>
								
								<tr>
									<td>2012</td>
									<td>7.60</td>
									<td>3.40</td>
									<td>11.00</td>
								</tr>
							
						</table>
						
					</div>
				</div>
				
				<div class="row-fluid" style="margin-top:20px">
					<div class="span12">
					
						<table class="table table-bordered table-striped">
							
							<tr>
								<th>YEAR</td>
								<th>2000</td>
								<th>2001</td>
								<th>2002</td>
								<th>2003</td>
								<th>2004</td>
								<th>2005</td>
								<th>2006</td>
								<th>2007</td>
								<th>2008</td>
								<th>2009</td>
								<th>2010</td>
								<th>2011</td>
								<th>2012</td>
							</tr>
							
							<tr>
								<td>INVESTMENT</td>
								<td>7</td>
								<td>2</td>
								<td>4</td>
								<td>2</td>
								<td>-</td>
								<td>159</td>
								<td>129</td>
								<td>171</td>
								<td>8</td>
								<td>-</td>
								<td>-</td>
								<td>208</td>
								<td>8</td>
							</tr>
							
							<tr>
								<td>PROJECT FINANCING</td>
								<td>1</td>
								<td>32</td>
								<td>5</td>
								<td>-</td>
								<td>216</td>
								<td>631</td>
								<td>1,519</td>
								<td>2,075</td>
								<td>1,000</td>
								<td>3,672</td>
								<td>828</td>
								<td>-</td>
								<td>3</td>
							</tr>
							
							<tr>
								<td>TOTAL</td>
								<td>8</td>
								<td>34</td>
								<td>9</td>
								<td>2</td>
								<td>216</td>
								<td>790</td>
								<td>1,647</td>
								<td>2,246</td>
								<td>1,008</td>
								<td>3,672</td>
								<td>828</td>
								<td>208</td>
								<td>11</td>
							</tr>
							
						</table>
					
					</div>
				</div>
				
				<div style="margin-top:20px">
					
					<img src="${pageContext.request.contextPath}/visualization/spglinechart/1000/500" />
					
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />