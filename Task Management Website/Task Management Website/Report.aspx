<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Task_Management_Website.Test1" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Report</title>

	<!-- stylesheets -->
	<link href="assetss/fonts/font-roboto.css" rel="stylesheet">
	<link href="assetss/bootstrap/bootstrap4-alpha3.min.css" rel="stylesheet">
	<link href="assetss/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="assetss/web-analytics/style.css" rel="stylesheet">

	<!-- scripts -->
	<script src="assetss/jquery/jquery-3.1.0.min.js"></script>
	<script src="assetss/tether/tether.min.js"></script>
	<script src="assetss/bootstrap/bootstrap4-alpha3.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>


</head>

<body>
	<!-- page-content-wrapper -->
	<div class="page-content-toggle" id="page-content-wrapper">
		<div class="container-fluid">

			<!-- 1st row -->
			<div class="row m-b-1">
				<div class="col-md-12">
					<div class="card card-block">
						<h4 class="card-title m-b-2">Tasks Created 2019 <span class="tag m-l-1" id="revenue-tag"></span></h4>
						<div id="revenue-spline-area-chart"></div>
					</div>
				</div>
			</div>
			<!-- /1st row -->

			<!-- 2nd row -->
			<div class="row m-b-1">
				<div class="col-md-12">
					<div class="card card-block">
						<h4 class="card-title m-b-2">Tasks By Category</h4>
						<span class="tag custom-tag hidden-sm-down">To view more detail about the category click on it</span>
						<div class="row">
							<div class="col-md-4">
								<div id="annual-revenue-by-category-pie-chart"></div>
							</div>
							<div class="col-md-8 hidden-sm-down">
								<div id="monthly-revenue-by-category-column-chart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /2nd row -->

			<!-- 3rd row -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card card-block">
						<h4 class="card-title m-b-2">
							<span id="visitors-chart-heading">Software Development vs Cyber Security Division solved tasks </span>
							<button class="btn pull-right invisible" type="button" id="visitors-chart-back-button"><i class="fa fa-angle-left fa-lg" aria-hidden="true"></i> Back</button>
						</h4>
						<span class="tag custom-tag" id="visitors-chart-tag">To view more click on the category</span>
						<div id="visitors-chart"></div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card card-block">
						<h4 class="card-title m-b-2">New Employees Added For Current Year</h4>
						<div id="users-spline-chart"></div>
					</div>
				</div>
			</div>
			<!-- /3rd row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /page-content-wrapper -->
