
function createLoanProceedsAllocationPieChart(url, width, height) {
	
	//Initialize the colors that will be used and make it gradient.
	var colors = ['#C10000','#FF2222','#AD1F3C', '#AD8DA0', '#DF7000', '#E1A042', 
	              '#DDF361', '#EAE413', '#06CADF', '#66ECFB', '#245A86', '#6FA9D9', 
	              '#6C288A', '#B46BD3', '#248626', '#79DB7B', '#5A745B', '#A9BCA9', 
	              '#400000'];
	
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
						return '<span style="font-size:13px;">' +this.point.name+ '</span> <br/> <span style="font-size:13px">' +
	                    			  this.percentage.toFixed(2) + '%</span> (<b>' + ReplaceNumberWithCommas(this.y) + '</b>)';
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
								return '<span style="font-weight:bold;font-size:12px">'+ this.point.name +'</span>: <span style="font-size:12px">'+ this.percentage.toFixed(2) +' % </span>';
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

function createLoanProceedsUtilizationPieChart(url, width, height) {
	
	//Initialize the colors that will be used and make it gradient.
	var colors = ['#C10000','#FF2222'];
	
	$.ajax({
		type: "POST",
		url: url,
		dataType: "json",
		cache: false,
		error: function (jqXHR, textStatus, errorThrown) { },
		success: function (data) {

			var loanProceedsUtilizationPieChart;
			   
			// Build the chart
			loanProceedsUtilizationPieChart = new Highcharts.Chart({
				chart: {
					renderTo: 'loanProceedsUtilizationPieChartDiv',
					width: width,
					height: height
				},
				title: {
					text: '<b>Utilization of NIA Loan Proceeds</b>'
				},
				tooltip: {
					formatter: function() {
						return '<span style="font-size:13px;">' +this.point.name+ '</span> <br/> <span style="font-size:13px">' +
	                    			  this.percentage.toFixed(2) + '%</span>';
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
								return '<span style="font-weight:bold;font-size:12px">'+ this.point.name +'</span>: <span style="font-size:12px">'+ this.percentage.toFixed(2) +' % </span>';
							},
							style: {
								fontFamily: 'Tahoma, Arial, Helvetica, sans-serif'
							}
						}
					}
				},
				series: [{
					type: 'pie',
					data: [{name: "Repair,Rehab,Restore", y: data.Repair}, 
						   {name: "Farm to Market Roads", y: data.Rehab}
						  ]
				}]
			});
		}
	});	
}

function createAgriAgraBondsPieChart(url, width, height) {
	
	//Initialize the colors that will be used and make it gradient.
	var colors = ['#C10000','#FF2222'];
	
	$.ajax({
		type: "POST",
		url: url,
		dataType: "json",
		cache: false,
		error: function (jqXHR, textStatus, errorThrown) { },
		success: function (data) {

			var agriAgraBondsPieChart;
			var years = data.years;
			var amounts = data.amounts;
			
			var mySeries = [];
			
			for(var i=0; i<years.length; i++) {
				mySeries.push([years[i], amounts[i]]);
			}
			
			//add unutilized
			mySeries.push(["Unutilized", data.unutilized]);
			
			mySeries = prepare(mySeries);
			
			// Build the chart
			agriAgraBondsPieChart = new Highcharts.Chart({
				chart: {
					renderTo: 'agriAgraBondsPieChartDiv',
					width: width,
					height: height
				},
				title: {
					text: '<b>Balance of NDC Agri Agra Bonds(' + data.dateUpdated + ')</b>'
				},
				tooltip: {
					formatter: function() {
						return '<span style="font-size:13px;">' +this.point.x + '</span> <br/> <span style="font-size:13px">' +
	                    			  this.percentage.toFixed(2) + '%</span> (<b>' + ReplaceNumberWithCommas(this.y) + '</b>)';
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
								return '<span style="font-size:13px;">' +this.point.x + '</span> <br/> <span style="font-size:13px">' +
                  			  this.percentage.toFixed(2) + '%</span> (<b>' + abbrNum(this.y,2) + '</b>)';
							},
							style: {
								fontFamily: 'Tahoma, Arial, Helvetica, sans-serif'
							}
						}
					}
				},
				series: [{
					type: 'pie',
					data: mySeries
				}]
			});
		}
	});	
}

function prepare(dataArray) {
    return dataArray.map(function (item, index) {
        return {x: item[0], y: item[1], myIndex: index};
    });
};

function abbrNum(number, decPlaces) {
    // 2 decimal places => 100, 3 => 1000, etc
    decPlaces = Math.pow(10,decPlaces);

    // Enumerate number abbreviations
    var abbrev = [ "K", "M", "B", "T" ];

    // Go through the array backwards, so we do the largest first
    for (var i=abbrev.length-1; i>=0; i--) {

        // Convert array index to "1000", "1000000", etc
        var size = Math.pow(10,(i+1)*3);

        // If the number is bigger or equal do the abbreviation
        if(size <= number) {
             // Here, we multiply by decPlaces, round, and then divide by decPlaces.
             // This gives us nice rounding to a particular decimal place.
             number = Math.round(number*decPlaces/size)/decPlaces;

             // Handle special case where we round up to the next abbreviation
             if((number == 1000) && (i < abbrev.length - 1)) {
                 number = 1;
                 i++;
             }

             // Add the letter for the abbreviation
             number += abbrev[i];

             // We are done... stop
             break;
        }
    }

    return number;
}