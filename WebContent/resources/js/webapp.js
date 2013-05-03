		$(document).ready(function() {
			
				$("#feedbackForm").submit(function() {
					$("#feedbackButton").button('loading');
				});
				
				$(".personalServices").click(function() {
					
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/internal/FAD/GetPersonalServices",
						success: function(data) {
							if(data) {
								var data = $.parseJSON(data);
								if(data.status) {
									if(data.data) {
										
										var data = $.parseJSON(data.data);
										
										$("#budgetPersonalServices").html(addCommas(data.budgetPersonalServices));
										$("#actualPersonalServices").html(addCommas(data.actualPersonalServices));
										$("#unutilizedPersonalServices").html(addCommas(data.budgetPersonalServices - data.actualPersonalServices));
										$("#percentOfUtilizationPersonalServices").html(((data.actualPersonalServices / data.budgetPersonalServices) * 100).toFixed(2) + "%");
										
										$("#personalServicesModal").modal();
										
									}
								} else {
									alert("An error has occurred.");
								}
							} else {
								alert("An error has occurred.");
							}
						},
						error: function(data) {
							alert("An error has occurred.");
						}
					});
					
				});
				
				$(".mooe").click(function() {
					
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/internal/FAD/GetMooe",
						success: function(data) {
							if(data) {
								var data = $.parseJSON(data);
								if(data.status) {
									if(data.data) {
										
										var data = $.parseJSON(data.data);
										
										$("#budgetMooe").html(addCommas(data.budgetMooe));
										$("#actualMooe").html(addCommas(data.actualMooe));
										$("#unutilizedMooe").html(addCommas(data.budgetMooe - data.actualMooe));
										$("#percentOfUtilizationMooe").html(((data.actualMooe / data.budgetMooe) * 100).toFixed(2) + "%");
										
										$("#mooeModal").modal();
										
									}
								} else {
									alert("An error has occurred.");
								}
							} else {
								alert("An error has occurred.");
							}
						},
						error: function(data) {
							alert("An error has occurred.");
						}
					});
					
				});
				
				$(".capitalExpenditures").click(function() {
					
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/internal/FAD/GetCapitalExpenditures",
						success: function(data) {
							if(data) {
								var data = $.parseJSON(data);
								if(data.status) {
									if(data.data) {
										
										var data = $.parseJSON(data.data);
										
										$("#budgetCapitalExpenditures").html(addCommas(data.budgetCapitalExpenditures));
										$("#actualCapitalExpenditures").html(addCommas(data.actualCapitalExpenditures));
										$("#unutilizedCapitalExpenditures").html(addCommas(data.budgetCapitalExpenditures - data.actualCapitalExpenditures));
										$("#percentOfUtilizationCapitalExpenditures").html(((data.actualCapitalExpenditures / data.budgetCapitalExpenditures) * 100).toFixed(2) + "%");
										
										$("#capitalExpendituresModal").modal();
										
									}
								} else {
									alert("An error has occurred.");
								}
							} else {
								alert("An error has occurred.");
							}
						},
						error: function(data) {
							alert("An error has occurred.");
						}
					});
					
				});
				
				$('#fadNotif').tooltip('show');
				$('#fmgNotif').tooltip('show');
				$('#spgNotif').tooltip('show');
				$('#amgNotif').tooltip('show');
				
				//carousel
				$('[id^=carousel-selector-0]').click( function(){
                var id_selector = $(this).attr("id");
                var id = id_selector.substr(id_selector.length -1);
                var id = parseInt(id);
                $('#myCarousel').carousel(id);
        		});
				
				$('[id^=carousel-selector-1]').click( function(){
	                var id_selector = $(this).attr("id");
	                var id = id_selector.substr(id_selector.length -1);
	                var id = parseInt(id);
	                $('#myCarousel').carousel(id);
	        	});
				$('[id^=carousel-selector-2]').click( function(){
	                var id_selector = $(this).attr("id");
	                var id = id_selector.substr(id_selector.length -1);
	                var id = parseInt(id);
	                $('#myCarousel').carousel(id);
	        	});
					
				$('[id^=carousel-selector-3]').click( function(){
	                var id_selector = $(this).attr("id");
	                var id = id_selector.substr(id_selector.length -1);
	                var id = parseInt(id);
	                $('#myCarousel').carousel(id);
		        });
				$('[id^=carousel-selector-4]').click( function(){
	                var id_selector = $(this).attr("id");
	                var id = id_selector.substr(id_selector.length -1);
	                var id = parseInt(id);
	                $('#myCarousel').carousel(id);
        		});
					
				$('[id^=carousel-selector-5]').click( function(){
	                var id_selector = $(this).attr("id");
	                var id = id_selector.substr(id_selector.length -1);
	                var id = parseInt(id);
	                $('#myCarousel').carousel(id);
	        	});
				$('[id^=carousel-selector-6]').click( function(){
	                var id_selector = $(this).attr("id");
	                var id = id_selector.substr(id_selector.length -1);
	                var id = parseInt(id);
	                $('#myCarousel').carousel(id);
	        	});
					
					$('[id^=carousel-selector-7]').click( function(){
		                var id_selector = $(this).attr("id");
		                var id = id_selector.substr(id_selector.length -1);
		                var id = parseInt(id);
		                $('#myCarousel').carousel(id);
		        });
					$('[id^=carousel-selector-8]').click( function(){
		                var id_selector = $(this).attr("id");
		                var id = id_selector.substr(id_selector.length -1);
		                var id = parseInt(id);
		                $('#myCarousel').carousel(id);
		        });
				
				/*** ACTUAL INCOME ***/
				$("input[name=actualDividend]").keyup(function() {
					getTotal();
				});
				
				$("input[name=actualInterest]").keyup(function() {
					getTotal();
				});
				
				$("input[name=actualRental]").keyup(function() {
					getTotal();
				});
				
				$("input[name=actualGainOnSale]").keyup(function() {
					getTotal();
				});
				
				$("input[name=actualOtherIncome]").keyup(function() {
					getTotal();
				});
				//////////////////////////////////////////////////////
				
				/*** PROJECTED INCOME ***/
				$("input[name=projectedDividend]").keyup(function() {
					getProjectedTotal();
				});
				
				$("input[name=projectedInterest]").keyup(function() {
					getProjectedTotal();
				});
				
				$("input[name=projectedRental]").keyup(function() {
					getProjectedTotal();
				});
				
				$("input[name=projectedGainOnSale]").keyup(function() {
					getProjectedTotal();
				});
				
				$("input[name=projectedOtherIncome]").keyup(function() {
					getProjectedTotal();
				});
				//////////////////////////////////////////////////////
				
				$(".viewNotif").click(function() {
					
					var groupName = $(this).attr("groupId");
					var userId = $(this).attr("fooId");
					
					//open a modal where there are a list of notifications
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/tactical/viewNotif",
						data: {
							groupName: groupName,
							userId: userId
						},
						success: function(data) {
							if(data) {
								var data = $.parseJSON(data);
								
								if(data.status) {
									$("#notificationModal").modal();
									
									var htmlContent = "";
									
									$.each($.parseJSON(data.data), function(index, notification) {
										htmlContent += "<div class='alert alert-success'> <p class='badge badge-important'> " + notification.dateNotified + " </p> <span class='badge badge-important' style='font-weight:bold'>" + notification.triggeredBy + "</span>: <span style='font-weight:bold'>" + notification.message + "</span> </div>";
									});
									
									$("#notificationModal .modal-body").html(htmlContent);
								} else {
									alert("An error has occurred");
								}
							} else {
								alert("An error has occurred");
							}
						},
						error: function(data) {
							alert("An error has occurred");
						}
					});
					
				});
				
				$("img").css("cursor", "pointer");
				
				$("#viewExpenses").click(function() {
					
					var id = $("select[name=months]").val();
					var title = $("select[name=months] option[value=" + id + "]").attr("title");
	
					$("#actualIncomeExpenseModal .modal-body").html(" <img alt='Actual Income Expense is not available' src='" + contextPath + "/visualization/actualincomeexpensesubchart/" + id + "/550/400/" + title  + "' /> ");
					$("#actualIncomeExpenseModal").modal();
					
				});
				
				$("#projectedActualIncomeExpenseChart").click(function() {
					$("#projectedActualIncomeExpenseSubModal").modal();
				});
				
				//notif
				$("#amgNotif, #fadNotif, #fmgNotif, #spgNotif").click(function() {
					
					//send ajax call that will set the notification visible=0 for that user only
					var userId = $(this).attr("fooId");
					var groupId = $(this).attr("groupId");
					
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/tactical/refresh",
						data: {
							userId : userId,
							groupId : groupId
						},
						success: function(data) {
							if(data) {
								var data = $.parseJSON(data);
								if(data.status) {
									$("#" + groupId.toLowerCase() + "Notif span").hide();
								} else {
									alert("An error has occurred");
								}
							} else {
								alert("An error has occurred");
							}
						},
						error: function(data) {
							alert("An error has occurred");
						}
					});
					
				});
				
				//edit profile
				$("#editProfileBtn").click(function(e) {
					e.preventDefault();
					
					$("#editProfileMessage").hide();
					
					var username = $(this).attr("usr");
					
					//call ajax
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/editProfile",
						data: {
							username: username
						},
						success: function(data) {
							if(data) {
								
								var data = $.parseJSON(data);
								
								if(data.id != null) {
									//open modal and populate fields
									$("#editFirstName").val(data.firstName);
									$("#editMiddleName").val(data.middleName);
									$("#editLastName").val(data.lastName);
									$("#editUsername").html(data.username);
									$("#foo").val(data.id);
									
									$("#editProfileModal").modal();
								} else {
									alert("Error occurred");
								}
							} else {
								alert("Error occurred");
							}
						},
						error: function(data) {
							alert("Error occurred");
						}
					});
					
				});
				
				$("#editProfileForm").submit(function() {
					$("#editProfileSubmit").button('loading');
				});
				
				//submit edit profile
				$("#editProfileSubmit").click(function(e) {
					e.preventDefault();
					
					var id = $("#foo").val();
					var firstName = $("#editFirstName").val();
					var middleName = $("#editMiddleName").val();
					var lastName = $("#editLastName").val();
					var password = $("#editPassword").val();
					var confirmPassword = $("#editConfirmPassword").val();
					
					if(firstName == null || firstName == "") {
						
						$("#editProfileMessage").show();
						$("#editProfileMessage").html("First name is required");
						$("#editProfileMessage").addClass('alert').addClass('alert-error');
						$("#editProfileMessage").css('fontWeight','bold');
						
						return;
					}
					if(middleName == null || middleName == "") {
						
						$("#editProfileMessage").show();
						$("#editProfileMessage").html("Middle name is required");
						$("#editProfileMessage").addClass('alert').addClass('alert-error');
						$("#editProfileMessage").css('fontWeight','bold');
						
						return;
					}
					if(lastName == null || lastName == "") {
						
						$("#editProfileMessage").show();
						$("#editProfileMessage").html("Last name is required");
						$("#editProfileMessage").addClass('alert').addClass('alert-error');
						$("#editProfileMessage").css('fontWeight','bold');
						
						return;
					}
					if(password == null || password == "") {
						
						$("#editProfileMessage").show();
						$("#editProfileMessage").html("Password is required");
						$("#editProfileMessage").addClass('alert').addClass('alert-error');
						$("#editProfileMessage").css('fontWeight','bold');
						
						return;
					}
					if(password.length < 8 || password.length > 10) {
						
						$("#editProfileMessage").show();
						$("#editProfileMessage").html("Password should be 8-10 characters");
						$("#editProfileMessage").addClass('alert').addClass('alert-error');
						$("#editProfileMessage").css('fontWeight','bold');
						
						return;
					}
					if(confirmPassword != password) {
						
						$("#editProfileMessage").show();
						$("#editProfileMessage").html("Passwords do not match.");
						$("#editProfileMessage").addClass('alert').addClass('alert-error');
						$("#editProfileMessage").css('fontWeight','bold');
						
						return;
					}
					
					$.ajax({
						async: false,
						type: "POST",
						url: contextPath + "/dashboard/editProfileSubmit",
						data: {
							id : id,
							firstName : firstName,
							middleName : middleName,
							lastName : lastName,
							password : password
						},
						success: function(data) {
							if(data) {
								
								var data = $.parseJSON(data);
								
								if(data.status == true) {
									$("#editProfileMessage").html(data.message);
									$("#editProfileMessage").css("color", "green");
									$("#editProfileMessage").css("fontWeight", "bold");
									$("#editProfileMessage").css("marginBottom", "10px");
									$("#editProfileMessage").css("fontSize", "20px");
									
									window.location.href = contextPath;
								} else {
									$("#editProfileMessage").html(data.message);
									$("#editProfileMessage").css("color", "red");
									$("#editProfileMessage").css("fontWeight", "bold");
									$("#editProfileMessage").css("marginBottom", "10px");
									$("#editProfileMessage").css("fontSize", "20px");
								}
								
							} else {
								alert("An error has occurred");
							}
						},
						error: function(data) {
							alert("An error has occurred");
						}
					});
					
					$(this).button('reset');
					
				});
				
				//delete a user
				$(".deleteBtn").click(function(e) {
					e.preventDefault();
					
					var id = $(this).attr("systemID");
					$("#deleteModal #deleteId").val(id);
					
					$("#deleteModal").modal();
				});
				
				//maps
				//luzon
				$(".groupIsabela").colorbox({rel:'groupIsabela', transition:"none", width:"75%", height:"90%"});
				$(".groupPampanga1").colorbox({rel:'groupPampanga1', transition:"none", width:"75%", height:"90%"});
				$(".groupPampanga2").colorbox({rel:'groupPampanga2', transition:"none", width:"75%", height:"90%"});
				$(".groupManila").colorbox({rel:'groupManila', transition:"none", width:"75%", height:"90%"});
				$(".groupCavite").colorbox({rel:'groupCavite', transition:"none", width:"75%", height:"90%"});
				$(".groupNuevaecija").colorbox({rel:'groupNuevaecija', transition:"none", width:"75%", height:"90%"});
				$(".groupAntipolo").colorbox({rel:'groupAntipolo', transition:"none", width:"75%", height:"90%"});
				$(".groupLaguna").colorbox({rel:'groupLaguna', transition:"none", width:"75%", height:"90%"});
				
				//visayas
				$(".groupCebu1").colorbox({rel:'groupCebu1', transition:'none', width:'75%', height:'90%'});
				$(".groupCebu2").colorbox({rel:'groupCebu2', transition:'none', width:'75%', height:'90%'});
				
				//mindanao
				$(".groupIligan").colorbox({rel:'groupIligan', transition:'none', width:'75%', height:'90%'});
				$(".groupZamboanga").colorbox({rel:'groupZamboanga', transition:'none', width:'75%', height:'90%'});
				$(".groupDavao").colorbox({rel:'groupDavao', transition:'none', width:'75%', height:'90%'});
				$(".groupCotabato").colorbox({rel:'groupCotabato', transition:'none', width:'75%', height:'90%'});
				
				
				
				//make all form textfields required using HTML5
				$("form input[type=text],input[type=password]").attr("required", "required");
				
				//make some fields numeric only
				$('input[constraint=number]').keypress(validateNumber);
				
