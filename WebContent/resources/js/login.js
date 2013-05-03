
		$(document).ready(function() {
			
			$("#forgotPass").click(function(e) {
				e.preventDefault();
				
				$("#message").hide();
				
				$("#forgotPasswordModal").modal();
			});
			
			$("#forgotPass1").click(function() {
				
				$(this).button('loading');
				
				var username = $("#username").val();
				var secretQuestion = $("#secretQuestion").val();
				var secretAnswer = $("#secretAnswer").val();
				
				$.ajax({
					
					async: false,
					type: "POST",
					url: contextPath + "/login/forgot",
					data: {
						username: username,
						secretQuestion: secretQuestion,
						secretAnswer: secretAnswer
					},
					success: function(data) {
						//send email
						if(data) {
							var data = $.parseJSON(data);
							
							if(data.status == true) {
								
								$("#message").show();
								$("#message").removeClass("alert").removeClass("alert-error").addClass("alert").addClass("alert-success");
								$("#message").html(data.message);
								
							} else {
								
								$("#message").show();
								$("#message").removeClass("alert").removeClass("alert-success").addClass("alert").addClass("alert-error");
								$("#message").html(data.message);
								
							}
						} else {
							
							$("#message").show();
							$("#message").removeClass("alert").removeClass("alert-success").addClass("alert").addClass("alert-error");
							$("#message").html("An error has occurred.");
							
						}
					},
					error: function(data) {
						
						$("#message").show();
						$("#message").removeClass("alert").removeClass("alert-success").addClass("alert").addClass("alert-error");
						$("#message").html("An error has occurred.");
						
					}
					
				});
				
				$(this).button('reset');
				
			});
			
			$("#forgotPassAdmin").click(function(e) {
				e.preventDefault();
				
				$("#adminMessage").hide();
				
				$("#forgotPasswordAdminModal").modal();
			});
			
			$("#forgotPass2").click(function() {
				
				$(this).button('loading');
				
				var adminUsername = $("#adminUsername").val();
				var adminEmail = $("#adminEmail").val();
				
				$.ajax({
					
					async: false,
					type: "POST",
					url: contextPath + "/login/admin/forgot",
					data: {
						username: adminUsername,
						email: adminEmail
					},
					success: function(data) {
						//send email
						if(data) {
							var data = $.parseJSON(data);
							
							if(data.status == true) {
								
								$("#adminMessage").show();
								$("#adminMessage").removeClass("alert").removeClass("alert-error").addClass("alert").addClass("alert-success");
								$("#adminMessage").html(data.message);
								
							} else {
								
								$("#adminMessage").show();
								$("#adminMessage").removeClass("alert").removeClass("alert-success").addClass("alert").addClass("alert-error");
								$("#adminMessage").html(data.message);
								
							}
						} else {
							
							$("#adminMessage").show();
							$("#adminMessage").removeClass("alert").removeClass("alert-success").addClass("alert").addClass("alert-error");
							$("#adminMessage").html("An error has occurred.");
							
						}
					},
					error: function(data) {
						
						$("#adminMessage").show();
						$("#adminMessage").removeClass("alert").removeClass("alert-success").addClass("alert").addClass("alert-error");
						$("#adminMessage").html("An error has occurred.");
						
					}
					
				});
				
				$(this).button('reset');
				
			});
			
		});