<script>
	$(function () {
	var totalRevenue = 2781460,
			totalVisitors = 884000;
	

	// data for drilldown charts
	var dataMonthlyRevenueByCategory = {
		"Paused Task": {
			color: "#393f63",
			markerSize: 0,
			name: "Paused Task",
			type: "column",
			yValueFormatString: "###,###.00",
			dataPoints: [
				{ x: new Date("1 Jan 2019"), y: 259.50 },
				{ x: new Date("1 Feb 2019"), y: 234.00 },
				{ x: new Date("1 Mar 2019"), y: 299.00 },
				{ x: new Date("1 Apr 2019"), y: 207.00 },
				{ x: new Date("1 May 2019"), y: 362.00 },
				{ x: new Date("1 Jun 2019"), y: 308.00 },
				{ x: new Date("1 Jul 2019"), y: 287.00 },
				{ x: new Date("1 Aug 2019"), y: 306.00 },
				{ x: new Date("1 Sep 2019"), y: 252.00 },
				{ x: new Date("1 Oct 2019"), y: 211.00 },
				{ x: new Date("1 Nov 2019"), y: 309.00 },
				{ x: new Date("1 Dec 2019"), y: 379.00 }
			]
		},
		"Medium Priority": {
			color: "#e5d8b0",
			markerSize: 0,
			name: "Medium Priority",
			type: "column",
			yValueFormatString: "###,###.00",
			dataPoints: [
				{ x: new Date("1 Jan 2019"), y: 190.50 },
				{ x: new Date("1 Feb 2019"), y: 156.00 },
				{ x: new Date("1 Mar 2019"), y: 342.00 },
				{ x: new Date("1 Apr 2019"), y: 248.00 },
				{ x: new Date("1 May 2019"), y: 317.00 },
				{ x: new Date("1 Jun 2019"), y: 260.00 },
				{ x: new Date("1 Jul 2019"), y: 240.00 },
				{ x: new Date("1 Aug 2019"), y: 362.00 },
				{ x: new Date("1 Sep 2019"), y: 340.00 },
				{ x: new Date("1 Oct 2019"), y: 260.00 },
				{ x: new Date("1 Nov 2019"), y: 362.00 },
				{ x: new Date("1 Dec 2019"), y: 434.00 }
			]
		},
		"Low Priority": {
			color: "#ffb367",
			markerSize: 0,
			name: "Low Priority",
			type: "column",
			yValueFormatString: "###,###.00",
			dataPoints: [
				{ x: new Date("1 Jan 2019"), y: 410.00 },
				{ x: new Date("1 Feb 2019"), y: 413.00 },
				{ x: new Date("1 Mar 2019"), y: 420.00 },
				{ x: new Date("1 Apr 2019"), y: 372.00 },
				{ x: new Date("1 May 2019"), y: 368.00 },
				{ x: new Date("1 Jun 2019"), y: 440.00 },
				{ x: new Date("1 Jul 2019"), y: 304.00 },
				{ x: new Date("1 Aug 2019"), y: 361.00 },
				{ x: new Date("1 Sep 2019"), y: 400.00 },
				{ x: new Date("1 Oct 2019"), y: 334.00 },
				{ x: new Date("1 Nov 2019"), y: 266.00 },
				{ x: new Date("1 Dec 2019"), y: 351.00 }
			]
		},
		"Overdue Tasks": {
			color: "#f98461",
			markerSize: 0,
			name: "Overdue Tasks",
			type: "column",
			yValueFormatString: "###,###.00",
			dataPoints: [
				{ x: new Date("1 Jan 2019"), y: 125.00 },
				{ x: new Date("1 Feb 2019"), y: 272.00 },
				{ x: new Date("1 Mar 2019"), y: 254.00 },
				{ x: new Date("1 Apr 2019"), y: 166.00 },
				{ x: new Date("1 May 2019"), y: 136.00 },
				{ x: new Date("1 Jun 2019"), y: 176.00 },
				{ x: new Date("1 Jul 2019"), y: 239.00 },
				{ x: new Date("1 Aug 2019"), y: 154.00 },
				{ x: new Date("1 Sep 2019"), y: 252.00 },
				{ x: new Date("1 Oct 2019"), y: 211.00 },
				{ x: new Date("1 Nov 2019"), y: 154.00 },
				{ x: new Date("1 Dec 2019"), y: 108.00 }
			]
		},
		"High Priority": {
			color: "#d9695f",
			markerSize: 0,
			name: "High Priority",
			type: "column",
			yValueFormatString: "###,###.00",
			dataPoints: [
				{ x: new Date("1 Jan 2019"), y: 693.00 },
				{ x: new Date("1 Feb 2019"), y: 878.00 },
				{ x: new Date("1 Mar 2019"), y: 813.00 },
				{ x: new Date("1 Apr 2019"), y: 108.00 },
				{ x: new Date("1 May 2019"), y: 108.00 },
				{ x: new Date("1 Jun 2019"), y: 101.00 },
				{ x: new Date("1 Jul 2019"), y: 125.00 },
				{ x: new Date("1 Aug 2019"), y: 132.00 },
				{ x: new Date("1 Sep 2019"), y: 120.00 },
				{ x: new Date("1 Oct 2019"), y: 132.00 },
				{ x: new Date("1 Nov 2019"), y: 119.00 },
				{ x: new Date("1 Dec 2019"), y: 113.00 }
			]
		}
	};
	
	// data for drilldown charts
	var dataVisitors = {
		"Software Development vs Cyber Security Division": [
			{
				click: visitorsChartDrilldownHandler,
				cursor: "pointer",
				explodeOnClick: false,
				innerRadius: "75%",
				legendMarkerType: "square",
				name: "Software Development vs Cyber Security Division",
				radius: "100%",
				showInLegend: true,
				startAngle: 90,
				type: "doughnut",
				dataPoints: [
					{ y: 519960, name: "Software Development", color: "#393f63" },
					{ y: 363040, name: "Cyber Security", color: "#f98461" }
				]
			}
		],
		"Software Development": [
			{
				color: "#393f63",
				name: "Software Development",
				type: "column",
				dataPoints: [
					{ x: new Date("1 Jan 2019"), y: 330 },
					{ x: new Date("1 Feb 2019"), y: 359 },
					{ x: new Date("1 Mar 2019"), y: 421 },
					{ x: new Date("1 Apr 2019"), y: 422 },
					{ x: new Date("1 May 2019"), y: 432 },
					{ x: new Date("1 Jun 2019"), y: 406 },
					{ x: new Date("1 Jul 2019"), y: 425 },
					{ x: new Date("1 Aug 2019"), y: 442 },
					{ x: new Date("1 Sep 2019"), y: 448 },
					{ x: new Date("1 Oct 2019"), y: 487 },
					{ x: new Date("1 Nov 2019"), y: 508 },
					{ x: new Date("1 Dec 2019"), y: 516 }
				]
			}
		],
		"Cyber Security": [
			{
				color: "#f98461",
				name: "Cyber Security",
				type: "column",
				dataPoints: [
					{ x: new Date("1 Jan 2019"), y: 220 },
					{ x: new Date("1 Feb 2019"), y: 260 },
					{ x: new Date("1 Mar 2019"), y: 258 },
					{ x: new Date("1 Apr 2019"), y: 237 },
					{ x: new Date("1 May 2019"), y: 288 },
					{ x: new Date("1 Jun 2019"), y: 294 },
					{ x: new Date("1 Jul 2019"), y: 334 },
					{ x: new Date("1 Aug 2019"), y: 378 },
					{ x: new Date("1 Sep 2019"), y: 352 },
					{ x: new Date("1 Oct 2019"), y: 353 },
					{ x: new Date("1 Nov 2019"), y: 311 },
					{ x: new Date("1 Dec 2019"), y: 344 }
				]
			}
		]
	};
	
	// CanvasJS spline area chart to show revenue from Jan 2019 - Dec 2019
	var revenueSplineAreaChart = new CanvasJS.Chart("revenue-spline-area-chart", {
		animationEnabled: true,
		backgroundColor: "transparent",
		axisX: {
			interval: 3,
			intervalType: "month",
			labelFontColor: "#717171",
			labelFontSize: 16,
			lineColor: "#a2a2a2",
			minimum: new Date("1 Jan 2019"),
			tickColor: "#a2a2a2",
			valueFormatString: "MMM YYYY"
		},
		axisY: {
			gridThickness: 0,
			includeZero: false,
			labelFontColor: "#717171",
			labelFontSize: 16,
			lineColor: "#a2a2a2",
			prefix: "",
			tickColor: "#a2a2a2"
		},
		toolTip: {
			borderThickness: 0,
			cornerRadius: 0,
			fontStyle: "normal"
		},
		data: [
			{
				color: "#393f63",
				markerSize: 0,
				type: "splineArea",
				yValueFormatString: "###,###.##",
				dataPoints: [
					{ x: new Date("1 Jan 2019"), y: 352 },
					{ x: new Date("1 Feb 2019"), y: 400 },
					{ x: new Date("1 Mar 2019"), y: 389 },
					{ x: new Date("1 Apr 2019"), y: 370 },
					{ x: new Date("1 May 2019"), y: 600 },
					{ x: new Date("1 Jun 2019"), y: 650 },
					{ x: new Date("1 Jul 2019"), y: 500 },
					{ x: new Date("1 Aug 2019"), y: 478},
					{ x: new Date("1 Sep 2019"), y: 350},
					{ x: new Date("1 Oct 2019"), y: 300 },
					{ x: new Date("1 Nov 2019"), y: 245 },
					{ x: new Date("1 Dec 2019"), y: 224 }
				]
			}
		]
	});
	
	revenueSplineAreaChart.render();
	
	// CanvasJS pie chart to show annual revenue by category
	var annualRevenueByCategoryPieChart = new CanvasJS.Chart("annual-revenue-by-category-pie-chart", {
		animationEnabled: true,
		backgroundColor: "transparent",
		legend: {
			fontFamily: "calibri",
			fontSize: 14,
			horizontalAlign: "left",
			verticalAlign: "center",
			itemTextFormatter: function (e) {
				return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalRevenue * 100) + "%";  
			}
		},
		toolTip: {
			backgroundColor: "#ffffff",
			cornerRadius: 0,
			fontStyle: "normal",
			contentFormatter: function (e) {
				return e.entries[0].dataPoint.name + ": " + CanvasJS.formatNumber(e.entries[0].dataPoint.y, "###,###.00") + " - " + Math.round(e.entries[0].dataPoint.y / totalRevenue * 100) + "%";  
			}
		},
		data: [
			{
				click: monthlyRevenueByCategoryDrilldownHandler,
				cursor: "pointer",
				legendMarkerType: "square",
				showInLegend: true,
				startAngle: 90,
				type: "pie",
				dataPoints: [
					{ y: 342373.50, name:"Paused Task", color: "#393f63" },
					{ y: 348421.50, name:"Medium Priority", color: "#e5d8b0" },
					{ y: 553455.00, name:"Low Priority", color: "#ffb367" },
					{ y: 230391.00, name:"Overdue Tasks", color: "#f98461" },
					{ y: 1306809.00, name:"High Priority", color: "#d9695f" }
				]
			}
		]
	});
	
	// CanvasJS multiseries column chart to show monthly revenue by category
	var monthlyRevenueByCategoryColumnChart = new CanvasJS.Chart("monthly-revenue-by-category-column-chart", {
		animationEnabled: true,
		backgroundColor: "transparent",
		axisX: {
			interval: 2,
			intervalType: "month",
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2"
		},
		axisY: {
			gridThickness: 0,
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			maximum: 1000,
			prefix: "",
			tickColor: "#a2a2a2"
		},
		toolTip: {
			backgroundColor: "#737580",
			borderThickness: 0,
			cornerRadius: 0,
			fontColor: "#ffffff",
			fontSize: 16,
			fontStyle: "normal",
			shared: true
		},
		data: []
	});

	populateMonthlyRevenueByCategoryChart();
	monthlyRevenueByCategoryColumnChart.render();

	var visitorsDrilldownedChartOptions = {
		animationEnabled: true,
		backgroundColor: "transparent",
		axisX: {
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2"
		},
		axisY: {
			gridThickness: 0,
			includeZero: false,
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2"
		},
		toolTip: {
			cornerRadius: 0,
			fontStyle: "normal"
		},
		data: []
	};
	
	var newVsReturningVisitorsChartOptions = {
		animationEnabled: true,
		backgroundColor: "transparent",
		legend: {
			fontFamily: "calibri",
			fontSize: 14,
			itemTextFormatter: function (e) {
				return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
			}
		},
		toolTip: {
			cornerRadius: 0,
			fontStyle: "normal",
			contentFormatter: function (e) {
				return e.entries[0].dataPoint.name + ": " + CanvasJS.formatNumber(e.entries[0].dataPoint.y, "###,###") + " - " + Math.round(e.entries[0].dataPoint.y / totalVisitors * 100) + "%";  
			} 
		},
		data: []
	};	

	// CanvasJS doughnut chart to show new vs returning visitors
	var visitorsChart = new CanvasJS.Chart("visitors-chart", newVsReturningVisitorsChartOptions);
	visitorsChart.options.data = dataVisitors["Software Development vs Cyber Security Division"];
	
	visitorsChart.render();

	// CanvasJS spline chart to show users from Jan 2015 - Dec 2015
	var usersSplineChart = new CanvasJS.Chart("users-spline-chart", {
		animationEnabled: true,
		backgroundColor: "transparent",
		axisX: {
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2"
		},
		axisY: {
			gridThickness: 0,
			includeZero: false,
			labelFontColor: "#717171",
			lineColor: "#a2a2a2",
			tickColor: "#a2a2a2"
		},
		toolTip: {
			borderThickness: 1,
			cornerRadius: 0,
			fontStyle: "normal"
		},
		data: [
			{
				color: 	"#393F63", 
				lineThickness: 3,
				markerSize: 0,
				type: "spline",
				dataPoints: [
					{ x: new Date("1 Jan 2019"), y: 5 },
					{ x: new Date("1 Feb 2019"), y: 1 },
					{ x: new Date("1 Mar 2019"), y: 0 },
					{ x: new Date("1 Apr 2019"), y: 0 },
					{ x: new Date("1 May 2019"), y: 10 },
					{ x: new Date("1 Jun 2019"), y: 8 },
					{ x: new Date("1 Jul 2019"), y: 2 },
					{ x: new Date("1 Aug 2019"), y: 0 },
					{ x: new Date("1 Sep 2019"), y: 0 },
					{ x: new Date("1 Oct 2019"), y: 1 },
					{ x: new Date("1 Nov 2019"), y: 0 },
					{ x: new Date("1 Dec 2019"), y: 0 }
				]
			}
		]
	});
	
	usersSplineChart.render();	
	
	//----------------------------------------------------------------------------------//
	var allCharts = [
		revenueSplineAreaChart,
		annualRevenueByCategoryPieChart,
		monthlyRevenueByCategoryColumnChart,
		visitorsChart,
		usersSplineChart
	];
	
	function populateMonthlyRevenueByCategoryChart() {
		for (var prop in dataMonthlyRevenueByCategory)
			if  (dataMonthlyRevenueByCategory.hasOwnProperty(prop))
				monthlyRevenueByCategoryColumnChart.options.data.push( dataMonthlyRevenueByCategory[prop] );
	}
	
	function monthlyRevenueByCategoryDrilldownHandler(e) {
		monthlyRevenueByCategoryColumnChart.options.data = [];

		for (var i = 0; i < annualRevenueByCategoryPieChart.options.data[0].dataPoints.length; i++)
			if (annualRevenueByCategoryPieChart.options.data[0].dataPoints[i].exploded === true)
				monthlyRevenueByCategoryColumnChart.options.data.push( dataMonthlyRevenueByCategory[annualRevenueByCategoryPieChart.options.data[0].dataPoints[i].name] );

		if (monthlyRevenueByCategoryColumnChart.options.data.length === 0)
			populateMonthlyRevenueByCategoryChart();

		monthlyRevenueByCategoryColumnChart.render();
	}
	
	var visitorsChartHeadingDOM = $("#visitors-chart-heading"),
			visitorsChartBackButtonDOM = $("#visitors-chart-back-button"),
			visitorsChartTagDOM = $("#visitors-chart-tag");
	
	function visitorsChartDrilldownHandler (e) {
		visitorsChart = new CanvasJS.Chart("visitors-chart", visitorsDrilldownedChartOptions);
		visitorsChart.options.data = dataVisitors[e.dataPoint.name];
		visitorsChart.render();
		
		// DOM Manipulations
		visitorsChartHeadingDOM.html(e.dataPoint.name);
		visitorsChartBackButtonDOM.toggleClass("invisible");
		visitorsChartTagDOM.toggleClass("invisible");
	}
	
	// binding click event to visitors chart back button to drill up to "New Vs Returning Visitors" doughnut chart
	visitorsChartBackButtonDOM.on("click", function () {
		visitorsChart = new CanvasJS.Chart("visitors-chart", newVsReturningVisitorsChartOptions);
		visitorsChart.options.data = dataVisitors["Software Development vs Cyber Security Division"];
		visitorsChart.render();
		
		// DOM Manipulations
		visitorsChartHeadingDOM.html("Software Development vs Cyber Security Division");
		visitorsChartBackButtonDOM.toggleClass("invisible");
		visitorsChartTagDOM.toggleClass("invisible");
	});
	
	// chart properties cutomized further based on screen width
	function chartPropertiesCustomization () {
		if ($(window).outerWidth() >= 1200 ) {
			
			annualRevenueByCategoryPieChart.options.legend.horizontalAlign = "left";
			annualRevenueByCategoryPieChart.options.legend.verticalAlign = "center";
			annualRevenueByCategoryPieChart.render();
			
			visitorsChartTagDOM.css("position", "absolute");
			
		} else if ($(window).outerWidth() < 1200) {
			
			annualRevenueByCategoryPieChart.options.legend.horizontalAlign = "center";
			annualRevenueByCategoryPieChart.options.legend.verticalAlign = "top";
			annualRevenueByCategoryPieChart.render();
			
			visitorsChartTagDOM.css("position", "static");
			
		}
	}
	
	function renderAllCharts() {
		for (var i = 0; i < allCharts.length; i++)
			allCharts[i].render();
	}
	
	function sidebarToggleOnClick() {
		$('#sidebar-toggle-button').on('click', function () {
			$('#sidebar').toggleClass('sidebar-toggle');
			$('#page-content-wrapper').toggleClass('page-content-toggle');
			renderAllCharts();
		});	
	}
	
	(function init() {
		chartPropertiesCustomization();
		$(window).resize(chartPropertiesCustomization);
		sidebarToggleOnClick();
	})();
	
});
</script>



</body>

</html>