// 				//dynamically add input when mmoe expenses is clicked,
// 				$("input[id=mooeExpenses]").click(function() {
// 					alert("Hello");
// 				});

				//datatables
				$(".table").dataTable({
					"sPaginationType": "full_numbers",
					"aaSorting": []
				});
				
			});
			
			function addCommas(nStr) {
			    nStr += '';
			    x = nStr.split('.');
			    x1 = x[0];
			    x2 = x.length > 1 ? '.' + x[1] : '';
			    var rgx = /(\d+)(\d{3})/;
			    while (rgx.test(x1)) {
			        x1 = x1.replace(rgx, '$1' + ',' + '$2');
			    }
			    return x1 + x2;
			}
			
			/*** ACTUAL INCOME ***/
			function getTotal() {
				
				var actualDividend = Number($("#actualDividend").val());
				var actualInterest = Number($("#actualInterest").val());
				var actualRental = Number($("#actualRental").val());
				var actualGainOnSale = Number($("#actualGainOnSale").val());
				var actualOtherIncome = Number($("#actualOtherIncome").val());
				
				var total = actualDividend + actualInterest + actualRental + actualGainOnSale + actualOtherIncome;
				
				$("#actualIncome").val(total);
				
			}
			
			/*** PROJECTED INCOME ***/
			function getProjectedTotal() {
				
				var projectedDividend = Number($("#projectedDividend").val());
				var projectedInterest = Number($("#projectedInterest").val());
				var projectedRental = Number($("#projectedRental").val());
				var projectedGainOnSale = Number($("#projectedGainOnSale").val());
				var projectedOtherIncome = Number($("#projectedOtherIncome").val());
				
				var total = projectedDividend + projectedInterest + projectedRental + projectedGainOnSale + projectedOtherIncome;
				
				$("#projectedIncome").val(total);
				
			}
			
			function validateNumber(event) {
			    var key = window.event ? event.keyCode : event.which;

			    if (event.keyCode == 8 || event.keyCode == 46
			     || event.keyCode == 37 || event.keyCode == 39) {
			        return true;
			    }
			    else if ( key < 48 || key > 57 ) {
			        return false;
			    }
			    else return true;
			};