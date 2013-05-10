<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class = "span2">
						<security:authorize access="isAuthenticated()">
							<div class="row-fluid" style="margin-bottom: 20px">
								<div class="span12">
									<div>
										<a class="btn btn-primary"
											href="<c:url value="/dashboard/" />"><i
											class="icon icon-backward icon-white"></i> Internal Dashboard </a>
									</div>
								</div>
							</div>
						</security:authorize>
						
						<div class="row-fluid" style="margin-bottom: 20px">
							<div class="span12">
								<div>
									<a class="btn btn-primary" href="<c:url value="/external" />"><i class = "icon icon-backward icon-white"></i> External Dashboard </a>
								</div>
							</div>
						</div>
					</div>