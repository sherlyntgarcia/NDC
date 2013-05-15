/* 
dashboard_default_options.js	v. 1.0

Author: Arvin Bernabe
Date Created: 2013-03-08

This contains default settings for all charts.
*/

// Set Global Options that will be used by all charts.
Highcharts.setOptions({
    chart: {
    	backgroundColor: null,
		shadow: true,
		spacingLeft: 20,
        spacingRight: 20
    },
    credits: {
		href: '',
		enabled: false
	},
	exporting: {
		enabled: false,
		chartOptions: {
	        chart: {
	        	backgroundColor: '#000000'
	        }
	    }
	},
	title: {
		style: {
			fontFamily: 'Tahoma, Arial, Helvetica, sans-serif',
			color: '#000000'
		}
	},
	subtitle: {
		style: {
			fontFamily: 'Tahoma, Arial, Helvetica, sans-serif',
			color: '#000000'
		}
	},
	tooltip: {
		style: {
			fontFamily: 'Tahoma, Arial, Helvetica, sans-serif',
			fontSize: '9px',
			color: '#000000'
		}
	},
	legend: {
    	borderColor: '#000000',
    	borderRadius: 3,
    	itemStyle: {
			fontFamily: 'Tahoma, Arial, Helvetica, sans-serif',
			fontSize: '9px',
			color: '#000000'
		},
		itemHoverStyle: {
			color: '#000000'
		}
    }
});