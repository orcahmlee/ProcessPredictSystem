<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String firstname = (String)session.getAttribute("firstname");
	String lastname = (String)session.getAttribute("lastname");
	String isApproval = (String)session.getAttribute("isApproval");
	
	if (firstname == null || lastname == null) {
		response.sendRedirect("FactoryLogin");
	}
%>
<%
	String temperatureFlotData = (String)session.getAttribute("temperatureFlotData");
	String pressureFlotData = (String)session.getAttribute("pressureFlotData");
	String flowRateFlotData = (String)session.getAttribute("flowRateFlotData");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- JQuery UI -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- JQuery UI CSS-->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/dark-hive/jquery-ui.css">
	<!-- Flot -->
	<script language="javascript" type="text/javascript" src = "flot/jquery.flot.js"></script>
	<script language="javascript" type="text/javascript" src = "flot/jquery.flot.time.js"></script>	
	<script language="javascript" type="text/javascript" src = "flot/jquery.flot.axislabels.js"></script>	
	<script language="javascript" type="text/javascript" src = "flot/jquery.flot.tooltip.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>YOUR DATA</title>
	<style type="text/css">
        body {
    			padding-top: 70px;
    		}
	    	.form-control {
			width:auto;
			display:inline-block;
	    }
    </style>	
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class = "container-fluid">
			<div class = "navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class = "sr-only">Toggle navigation</span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
				</button>
				<a class = "navbar-brand glyphicon glyphicon-home" href = "FactoryMainPage"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class = "nav navbar-nav" style = "font-size:16px">
        				<li class = "dropdown">
        					<a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">Machine 1<span class = "caret"></span></a>
        					<ul class = "dropdown-menu">
        						<li><a href = "FactoryMainMachine1_RealTime">Real-Time</a></li>
        						<li><a href = "FactoryMainMachine1_History">History</a></li>
        					</ul>
        				</li>
        				<li class = "dropdown">
        					<a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">Machine 2<span class = "caret"></span></a>
        					<ul class = "dropdown-menu">
        						<li><a href = "#">Real-Time</a></li>
        						<li><a href = "#">History</a></li>
        					</ul>
        				</li>
        				<li class = "dropdown">
        					<a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">Machine 3<span class = "caret"></span></a>
        					<ul class = "dropdown-menu">
        						<li><a href = "#">Real-Time</a></li>
        						<li><a href = "#">History</a></li>
        					</ul>
        				</li>
        				<li class = "dropdown">
        					<a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">Machine4<span class = "caret"></span></a>
        					<ul class = "dropdown-menu">
        						<li><a href = "#">Real-Time</a></li>
        						<li><a href = "#">History</a></li>
        					</ul>
        				</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
                    <li style = "font-size:16px"><a href = "#"><span class = "glyphicon glyphicon-user"></span><%= firstname + " " + lastname%></a></li>
                    <li style = "font-size:16px"><a href = "#"><span class = "glyphicon glyphicon-log-out"></span>Logout</a></li>
                </ul>
			</div>
		</div>
	</nav>

    <div class = "container-fluid">
	    <form method = "post" action = "FactoryMainMachine1_History">
	      	<div class = "row">      	
	        		<div class = "col-sm-2" align = "center">
	        			<label style = "font-size:16px">START TIME</label>&nbsp;
	        		</div>
	        		<div class = "col-sm-3" align = "left">
	        			<label>DATE:</label>&nbsp;
	        			<input type = "text" size = "12" id = "start-datepicker" name = startDate>
	        		</div>
	        		<div class = "col-sm-3" align = "left">
	        			<div class = "form-group">
		    				<label>HOUR:</label>&nbsp; 		    					
		    				<select class = "form-control" id = "start-slc-hour" name = startHour></select>
		    			</div>
	     		</div>
	        		<div class = "col-sm-3" align = "left">	
	    		    		<div class = "form-group">
	    		    			<label>MINUTE:</label>&nbsp; 		    					
	    		    			<select class = "form-control" id = "start-slc-minute" name = startMinute></select>
	    		    		</div>
	        		</div>
	        		<div class = "col-sm-1"></div>
	        	</div>
	        			
	        	<hr>
	        			
	        	<div class = "row">
	        		<div class = "col-sm-2" align = "center">
	        			<label style = "font-size:16px">END TIME</label>&nbsp;
	        		</div>
	        		<div class = "col-sm-3" align = "left">
	        			<label>DATE:</label>&nbsp;
	        			<input type = "text" size = "12" id = "end-datepicker" name = "endDate">
	        		</div>
	        		<div class = "col-sm-3" align = "left">
	        			<div class = "form-group">
		    				<label>HOUR:</label>&nbsp; 		    					
		    				<select class = "form-control" id = "end-slc-hour" name = "endHour"></select>
		    			</div>
	        		</div>
	        		<div class = "col-sm-3" align = "left">	
	    		   		<div class = "form-group">
	    		    			<label>MINUTE:</label>&nbsp;
	    		    			<select class = "form-control" id = "end-slc-minute" name = "endMinute"></select>
	    		    		</div>
	        		</div>
	        		<div class = "col-sm-1" align = "center">
	        			<input type = "submit" class = "btn btn-default" style = "font-size:16px" value = "SEARCH"></input>        					
	        		</div>		
	        	</div>
		</form>    
	    			
    		<!-- DEBUG AREA -->
    		<hr>
    		<div class = "col-sm-12" align = "center">
    			<span align = "center" id = "debug">DEBUG</span>
    		</div>        				
    		<hr>
    		<!-- DEBUG AREA -->
        				
        	<div class = "row">	
        		<div class = "col-sm-6" align = "center">
        			<hr>
        			<p>PDF</p>
        			<div id = "placeholder1" style = "width:100%; height:350px"></div>
        		</div>        	
        		<div class = "col-sm-6" align = "center">
        			<hr>
        			<p>PDF</p>
        			<div id = "placeholder2" style = "width:100%; height:350px"></div>
        		</div>        		
        		<div class = "col-sm-6" align = "center">
        			<hr>
        			<p>Pressure</p>
        			<div id = "placeholder3" style = "width:100%; height:350px"></div>
        		</div>        		
        		<div class = "col-sm-6" align = "center">
        			<hr>
        			<p>PDF</p>
        			<div id = "placeholder4" style = "width:100%; height:350px"></div>
        		</div>
        		<div class = "col-sm-6" align = "center">
        			<hr>
        			<p>Flow Rate</p>
        			<div id = "placeholder5" style = "width:100%; height:350px"></div>
        		</div>        		
        		<div class = "col-sm-6" align = "center">
        			<hr>
        			<p>PDF</p>
        			<div id = "placeholder6" style = "width:100%; height:350px"></div>
        		</div>        	
        	</div>
	</div>

 
