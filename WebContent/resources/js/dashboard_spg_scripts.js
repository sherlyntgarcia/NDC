
function createShareholdersPieChart(url, width, height, id) {
	
	//Initialize the colors that will be used and make it gradient.
	var colors = ['#C10000','#FF2222'];
	
	$.ajax({
		type: "POST",
		url: url + "/" + id,
		dataType: "json",
		cache: false,
		error: function (jqXHR, textStatus, errorThrown) { },
		success: function (data) {

			var shareholdersPieChart;
			var shareholdersList = data.shareholdersList;
			var sharesList = data.sharesList;
			var mySeries = [];
			
			for(var i=0; i<shareholdersList.length; i++) {
				mySeries.push([shareholdersList[i], sharesList[i]]);
			}
			
			mySeries = prepare(mySeries);
			
			// Build the chart
			shareholdersPieChart = new Highcharts.Chart({
				chart: {
					renderTo: 'shareholdersPieChartDiv',
					width: width,
					height: height
				},
				title: {
					text: '<b>Shareholders</b>'
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
								return '<span style="font-weight:bold;font-size:12px">'+ this.point.x +'</span>: <span style="font-size:12px">'+ this.percentage.toFixed(2) +' % </span>';
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