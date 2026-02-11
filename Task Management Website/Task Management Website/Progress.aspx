<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Progress.aspx.cs" Inherits="Task_Management_Website.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
 	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
		
		<title>Employees Progress</title>
		
    <!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/bootstrap/bootstrap4-alpha3.min.css">
		<!-- Google Font Roboto -->
		<link rel="stylesheet" href="assets/fonts/font-roboto.css">
		
		<style>	
			body {
				background-color: white;
				color: black;
				font-family: "Roboto", Helvetica, Arial, sans-serif;
				font-size: 16px;
				line-height: 1.5;
				padding-bottom: 3.5rem;
				padding-top: 3.5rem;
			}

			h1, h2, h3, h4, h5, h6 {
				font-weight: 300;
			}

			hr {
				border-top: 1px solid #727273;
				margin-bottom: 2rem;
				margin-top: 2rem;
			}
			
			#revenue-tag {
				border-radius: 0px !important;
				font-size: inherit !important;
				font-weight: inherit !important;
			}

			.align-center {
				text-align: center;
			}

			.card {
				background-color: transparent;
				border: none;
				margin-bottom: 0px;
			}

			#sales-doughnut-chart-us, #sales-doughnut-chart-nl, #sales-doughnut-chart-de {
				height: 280px;
				margin-top: 1rem;
				width: 100%;
			}

			#page-views-spline-area-chart, #orders-spline-area-chart, #revenue-spline-area-chart {
				height: 100px;
				width: 100%;
			}

			#users-doughnut-chart, #users-spline-chart {
				height: 280px; 
				margin-top: 2rem;
				width: 100%;
			}

			#users-countries-bar-chart {
				height: 360px; 
				margin-top: 2rem;
				width: 100%;
			}
		</style>
		
		<!-- Scripts -->
		<script src="assetss/jquery/jquery-3.1.0.min.js"></script>
		<script src="assetss/tether/tether.min.js"></script>
		<script src="assetss/bootstrap/bootstrap4-alpha3.min.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		<script src="assetss/jquery.scrollspeed/jquery.scrollspeed.min.js"></script>
		<script src="assetss/jquery.inview/jquery.inview.min.js"></script>
		
		<script>
			$(function () {
				var totalRevenue = 15341110,
						totalUsers = 7687036;
				
				// CanvasJS doughnut chart to show annual sales percentage from United States(US)
				var salesDoughnutChartUS = new CanvasJS.Chart("sales-doughnut-chart-us", { 
					animationEnabled: true,
					backgroundColor: "transparent",
					title: {
						fontColor: "black",
						fontSize: 70,
						horizontalAlign: "center",
						text: "47%",
						verticalAlign: "center"
					},
					toolTip: {
						backgroundColor: "black",
						borderThickness: 0,
						cornerRadius: 0,
						fontColor: "red"
					},
					data: [
						{
							explodeOnClick: false,
							innerRadius: "96%",
							radius: "90%",
							startAngle: 270,
							type: "doughnut",
							dataPoints: [
								{ y: 47, color: "red", toolTipContent: "United States: $<span>" + CanvasJS.formatNumber(Math.round(47 / 100 * totalRevenue), '#,###,###') + "</span>" },
								{ y: 53, color: "black", toolTipContent: null }
							]
						}
					]
				});

				// CanvasJS doughnut chart to show annual sales percentage from Netherlands(NL)
				var salesDoughnutChartNL = new CanvasJS.Chart("sales-doughnut-chart-nl", { 
					animationEnabled: true,
					backgroundColor: "transparent",
					title: {
						fontColor: "black",
						fontSize: 70,
						horizontalAlign: "center",
						text: "19%",
						verticalAlign: "center"
					},
					toolTip: {
						backgroundColor: "black",
						borderThickness: 0,
						cornerRadius: 0,
						fontColor: "black"
					},
					data: [
						{
							explodeOnClick: false,
							innerRadius: "96%",
							radius: "90%",
							startAngle: 270,
							type: "doughnut",
							dataPoints: [
								{ y: 19, color: "red", toolTipContent: "Netherlands: $<span>" + CanvasJS.formatNumber(Math.round(19 / 100 * totalRevenue), '#,###,###') + "</span>" },
								{ y: 81, color: "black", toolTipContent: null }
							]
						}
					]
				});

				
				// CanvasJS stackedColumn bar chart
				var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					backgroundColor: "transparent",
					title:{
						text: ""
					},
					axisX: {
						interval: 1,
						intervalType: "year",
						valueFormatString: "YYYY"
						
					},
					axisY: {
						suffix: "%"
						
					},
					toolTip: {
						shared: true
					},
					legend: {
						reversed: true,
						verticalAlign: "center",
						horizontalAlign: "right"
					},
					data: [{
						type: "stackedColumn100",
						name: "Completed",
						showInLegend: true,
						xValueFormatString: "YYYY",
						yValueFormatString: "#,##0\"%\"",
						dataPoints: [
							{ x: new Date(2014,0), y: 92 },
							{ x: new Date(2015,0), y: 88 },
							{ x: new Date(2016, 0), y: 98 },
							 { x: new Date(2017,0), y: 70 },
							{ x: new Date(2018,0), y: 95}
						]
					}, 
					{
						type: "stackedColumn100",
						name: "Overdue",
						showInLegend: true,
						xValueFormatString: "YYYY",
						yValueFormatString: "#,##0\"%\"",
						dataPoints: [
							{ x: new Date(2014,0), y: 8 },
							{ x: new Date(2015,0), y: 12 },
							{ x: new Date(2016, 0), y: 2 },
							 { x: new Date(2017,0), y: 30 },
							{ x: new Date(2018,0), y: 5 }
						]
					}, 
					
					{
					}]
				});
		
				//jQuery.scrollSpeed(100, 400); // for smooth mouse wheel scrolling
				
				// jQuery.inview plugin
				$('.inview').one('inview', function (e, isInView) {
					if (isInView) {
						switch (this.id) {
							case "sales-doughnut-chart-us": salesDoughnutChartUS.render();
								break;
							case "sales-doughnut-chart-nl": salesDoughnutChartNL.render();
								break;
							case "sales-doughnut-chart-de": salesDoughnutChartDE.render();
								break;
							case "chartContainer": chart.render()
								break;
							case "orders-spline-area-chart": ordersSplineAreaChart.render();
								break;
							case "revenue-spline-area-chart": revenueSplineAreaChart.render();
								break;
							case "users-doughnut-chart": usersDoughnutChart.render();
								break;
							case "users-spline-chart": usersSplineChart.render();
								break;
							case "users-countries-bar-chart": usersCountriesBarChart.render();
								break;
						}
					}
				});
		
			});
	
		</script>
		
  </head>
  <body>
		<div class="container">
			<h1>Employees Progress</h1>
			<hr class="m-t-2">
			
			<h3>Percentage of completed tasks vs overdue tasks</h3>
			<div class="row">	
				<div class="col-md-4">
					<div class="inview" id="sales-doughnut-chart-us"></div>
					<h3 class="align-center">Completed</h3>
				</div>				
				<div class="col-md-4">
					<div class="inview" id="sales-doughnut-chart-nl"></div>
					<h3 class="align-center">Overdue</h3>
				</div>
			</div>
			
			<hr>
			<h3>Completed vs Overdue</h3>
			<div class="row">
				<div class="col-md-12">					
					<div class="inview" id="chartContainer"></div>
				</div>
			</div>
			
		</div> <!-- container -->
		
	</body>
</html>