<script>

$(function() {
	$("#start-datepicker").datepicker();
	$("#end-datepicker").datepicker();
});
$("#start-datepicker").datepicker({
	dateFormat: "yy-mm-dd"
});
$("#end-datepicker").datepicker({
	dateFormat: "yy-mm-dd"
});

$(function() {
	var left = '<option>';
	var right = '</option>';
	for (var i = 0; i < 25; i++) {
		i = (i < 10) ? (i = "0" + i) : (i);
		$("#start-slc-hour").append(left + i + right);
		$("#end-slc-hour").append(left + i + right);
	}
});

$(function() {
	var left = '<option>';
	var right = '</option>';
	for (var i = 0; i < 60; i++) {
		i = (i < 10) ? (i = "0" + i) : (i);
		$("#start-slc-minute").append(left + i + right);
		$("#end-slc-minute").append(left + i + right);
	}
});
 	
function plotTemperature() {
	var data = <%= temperatureFlotData %>;
	
	$.plot($("#placeholder1"),[ data ], {
	    series: {
		    lines: {
				show: true,
				align: "center"
			},
			points: {show: false}
		},
		colors: ["#ff0000"],
		xaxis: {
			mode: "time",
			timezone: "browser",
			axisLabel: "Time",
			axisLabelPadding: 20,
			axisLabelUseCanvas: true,
			axisLabelFontSizePixels: 16
		},
		yaxis: {
			axisLabel: "Temp. (degree C)",
			axisLabelUseCanvas: true,
			axisLabelPadding: 10,
			axisLabelFontSizePixels: 16

		},
		grid: {
            hoverable: true,
            clickable: true
        },
        tooltip: {
        		show: true,
        		content: "%x | %y" 
        }
	});
}

function plotPressure() {
	var data = <%= pressureFlotData %>;
	
	$.plot($("#placeholder3"),[ data ], {
	    series: {
		    lines: {
				show: true,
				align: "center"
			},
			points: {show: false}
		},
		colors: ["#2a9e3a"],
		xaxis: {
			mode: "time",
			timezone: "browser",
			axisLabel: "Time",
			axisLabelPadding: 20,
			axisLabelUseCanvas: true,
			axisLabelFontSizePixels: 16
		},
		yaxis: {
			axisLabel: "Pres. (kPa)",
			axisLabelUseCanvas: true,
			axisLabelPadding: 10,
			axisLabelFontSizePixels: 16

		},
		grid: {
            hoverable: true,
            clickable: true
        },
        tooltip: {
    			show: true,
    			content: "%x | %y" 
    		}
	});
}

function plotFlowRate() {
	var data = <%= flowRateFlotData %>;
	
	$.plot($("#placeholder5"),[ data ], {
	    series: {
		    lines: {
				show: true,
				align: "center"
			},
			points: {show: false}
		},
		colors: ["#2269cc"],
		xaxis: {
			mode: "time",
			timezone: "browser",
			axisLabel: "Time",
			axisLabelPadding: 20,
			axisLabelUseCanvas: true,
			axisLabelFontSizePixels: 16
		},
		yaxis: {
			axisLabel: "Flow Rate (L/min)",
			axisLabelUseCanvas: true,
			axisLabelPadding: 10,
			axisLabelFontSizePixels: 16

		},
		grid: {
            hoverable: true,
            clickable: true
        },
        tooltip: {
    			show: true,
    			content: "%x | %y" 
	    }
	});
}

$(function() {
	plotTemperature();
	plotPressure();
	plotFlowRate();
});


$(function() {
	window.onresize = function() {
		plotTemperature();
		plotPressure();
		plotFlowRate();
	}	
});

</script>



</body>
</html>

