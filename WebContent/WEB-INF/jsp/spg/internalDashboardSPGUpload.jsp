<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

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
						<p class="lead">Upload Files</p>
						<hr />
					</div>
				</div>
				
				<c:if test="${not empty error}">
					<div class="alert alert-error">
						${error}
					</div>
				</c:if>
				
				<c:if test="${not empty success}">
					<div class="alert alert-success">
						${success} Your file is uploaded under <span style='color:#000'>"${fileLocation}"</span>
					</div>
				</c:if>
				
				<div class="row-fluid">
					<div class="span12">
						
						<spring:form modelAttribute="document" enctype="multipart/form-data" method="POST">
						
							<spring:errors path="*" cssClass="alert alert-error" element="div" />
						
							<label>Category</label>
							<div>
								<spring:select items="${categories}" path="category" class="span3" />
							</div>
						
							<label>Upload File:</label>
							<div>
								<input type="file" name="file" class="span3" />
							</div>
							
							<div style="margin-top:10px;">
								<p> * Only PDF files are allowed. </p>
							</div>
							
							<label>Description:</label>
							<div>
								<spring:textarea required="required" placeholder="Describe this file?" path="description" class="span3" style="resize:none;height:100px" />
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary"><i class="icon icon-download-alt icon-white"></i> Save changes</button>
								<a href="${pageContext.request.contextPath}/dashboard/internal/SPG" class="btn">Go back</a>
							</div>
						
						</spring:form>
						
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />