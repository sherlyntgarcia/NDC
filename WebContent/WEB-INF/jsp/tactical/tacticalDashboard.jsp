<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class="admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Tactical Dashboard</label> 
				</div>
			</div>
			
		</div>
	
	</div>
	
	<div class="row-fluid" style="margin-top:10px">
	
		<div class="span12">
		
			<div class="row-fluid">
				<div class="span12">
					
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="span12">
					
					<div style="width:1000px;padding:10px;margin:0 auto;margin-top:20px">
						
						<ul class="nav nav-tabs">
							<li class = "active">
								<a data-toggle="tab" href = "#tacticalMain">
									Main
								</a>
							</li>
							<li>
								<c:choose>
									<c:when test="${not empty amgNotif}">
										<a id="amgNotif" groupId="AMG" fooId="${userId}" data-toggle="tab" href="#amgTactical"  rel = "tooltip" data-placement = "top" title = "Click the number icon view the updates">
											Asset Management 
											<span groupId="AMG" fooId="${userId}" title="This dashboard was updated" class="badge badge-important viewNotif" style="cursor:pointer;font-weight:bold">${amgNotifCount}</span>
										</a>
									</c:when>
									
									<c:otherwise>
										<a data-toggle="tab" href="#amgTactical">
											Asset Management
										</a>
									</c:otherwise>
								</c:choose>
							</li>
							
							<li>
								<c:choose>
									<c:when test="${not empty fmgNotif}">
										<a id="fmgNotif" groupId="FMG" fooId="${userId}" data-toggle="tab" href="#fmgTactical" rel = "tooltip" data-placement = "top" title = "Click the number icon view the updates">
											Fund Management
											<span groupId="FMG" fooId="${userId}" title="This dashboard was updated" class="badge badge-important viewNotif" style="cursor:pointer;font-weight:bold">${fmgNotifCount}</span>
										</a>
									</c:when>
									
									<c:otherwise>
										<a data-toggle="tab" href="#fmgTactical">
											Fund Management
										</a>
									</c:otherwise>
								</c:choose>
							</li>
							
							<li>
								<c:choose>
									<c:when test="${not empty fadNotif}">
										<a id="fadNotif" groupId="FAD" fooId="${userId}" data-toggle="tab" href="#fadTactical" rel = "tooltip" data-placement = "top" title = "Click the number icon view the updates">
											Finance Admin 
											<span groupId="FAD" fooId="${userId}" class="badge badge-important viewNotif" style="cursor:pointer;font-weight:bold">${fadNotifCount}</span>
										</a>
									</c:when>
									
									<c:otherwise>
										<a data-toggle="tab" href="#fadTactical">
											Finance Admin
										</a>
									</c:otherwise>
								</c:choose>
							</li>
							
							<li>
								<c:choose>
									<c:when test="${not empty spgNotif}">
										<a id="spgNotif" groupId="SPG" fooId="${userId}" data-toggle="tab" href="#spgTactical"  rel = "tooltip" data-placement = "top" title = "Click the number icon view the updates">
											Special Projects
											<span groupId="SPG" fooId="${userId}" title="This dashboard was updated" class="badge badge-important viewNotif" style="cursor:pointer;font-weight:bold">${spgNotifCount}</span>
										</a>
									</c:when>
									
									<c:otherwise>
										<a data-toggle="tab" href="#spgTactical">
											Special Projects
										</a>
									</c:otherwise>
								</c:choose>
							</li>
						
						</ul>
						
						<div class="tab-content">
							<div class="tab-pane active" id="tacticalMain">
								<div class = "row-fluid">
									<div class = "span2">
										<div style="margin-top:20px">
											<p class="lead">Legends</p>
											<hr />
											<ul class="unstyled">
												<li> <img src="${pageContext.request.contextPath}/resources/img/luzon_legend.png" />  - <span style="font-weight:bold">Luzon</span> </li>
												<li> <img src="${pageContext.request.contextPath}/resources/img/visayas_legend.png" /> - <span style="font-weight:bold">Visayas</span> </li>
												<li> <img src="${pageContext.request.contextPath}/resources/img/mindanao_legend.png" /> - <span style="font-weight:bold; font-size: 13px">Mindanao</span> </li>
											</ul>
										</div>
									</div>
									<div class="span4">
										<div>
											<img src="${pageContext.request.contextPath}/resources/img/maps/whole_map_main.png" usemap="#pinas" border="0" style="width:450px;height:600px" alt="" />
											<map name="pinas">
												<area shape="poly" coords="2,436,5,415,27,367,55,324,55,296,75,283,78,257,74,219,59,188,75,162,65,107,71,81,82,81,82,28,87,7,118,2,140,8,147,20,139,44,146,58,150,73,149,98,135,109,125,139,136,160,140,188,149,193,150,185,166,170,184,173,190,165,199,176,219,171,221,158,234,154,238,176,226,189,218,192,236,216,237,247,231,247,219,254,226,282,205,281,194,294,188,255,164,243,148,271,137,272,126,289,124,272,106,264,92,270,90,294,72,309,76,346,61,353,60,366,44,373,47,387,29,417," href="<c:url value = "/external/luzon"/>" alt="" title="Luzon"   />
												<area shape="poly" coords="124,298,120,306,130,315,121,349,128,364,149,356,153,381,151,395,173,422,198,418,213,402,228,392,229,369,246,357,260,360,271,353,268,332,260,317,277,311,272,268,260,241,234,248,230,253,237,275,236,295,221,292,207,316,186,311,184,304,170,308," href="<c:url value = "/external/visayas"/>"  alt="" title="Visayas"   />
												<area shape="poly" coords="121,579,135,549,142,521,145,484,172,470,172,462,186,439,209,437,217,453,236,446,248,423,263,411,276,377,291,345,299,349,298,375,294,395,308,411,313,450,316,465,313,489,299,538,287,547,277,571,224,545,219,525,229,493,218,486,201,509,178,515,171,505,160,518,160,535,160,552,154,561,140,584," href="<c:url value = "/external/mindanao"/>" alt="" title="Mindanao"   />
											</map>
										</div>
									</div>
									<div class="span6">
						
										<c:if test="${not empty success}">
											<div class="alert alert-success">
												${success}
											</div>
										</c:if>
										
										<c:if test="${not empty error}">
											<div class="alert alert-error">
												${error}
											</div>
										</c:if>
										
										<div class="row-fluid">
											
											<div class="span10 offset2">
												<img alt="Balance Sheet is not available" src="${pageContext.request.contextPath}/visualization/bsbarchart/500/320" />
											</div>
											
										</div>
										
										<br /> <br />
										
										<div class="row-fluid">
											
											<div class="span10 offset2">
												<img alt="Income Statement is not available" src="${pageContext.request.contextPath}/visualization/stockareachart/500/320" />
											</div>
											
										</div>
										
									</div>
								</div>
								
							</div>
							
							<div class="tab-pane" id="amgTactical">
								
								<c:import url="../amg/internalAmgTemplate.jsp" />
								
							</div>
							
							<div class="tab-pane" id="fmgTactical">
								
								<c:import url="../fmg/internalFmgTemplate.jsp" />
								
							</div>
							
							<div class="tab-pane" id="fadTactical">
								
								<c:import url="../fad/internalFadTemplate.jsp" />
								
							</div>
							
							<div class="tab-pane" id="spgTactical">
								
								<c:choose>
									<c:when test="${not empty documents}">
							
										<table class="table table-bordered table-striped" style="table-layout:fixed;width:100%">
										
											<thead>
												<tr>
													<th>Category</th>
													<th>Filename</th>
													<th>Updated By</th>
													<th>Description</th>
												</tr>
											</thead>
											
											<tbody>
												<c:forEach var="document" items="${documents}">
													<tr>
														<td>${document.category}</td>
														<td>
															<c:choose>
																<c:when test="${document.category eq 'ASEAN'}">
																	Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
																</c:when>
																
																<c:when test="${document.category eq 'Mining'}">
																	Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
																</c:when>
																
																<c:when test="${document.category eq 'Energy'}">
																	Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
																</c:when>
																
																<c:when test="${document.category eq 'Industrial'}">
																	Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
																</c:when>
																
																<c:when test="${document.category eq 'Real Estate'}">
																	Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
																</c:when>
																
																<c:when test="${document.category eq 'Others'}">
																	Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
																</c:when>
																
																<c:otherwise>
																	Not available
																</c:otherwise>
															</c:choose>
														</td>
														<td>${document.updatedBy}</td>
														<td style="word-wrap:break-word">
															${document.description}
														</td>
													</tr>
												</c:forEach>
											</tbody>
										
										</table>
									
									</c:when>
									
									<c:otherwise>
										<div class="alert alert-error">
											No disclosures found.
										</div>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />