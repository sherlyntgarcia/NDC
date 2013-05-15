/* 
dashboard_ops_scripts.js	v. 1.0

Author: Arvin Bernabe
Date Created: 2013-02-18

This contains all chart related function scripts that are being used by the 
FMG Dashboard.
*/

function createLoanProceedsAllocationPieChart(url, width, height) {
	
	//Initialize the colors that will be used and make it gradient.
	var colors = ['#C10000','#FF2222','#AD1F3C', '#AD8DA0', '#DF7000', '#E1A042', 
	              '#DDF361', '#EAE413', '#06CADF', '#66ECFB', '#245A86', '#6FA9D9', 
	              '#6C288A', '#B46BD3', '#248626', '#79DB7B', '#5A745B', '#A9BCA9', 
	              '#400000'];

	Highcharts.getOptions().colors = $.map(colors, function(color) {
		return {
			radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
			stops: [
				[0, color],
				[1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
			]
		};
	});
	
	$.ajax({
		type: "POST",
		url: url,
		dataType: "json",
		cache: false,
		error: function (jqXHR, textStatus, errorThrown) { },
		success: function (data) {

			var loanProceedsAllocationPieChart;
			   
			// Build the chart
			loanProceedsAllocationPieChart = new Highcharts.Chart({
				chart: {
					renderTo: 'loanProceedsAllocationPieChartDiv',
					width: width,
					height: height
				},
				title: {
					text: '<b>Loan proceeds allocation (per region)</b>'
				},
				tooltip: {
					formatter: function() {
						return '<span style="color:'+this.point.color.stops[0][1]+'">' +this.point.name+ '</span> <br/>' +
	                    			  this.percentage.toFixed(2) + '% (<b>' + this.y + '</b>)';
	                },
					backgroundColor: '#FFFFFF'
				},
				legend: {
					align: 'right',
					layout: 'vertical',
					verticalAlign: 'middle',
					itemMarginBottom: 5
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						borderWidth: 2,
						showInLegend: false,
						dataLabels: {
							enabled: true,
							color: '#000000',
							connectorColor: '#000000',
							connectorPadding: 5,
							distance: 30,
							formatter: function() {
								return '<b>'+ this.point.name +'</b>: '+ this.percentage.toFixed(2) +' %';
							},
							style: {
								fontFamily: 'Tahoma, Arial, Helvetica, sans-serif'
							}
						}
					}
				},
				series: [{
					type: 'pie',
					data: [{name: "CAR", y: data.CAR}, 
						   {name: "I", y: data.I},
						   {name: "ARIIP", y: data.ARIIP},
						   {name: "II", y: data.II},
						   {name: "MARIIS", y: data.MARIIS},
						   {name: "III", y: data.III},
						   {name: "UPRIIS", y: data.UPRIIS},
						   {name: "IV", y: data.IV},
						   {name: "V", y: data.V},
						   {name: "VI", y: data.VI},
						   {name: "VII", y: data.VII},
						   {name: "VIII", y: data.VIII},
						   {name: "IX", y: data.IX},
						   {name: "X", y: data.X},
						   {name: "XI", y: data.XI},
						   {name: "XII", y: data.XII},
						   {name: "XIII", y: data.XIII},
						   {name: "ARMM", y: data.ARMM},
						   {name: "NCR", y: data.NCR}
						  ]
				}]
			});
		}
	});	
}