
function createOccupancyPieChart(url, width, height) {
	
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

			var occupancyPieChart;
			   
			// Build the chart
			occupancyPieChart = new Highcharts.Chart({
				chart: {
					renderTo: 'occupancyPieChartDiv',
					width: width,
					height: height
				},
				title: {
					text: '<b>NDC & I&I Bldg. Occupancy Rate</b>'
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
					data: [{name: "Occupied", y: data.Occupied}, 
						   {name: "Vacant", y: data.Vacant}
						  ]
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